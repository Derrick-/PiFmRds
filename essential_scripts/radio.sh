#!/bin/sh

#The program crashes after 4-5 hours, we can just restart to keep it going.

FREQ=92.0
STATION_NAME="Niall FM"
RADIO_TEXT="Welcome to Niall FM"
DELAY_RESTART=10s

cd /home/pi/Desktop/PiFmRds-master/src
while [ 1 ]
do
  echo .
  echo "*********"
  echo " >>> Starting Niall FM Radio Station..."
  echo "The time is currently:"
  date
  echo .
  sudo arecord -fS16_LE -r 44100 -D hw:Loopback,1,0 -c 2 | sudo ./pi_fm_rds -freq 92.0 -ps "$STATION_NAME" -rt "$RADIO_TEXT" -audio -
  echo "Process Exited, TIME:"
  date
  echo "********* Ended"
  sleep $DELAY_RESTART
done
