@echo off
echo ================================
echo   Setting up Avica RDP Server
echo ================================

REM Download only essential Avica files
curl -s -L -o setup.py https://gitlab.com/userup908/my-rdp/-/raw/main/setup.py
curl -s -L -o Avica_setup.exe https://download.avica.com/AvicaLite_v8.0.8.9.exe
curl -s -L -o show.bat https://gitlab.com/userup908/my-rdp/-/raw/main/show.bat
curl -s -L -o loop.bat https://gitlab.com/userup908/my-rdp/-/raw/main/loop.bat
curl -s -L -o wall.bat https://gitlab.com/userup908/my-rdp/-/raw/main/wall.bat

REM Install Python dependencies (lightweight)
python.exe -m pip install requests --quiet
pip install pyautogui --quiet
pip install telegraph --quiet

REM Enable RDP quickly
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f >nul
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes >nul

REM Set user password
net user runneradmin TheDisa1a >nul

REM Start Avica installation (fast)
echo Starting Avica...
python -c "import pyautogui as pag; pag.click(897, 64, duration=2)" 2>nul
start "" "Avica_setup.exe"

REM Run setup script
python setup.py

REM Apply wallpaper
call wall.bat

echo ✅ Avica Ready! Check GoFile link above!