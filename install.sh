#!/bin/bash
set -ex

cd /

timedatectl set-ntp true

lsblk
read -p "Enter drive to installl on (eg. nvme0n1): " INSTALL_DRIVE

cfdisk /dev/$INSTALL_DRIVE
sleep 5

lsblk
read -p "Enter EFI, swap, and root partition-suffix in order seperated by spaces (eg. p1 p2 p3): " EFI_PARTITION_SUFFIX SWAP_PARTITION_SUFFIX ROOT_PARTITION_SUFFIX 

$EFI_PARTITION=$INSTALL_DRIVE$EFI_PARTITION_SUFFIX
$SWAP_PARTITION=$INSTALL_DRIVE$SWAP_PARTITION_SUFFIX
$ROOT_PARTITION=$INSTALL_DRIVE$ROOT_PARTITION_SUFFIX

mkfs.ext4 /dev/$ROOT_PARTITION
mkfs.vfat /dev/$EFI_PARTITION
mkswap /dev/$SWAP_PARTITION

mount /dev/$ROOT_PARTITION /mnt
mkdir /mnt/efi
mount /dev/$EFI_PARTITION /mnt/efi
swapon /dev/$SWAP_PARTITION

reflector --latest 50 --protocol https --sort rate --save /etc/pacman.d/mirrorlist

pacstrap /mnt base base-devel linux linux-firmware grub efibootmgr networkmanager

genfstab -U /mnt >> /mnt/etc/fstab

cp /arch-linux-installation/chroot.sh /mnt
arch-chroot /mnt ./chroot.sh
rm -f /mnt/chroot.sh

reboot
