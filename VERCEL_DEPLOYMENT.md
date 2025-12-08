# Vercel Deployment Guide

## Quick Fix for Sitemap 404 Error

If Google Search Console shows a 404 error for your sitemap, follow these steps:

### 1. Ensure Files Are in Root Directory

Make sure these files are in your project root (not in `private/` folder):
- ✅ `sitemap.xml`
- ✅ `robots.txt`
- ✅ `vercel.json` (configuration file)

### 2. Commit and Push to Git

If you're using Git with Vercel:
```bash
git add sitemap.xml robots.txt vercel.json
git commit -m "Add sitemap and robots.txt for SEO"
git push
```

Vercel will automatically deploy when you push.

### 3. Manual Deployment

If deploying manually via Vercel CLI or dashboard:
- Ensure `sitemap.xml` and `robots.txt` are in the root directory
- Deploy the project

### 4. Verify Files Are Accessible

After deployment, verify these URLs work:
- https://grow-it-at-home.vercel.app/sitemap.xml
- https://grow-it-at-home.vercel.app/robots.txt

### 5. Resubmit to Google Search Console

1. Go to [Google Search Console](https://search.google.com/search-console)
2. Navigate to **Sitemaps**
3. Remove the old sitemap entry (if it shows an error)
4. Add new sitemap: `https://grow-it-at-home.vercel.app/sitemap.xml`
5. Click **Submit**

## Files Required for Vercel Deployment

### Must Include (in root):
- All HTML files
- `styles.css`
- `sitemap.xml` ⚠️ **Critical for SEO**
- `robots.txt` ⚠️ **Critical for SEO**
- `vercel.json` (for proper headers)
- `images/` folder
- `guides/` folder
- `blog/` folder

### Exclude from Deployment:
- `private/` folder (build files only)
- `README.md` (optional)
- `deploy/` folder (local deployment package)

## Vercel Configuration

The `vercel.json` file ensures:
- Proper Content-Type headers for XML files
- Correct caching for sitemap
- Proper routing for sitemap.xml

## Troubleshooting

### Sitemap Still Shows 404?

1. **Check file exists in root**: `ls sitemap.xml` (or `dir sitemap.xml` on Windows)
2. **Check Vercel deployment logs**: Look for any errors during build
3. **Verify file is committed**: `git ls-files | grep sitemap.xml`
4. **Clear Vercel cache**: Redeploy or use "Redeploy" in Vercel dashboard
5. **Wait a few minutes**: Sometimes it takes a moment for files to propagate

### Test Locally Before Deploying

You can test the sitemap locally:
```bash
# Start a local server
python -m http.server 8000

# Visit http://localhost:8000/sitemap.xml
```

## Regenerating Sitemap

If you add new pages, regenerate the sitemap:
```bash
python private/scripts/generate_sitemap.py
```

Then commit and redeploy to Vercel.

