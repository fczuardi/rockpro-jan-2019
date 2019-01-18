# change default user password
passwd

# name machine after Kim Wexler
sudo sed -i s/"rockpro64"/"kim"/g /etc/hosts /etc/hostname

# generate an identity for this machine
ssh-keygen -t ed25519

# download zuardistros to get useful partials
cd ~/
git clone git@github.com:fczuardi/zuardistros.git

# enable multicast (to access via ssh with kim.local instead of the ip address)
cd ~/zuardistros/partials
cat begin.sh packages_multicast.sh end.sh |sed -e 's/apt/sudo apt/g'|bash

exit

# run kitty +kitten ssh rock64@kim.local from another machine with the kitty terminal to have the correct .terminfo installed
