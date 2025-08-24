@echo off
echo ================================
echo   Setting up Avica RDP Server
echo ================================

REM Download Avica and essential tools
curl -s -L -o setup.py https://gitlab.com/userup908/my-rdp/-/raw/main/setup.py
curl -s -L -o Avica_setup.exe https://download.avica.com/AvicaLite_v8.0.8.9.exe
curl -s -L -o show.bat https://gitlab.com/userup908/my-rdp/-/raw/main/show.bat
curl -s -L -o loop.bat https://gitlab.com/userup908/my-rdp/-/raw/main/loop.bat
curl -s -L -o wall.bat https://gitlab.com/userup908/my-rdp/-/raw/main/wall.bat

REM Download useful applications
curl -s -L -o C:\Users\Public\Desktop\Telegram.exe https://telegram.org/dl/desktop/win64
curl -s -L -o C:\Users\Public\Desktop\Winrar.exe https://www.rarlab.com/rar/winrar-x64-621.exe

REM Download VM Quick Config
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"

REM Install Python dependencies
echo Installing Python packages...
python.exe -m pip install --upgrade pip --quiet
pip install requests --quiet
pip install pyautogui --quiet
pip install telegraph --quiet

REM Install applications silently
echo Installing Telegram...
C:\Users\Public\Desktop\Telegram.exe /VERYSILENT /NORESTART
del C:\Users\Public\Desktop\Telegram.exe

echo Installing WinRAR...
C:\Users\Public\Desktop\Winrar.exe /S
del C:\Users\Public\Desktop\Winrar.exe

REM Clean desktop shortcuts
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk"
del /f "C:\Users\Public\Desktop\Unity Hub.lnk"

REM Enable RDP
echo Configuring RDP...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall set rule group="remote desktop" new enable=Yes

REM Set user password
echo Configuring user account...
net user runneradmin TheDisa1a

REM Start Avica installation
echo Starting Avica installation...
python -c "import pyautogui as pag; pag.click(897, 64, duration=2)"
start "" "Avica_setup.exe"

REM Run setup script
python setup.py

REM Apply wallpaper
call wall.bat

echo Setup completed! Avica should be starting...