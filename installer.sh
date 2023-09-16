#!/bin/sh
echo "##############################################"
echo "#####[ Creating Symliks folder & files ]######"
echo "#####[    Created By : Ismail9875      ]######"
echo "#####[        Tangier : 11-9-23        ]######"
echo "##############################################"
# --- Create SymLinks Folder ---

cd /#
mkdir SymLinks 
mkdir SymLinks/etc 

echo "===================="
echo "==== List links ===="
echo "===================="
echo """
[1] /etc/tuxbox/config
[2] /etc/enigma2
[3] /usr/lib/enigma2/python/Plugins/extentions
[4] /usr/share/enigma2
[5] /usr/share/picon
[6] /media/hdd
"""
 

# --- Commande To Create Symbolic-Links
echo "Create /etc/tuxbox/config Symbolic Link .."
echo ".."
ln -s /etc/tuxbox/config/ SymLinks/etc/ 
echo "Create /etc/enigma2 Symbolic link .."
echo ".."
ln -s /etc/enigma2/ SymLinks/etc/ 
echo "Create /usr/share/enigma2 Symbolic Link .."
echo ".."
ln -s /usr/share/enigma2/ SymLinks/ 
echo "Create /usr/share/picon Symbolic Link .."
echo ".."
ln -s /usr/share/picon/ SymLinks/ 
echo "Create /media/hdd Symbolic Link .."
echo ".."
ln -s /media/hdd/ SymLinks/ 
echo "create /usr/..../Plugins/Extentions .."
echo ".."
ln -s /usr/lib/enigma2/python SymLinks/
echo "==============================="
echo "==== All Links Are Created ===="
echo "==============================="
echo " "
cd ..
sync
echo "###############################################"
echo "############   [  End All Proccess  ]   #######"
echo "############   [ Restat Enigma2 GUI ]   #######" 
echo "###############################################"
#init 4
#sleep 3
#init 1
exit 0
