sudo bash /home/pi/babyphone/make_dirs.sh
sudo /home/pi/babyphone/picam/picam -o /run/shm/hls --samplerate 32000 --channels 2 --audiobitrate 96000 --videobitrate 4000000 --vfr --avclevel 3.1 --autoex --time --alsadev hw:1,0  >/var/log/picam.log 2>&1
