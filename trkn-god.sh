#!/bin/bash
# Script Bash pour générer tous les CLSID Windows depuis une liste
# Usage: ./godmodes_full.sh /mnt/usb/CLSID

TARGET="${1:-./CLSID}"
CLSIDS="clsid_full.txt"

mkdir -p "$TARGET"

if [[ ! -f "$CLSIDS" ]]; then
  echo "[ERREUR] Fichier $CLSIDS introuvable !"
  exit 1
fi

echo "[*] Création des dossiers CLSID dans $TARGET ..."
while IFS="|" read -r name clsid; do
  [[ -z "$name" || -z "$clsid" ]] && continue
  mkdir -p "$TARGET/$name.$clsid"
  echo "[+] $name -> $clsid"
done < "$CLSIDS"

echo "[OK] Dossiers prêts. Branche sur Windows pour les tester."
