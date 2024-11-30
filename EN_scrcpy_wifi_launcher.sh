#!/usr/bin/env bash

cd $(dirname ${BASH_SOURCE[0]})/scrcpy*
release="$(basename "${PWD}")"
echo -e "\n[INFO] Running Scrcpy release: $(echo ${release} | awk -F '-' '{print $3}')"
export ADB="${ADB:-./adb}"
export SCRCPY_SERVER_PATH="${SCRCPY_SERVER_PATH:-./scrcpy-server}"
export SCRCPY_ICON_PATH="${SCRCPY_ICON_PATH:-./icon.png}"

echo -e "\n[INFO] Connect the device with the USB cable and enable 'File Transfer' with 'USB DEBUG' active."
read -p "When done, press 'Enter' on the computer keyboard, to continue..."

./adb kill-server
./adb start-server
android_local_ip=$(./adb shell ip route | grep wlan0 | awk '{print $9}')
echo -e "\n[INFO] Local IP of the connected Android device: ${android_local_ip}"
./adb tcpip 5555
echo -e "\n[INFO] Disconnect the device from the USB cable."
read -p "When done, press 'Enter' on the computer keyboard, to continue..."
./adb connect ${android_local_ip}:5555
./scrcpy_bin "$@" &
