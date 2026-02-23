sudo pacman -S --noconfirm gnome-shell gnome-console gnome-control-center
sudo pacman -S --noconfirm gnome-backgrounds gnome-tweaks
sudo pacman -S --noconfirm nano networkmanager gdm
sudo pacman -S --noconfirm flatpak gnome-software
sudo systemctl disable systemd-networkd
sudo systemctl enable NetworkManager
sudo systemctl enable gdm
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
echo "NoDisplay=true" | sudo tee -a /usr/share/applications/avahi-discover.desktop
echo "NoDisplay=true" | sudo tee -a /usr/share/applications/bssh.desktop
echo "NoDisplay=true" | sudo tee -a /usr/share/applications/bvnc.desktop
echo "NoDisplay=true" | sudo tee -a /usr/share/applications/qv4l2.desktop
echo "NoDisplay=true" | sudo tee -a /usr/share/applications/qvidcap.desktop
sudo reboot
