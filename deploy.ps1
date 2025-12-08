# Deployment Script for GrowItAtHome Website
# This script copies only the files needed for the live website to a deployment folder

param(
    [string]$DeployPath = ".\deploy"
)

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "GrowItAtHome Deployment Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Remove existing deploy folder if it exists
if (Test-Path $DeployPath) {
    Write-Host "Removing existing deployment folder..." -ForegroundColor Yellow
    Remove-Item -Recurse -Force $DeployPath
}

# Create deploy folder
Write-Host "Creating deployment folder: $DeployPath" -ForegroundColor Green
New-Item -ItemType Directory -Path $DeployPath | Out-Null

# Copy HTML files from root
Write-Host "Copying HTML files..." -ForegroundColor Green
Copy-Item "*.html" -Destination $DeployPath -ErrorAction SilentlyContinue

# Copy CSS file
Write-Host "Copying styles.css..." -ForegroundColor Green
Copy-Item "styles.css" -Destination $DeployPath -ErrorAction SilentlyContinue

# Copy sitemap.xml if it exists
if (Test-Path "sitemap.xml") {
    Write-Host "Copying sitemap.xml..." -ForegroundColor Green
    Copy-Item "sitemap.xml" -Destination $DeployPath -ErrorAction SilentlyContinue
}

# Copy robots.txt if it exists
if (Test-Path "robots.txt") {
    Write-Host "Copying robots.txt..." -ForegroundColor Green
    Copy-Item "robots.txt" -Destination $DeployPath -ErrorAction SilentlyContinue
}

# Copy images folder
Write-Host "Copying images folder..." -ForegroundColor Green
Copy-Item "images" -Destination $DeployPath -Recurse -ErrorAction SilentlyContinue

# Copy guides folder
Write-Host "Copying guides folder..." -ForegroundColor Green
Copy-Item "guides" -Destination $DeployPath -Recurse -ErrorAction SilentlyContinue

# Copy blog folder (even if empty)
Write-Host "Copying blog folder..." -ForegroundColor Green
if (Test-Path "blog") {
    Copy-Item "blog" -Destination $DeployPath -Recurse -ErrorAction SilentlyContinue
} else {
    New-Item -ItemType Directory -Path "$DeployPath\blog" | Out-Null
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Deployment folder created successfully!" -ForegroundColor Green
Write-Host "Location: $DeployPath" -ForegroundColor Green
Write-Host ""
Write-Host "Files included:" -ForegroundColor Yellow
Write-Host "  - All HTML files (index, fruits, herbs, vegetables, blog)" -ForegroundColor White
Write-Host "  - styles.css" -ForegroundColor White
Write-Host "  - sitemap.xml (if generated)" -ForegroundColor White
Write-Host "  - images/ folder" -ForegroundColor White
Write-Host "  - guides/ folder" -ForegroundColor White
Write-Host "  - blog/ folder" -ForegroundColor White
Write-Host ""
Write-Host "Files excluded:" -ForegroundColor Yellow
Write-Host "  - private/ folder (build files)" -ForegroundColor White
Write-Host "  - README.md (documentation)" -ForegroundColor White
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Review the contents of the '$DeployPath' folder" -ForegroundColor White
Write-Host "  2. Upload all files in '$DeployPath' to your web server" -ForegroundColor White
Write-Host "  3. Ensure the folder structure is preserved on the server" -ForegroundColor White
Write-Host "========================================" -ForegroundColor Cyan

