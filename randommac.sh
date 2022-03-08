#!/bin/zsh

# Version 0.1 - Tested on macOS 12.2.1 - 2022-03-07
# Generates a random MAC address, disconnects from any Wi-Fi networks, and sets the Wi-Fi
# interface to use the random address. 

MACADDRESS=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/./0/2; s/.$//')
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport "en0" -z
sudo ifconfig en0 ether $MACADDRESS