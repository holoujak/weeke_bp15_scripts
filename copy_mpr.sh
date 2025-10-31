#!/bin/bash

MPR="$1"
IMG="$2"
DEFAULT_IMG="HD0.img"

TARGET="/A1/MPR"

if [ -z "$MPR" ]; then
  echo "Chyba: Nebyl zadán MPR soubor."
  echo "Použití: $0 <MPR> [<IMG>]"
  exit 1
fi

if [ ! -f "$MPR" ]; then
  echo "Chyba: Soubor '$MPR' neexistuje."
  exit 1
fi

if [ -z "$IMG" ]; then
  echo "Using default img path: $DEFAULT_IMG."
  IMG="$DEFAULT_IMG"
fi

if [ ! -f "$IMG" ]; then
    echo "Disk image $IMG nenalezen."
    exit 1
fi

echo "Kopiruji $file $IMG,$TARGET/$BASENAME"
BASENAME=$(basename "$MPR")

os9 copy -r "$MPR" "$IMG","$TARGET/$BASENAME"
# os9 copy -r ./img/A1/f1 HD0_cs.img,/f1

echo "Done"

