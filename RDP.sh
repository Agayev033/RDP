#! /bin/bash

printf "RDP yükleniyor. Lütfen sabırlı olun... " >&2

{

sudo useradd -m ALEX

sudo adduser ALEX sudo

echo 'ALEX:2003' | sudo chpasswd

sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd

sudo apt-get update

wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb

sudo dpkg --install chrome-remote-desktop_current_amd64.deb

sudo apt install --assume-yes --fix-broken

sudo DEBIAN_FRONTEND=noninteractive \

apt install --assume-yes xfce4 desktop-base

sudo bash -c 'echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session'  

sudo apt install --assume-yes xscreensaver

sudo systemctl disable lightdm.service

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg --install google-chrome-stable_current_amd64.deb

sudo apt install --assume-yes --fix-broken

sudo apt install nautilus nano -y 

sudo adduser ALEX chrome-remote-desktop

} &> /dev/null &&

printf "\nKurulum tamamlandı " >&2 ||

printf "\nHata oluştu " >&2

printf '\nLinke girin: https://remotedesktop.google.com/headless ve Debian Linux komutunu kopyalayıp alta yapıştırın.\n'

read -p "Buray Yapıştırın: " CRP

su - ALEX -c """$CRP"""

printf 'BURAYA BAKIN https://remotedesktop.google.com/access/ \n\n'

if sudo apt-get upgrade &> /dev/null

then

    printf "\n\nGüncelleme tamamlandı " >&2

else

    printf "\n\nHata oluştu " >&2

fi
