import subprocess

subprocess.run(["touch", "/etc/wpa_supplicant/wpa_supplicant.conf"])
subprocess.run(["cp", "/etc/wpa_supplicant/wpa_supplicant.conf", "/etc/wpa_supplicant/wpa_supplicant.conf"])
subprocess.run(["cp", "/etc/network/interfaces", "/etc/network/interfaces"])

with open("/etc/wpa_supplicant/wpa_supplicant.conf","a") as f:


##need to add a check for ssid="eduroam" so that this can berun a million times without issue
##this will be changed to python3 in the ideal future
##python 3 will handle the password input with stdiomask
    f.write("network={")
    f.write("        ssid=\"eduroam\"")
    f.write("        scan_ssid=1")
    f.write("        key_mgmt=WPA-EAP")
    f.write("        eap=PEAP")
    #f.write("        identity=/"<pid>@vt.edu/"")
    f.write("        password=/"<network password>/"")
    f.write("        phase1=/"peaplabel=0/"")
    f.write("        phase2=/"auth=MSCHAPV2/"")
    f.write("}")


i= open("/etc/network/interfaces","a")

i.write("source-directory /etc/network/interfaces.d")
i.write("auto wlan0")
i.write("allow-hotplug wlan0")
i.write("iface wlan0 inet manual")
i.write("       pre-up wpa_supplicant -B -Dwext -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf")
i.write("       post-down killall -q wpa_supplicant")
i.close()
