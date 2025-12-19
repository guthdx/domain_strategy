# Domain Portfolio Deployment Guide

This guide covers deploying all 9 custom landing pages and configuring 7 redirect domains using Cloudflare Pages (free tier).

## Overview

### Sites to Deploy (9 custom landing pages)

| Domain | Directory | Status |
|--------|-----------|--------|
| royalsmartpeople.com | `sites/royalsmartpeople.com/` | Ready |
| g3dx.com | `sites/g3dx.com/` | Ready |
| aftermathematics.com | `sites/aftermathematics.com/` | Ready |
| projecth3lp.com | `sites/projecth3lp.com/` | Ready |
| guthed.com | `sites/guthed.com/` | Ready |
| deadcowcreek.com | `sites/deadcowcreek.com/` | Ready |
| inertialism.com | `sites/inertialism.com/` | Ready |
| doctorswithinborders.org | `sites/doctorswithinborders.org/` | Ready |
| ohitika.org | `sites/ohitika.org/` | Ready (Personal) |

### Redirect Domains (7 301 redirects)

| Source Domain | Target | Type |
|---------------|--------|------|
| g3dx.org | g3dx.com | 301 |
| royalsmartpeople.org | royalsmartpeople.com | 301 |
| royalsmartpeople.net | royalsmartpeople.com | 301 |
| royalsmartpeople.info | royalsmartpeople.com | 301 |
| aftermathematics.org | aftermathematics.com | 301 |
| projecth3lp.net | projecth3lp.com | 301 |
| ohitika.net | ohitika.org | 301 |

### Personal Holdbacks (NOT for sale)

- **ohitika.org** - Deploy, but keep for personal use
- **ohitika.net** - Redirect to ohitika.org, keep
- **aftermathematics.net** - Keep for personal use

---

## Prerequisites

1. **Cloudflare Account** with domains added
2. **Wrangler CLI** installed: `npm install -g wrangler`
3. **Authentication**: `wrangler login`

---

## Part 1: Deploying Landing Pages

### Option A: Manual Upload (Easiest)

For each domain:

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com)
2. Select your account
3. Go to **Workers & Pages** > **Create application** > **Pages**
4. Choose **Direct Upload**
5. Name the project (e.g., `royalsmartpeople`)
6. Upload the contents of the site directory
7. Click **Deploy**

### Option B: Wrangler CLI (Faster for multiple sites)

```bash
# Navigate to domain_strategy directory
cd ~/terminal_projects/claude_code/domain_strategy

# Deploy each site (run these in sequence)
wrangler pages deploy sites/royalsmartpeople.com --project-name royalsmartpeople
wrangler pages deploy sites/g3dx.com --project-name g3dx
wrangler pages deploy sites/aftermathematics.com --project-name aftermathematics
wrangler pages deploy sites/projecth3lp.com --project-name projecth3lp
wrangler pages deploy sites/guthed.com --project-name guthed
wrangler pages deploy sites/deadcowcreek.com --project-name deadcowcreek
wrangler pages deploy sites/inertialism.com --project-name inertialism
wrangler pages deploy sites/doctorswithinborders.org --project-name doctorswithinborders
wrangler pages deploy sites/ohitika.org --project-name ohitika
```

### Connecting Custom Domains

After deploying each Pages project:

1. In Cloudflare Dashboard, go to **Workers & Pages**
2. Select the project (e.g., `royalsmartpeople`)
3. Go to **Custom domains** tab
4. Click **Set up a custom domain**
5. Enter the domain (e.g., `royalsmartpeople.com`)
6. Click **Activate domain**

Cloudflare will automatically:
- Create the necessary DNS records
- Provision SSL certificate
- Enable the domain

---

## Part 2: Configuring Redirects

### Method 1: Cloudflare Redirect Rules (Recommended)

For each redirect domain, create a redirect rule:

1. Go to Cloudflare Dashboard
2. Select the domain (e.g., `g3dx.org`)
3. Go to **Rules** > **Redirect Rules**
4. Click **Create rule**
5. Configure:
   - **Rule name**: `Redirect to .com`
   - **When incoming requests match**:
     - Field: `Hostname`
     - Operator: `equals`
     - Value: `g3dx.org` (or the source domain)
   - **Then**:
     - Type: `Dynamic`
     - Expression: `concat("https://g3dx.com", http.request.uri.path)`
     - Status code: `301`
6. Click **Deploy**

### Redirect Rules Summary

Create these redirect rules:

```
g3dx.org/* → https://g3dx.com/*
royalsmartpeople.org/* → https://royalsmartpeople.com/*
royalsmartpeople.net/* → https://royalsmartpeople.com/*
royalsmartpeople.info/* → https://royalsmartpeople.com/*
aftermathematics.org/* → https://aftermathematics.com/*
projecth3lp.net/* → https://projecth3lp.com/*
ohitika.net/* → https://ohitika.org/*
```

### Method 2: Page Rules (Alternative)

If you prefer Page Rules:

1. Go to domain in Cloudflare Dashboard
2. Go to **Rules** > **Page Rules**
3. Click **Create Page Rule**
4. Configure:
   - **URL**: `*g3dx.org/*`
   - **Setting**: Forwarding URL
   - **Status Code**: 301 - Permanent Redirect
   - **Destination URL**: `https://g3dx.com/$2`
