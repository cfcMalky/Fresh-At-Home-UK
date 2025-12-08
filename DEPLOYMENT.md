# Deployment Guide

This guide explains how to deploy the Fresh At Home UK website to a web server.

## Files Required for Deployment

The following files and folders are needed for the website to function:

### Required Files
- **HTML Files** (root level):
  - `index.html`
  - `fruits.html`
  - `herbs.html`
  - `vegetables.html`
  - `blog.html`

- **CSS File**:
  - `styles.css`

- **Folders**:
  - `images/` - All image files used by the website
  - `guides/` - Individual guide pages (fruits and herbs)
  - `blog/` - Blog content folder

### Files NOT Required
- `private/` folder - Contains build scripts and data files (CSV, MD, Python scripts)
- `README.md` - Documentation file (optional to include)

## Deployment Methods

### Method 1: Using the Deployment Script (Recommended)

1. Run the PowerShell deployment script:
   ```powershell
   .\deploy.ps1
   ```

2. This will create a `deploy` folder containing only the necessary files.

3. Upload the entire contents of the `deploy` folder to your web server.

### Method 2: Manual Deployment

1. Upload the following to your web server:
   - All `.html` files from the root directory
   - `styles.css`
   - The entire `images/` folder
   - The entire `guides/` folder
   - The entire `blog/` folder

2. **Do NOT upload:**
   - The `private/` folder
   - `README.md` (optional)

### Method 3: Using FTP/SFTP

If using an FTP client:
1. Connect to your web server
2. Navigate to your website's root directory (usually `public_html`, `www`, or `htdocs`)
3. Upload only the required files listed above
4. Ensure folder structure is preserved

### Method 4: Using Git (if server supports)

If your server supports Git deployments:
1. Create a `.gitignore` file (already included) to exclude `private/` folder
2. Push to your repository
3. Pull on the server (the `.gitignore` will prevent `private/` from being deployed)

## Server Requirements

- **Web Server**: Any standard web server (Apache, Nginx, etc.)
- **No Server-Side Processing**: This is a static website, no PHP, Python, or database required
- **File Permissions**: Ensure HTML files are readable (typically 644)
- **Directory Structure**: Maintain the same folder structure on the server

## Verification

After deployment, verify:
1. Homepage loads correctly (`index.html`)
2. Navigation links work (fruits, herbs, vegetables, blog)
3. Images display properly
4. Individual guide pages load (e.g., `guides/fruits/apples.html`)
5. CSS styling is applied correctly

## Troubleshooting

- **404 Errors**: Check that folder structure matches exactly (case-sensitive on Linux servers)
- **Missing Images**: Verify `images/` folder was uploaded completely
- **Broken Links**: Ensure all HTML files are in the correct locations
- **CSS Not Loading**: Check that `styles.css` is in the root directory

## Updating the Website

When you make changes:
1. Run your build scripts from the `private/scripts/` folder
2. This will regenerate the HTML files
3. Re-deploy using one of the methods above

