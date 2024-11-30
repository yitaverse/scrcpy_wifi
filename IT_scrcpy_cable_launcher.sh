#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE[0]})/scrcpy*
release="$(basename "${PWD}")"
echo -e "\n[INFO] Versione di Scrcpy in esecuzione: $(echo ${release} | awk -F '-' '{print $3}')"
export ADB="${ADB:-./adb}"
export SCRCPY_SERVER_PATH="${SCRCPY_SERVER_PATH:-./scrcpy-server}"
export SCRCPY_ICON_PATH="${SCRCPY_ICON_PATH:-./icon.png}"

echo -e "\n[INFO] Collegare il dispositivo con il cavo USB e abilitare il 'Trasferimento di file' con 'DEBUG USB' attivo."
read -p "Premere 'Invio' sulla tastiera del computer quando fatto, per continuare..."

./adb kill-server
./adb start-server
./scrcpy_bin "$@" &

