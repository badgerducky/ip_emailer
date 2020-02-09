#!/bin/bash

cd /etc/wpa_supplicant/
sudo cp wpa_supplicant.conf wpa_supplicant.bak
echo "network={" | sudo tee -a /wpa_supplicant.conf
echo "        ssid=\"eduroam\"" | sudo tee -a /wpa_supplicant.conf
echo "        scan_ssid=1" | sudo tee -a /wpa_supplicant.conf
echo "        key_mgmt=WPA-EAP" | sudo tee -a /wpa_supplicant.conf
echo "        eap=PEAP" | sudo tee -a /wpa_supplicant.conf
echo "        identity=/"<pid>@vt.edu/"" | sudo tee -a /wpa_supplicant.conf
echo "        password=/"<network password>/"" | sudo tee -a /wpa_supplicant.conf
echo "        phase1=/"peaplabel=0/"" | sudo tee -a /wpa_supplicant.conf
echo "        phase2=/"auth=MSCHAPV2/"" | sudo tee -a /wpa_supplicant.conf
echo "}" | sudo tee -a /wpa_supplicant.conf

cd /etc/network
sudo cp interfaces interfaces.bak
echo "source-directory /etc/network/interfaces.d" | sudo tee -a /interfaces
echo "auto wlan0" | sudo tee -a /interfaces
echo "allow-hotplug wlan0" | sudo tee -a /interfaces
echo "iface wlan0 inet manual" | sudo tee -a /interfaces
echo "        pre-up wpa_supplicant -B -Dwext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf" | sudo tee -a /interfaces
echo "        post-down killall -q wpa_supplicant" | sudo tee -a /interfaces

