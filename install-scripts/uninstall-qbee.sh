#!/usr/bin/env sh
apt-get --purge remove qbee-agent
rm /etc/qbee /var/lib/qbee /opt/qbee -rf 
exit 0
