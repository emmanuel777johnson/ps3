<#

Purpose: 3rd Powershell lab Practice use of:  Here-strings, piping, Writing commands, conditional logic.
Author; Emmanuel Johnson
File: Lab3Spring2020.ps1
Date: Feb 20 2020
#>

<# Checkoff 1 #>
Clear-Host
Set-Location $env:USERPROFILE 
Get-ChildItem -Path C:\users\johemma -Filter *.txt | Sort-Object -Property name | Format-Table -Property name, length

<#Checkoff 2 #> 

$question = @"
1. Write a contact entry to a file
2. Display all files last written to after a given date
3. Read a specified text file
"@

$question
$choice = Read-Host "What choice would tou like?" 

<#Checkoff 3#>
if($choice -eq 1) {
    Write-Output "You chose to write a contact entry  to a file"
    $fullname = Read-Host "Full Name"
    $phonenumber = read-host "Phone Number"
    $email = read-host "Email"
    $filename = Read-Host "File name"
    Add-Content -Path $filename -Value $fullname
    Add-Content -Path $filename -Value $phonenumber
    Add-Content -Path $filename -Value $email
    Add-Content -Path $filename -Value ""



   
}


elseif($choice -eq 2) {
    Write-Output "You chise to display all files last written to after a given date"
    $date =  Read-Host "Enter earliest date of files to display"
    Get-ChildItem | Where-Object {$_.LastWriteTime -ge $date} | Sort-Object -Property lastwritetime | Format-Table -property name, lastwritetime
}

elseif($choice -eq 3) {
    Write-Output "You chose to Read a specified text file"
    $file = Read-Host "Name of text file"
    $exist = Test-Path $env:USERPROFILE\$file
    if($exist -eq $true) {Get-Content $env:USERPROFILE\$file}
    else {Write-Host "file $file does not exist"}
 
}

else {
    Write-Output "YOu chose $choice"
    Write-Output "That is not in the list"
    Write-Output " $env:username entered an invalid response on $env:computername"
}

<#checkoff 4#>









