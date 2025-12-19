# Domain Strategy Portfolio

Custom landing pages for 9 domains designed to increase resale value through professional web presence.

## Deployment Status: LIVE

All sites deployed to Cloudflare Pages on 2025-12-19.

| Domain | Category | Status | Current Value | Target Value |
|--------|----------|--------|---------------|--------------|
| [royalsmartpeople.com](https://royalsmartpeople.com) | EdTech | Live | $2,770 | $8,000-12,000 |
| [g3dx.com](https://g3dx.com) | Tech/Gaming | Live | $2,188 | $6,000-8,000 |
| [aftermathematics.com](https://aftermathematics.com) | EdTech | Live | $1,701 | $5,000-7,000 |
| [projecth3lp.com](https://projecth3lp.com) | Nonprofit/Tech | Live | $1,494 | $4,500-6,000 |
| [guthed.com](https://guthed.com) | Creative | Live | $1,276 | $3,500-5,000 |
| [deadcowcreek.com](https://deadcowcreek.com) | Ranch/Western | Live | $1,007 | $3,000-4,500 |
| [inertialism.com](https://inertialism.com) | Philosophy | Live | $714 | $2,500-4,000 |
| [doctorswithinborders.org](https://doctorswithinborders.org) | Healthcare | Live | $137 | $2,500-4,000 |
| [ohitika.org](https://ohitika.org) | Cultural | **Holdback** | $571 | Not for sale |

**Total Portfolio**: $12,817 current → $35,000-51,500 target

## Redirect Domains (301 Permanent)

| From | To | Status |
|------|-----|--------|
| g3dx.org | g3dx.com | Active |
| royalsmartpeople.org | royalsmartpeople.com | Active |
| royalsmartpeople.net | royalsmartpeople.com | Active |
| aftermathematics.org | aftermathematics.com | Active |
| projecth3lp.net | projecth3lp.com | Active |
| ohitika.net | ohitika.org | Active |

## Local Testing

Open `portfolio-links.html` in your browser for quick access to all live sites.

## Redeployment

```bash
# Install Wrangler (if needed)
npm install -g wrangler

# Login to Cloudflare
wrangler login

# Deploy all sites
./deploy/deploy-all.sh
```

## Project Structure

```
domain_strategy/
├── sites/                    # Individual site directories
│   ├── royalsmartpeople.com/
│   ├── g3dx.com/
│   ├── aftermathematics.com/
│   ├── projecth3lp.com/
│   ├── guthed.com/
│   ├── deadcowcreek.com/
│   ├── inertialism.com/
│   ├── doctorswithinborders.org/
│   └── ohitika.org/
├── deploy/
│   ├── DEPLOYMENT_GUIDE.md   # Full deployment instructions
│   └── deploy-all.sh         # Batch deployment script
├── portfolio-links.html      # Local link dashboard
└── CLAUDE.md                 # Claude Code instructions
```

## Bundle Sale Opportunity

**Royal Smart Person + Aftermathematics Bundle**: $15,000-20,000
- Connected brand story (Sesame Street "Caveman" sketch reference)
- Complete "problem → solution → implementation" ecosystem

## Personal Holdbacks (NOT for sale)

- `ohitika.org` / `ohitika.net` - Lakota language/culture
- `aftermathematics.net` - Personal use

## Infrastructure

- **Hosting**: Cloudflare Pages (free tier)
- **DNS**: Cloudflare
- **SSL**: Automatic via Cloudflare
- **Redirects**: Cloudflare Page Rules (301)
