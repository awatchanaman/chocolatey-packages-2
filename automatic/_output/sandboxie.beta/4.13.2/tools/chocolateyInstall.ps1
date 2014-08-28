﻿$packageName = 'sandboxie.beta'
$installerType = 'EXE'
$url  = 'http://www.sandboxie.com/SandboxieInstall32-413-2.exe'
$url64 = 'http://www.sandboxie.com/SandboxieInstall64-413-2.exe'
$silentArgs = '/install /S /D=C:\Program Files\Sandboxie'

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"