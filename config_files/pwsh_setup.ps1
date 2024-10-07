# zoxide
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# oh-my-posh
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/kali.omp.json" | Invoke-Expression

# fd
# find files
function f {
    fd --absolute-path --hidden --no-ignore --ignore-case $args | fzf | % { Set-Clipboard -Value $_ }
}

# find folders
function ff {
    fd --absolute-path --hidden --no-ignore --ignore-case --type dir $args | fzf | % { Set-Clipboard -Value $_ }
}


# pwsh
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -PredictionSource HistoryAndPlugin 
Set-PSReadLineOption -MaximumHistoryCount 500
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Chord Ctrl+y -Function Redo

# fzf search
function enableFzfCommandHistory {
    $command = Get-Content (Get-PSReadlineOption).HistorySavePath | Select-Object -Unique | fzf --tac
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert($command)
}

Set-PSReadLineKeyHandler -Chord Ctrl+r -ScriptBlock { enableFzfCommandHistory } -ViMode Insert
Set-PSReadLineKeyHandler -Chord Ctrl+r -ScriptBlock { enableFzfCommandHistory } -ViMode Command

# vim clipboard
function yankContentToClipboard {
    $inputBuffer = ""
    $cursorPosition = 0
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$inputBuffer, [ref]$cursorPosition)
    Set-Clipboard -Value $inputBuffer
}
Set-PSReadLineKeyHandler -Chord Y -ScriptBlock { yankContentToClipboard } -ViMode Command

# vim cursor mode
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewLine "`e[1 q"
    }
    else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewLine "`e[5 q"
    }
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange
