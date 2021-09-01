@echo off
powershell -command "& { $URL = 'https://launcher.mojang.com/v1/objects/4697c84c6a347d0b8766759d5b00bc5a00b1b858/1_18_experimental-snapshot-6.zip'; $versionsfolder = Join-Path $ENV:appdata '.minecraft\versions'; $zipfile = Join-Path $ENV:appdata '.minecraft\versions\1_18_experimental-snapshot-6.zip'; Invoke-WebRequest -Uri $URL -OutFile $zipfile; Expand-Archive -LiteralPath $zipfile -DestinationPath $versionsfolder; Remove-item $zipfile; Read-Host -Prompt 'Successfully installed Minecraft 1.18 Expiremental Snapshot.  You will need to add a new installation in the launcher for it. Press enter to close this window.';}
