import smtplib, ssl
import subprocess
import time
import os
ps = subprocess.Popen(['iwgetid'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
isConnected = 0
while isConnected == 0:
    time.sleep(1)
    try:
        output = subprocess.check_output(('grep', 'ESSID'), stdin=ps.stdout)
        print(output)
        isConnected = 1
    except subprocess.CalledProcessError:
    # grep did not match any lines
        print("No wireless networks connected")
        isConnected = 0

get_ip = subprocess.check_output(["hostname", "-I"])
ip = str(get_ip).split()
ip = ip[0]
ip = ip[2:]
print(ip)

sender_email = "from@gmail.com"
receiver_email = "to@gmail.com"
password = "yourpass"

message = ip
port = 465  # For SSL
# Create a secure SSL context
context = ssl.create_default_context()

with smtplib.SMTP_SSL("smtp.gmail.com", port, context=context) as server:
    server.login(sender_email, password)
    server.sendmail(sender_email, receiver_email, message)
