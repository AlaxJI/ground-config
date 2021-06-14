mkdir $HOME/.config/bspwm
mkdir $HOME/.config/sxhkd
mkdir $HOME/.config/i3
ln -sfr config/bspwmrc ~/.config/bspwm/bspwmrc
ln -sfr config/sxhkdrc ~/.config/sxhkd/sxhkdrc
chmod +x $HOME/.config/bspwm/bspwmrc
chmod +x $HOME/.config/sxhkd/sxhkdrc

## Installing Mousepad config
## sudo ln -sfr config/40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf
