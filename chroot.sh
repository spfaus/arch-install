#!/bin/bash
set -ex

ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime
hwclock --systohc

sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen

echo "LANG=en_US.UTF-8" > /etc/locale.conf

read -p "Enter your hostname: " MY_HOSTNAME
echo $MY_HOSTNAME > /etc/hostname
echo "127.0.0.1   localhost" >> /etc/hosts
echo "::1         localhost" >> /etc/hosts
echo "127.0.1.1   $MY_HOSTNAME.localdomain $MY_HOSTNAME" >> /etc/hosts

echo "Enter root password"
passwd

grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

read -p "Enter your username: " MY_USERNAME
useradd -m $MY_USERNAME
passwd $MY_USERNAME
sed -i -e 's/# Defaults targetpw/Defaults targetpw/g' /etc/sudoers
sed -i -e 's/# ALL ALL=(ALL) ALL/ALL ALL=(ALL) ALL/g' /etc/sudoers

systemctl enable NetworkManager.service
