$Computers = Get-Content "C:\temp\checkdiskofthesecomp.txt"

foreach ($Computer in $Computers) {

    for ($test = 0; $test -lt 26; $test++){

    $L = [char](65 + $test) + ":"

    $NameOfDisk = "DeviceID='$L'" 

    $disk = Get-WmiObject Win32_LogicalDisk -ComputerName $Computer -Filter $NameOfDisk | Select-Object Size,FreeSpace

    $GBDiskSize = ($disk.Size /1024 /1024 /1024)

    $GBFreeSpace = ($disk.FreeSpace /1024 /1024 /1024)

    if ($GBDiskSize -or $GBFreeSpace -ne 0){
    
        Write-Host "$Computer $NameOfDisk Total Size of Disk": $GBDiskSize "GB"

        Write-Host "$Computer $NameOfDisk Free Disk Space": $GBFreeSpace "GB"}

    }

}
