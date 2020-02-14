# ip_emailer
to connect to eduroam:
1. run ```init.sh```
2. edit /etc/wpa_supplicant/wpa_supplicant.conf with your username and password
3. run ```sudo reboot```

**WARNING: init.sh appends to files, so running it more than once will result in duplicate entries.**

to email your ip:
1. create a new gmail account and allow less secure apps
2. edit email_ip.py with your new email and password as the sender and then choose where to send your ip
3. run ```python3 email_ip.py``` to make sure it works
4. OPTIONAL: copy the email_ip.py script to your home directory with a .prefix on the file so it is hidden
  -asuming username is pi run : ```cp /home/pi/ip_emailer/email_ip.py /home/pi/.IPemail```
4. *thanks to Zach Vandegrift for thinking to put this in bashrc*
5. add a line to the end of bashrc with ''': $(python3 .IPemail &> /home/pi/.IPlog)'''
6. save, quit, and reboot then pray that it works...

*If you send emails to your regular gmail account they will probably be in spam.*
