# change default user password
passwd

# name machine after Kim Wexler
sudo sed -i s/"rockpro64"/"kim"/g /etc/hosts /etc/hostname

# generate an identity for this machine
ssh-keygen -t ed25519

# set timezone
sudo dpkg-reconfigure tzdata

# download zuardistros to get useful partials
cd ~/
git clone git@github.com:fczuardi/zuardistros.git

# enable multicast (to access via ssh with kim.local instead of the ip address)
cd ~/zuardistros/partials
cat begin.sh packages_multicast.sh end.sh |sed -e 's/apt/sudo apt/g'|bash

# install mosh
source config_locale.sh
cat begin.sh packages_mosh.sh end.sh |sed -e 's/apt/sudo apt/g'|bash

# install tor
source config_tor.sh
cat begin.sh packages_multicast.sh end.sh |sed -e 's/apt/sudo apt/g'|bash

# config ssh hidden service
sudo mkdir -p /var/lib/tor/ssh
sudo chown debian-tor:debian-tor /var/lib/tor/ssh
sudo chmod 700 /var/lib/tor/ssh
sudo vim /etc/tor/torrc
sudo systemctl restart tor
sudo journalctl -f
sudo cat /var/lib/tor/ssh/hostname

# install man
sudo apt install man

# torrent daemon and client
cat begin.sh packages_torrent.sh end.sh |sed -e 's/apt/sudo apt/g'|bash
exit

