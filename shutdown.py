import RPi.GPIO as GPIO
import subprocess
import os

GPIO.setmode(GPIO.BCM)
GPIO.setup(3, GPIO.IN, pull_up_down=GPIO.PUD_UP)
GPIO.wait_for_edge(3, GPIO.FALLING)

#subprocess.call(['shutdown', 'now'], shell=False)
os.system("shutdown -h now")
