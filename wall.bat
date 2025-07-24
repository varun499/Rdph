@echo off
powershell -Command "Invoke-WebRequest https://gitlab.com/gusta7w7/pcrdp-avica/-/raw/main/TranscodedWallpaper -OutFile TranscodedWallpaper"
powershell -Command "Invoke-WebRequest https://gitlab.com/gusta7w7/pcrdp-avica/-/raw/main/20250724_151706.jpg -OutFile 20250724_151706.jpg"

set "TranscodedWallpaper=TranscodedWallpaper"
set "CachedImage=20250724_151706.jpg"

set "destinationDir=C:\Users\runneradmin\AppData\Roaming\Microsoft\Windows\Themes"
set "cachedFileDir=C:\Users\runneradmin\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles"

copy /y "%TranscodedWallpaper%" "%destinationDir%\TranscodedWallpaper"
copy /y "%CachedImage%" "%cachedFileDir%\20250724_151706.jpg"

RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters ,1 ,True