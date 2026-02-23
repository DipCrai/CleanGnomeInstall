FLATPAK=true
for arg in "$@"; do 
    case $arg in 
        --no-flatpak) 
            FLATPAK=false 
            ;; 
    esac
done

sudo pacman -S --noconfirm gnome-shell gdm networkmanager \
    gnome-console gnome-control-center gnome-tweaks \
    gnome-backgrounds nano
    
if [ "$FLATPAK" = true ]; then
    sudo pacman -S --noconfirm flatpak gnome-software
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

sudo systemctl disable systemd-networkd
sudo systemctl enable NetworkManager
sudo systemctl enable gdm

for app in avahi-discover bssh bvnc qv4l2 qvidcap; do
    echo "NoDisplay=true" | sudo tee -a /usr/share/applications/$app.desktop
done

sudo reboot
