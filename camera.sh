#!/bin/bash
#-sa 100 turns up the saturation to maximum, adjust if necessary
#raspivid -t 0 -w 1920 -h 1080 -fps 30 -sa 100 -rot 180
raspivid -t 0 -w 1920 -h 1080 -fps 30 -sa 100 -rot 180 -a 1036 -a "%Y-%m-%d %X" -ae 100,ff,00,0,0,940 -o /dev/null
