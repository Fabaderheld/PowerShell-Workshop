# PowerShell Basic Scripting
- [PowerShell Basic Scripting](#powershell-basic-scripting)
  - [Scripting](#scripting)
  - [Input / OutPut](#input--output)
- [Script Structure](#script-structure)
  - [Parameter Block](#parameter-block)
  - [Functions](#functions)
  - [Modules](#modules)
  - [VS Code](#vs-code)
  - [VS Code Intellisense](#vs-code-intellisense)
  - [Vs CodeDebugging](#vs-codedebugging)
Powershell
Fabian Sasse, Stefan Zmatlo
## Scripting
Variables
DEMO TIME
## Input / OutPut
Read-Host – Prompts the user for interactive input
Pipeline – Takes data from previous cmdlets pipeline
Parameters
Write-Output –
Write-Debug/Error/Warning/Information – Levels of verbosity
Type / Typecasting
Modules
Get-InstalledModule Lists installed Modules (not currently loaded!)
Get-Module Lists currently loaded modules

# Script Structure
## Parameter Block

## Functions
## Modules


Variables / Aliases
$_ - Current Object in Pipe
? - Where-Object
% - Foreach-Object
Finding the right command
Get-Command aka gcm
Get-Members aka gm
Get-help aka help
Show-Command
Keyboard Shortcuts
Autocomplete with CTRL + SPACE
Works on Cmdlets and parameters
Powershell Remoting
Install Powershell 7:
Linux Installing PowerShell on Linux - PowerShell | Microsoft Docs
Mac Installing PowerShell on macOS - PowerShell | Microsoft Docs
Advanced Use
(Get-VM | ? { $_.Guest.OSFullName -like "*windows*"}) | select name, @{Name = "OS"; Expression = {(Get-ADComputer -Identity $_.Name -Properties OperatingSystemVersion).OperatingSystemVersion }}, @{Name = "DataStore"; Expression = { Get-Datastore -id $_.DatastoreIdList}}
Explanation
Powershell repo
https://bitbucket.vbc.ac.at/projects/VBCOPS/repos/scriptsandsnippets/browse
Notes
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUserSets executionpolicy to unrestricted for current user
Links
https://poshcode.gitbook.io/powershell-practice-and-style
https://adamtheautomator.com/
about Profiles - PowerShell | Microsoft Docs
Literature
Windows Powershell – Tobias Weltner
Learn Windows Powershell in a month of lunches – Don Jones
Powershell Cookbook – Lee Holmes
