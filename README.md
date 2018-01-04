Babyphone/Baby Monitor with Raspberry Pi

I was looking for a way to build a babyphone using a raspberry pi. My main objective is a quick & dirty solution so that I can monitor my child while he is sleepling.

I found some related projects:

* [https://github.com/ivadim/fruitnanny](https://github.com/ivadim/fruitnanny): use webrtc, nice case design, night vision
* [https://kamranicus.com/guides/raspberry-pi-3-baby-monitor](https://kamranicus.com/guides/raspberry-pi-3-baby-monitor): use picam, adaptive streaming with hls
* [https://www.element14.com/community/community/raspberry-pi/raspberrypi_projects/blog/2016/04/25/noir-v2-video-streaming-baby-monitor](https://www.element14.com/community/community/raspberry-pi/raspberrypi_projects/blog/2016/04/25/noir-v2-video-streaming-baby-monitor)

Fruitnany seems to be a completed project and should work well but I couldn't make it work with my both RPi2 & RPi 3. No video is shown.

So I tried the picam solution and it worked pretty well. The only drawback is the stream lags 3-4 seconds behind. But for my usecase, it is not a big problem.

This project aims to create a simple installation script to install the required softwares to transform a RPi + a camera module to a simple Babyphone.

I added an additional feature for my convenience:

* A shutdown button + led status so that I know if it is safe to unplug the RPi

# Step 1: Basic configuration

* Flash **Raspian Stretch** : the binary Picam in the source repository is built for **Stretch**. If you use a different version of Raspian, please adapt the install.sh script to download the correct version of picam first before running it.
* Connect the RPi with Wifi/Ethernet
* Enable ssh, camera and remote GPIO
* Configure the Hostname: (copied from [https://kamranicus.com/guides/raspberry-pi-3-baby-monitor](https://kamranicus.com/guides/raspberry-pi-3-baby-monitor)

> The Raspberry Pi can be pinged and connected to via the hostname babypi.local or whatever name you chose in the last step (plus .local at the end). However, the IP address this defaults to is a long one (IPv6). Web browsers can have trouble connecting to the Pi with this enabled, so we need to disable IPv6 hostname resolution.
> 
`sudo nano /etc/avahi/avahi-daemon.conf`

> On the line use-ipv6=yes change yes to no. Press Ctrl-O to save (hit Enter), then Ctrl-X to exit.
> 
> Now reboot! sudo reboot

# Step 2: Install code

```
cd ~
git clone https://github.com/peacemoon/RaspberryPi-Babyphone.git ~/babyphone
cd ~/babyphone
./install.sh
sudo systemctl reboot
```

# Step 3: Access video stream
There are 2 ways to access the video stream:

* Web browser: just open http://babypi.local or http://<ip of the RPi>
* VLC: open the network stream http://babypi.local/hls/index.m3u8


