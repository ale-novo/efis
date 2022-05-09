#!/bin/bash
xrandr --newmode "720x720"   41.50  720 752 824 928  720 723 733 748 -hsync +vsync
xrandr --addmode DSI-1 720x720
xrandr --output DSI-1 --mode 720x720
unclutter -idle 0.2 &

cd /home/pi/efis/
git pull
sleep 15


cd /home/pi/efis/simvim
./SimVimPanel_RPi

