#!/bin/sh
killall conky
conky -q -c $HOME/.conky_config/conky-mpd &
conky -q -c $HOME/.conky_config/conky-time &
conky -q -c $HOME/.conky_config/conky-cpu &
conky -q -c $HOME/.conky_config/conky-network &
conky -q -c $HOME/.conky_config/conky-process & exit
