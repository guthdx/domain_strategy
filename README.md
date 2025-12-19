# Domain Strategy Portfolio

Custom landing pages for 9 domains designed to increase resale value through professional web presence.

## Portfolio Overview

| Domain | Category | Current Value | Target Value |
|--------|----------|---------------|--------------|
| royalsmartpeople.com | EdTech | $2,770 | $8,000-12,000 |
| g3dx.com | Tech/Gaming | $2,188 | $6,000-8,000 |
| aftermathematics.com | EdTech | $1,701 | $5,000-7,000 |
| projecth3lp.com | Nonprofit/Tech | $1,494 | $4,500-6,000 |
| guthed.com | Creative | $1,276 | $3,500-5,000 |
| deadcowcreek.com | Ranch/Western | $1,007 | $3,000-4,500 |
| inertialism.com | Philosophy | $714 | $2,500-4,000 |
| doctorswithinborders.org | Healthcare | $137 | $2,500-4,000 |
| ohitika.org | Cultural (Personal) | $571 | Holdback |

**Total Portfolio**: $12,817 current → $35,000-51,500 target

## Quick Deploy

```bash
# Install Wrangler
npm install -g wrangler

# Login to Cloudflare
wrangler login

# Deploy all sites
./deploy/deploy-all.sh
```

## Structure

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
└── wrangler/                 # Cloudflare Pages configs
    └── wrangler.toml         # Main Wrangler config
```

## Redirect Domains

These domains redirect to their primary counterparts:

- `g3dx.org` → `g3dx.com`
- `royalsmartpeople.org/net/info` → `royalsmartpeople.com`
- `aftermathematics.org` → `aftermathematics.com`
- `projecth3lp.net` → `projecth3lp.com`
- `ohitika.net` → `ohitika.org`

## Bundle Sale Opportunity

**Royal Smart Person + Aftermathematics Bundle**: $15,000-20,000
- Connected brand story (Sesame Street "Caveman" sketch reference)
- Complete "problem → solution → implementation" ecosystem

## Personal Holdbacks

These domains are **NOT for sale**:
- `ohitika.org` / `ohitika.net` - Lakota language/culture
- `aftermathematics.net` - Personal use
