# Path: scripts/mountFileShare.ps1

$storageAccountName = "azfirststorage001"
$storageAccountKey = ""
$fileShareName = "az-firstfileshare"
$localPath = "Z:"

Install-Module -Name Az -AllowClobber -Force -Scope CurrentUser
Install-Module -Name Az.Accounts -AllowClobber -Force -Scope CurrentUser

# Tester la connexion au partage de fichiers Azure
$connectTestResult = Test-NetConnection -ComputerName "$storageAccountName.file.core.windows.net" -Port 445
if ($connectTestResult.TcpTestSucceeded) {
    # Enregistrer le mot de passe pour que le lecteur persiste après le redémarrage
    cmd.exe /C "cmdkey /add:`"$storageAccountName.file.core.windows.net`" /user:`"$storageAccountName`" /pass:`"$storageAccountKey`""
    
    # Mapper le partage de fichiers au chemin local
    net use $localPath "\\$storageAccountName.file.core.windows.net\$fileShareName" /u:$storageAccountName $storageAccountKey
    
    Write-Host "Azure File Share monté sur $localPath"
}
else {
    Write-Error -Message "Impossible d'atteindre le compte de stockage Azure via le port 445. Vérifiez que votre organisation ou votre FAI ne bloque pas le port 445, ou utilisez Azure P2S VPN, Azure S2S VPN, ou Express Route pour acheminer le trafic SMB via un port différent."
}
