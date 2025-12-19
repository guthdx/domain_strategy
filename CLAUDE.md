# CLAUDE.md - Domain Strategy Portfolio

Instructions for Claude Code when working with this project.

## Project Overview

This is a domain portfolio with 9 custom landing pages deployed to Cloudflare Pages, plus 6 redirect domains. The goal is to increase domain resale value through professional web presence.

## Current Status (2025-12-19)

**Deployment: COMPLETE**

- 9 landing pages live on Cloudflare Pages
- 6 redirect rules active (301 permanent)
- All DNS configured and propagated

## Cloudflare Configuration

**Account ID**: `ad65b3ec7d1568e6c515bf0a59bd68f3`

### Pages Projects

| Project | Domain | Zone ID |
|---------|--------|---------|
| royalsmartpeople | royalsmartpeople.com | 29bc5fabd8bc30120647a054045d6828 |
| g3dx | g3dx.com | 2bb7b60babc97102fe6545e3680261f6 |
| aftermathematics | aftermathematics.com | c4aa0d1dcd6ecd1f9a86a56cc17f28ce |
| projecth3lp | projecth3lp.com | f4696a939e4fccc7e5cb7ed25fee7cc1 |
| guthed | guthed.com | 02386fd19a7626094df3b66cfed73967 |
| deadcowcreek | deadcowcreek.com | 1f736f180c8c21d042b2dc1fa263e9fe |
| inertialism | inertialism.com | 684a0ff9a70870fd506d20bb756fbf17 |
| doctorswithinborders | doctorswithinborders.org | 0035ceffa73e4d7ead8c776866855fa6 |
| ohitika | ohitika.org | 44cd1f9793dc7a3f10e95dec54bfb9a7 |

### Redirect Domains

| Domain | Zone ID | Redirects To |
|--------|---------|--------------|
| g3dx.org | 22645511d94e22f075675b99c7f0c97e | g3dx.com |
| royalsmartpeople.org | 08aeafb1c695ba52bbe51b6312547fc6 | royalsmartpeople.com |
| royalsmartpeople.net | 5d36c49a1a7e149729a4fb10710f5863 | royalsmartpeople.com |
| aftermathematics.org | d86bb8bfadfd032e9c3a278f28ec4c22 | aftermathematics.com |
| projecth3lp.net | 4c07d45e2fde7a6b217acf6e63f431f5 | projecth3lp.com |
| ohitika.net | f9baeb54660bb06f0b18cb31d5e4c1db | ohitika.org |

## Common Tasks

### Redeploy a Site

```bash
wrangler pages deploy sites/DOMAIN --project-name PROJECT_NAME --commit-dirty
```

### Update DNS Record

```bash
# Delete old record
curl -X DELETE "https://api.cloudflare.com/client/v4/zones/ZONE_ID/dns_records/RECORD_ID" \
  -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN"

# Add new CNAME
curl -X POST "https://api.cloudflare.com/client/v4/zones/ZONE_ID/dns_records" \
  -H "Authorization: Bearer $CLOUDFLARE_API_TOKEN" \
  -H "Content-Type: application/json" \
  --data '{"type":"CNAME","name":"domain.com","content":"project.pages.dev","ttl":1,"proxied":true}'
```

### Check Domain Status

```bash
curl -s https://DOMAIN | head -20
```

## DNS Configuration Notes

When adding a new domain to Cloudflare:

1. **Delete imported A records** pointing to GoDaddy parking (15.197.148.33, 3.33.130.190)
2. **Add CNAME** pointing to `PROJECT.pages.dev`
3. **Connect custom domain** in Pages project via API or dashboard

For redirect domains:
1. Add proxied A record pointing to `192.0.2.1` (dummy IP)
2. Create Page Rule with 301 forwarding

## Personal Holdbacks

These domains are NOT for sale - do not include in sale listings:
- ohitika.org / ohitika.net (Lakota language/culture)
- aftermathematics.net (personal use)

## Files

- `sites/*/index.html` - Landing page content
- `sites/*/_headers` - Cloudflare headers (caching, security)
- `deploy/deploy-all.sh` - Batch deployment script
- `portfolio-links.html` - Local link dashboard
