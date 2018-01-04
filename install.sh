#!/bin/sh

# Update RPi. Install required package
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install libharfbuzz0b libfontconfig1 vim nginx git -y

cd ~/babyphone
git submodule update --init

sudo touch /var/log/picam.log
sudo chmod 777 /var/log/picam.log

sudo cp babyphone /etc/init.d
sudo chmod +x /etc/init.d/babyphone
sudo update-rc.d babyphone defaults

sudo cp shutdown /etc/init.d
sudo chmod +x /etc/init.d/shutdown
sudo update-rc.d shutdown defaults

sudo cp -f default /etc/nginx/sites-available/default
sudo systemctl restart nginx

sudo cp -rf ~/babyphone/picam-viewer/* /var/www/html

