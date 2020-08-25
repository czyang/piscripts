#!/bin/bash

# This little script from here: https://youtu.be/VJC6OpGpq0Y?t=26

clear

for f in {1..7}
do
	vcgencmd measure_temp
	sysbench --test=cpu --cpu-max-prime=25000 --num-threads=4 run >/dev/null 2>&1
done

vcgencmd measure_temp
