## Installation Requirements

This script is intended to be used **after a fresh Arch Linux installation
performed with `archinstall`.**

When running `archinstall`, make sure to:

1. Proceed with normal installation steps
2. When prompted to select a profile type, choose:

   \> **Minimal**

⚠️ This script will install and configure GNOME manually. Selecting any other profile may cause package conflicts or duplicate setups.

## Packages Installed

The script installs the following packages:

### GNOME Core
- gnome-shell (Desktop Environment)
- gnome-console (Console App)
- gnome-control-center (Settings App)
- gnome-backgrounds (Default backgrounds)
- gnome-tweaks (Tweaks App)

⚠️ If you prefer not to install Gnome Tweaks, you can run the script with `--no-tweaks` flag.

### System & Networking
- networkmanager (Default network manager for GNOME)
- gdm (Login screen)
- nano (Console text editor)

### Software Management
- flatpak (App manager & repository)
- gnome-software (App manager)
  
⚠️ If you prefer not to use Flatpak or Flathub, you can run the script with `--no-flatpak` flag.

## To execute post-installation script run
```bash
bash <(curl -s https://raw.githubusercontent.com/DipCrai/CleanGnomeInstall/refs/heads/main/install.sh)
