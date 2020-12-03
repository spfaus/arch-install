# arch-install
Automating the [Arch Linux install process](https://wiki.archlinux.org/index.php/installation_guide)  

## Limitations / Notes
- This script tries not to go much beyond the Arch Linux installation guide and will leave you with a quite minimal bootable system (no GUI included). For further configuration automation, take a look at [my configuration repo](https://github.com/Simon-A-P/dotfiles).  
- Currently this script is only set up for non-encrypted systems with 3 partitions (EFI, swap, root).  
- GRUB will be installed as the bootloader.  
- NetworkManager will be installed and enabled to be able to connect to the internet after a reboot (```nmtui``` in the terminal for a graphical wifi tool).  
- Sudoers ```Defaults targetpw``` and ```ALL ALL=(ALL) ALL``` will be set.  
- The mirrorlist will be overwritten with the 50 most recently synchronized HTTPS mirrors, sorted by download rate.  
- Neovim will be installed as text editor.  
- The [base-devel](https://www.archlinux.org/groups/x86_64/base-devel/) group and git will be installed.  
- The finished installation will be in English.  
- A user will be created.  

## How do I use this?
1. Set up an installation medium:  
  a) https://wiki.archlinux.org/index.php/installation_guide#Acquire_an_installation_image  
  b) https://wiki.archlinux.org/index.php/installation_guide#Verify_signature  
  c) https://wiki.archlinux.org/index.php/installation_guide#Prepare_an_installation_medium  

2. [Boot the live environment](https://wiki.archlinux.org/index.php/installation_guide#Boot_the_live_environment) (Afterwards you may also [set the keyboard layout](https://wiki.archlinux.org/index.php/installation_guide#Set_the_keyboard_layout) for ease of use)  

3. [Verify the boot mode](https://wiki.archlinux.org/index.php/installation_guide#Verify_the_boot_mode) if you aren't sure it is UEFI  

4. [Connect to the internet](https://wiki.archlinux.org/index.php/installation_guide#Connect_to_the_internet)  

6. Install git: ```pacman -Sy git```  

7. Clone this repository into its own directory: ```git clone https://github.com/Simon-A-P/arch-install.git```

8. Execute the install script contained in the repository: ```./arch-install/install.sh```

## Installed packages
```
base
base-devel
linux
linux-firmware
man-db
man-pages
texinfo
grub
efibootmgr
networkmanager
neovim
git
```


## License
```
MIT License

Copyright (c) 2020 Simon Alexander Pfaus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
