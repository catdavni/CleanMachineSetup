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