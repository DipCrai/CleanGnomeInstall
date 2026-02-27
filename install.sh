FLATPAK=true
TWEAKS=true
for arg in "$@"; do 
    case $arg in 
        --no-flatpak) 
            FLATPAK=false 
            ;;
        --no-tweaks) 
            TWEAKS=false 
            ;;
        --help)
            echo "Usage: $0 [options]"
            echo
            echo "Options:"
            echo "  --no-flatpak    Disable installation of Flatpak and Gnome Software."
            echo "  --no-tweaks     Disable installation of Gnome Tweaks app."
            echo "  --help          Show this help message and exit."
            echo
            echo "Requirements:"
            echo "  -This script is intended to be used after a fresh Arch Linux installation performed with archinstall."
            echo "  -Selected profile type of installation must be >Minimal."
            echo "     *Selecting any other profile may cause package conflicts or duplicate setups."
            exit 0
            ;;
    esac
done

sudo pacman -S --noconfirm gnome-shell gdm networkmanager \
    gnome-console gnome-control-center \
    gnome-backgrounds nano
    
if [ "$TWEAKS" = true ]; then
    sudo pacman -S --noconfirm gnome-tweaks
fi

if [ "$FLATPAK" = true ]; then
    sudo pacman -S --noconfirm flatpak gnome-software
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

sudo systemctl disable systemd-networkd
sudo systemctl enable NetworkManager
sudo systemctl enable gdm

for app in avahi-discover bssh bvnc qv4l2 qvidcap; do
    original=/usr/share/applications/$app.desktop
    copy="/usr/local/share/applications/$app.desktop"

    mkdir -p "$(dirname "$copy")"
    cp "$original" "$copy"
    echo "NoDisplay=true" >> "$copy"
done

sudo reboot
