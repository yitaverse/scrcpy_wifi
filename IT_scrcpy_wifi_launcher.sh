#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE[0]})/scrcpy*
release="$(basename "${PWD}")"
echo -e "\n[INFO] Versione di Scrcpy in esecuzione: $(echo ${release} | awk -F '-' '{print $3}')"
export ADB="${ADB:-./adb}"
export SCRCPY_SERVER_PATH="${SCRCPY_SERVER_PATH:-./scrcpy-server}"
export SCRCPY_ICON_PATH="${SCRCPY_ICON_PATH:-./icon.png}"

echo -e "\n[INFO] Collegare il dispositivo con il cavo USB e abilitare il 'Trasferimento di file' con 'DEBUG USB' attivo."
read -p "Quando fatto, premere 'Invio' sulla tastiera del computer, per continuare..."

./adb kill-server
./adb start-server
android_local_ip=$(./adb shell ip route | grep wlan0 | awk '{print $9}')
echo -e "\n[INFO] IP locale del dispositivo Android collegato: ${android_local_ip}"
./adb tcpip 5555
echo -e "\n[INFO] Scollegare il dispositivo dal cavo USB."
read -p "Quando fatto, premere 'Invio' sulla tastiera del computer, per continuare..."
./adb connect ${android_local_ip}:5555
./scrcpy_bin "$@" &
