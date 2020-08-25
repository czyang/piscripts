#!/bin/bash

# This little script from here: https://youtu.be/VJC6OpGpq0Y?t=26

# Before start install sysbench
# curl -s https://packagecloud.io/install/repositories/akopytov/sysbench/script.deb.sh | sudo bash
# sudo apt -y install sysbench

clear

if ! command -v sysbench &> /dev/null
then
    echo "sysbench could not be found, please install it first."
    exit
fi


for f in {1..7}
do
	vcgencmd measure_temp
	sysbench --test=cpu --cpu-max-prime=25000 --num-threads=4 run >/dev/null 2>&1
done

vcgencmd measure_temp
