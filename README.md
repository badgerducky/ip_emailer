# ip_emailer
to connect to eduroam:
1. run init.sh as root
2. edit /etc/wpa_supplicant/wpa_supplicant.conf with your username and password

*WARNING: init.sh appends to files, so running it more than once will result in duplicate entries.*

to email your ip:
1. create a new gmail account and allow less secure apps
2. edit email_ip.py with your new email and password as the sender and then choose where to send your ip

*If you send emails to your regular gmail account they will probably be in spam.*

3. run python3 email_ip.py
4. figure out a way to start the program at boot

