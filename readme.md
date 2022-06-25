# PowerShell Beginners Workshop

The goal of this workshop is to provide a basic understanding of PowerShell and it's features

It is split into multiple sessions with a max duration of 30 min and contains the following topics:
* PowerShell overview
* PowerShell basics
* PowerShell advanced
* PowerShell basic scripting
* PowerShell advanced scripting
* PowerShell in operations
* PowerShell in VS Code
* PowerShell comparison to bash





Metadata

Generate Session Folders

``` ps1
Get-Content .\readme.md | Select-String "^\* PowerShell" | ForEach-Object {
    $sessionPath = ".\$($_.ToString().Substring(2))"
    New-Item -Path $sessionPath -Type Directory -EA SilentlyContinue
    }
```