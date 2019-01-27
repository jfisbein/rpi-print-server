#!/usr/bin/env bash

EXPECTED_ARGS=1

if [ $# -ne $EXPECTED_ARGS ]; then
  echo "Usage: $(basename "$0") {desired_print_server_name}"
  exit 1
fi
SERVER_NAME="${1}"

if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 2
fi

# Update all packages
apt-get -y update
apt-get -y upgrade

# Install cups
apt-get -y install cups hplip

# Add pi user to printer admin group
usermod -a -G lpadmin pi

# Allow remote admin
udo runuser -l "pi" -c "cupsctl --remote-admin --remote-any --share-printers --user-cancel-any"
systemctl restart cups

# Change host name
raspi-config nonint do_hostname "${SERVER_NAME}"

# Install samba to share with windows
apt-get -y install samba

# edit /etc/samba/smb.conf
sed -i -e "s/guest ok = no/guest ok = yes/" /etc/samba/smb.conf
sed -i -e "s/browseable = no/browseable = yes/" /etc/samba/smb.conf

# change print$ -> path to /usr/share/cups/drivers ?

systemctl restart smbd
systemctl restart nmbd

echo "connect to print server wed admin at https://$(cat /etc/hostname):631/"

reboot now
