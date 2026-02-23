## Installation Requirements

This script is intended to be used **after a fresh Arch Linux installation
performed with `archinstall`.**

When running `archinstall`, make sure to:

1. Proceed with normal installation steps
2. When prompted to select a profile type, choose:

   \> **Minimal**

This script will install and configure GNOME manually. Selecting any other profile may cause package conflicts or duplicate setups.

## To execute post-installation script run
```bash
bash <(curl -s https://raw.githubusercontent.com/DipCrai/CleanGnomeInstall/refs/heads/main/install.sh)
