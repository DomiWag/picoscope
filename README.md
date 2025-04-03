# picoscope
A DiY microscope based on Raspberry Pi Zero W, Raspberry Pi HQ Camera and a microscope lens

## Features
- View microscope image after startup
- Display timestamp in microscope image
- Shutdown via GPIO21
- Write-protected boot partition to allow yanking the power

**Note**: this is a WiP branch to port the project to Debian Bookworm.

## ToDos

- [ ] Rewrite `camera.sh` in Python using picamera2 and opencv
- [ ] Replace `rc.local` with a proper Systemd Unit
- [ ] Replace `shutdown.py` with dtoverlay
- [ ] Update README

## Required hardware
- Raspberry Pi Zero 2 W ([Pimoroni](https://shop.pimoroni.com/products/raspberry-pi-zero-2-w?variant=39493046075475)) (other Pis will probably work as well)
- Raspberry Pi HQ Camera ([Pimoroni](https://shop.pimoroni.com/products/raspberry-pi-high-quality-camera?variant=31675712241747))
- Microscope mount and lens ([Pimoroni](https://shop.pimoroni.com/products/microscope-stand-with-0-12-1-8x-lens?variant=31885089046611))
- Micro SD-Card & reader

## Setup procedure
1. Install [Raspberry Pi Imager](https://www.raspberrypi.com/software/) ([GitHub source](https://github.com/raspberrypi/rpi-imager))
2. Download the last official [Raspberry Pi OS based on Debian Buster](https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2021-05-28/)
3. Open Imager, select your Pi, then select _Use custom_. Pick the zip file that you downloaded in the previous step
4. Use customizations to Enable SSH, change the default password and supply your WiFi-credentials. It is also recommended to setup public key authentication.
5. Write everything to your Micro SD-Card
6. Power on and SSH into the Pi
7. Run `sudo apt update && sudo apt full-upgrade -y`
8. Reboot: `sudo systemctl reboot`
9. Run `sudo raspi-config`
10. Goto _3 Interface Options_, _P1 Camera_ and enable the camera interface
11. Goto _4 Performance Options_, _P3 Overlay File System_
12. Select _No_ for overlay file system, then select _Yes_ for write-protected boot parition
13. Finish and reboot
14. Copy the files from this repo to the system using SCP:
    - Copy `camera.sh` to `/home/pi/camera.sh`
    - Copy `shutdown.py` to `/home/pi/shutdown.py`
    - Copy `rc.local` to `/home/pi/rc.local`
15. Make `camera.sh` executable: `chmod +x /home/pi/camera.sh`
16. Run `./camera.sh` to verify that it is working
17. Enable automatic startup: run `sudo cp /home/pi/rc.local /etc/rc.local`
18. Reboot and enjoy