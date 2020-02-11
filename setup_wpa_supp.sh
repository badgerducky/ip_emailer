#!/bin/bash

##need to add a check for ssid="eduroam" so that this can berun a million times without issue
##this will be changed to python3 in the ideal future
##python 3 will handle the password input with stdiomask
sudo touch /etc/wpa_supplicant/wpa_supplicant.conf
sudo cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.bak
echo "network={" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "        ssid=\"eduroam\"" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "        scan_ssid=1" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "        key_mgmt=WPA-EAP" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "        eap=PEAP" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "        identity=/"<pid>@vt.edu/"" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "        password=/"<network password>/"" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "        phase1=/"peaplabel=0/"" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "        phase2=/"auth=MSCHAPV2/"" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf
echo "}" | sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf


sudo cp /etc/network/interfaces /etc/network/interfaces.bak
echo "source-directory /etc/network/interfaces.d" | sudo tee -a /etc/network/interfaces
echo "auto wlan0" | sudo tee -a /etc/network/interfaces
echo "allow-hotplug wlan0" | sudo tee -a /etc/network/interfaces
echo "iface wlan0 inet manual" | sudo tee -a /etc/network/interfaces
echo "        pre-up wpa_supplicant -B -Dwext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf" | sudo tee -a /etc/network/interfaces
echo "        post-down killall -q wpa_supplicant" | sudo tee -a /etc/network/interfaces

