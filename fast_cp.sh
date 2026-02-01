#!/bin/bash

set -ex

mount /dev/mmcblk0p1 /mnt/usb/

os9 copy -rl "./disk/A1/menuedat" HD0.img,/A1
os9 copy -rl "./disk/A1/PRG/.eichen" HD0.img,/A1/PRG
os9 copy -rl "./disk/A1/PRG/.eichen5" HD0.img,/A1/PRG
os9 copy -rl "./disk/A1/PRG/.grundst" HD0.img,/A1/PRG
os9 copy -rl "./disk/A1/PRG/.wz1" HD0.img,/A1/PRG
os9 copy -rl "./disk/A1/PRG/.wz2" HD0.img,/A1/PRG
os9 copy -rl "./disk/A1/PRG/.wz3" HD0.img,/A1/PRG
os9 copy -rl "./disk/A1/PRG/.wz4" HD0.img,/A1/PRG
os9 copy -rl "./disk/A1/PRG/.wz5" HD0.img,/A1/PRG
os9 copy -rl "./disk/A1/PRG/.wz6" HD0.img,/A1/PRG

for f in ./disk/CMDS.TEXT/*; do
    os9 copy -rl "$f" HD0.img,/CMDS.TEXT
done

for f in ./bludiste/a1_prg/*; do
    if [[ "$(basename "$f")" != *.* ]]; then
        os9 copy -rl "$f" HD0.img,/A1/PRG
    fi
done

cp -f ./HD0.img /mnt/usb/
umount /mnt/usb/
