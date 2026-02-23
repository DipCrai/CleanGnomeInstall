FLATPAK=true 
for arg in "$@"; do case $arg in --no-flatpak) FLATPAK=false shift ;; esac done

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

echo "NoDisplay=true" | sudo tee -a /usr/share/applications/avahi-discover.desktop
echo "NoDisplay=true" | sudo tee -a /usr/share/applications/bssh.desktop
echo "NoDisplay=true" | sudo tee -a /usr/share/applications/bvnc.desktop
echo "NoDisplay=true" | sudo tee -a /usr/share/applications/qv4l2.desktop
echo "NoDisplay=true" | sudo tee -a /usr/share/applications/qvidcap.desktop

sudo reboot
