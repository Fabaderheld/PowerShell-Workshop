## PowerShell beginners Workshop

The goal of this workshop is to provide a basic understanding of PowerShell and it's features

It is split into multiple sessions with a max duration of 30 min and contains the following topics:
* PowerShell overview
* PowerShell basics
* PowerShell basic scripting
* PowerShell in operations
* PowerShell advanced scripting
* PowerShell comparison to bash





Metadata

Generate Session Folders

``` ps1
Get-Content .\readme.md | Select-String "^\* PowerShell" | ForEach-Object {
    $sessionPath = ".\$($_.ToString().Substring(2))"
    New-Item -Path $sessionPath -Type Directory -EA SilentlyContinue
    if (-not (Test-Path -Path $sessionPath\readme.md)) {
        New-Item -Path $sessionPath\readme.md -Type file -EA SilentlyContinue
    }
    Set-Content -Path  $sessionPath\readme.md -Value "## $($_.ToString().Substring(2))"
    }
```