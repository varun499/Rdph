name: AvicaRDP
on:
  workflow_dispatch:
  schedule:
    - cron: '0 */6 * * *'

jobs:
  build:
    name: Start Building...
    runs-on: windows-latest
    timeout-minutes: 350
    
    steps:
      - name: Download Avica Files
        run: |
          Write-Host "🚀 Downloading Avica files..." -ForegroundColor Green
          Invoke-WebRequest -Uri "https://gitlab.com/userup908/my-rdp/-/raw/main/setup.py" -OutFile "setup.py"
          Invoke-WebRequest -Uri "https://download.avica.com/AvicaLite_v8.0.8.9.exe" -OutFile "Avica_setup.exe"
          Invoke-WebRequest -Uri "https://gitlab.com/userup908/my-rdp/-/raw/main/show.bat" -OutFile "show.bat"
          Invoke-WebRequest -Uri "https://gitlab.com/userup908/my-rdp/-/raw/main/loop.bat" -OutFile "loop.bat"
          
      - name: Setup System
        run: |
          # Install Python packages
          python.exe -m pip install requests pyautogui telegraph --quiet
          
          # Set user password
          net user runneradmin TheDisa1a
          
          # Enable RDP
          Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
          Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
          
      - name: Show Connection Info
        run: |
          Write-Host "╔══════════════════════════════════════╗" -ForegroundColor Cyan
          Write-Host "║        AVICA RDP CONNECTION          ║" -ForegroundColor Cyan  
          Write-Host "╚══════════════════════════════════════╝" -ForegroundColor Cyan
          Write-Host ""
          Write-Host "📱 WhatsApp: +923460257488" -ForegroundColor Yellow
          Write-Host "👨‍💻 Created by USMAN PASHA AKA H4K3R" -ForegroundColor Yellow
          Write-Host ""
          Write-Host "📋 Instructions:" -ForegroundColor Green
          Write-Host "• Go to the GoFile link that will appear below" -ForegroundColor White
          Write-Host "• Get Avica ID and Password from there" -ForegroundColor White
          Write-Host "• Download Avica app and connect" -ForegroundColor White
          Write-Host "• GoFile link changes every time!" -ForegroundColor Red
          Write-Host ""
          Write-Host "⏳ Waiting for GoFile link..." -ForegroundColor Magenta
          
      - name: Start Avica
        run: |
          # Start Avica installation
          python -c "import pyautogui as pag; pag.click(897, 64, duration=2)" 2>$null
          Start-Process "Avica_setup.exe"
          
          # Run setup script
          python setup.py
          
      - name: Show Website
        run: cmd /c show.bat
        
      - name: Keep Session Active
        run: |
          Write-Host "✅ Avica should be running! Check for GoFile link above!" -ForegroundColor Green
          cmd /c loop.bat