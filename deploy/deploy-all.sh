#!/bin/bash

# Domain Portfolio Batch Deployment Script
# Deploys all 9 custom landing pages to Cloudflare Pages

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "========================================"
echo "Domain Portfolio Deployment"
echo "========================================"
echo ""

cd "$PROJECT_DIR"

# Check if wrangler is installed
if ! command -v wrangler &> /dev/null; then
    echo "Error: Wrangler CLI not found."
    echo "Install with: npm install -g wrangler"
    exit 1
fi

# Check if logged in
if ! wrangler whoami &> /dev/null; then
    echo "Error: Not logged in to Cloudflare."
    echo "Run: wrangler login"
    exit 1
fi

echo "Logged in to Cloudflare. Starting deployment..."
echo ""

# Deploy Priority 1: High Value
echo "[1/9] Deploying royalsmartpeople.com..."
wrangler pages deploy sites/royalsmartpeople.com --project-name royalsmartpeople --commit-dirty
echo "Done!"
echo ""

echo "[2/9] Deploying g3dx.com..."
wrangler pages deploy sites/g3dx.com --project-name g3dx --commit-dirty
echo "Done!"
echo ""

echo "[3/9] Deploying aftermathematics.com..."
wrangler pages deploy sites/aftermathematics.com --project-name aftermathematics --commit-dirty
echo "Done!"
echo ""

echo "[4/9] Deploying projecth3lp.com..."
wrangler pages deploy sites/projecth3lp.com --project-name projecth3lp --commit-dirty
echo "Done!"
echo ""

# Deploy Priority 2: Medium Value
echo "[5/9] Deploying guthed.com..."
wrangler pages deploy sites/guthed.com --project-name guthed --commit-dirty
echo "Done!"
echo ""

echo "[6/9] Deploying deadcowcreek.com..."
wrangler pages deploy sites/deadcowcreek.com --project-name deadcowcreek --commit-dirty
echo "Done!"
echo ""

echo "[7/9] Deploying inertialism.com..."
wrangler pages deploy sites/inertialism.com --project-name inertialism --commit-dirty
echo "Done!"
echo ""

echo "[8/9] Deploying doctorswithinborders.org..."
wrangler pages deploy sites/doctorswithinborders.org --project-name doctorswithinborders --commit-dirty
echo "Done!"
echo ""

# Deploy Personal Holdback
echo "[9/9] Deploying ohitika.org (Personal)..."
wrangler pages deploy sites/ohitika.org --project-name ohitika --commit-dirty
echo "Done!"
echo ""

echo "========================================"
echo "All sites deployed successfully!"
echo "========================================"
echo ""
echo "Next steps:"
echo "1. Connect custom domains in Cloudflare Dashboard:"
echo "   - Workers & Pages > [project] > Custom domains"
echo ""
echo "2. Configure redirect rules for support domains:"
echo "   - g3dx.org -> g3dx.com"
echo "   - royalsmartpeople.org/net/info -> royalsmartpeople.com"
echo "   - aftermathematics.org -> aftermathematics.com"
echo "   - projecth3lp.net -> projecth3lp.com"
echo "   - ohitika.net -> ohitika.org"
echo ""
echo "3. Submit to Google Search Console"
echo ""
echo "See DEPLOYMENT_GUIDE.md for detailed instructions."
