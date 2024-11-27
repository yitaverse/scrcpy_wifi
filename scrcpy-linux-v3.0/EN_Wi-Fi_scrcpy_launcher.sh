#!/usr/bin/env bash

release="$(basename "${PWD}")"
echo -e "\n[INFO] Running Scrcpy Release: $(echo ${release} | awk -F '-' '{print $3}')"
cd "${PWD}"
export ADB="${ADB:-./adb}"
export SCRCPY_SERVER_PATH="${SCRCPY_SERVER_PATH:-./scrcpy-server}"
export SCRCPY_ICON_PATH="${SCRCPY_ICON_PATH:-./icon.png}"

echo -e "\n[INFO] Connect the device with the USB cable and enable 'File Transfer' with 'USB DEBUG' active."
read -p "Press 'Enter' when done, to continue..."

./adb kill-server
./adb start-server
android_local_ip=$(./adb shell ip route | grep wlan0 | awk '{print $9}')
echo -e "\n[INFO] Local IP of the connected Android device: ${android_local_ip}"
./adb tcpip 5555
echo -e "\n[INFO] Disconnect the device from the USB cable."
read -p "Press 'Enter' when done, to continue..."
./adb connect ${android_local_ip}:5555
./scrcpy_bin "$@" &
