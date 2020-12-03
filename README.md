# arch-linux-installation
Automating the [Arch Linux install process](https://wiki.archlinux.org/index.php/installation_guide)  

## Limitations / Notes
This script tries not to go beyond the Arch Linux installation guide and will leave you with a quite minimal bootable system (no GUI included). For further configuration automation, take a look at [my configuration repo](https://github.com/Simon-A-P/dotfiles).  
Currently this script is only set up for non-encrypted systems with 3 partitions (EFI, swap, root).  
GRUB will be installed as the bootloader.  
NetworkManager will be installed to be able to connect to the internet after the reboot (```nmtui``` in the terminal for a graphical wifi tool).  
Sudoers ```Defaults targetpw``` and ```ALL ALL=(ALL) ALL``` will be set.  
The mirrorlist will be overwritten with the 50 most recently synchronized HTTPS mirrors, sorted by download rate.

## How do I use this?
1. Set up an installation medium:  
  a) https://wiki.archlinux.org/index.php/installation_guide#Acquire_an_installation_image  
  b) https://wiki.archlinux.org/index.php/installation_guide#Verify_signature  
  c) https://wiki.archlinux.org/index.php/installation_guide#Prepare_an_installation_medium  

2. [Boot the live environment](https://wiki.archlinux.org/index.php/installation_guide#Boot_the_live_environment) (Afterwards you may also [set the keyboard layout](https://wiki.archlinux.org/index.php/installation_guide#Set_the_keyboard_layout) for ease of use)  

3. [Verify the boot mode](https://wiki.archlinux.org/index.php/installation_guide#Verify_the_boot_mode) if you aren't sure it is UEFI  

4. [Connect to the internet](https://wiki.archlinux.org/index.php/installation_guide#Connect_to_the_internet)  

5. Update your pacman databases: ```pacman -Sy```

6. Install git: ```pacman -S git```  

7. Clone this repository in its own directory in the root directory:
```
cd /  
git clone https://Simon-A-P/arch-linux-installation.git 
```
8. Execute the install script contained in the repository: ```./arch-linux-installation/install.sh```

## Installed packages
```
base
base-devel
linux
linux-firmware
grub
efibootmgr
networkmanager
```
