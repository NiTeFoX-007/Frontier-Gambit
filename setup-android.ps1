# ═══════════════════════════════════════════════════════
#  Frontier Gambit — Android App Setup
#  Run this ONCE after installing Node.js + Android Studio
#  Open PowerShell in C:\Users\Admin\FrontierGambit\ and run:
#    .\setup-android.ps1
# ═══════════════════════════════════════════════════════

Write-Host ""
Write-Host "FRONTIER GAMBIT — Android Setup" -ForegroundColor Yellow
Write-Host "================================" -ForegroundColor Yellow
Write-Host ""

# Step 1: Install dependencies
Write-Host "[1/4] Installing Capacitor..." -ForegroundColor Cyan
npm install
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: npm install failed. Is Node.js installed?" -ForegroundColor Red; exit 1 }

# Step 2: Copy game files to www/
Write-Host ""
Write-Host "[2/4] Copying game files into www/..." -ForegroundColor Cyan
New-Item -ItemType Directory -Path "www" -Force | Out-Null
Copy-Item "index.html" "www\" -Force
Copy-Item "icon.svg"   "www\" -Force
Copy-Item "manifest.json" "www\" -Force
Copy-Item "sw.js"      "www\" -Force

# Step 3: Add Android platform
Write-Host ""
Write-Host "[3/4] Adding Android platform..." -ForegroundColor Cyan
npx cap add android
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: cap add android failed." -ForegroundColor Red; exit 1 }

# Step 3b: Sync web assets to Android
npx cap sync android
if ($LASTEXITCODE -ne 0) { Write-Host "ERROR: cap sync failed." -ForegroundColor Red; exit 1 }

# Step 4: Open Android Studio
Write-Host ""
Write-Host "[4/4] Opening Android Studio..." -ForegroundColor Cyan
Write-Host "      In Android Studio: Build > Generate Signed Bundle/APK > Android App Bundle" -ForegroundColor Gray
Write-Host ""
npx cap open android

Write-Host ""
Write-Host "DONE! Android Studio should now be open." -ForegroundColor Green
Write-Host "Upload the AAB file to Google Play Console at play.google.com/console" -ForegroundColor Green
Write-Host ""
