#!/bin/bash
#https://askubuntu.com/questions/184204/how-do-i-fetch-only-numbers-in-grep
indexes=$(pacmd list-sink-inputs | grep index | grep -Eo '[0-9]{1,4}')

for f in $indexes; do
    pactl set-sink-input-volume $f 20%
    #echo $f
done

#echo $indexes
#pactl set-sink-input-volume 46 20%


