function procByArg {
    param (
        [string]$processName,
        [string]$arg
    )

    # $filteredProcesses = tasklist | rg $processName -i
    $all = Get-CimInstance Win32_Process
    $filteredByName = $all | Where-Object { $_.Name -ilike "*$processName*" }
    $filteredByArg = $filteredByName | Where-Object { $_.CommandLine -ilike "*$arg*" }
    $selectedProps = $filteredByArg | Select-Object Name, ProcessId, CommandLine

    $extractedArgs = $selectedProps | % {
        $extractedArg = extractWithinSpaces $_.CommandLine $arg
        [pscustomobject] @{
            Name         = $_.Name
            ProcessId    = $_.ProcessId
            # CommandLine  = $_.CommandLine
            ExtractedArg = $extractedArg
        }
    }
    return $extractedArgs
    
}

function extractWithinSpaces {
    param (
        [string]$inputString,
        [string]$searchString
    )

    # Perform case-insensitive search for the partial search string
    $position = [regex]::Match($inputString, $searchString, [System.Text.RegularExpressions.RegexOptions]::IgnoreCase).Index

    if ($position -ge 0) {
        # Find the position of the space before the match
        $start = $inputString.LastIndexOf(' ', $position) + 1
        
        # Find the position of the space after the match
        $end = $inputString.IndexOf(' ', $position)
        if ($end -eq -1) {
            $end = $inputString.Length
        }

        # Extract the full substring
        $fullMatch = $inputString.Substring($start, $end - $start)
        return $fullMatch
    }
    else {
        Write-Output "String matching '$searchString' not found."
        return ''
    }
}

# processByArg "electron" "procname"