# place plist in: 
/Users/slava/Library/LaunchAgents/com.kanata.tray.plist

# add app to sudoers:
sudo visudo -f /private/etc/sudoers.d/kanata-tray
slava ALL=(ALL) NOPASSWD: /opt/homebrew/bin/kanata *
slava ALL=(ALL) NOPASSWD: /Users/slava/Tools/kanata-tray-macos *

# troubleshooting:
launchctl bootstrap gui/$(id -u) /Users/slava/Library/LaunchAgents/com.kanata.tray.sudorunner.plist

launchctl bootout gui/$(id -u) /Users/slava/Library/LaunchAgents/com.kanata.tray.sudorunner.plist

chmod +x /Users/slava/Repos/Other/CleanMachineSetup/config_files/Kanata/mac/kanata.tray.sudorunner.sh
