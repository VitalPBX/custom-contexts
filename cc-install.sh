#!/bin/bash
set -e

echo "Installing..."

#Clean Yum Cache
yum clean all
rm -rf /var/cache/yum

#Download the resources
rm -f /var/lib/asterisk/sounds/en/your-public-ip-is.wav
wget -P /var/lib/asterisk/sounds/en/ https://github.com/VitalPBX/custom-contexts/raw/master/sounds/your-public-ip-is.wav

rm -f /etc/asterisk/vitalpbx/extensions__90-custom.conf
wget -P /etc/asterisk/vitalpbx/ https://raw.githubusercontent.com/VitalPBX/custom-contexts/master/extensions__90-custom.conf

#Intall other required dependencies
yum install -y asterisk-curl

#Reload Asterisk
asterisk -rx"core reload";

echo "Done!"
