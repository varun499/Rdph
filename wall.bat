@echo off
setlocal

set "ImageUrl=https://gitlab.com/gusta7w7/pcrdp-avica/-/raw/main/20250724_151706.jpg"
set "ImagePath=%TEMP%\wallpaper.jpg"

:: Baixa a imagem usando PowerShell
powershell -Command "Invoke-WebRequest '%ImageUrl%' -OutFile '%ImagePath%'"

:: Usa PowerShell para definir como wallpaper
powershell -Command ^
Add-Type @\" ^
using System.Runtime.InteropServices; ^
public class Wallpaper { ^
  [DllImport(\"user32.dll\", SetLastError = true)] ^
  public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); ^
}@\"; ^
[Wallpaper]::SystemParametersInfo(20, 0, '%ImagePath%', 0x01 -bor 0x02)

endlocal