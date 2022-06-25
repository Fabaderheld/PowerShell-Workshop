############################
#
# TypeCasting
#
############################


# Powershell uses Autotyping
$MyVariable = "This is a string"
$MyVariable
$MyVariable.Length # Show string length
$MyVariable.GetType()

# Autotype to int32
Remove-Variable -Name MyVariable
$MyVariable = 23
$MyVariable
$MyVariable.GetType()
([string]$MyVariable).GetType() # Typecast on the fly to string

# Autotype to array
Remove-Variable -Name MyVariable
$MyVariable = @("This", "is", "an", "array")
$MyVariable
$MyVariable.GetType()

# Autotype to hastable
Remove-Variable -Name MyVariable
$MyVariable = @{key = "value" }
$MyVariable
$MyVariable.key
$MyVariable["key"]
$MyVariable.GetType() # Don't know why there is so much more output here
$MyVariable | ConvertTo-Json # Output as JSON


# Force String
Remove-Variable -Name MyVariable
[String]$MyVariable = 23
$MyVariable
$MyVariable.GetType()

# Force Array
Remove-Variable -Name MyVariable
[Array]$MyVariable = "This is an array"
$MyVariable
$MyVariable[0] 
$MyVariable.Length # show array items instead of string length
$MyVariable.GetType()
$MyVariable.Add("Yet another String")  # Fails 
$MyVariable += "Another String" # works but why? += creates a new array $MyVariable with larger size https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_arrays?view=powershell-7.1
$MyVariable.IsFixedSize

############################
#
# Arrays / Lists
#
############################

# Create List 
# more info https://adamtheautomator.com/powershell-array/
Remove-Variable -Name MyVariable
$MyVariable = New-Object collections.generic.list[object]
$MyVariable.IsFixedSize
$MyVariable.Add("Yet another String")
$MyVariable += "Yet another String" 
$MyVariable.Add("A thrid String") # Fails again because += creates an array with fixed size
$MyVariable.IsFixedSize

# Force string array
Remove-Variable -Name MyVariable
[String[]]$MyVariable = 23
$MyVariable
$MyVariable.GetType()

############################
#
# Objects
#
############################

# Create PSCustomObject
Remove-Variable -Name MyVariable
$MyVariable = [PSCustomObject[]]@{
    FirstName = "Fabian"
    LastName  = "Sasse"
    Username  = "Fabian.sasse"
    Email     = "fabian.sasse@imba.oeaw.ac.at"
    Birthday  = Get-Date -Month 1 -Day 28 -Year 1985 # -Format dd.MM.yyyy
}

$MyVariable | Add-Member -MemberType ScriptMethod -Name Age -Value {$(Get-Date).Year - $this.Birthday.year }

$MyVariable.FirstName
$MyVariable | Select-Object Firstname
$MyVariable | Select-Object *name

$MyVariable += [PSCustomObject]@{
    FirstName = "Stefan"
    LastName  = "Zmatlo"
    Username  = "Stefan.Zmatlo"
    Email     = "Stefan.Zmatlo@imba.oeaw.ac.at"
}

[PSCustomObject]@{
    Name     = "Fabian.Sasse"
    ADGroups = (Get-ADUser -Identity "fabian.sasse" -Property memberof | Select-Object -ExpandProperty memberof | Get-ADGroup | Sort-Object name | Select-Object name).Name
}



Where-Object -InputObject $MyVariable -Property Firstname -eq Fabian