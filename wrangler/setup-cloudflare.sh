#!/bin/bash

# Cloudflare Pages Setup Script
# Creates all Pages projects and configures custom domains

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "========================================"
echo "Cloudflare Pages Project Setup"
echo "========================================"
echo ""

# Check prerequisites
if ! command -v wrangler &> /dev/null; then
    echo "Installing Wrangler..."
    npm install -g wrangler
fi

if ! command -v jq &> /dev/null; then
    echo "Error: jq is required. Install with: brew install jq"
    exit 1
fi

# Login check
echo "Checking Cloudflare authentication..."
if ! wrangler whoami &> /dev/null; then
    echo "Please login to Cloudflare:"
    wrangler login
fi

ACCOUNT_ID=$(wrangler whoami --json 2>/dev/null | jq -r '.account.id // empty')
if [ -z "$ACCOUNT_ID" ]; then
    echo "Could not determine account ID. Please run: wrangler whoami"
    exit 1
fi

echo "Account ID: $ACCOUNT_ID"
echo ""

# Read projects config
PROJECTS_FILE="$SCRIPT_DIR/pages-projects.json"

# Deploy each project
echo "Deploying Pages projects..."
echo ""

PROJECTS=$(jq -c '.projects[]' "$PROJECTS_FILE")

while IFS= read -r project; do
    NAME=$(echo "$project" | jq -r '.name')
    DIR=$(echo "$project" | jq -r '.directory')

    echo "----------------------------------------"
    echo "Deploying: $NAME"
    echo "Directory: $DIR"

    # Create the project if it doesn't exist, or deploy to it
    cd "$PROJECT_DIR"

    if wrangler pages project list 2>/dev/null | grep -q "^$NAME "; then
        echo "Project exists, deploying update..."
    else
        echo "Creating new project..."
    fi

    wrangler pages deploy "$DIR" --project-name "$NAME" --commit-dirty

    echo "Deployed $NAME successfully!"
    echo ""

done <<< "$PROJECTS"

echo "========================================"
echo "All projects deployed!"
echo "========================================"
echo ""
echo "Next: Configure custom domains in Cloudflare Dashboard"
echo "  1. Go to Workers & Pages"
echo "  2. Select each project"
echo "  3. Go to Custom Domains tab"
echo "  4. Add the domain(s)"
echo ""
echo "Or use the Cloudflare API to automate domain configuration."
