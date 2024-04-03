@echo off
start NormalContextMenu.reg
echo "Restarting explorer..."
taskkill /F /IM explorer.exe
start explorer.exe