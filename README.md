# scrcpy_wifi
Run `scrcpy` over Wi-Fi, without a USB cable.

This repository simplifies the commands shown in the [video](https://youtu.be/5-Kv2MOwBUA) dedicated to `scrcpy` for the Windows environment, on my YouTube [channel](https://www.youtube.com/@yitaverse), by automating them with a bash script (`EN_Wi-Fi_scrcpy_launcher.sh` for the English language, `IT_Wi-Fi_scrcpy_launcher.sh` for the Italian language) executable in Linux environment.

Personally, I have associated the script launch with an `alias` saved in the `~/.bashrc` file, after saving the ZIP of this repository in a path of my choice (e.g. `~/Programs/scrcpy_wifi`):

`nano ~/.bashrc`

`alias scrcpy_wifi='bash "${HOME}/Programs/scrcpy_wifi/scrcpy-linux-v3.0/EN_Wi-Fi_scrcpy_launcher.sh"'`

Save the modified `~/.bashrc` file by pressing `CTRL+X` then confirm with `Y` and `Enter`, and finally run:

`source ~/.bashrc`

to find the new `scrcpy_wifi` command available in the terminal, following the terminal instructions, namely:

1) connect the device with the USB cable, confirm the "File Transfer" on the device and make sure you have the "USB Debug" option active in the "Development Options" (as shown in the [video](https://youtu.be/5-Kv2MOwBUA)), BEFORE pressing `Enter` on the computer keyboard;
2) disconnect the Android device from the USB cable, BEFORE pressing `Enter` on your computer keyboard again, to start `scrcpy` in Wi-Fi mode.
