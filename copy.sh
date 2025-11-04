#!/bin/bash

IMG="HD0_cs.img"
SOURCE="./img/CMDS.TEXT"
TARGET="/CMDS.TEXT"

# zkontroluj, zda image existuje
if [ ! -f "$IMG" ]; then
    echo "Disk image $IMG nenalezen."
    exit 1
fi

if [ ! -d "$SOURCE" ]; then
    echo "Zdrojová složka $SOURCE nenalezena."
    exit 1
fi


# projdi všechny soubory v aktuálním adresáři
for file in "$SOURCE"/*; do
    # preskoc adresare
    [ -f "$file" ] || continue

    BASENAME=$(basename "$file")
    
    # pokud existuje, preskoc dotaz a rovnou prepis
    echo "Kopiruji $file $IMG,$TARGET/$BASENAME"
    os9 copy -rl "$file" "$IMG","$TARGET/$BASENAME"
    # os9 copy -r ./img/A1/f1 HD0_cs.img,/f1
done

echo "✅ Vsechny soubory byly nahrany do $IMG:$TARGET"