5. Click **Save and Deploy**

---

## Part 3: DNS Configuration

Ensure each domain has proper DNS records:

### For Sites (Pages projects)

DNS should point to Cloudflare Pages:
```
Type: CNAME
Name: @ (or www)
Target: <project-name>.pages.dev
Proxy: Proxied (orange cloud)
```

### For Redirect Domains

Even redirect domains need a DNS record to function:
```
Type: A
Name: @
Content: 192.0.2.1 (dummy IP, will be redirected)
Proxy: Proxied (orange cloud)
```

Or use a CNAME if available.

---

## Part 4: Verification Checklist

After deployment, verify each site:

### Landing Pages

- [ ] royalsmartpeople.com - loads correctly, SSL active
- [ ] g3dx.com - loads correctly, SSL active
- [ ] aftermathematics.com - loads correctly, SSL active
- [ ] projecth3lp.com - loads correctly, SSL active
- [ ] guthed.com - loads correctly, SSL active
- [ ] deadcowcreek.com - loads correctly, SSL active
- [ ] inertialism.com - loads correctly, SSL active
- [ ] doctorswithinborders.org - loads correctly, SSL active
- [ ] ohitika.org - loads correctly, SSL active

### Redirects

Test each redirect returns 301 and lands on correct site:

```bash
# Test redirects (should show 301 and Location header)
curl -I https://g3dx.org
curl -I https://royalsmartpeople.org
curl -I https://royalsmartpeople.net
curl -I https://royalsmartpeople.info
curl -I https://aftermathematics.org
curl -I https://projecth3lp.net
curl -I https://ohitika.net
```

---

## Part 5: Post-Deployment SEO

### Google Search Console

Submit each site to Google Search Console:

1. Go to [Google Search Console](https://search.google.com/search-console)
2. Add property for each domain
3. Verify via DNS (Cloudflare makes this easy)
4. Submit sitemap if you add one later

### Meta Tags Verification

Each site already includes:
- Title tags optimized for target keywords
- Meta descriptions for search results
- Open Graph tags for social sharing
- Proper heading hierarchy (H1, H2, etc.)

---

## Batch Deployment Script

Save as `deploy-all.sh`:

```bash
#!/bin/bash

# Deploy all sites to Cloudflare Pages
cd ~/terminal_projects/claude_code/domain_strategy

echo "Deploying royalsmartpeople.com..."
wrangler pages deploy sites/royalsmartpeople.com --project-name royalsmartpeople

echo "Deploying g3dx.com..."
wrangler pages deploy sites/g3dx.com --project-name g3dx

echo "Deploying aftermathematics.com..."
wrangler pages deploy sites/aftermathematics.com --project-name aftermathematics

echo "Deploying projecth3lp.com..."
wrangler pages deploy sites/projecth3lp.com --project-name projecth3lp

echo "Deploying guthed.com..."
wrangler pages deploy sites/guthed.com --project-name guthed

echo "Deploying deadcowcreek.com..."
wrangler pages deploy sites/deadcowcreek.com --project-name deadcowcreek

echo "Deploying inertialism.com..."
wrangler pages deploy sites/inertialism.com --project-name inertialism

echo "Deploying doctorswithinborders.org..."
wrangler pages deploy sites/doctorswithinborders.org --project-name doctorswithinborders

echo "Deploying ohitika.org..."
wrangler pages deploy sites/ohitika.org --project-name ohitika

echo "All sites deployed!"
echo "Remember to:"
echo "1. Connect custom domains in Cloudflare Dashboard"
echo "2. Configure redirect rules for support domains"
echo "3. Submit to Google Search Console"
```

Make executable:
```bash
chmod +x deploy/deploy-all.sh
```

---

## Estimated Values & Targets

| Domain | Current | Target | Category |
|--------|---------|--------|----------|
| royalsmartpeople.com | $2,770 | $8,000-12,000 | EdTech |
| g3dx.com | $2,188 | $6,000-8,000 | Tech/Gaming |
| aftermathematics.com | $1,701 | $5,000-7,000 | EdTech |
| projecth3lp.com | $1,494 | $4,500-6,000 | Nonprofit |
| guthed.com | $1,276 | $3,500-5,000 | Creative |
| deadcowcreek.com | $1,007 | $3,000-4,500 | Ranch |
| inertialism.com | $714 | $2,500-4,000 | Philosophy |
| doctorswithinborders.org | $137 | $2,500-4,000 | Healthcare |

**Bundle Opportunity**: royalsmartpeople.com + aftermathematics.com = $15,000-20,000

---

## Troubleshooting

### Site not loading after deployment

1. Check DNS is proxied (orange cloud) in Cloudflare
2. Verify custom domain is activated in Pages project
3. Wait 5-10 minutes for DNS propagation

### Redirect not working

1. Ensure redirect rule is deployed (not just saved)
2. Check redirect domain has DNS record pointing to Cloudflare
3. Verify DNS is proxied (orange cloud)

### SSL certificate issues

- Cloudflare automatically provisions SSL
- May take up to 24 hours for new domains
- Check **SSL/TLS** > **Edge Certificates** in dashboard
