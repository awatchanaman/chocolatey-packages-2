﻿$packageName = '{{PackageName}}'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = '{{DownloadUrl}}'
$checksum = '{{Checksum}}'
$checksumType = 'sha256'
$url64 = '{{DownloadUrlx64}}'
$checksum64 = '{{Checksumx64}}'
$checksumType64 = 'sha256'

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Url64bit "$url64" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "$checksumType64"

# create empty sidecar so shimgen.exe creates shim for GUI rather than console
$guiExe = Get-ChildItem -Recurse -Path $toolsDir -Include "bitcoin-qt.exe"
if ($guiExe) {Set-Content -Path $($guiExe.FullName+".gui") -Value $null}
