
#!/bin/bash

URL="https://launcher.mojang.com/v1/objects/b1e589c1d6ed73519797214bc796e53f5429ac46/1_19_deep_dark_experimental_snapshot-1.zip"
ZIPNAME="snapshot.zip"
MCVERSION="Deep Dark Experimental Snapshot 1/pending"

echo "$MCVERSION Installer!"
echo "What is the full path to your Minecraft directory? (defaults to ~/.minecraft)"
read -p 'Directory: ' MCDIR
if [ -z "$MCDIR" ]; then
  MCDIR="$HOME/.minecraft"
fi
cd "$MCDIR/versions/" &> /dev/null
if [ $? -ne 0 ]; then
  echo "Invalid directory! Exiting..."
  exit
fi
echo "Downloading snapshot..."
wget -O "$ZIPNAME" $URL &> /dev/null
echo "Snapshot downloaded!"
echo "Expanding archive..."
unzip $ZIPNAME &> /dev/null
if [ $? -ne 0 ]; then
  echo "There was a problem extracting the archive, check if you have the unzip package installed"
  exit
fi
echo "Archive expanded!"
rm $ZIPNAME &> /dev/null
echo "$MCVERSION files successfully installed! You will need to create a new installation from the Minecraft launcher"
