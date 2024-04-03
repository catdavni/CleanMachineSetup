@echo off

echo "Setiing windows 10 context menu"
call EnableNormalContextMenu.bat

echo "setting powershell policy"
powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser"

echo "installing scoop"
powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
echo scoop installed to: C:\Users\%USERNAME%\scoop\shims
set PATH=%PATH%;C:\Users\%USERNAME%\scoop\shims

echo "installing scoop components"
powershell -Command "./install_packages_scoop.ps1"

echo "installing winget"
powershell -Command "Start-Process PowerShell -ArgumentList '-File winget_install/winget-install.ps1' -Verb RunAs -Wait"
powershell -Command "./install_packages_winget.ps1"



