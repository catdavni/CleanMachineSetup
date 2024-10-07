scoop install git

# NON PORTABLE BUCKET
scoop bucket add nonportable
Start-Process powershell -ArgumentList "scoop install qttabbar-np" -Verb RunAs -Wait

# EXTRAS BUCKET
scoop bucket add extras
scoop install foxit-reader
scoop install ripgrep
scoop install winmerge
scoop install youtubedownloader
scoop install rapidee

scoop bucket add mentei https://github.com/den-mentiei/scoop-bucket.git
scoop install cffexplorer

# pwsh
scoop install zoxide
scoop install fzf
scoop install fd