#!/bin/bash

URL="https://launcher.mojang.com/v1/objects/ab4ecebb133f56dd4c4c4c3257f030a947ddea84/1_18_experimental-snapshot-7.zip"
ZIPNAME="snapshot.zip"
MCVERSION="1.18 Experimental Snapshot 7/pending"

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
echo "Archive expanded!"
rm $ZIPNAME &> /dev/null
echo "$MCVERSION installation complete!"