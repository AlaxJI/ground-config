#

mkdir $HOME/.config/bspwm
mkdir $HOME/.config/sxhkd
mkdir $HOME/.config/compton
mkdir $HOME/.config/rofi

ln -sfr $HOME/ground-config/config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
ln -sfr $HOME/ground-config/config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc
ln -sfr $HOME/ground-config/config/compton/compton.conf ~/.config/compton/compton.conf
ln -sfr $HOME/ground-config/config/rofi/config ~/.config/rofi/config

chmod +x $HOME/.config/bspwm/bspwmrc
chmod +x $HOME/.config/sxhkd/sxhkdrc

