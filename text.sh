#!/bin/bash

sudo apt update && sudo apt upgrade -y

# Installing kitty & setting it up
sudo apt install kitty -y
sudo update-alternatives --config x-terminal-emulator
cp /usr/share/doc/kitty/examples/kitty.conf $HOME/.config/kitty/
cp $HOME/Downloads/i3wm-ubuntu/config/kitty/kitty.conf $HOME/.config/kitty/kitty.conf

# Installing vim
sudo apt install vim -y

# ulauncher install
sudo add-apt-repository ppa:agornostal/ulauncher
sudo apt update -y
sudo apt install ulauncher

# Installing required libraries
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake libxcb-shape0-dev

# SPEED RICER REPOSTIORY i3-gaps
sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update
sudo apt install i3-gaps

# Polybar dependencies & Install
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev

cd $HOME/Downloads
git clone --recursive https://github.com/polybar/polybar
cd $HOME/Downloads/polybar
mkdir build && cd build
cmake ..
make -j$(nproc)
sudo make install

# Picom dependencies
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev

sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
# Picom install
cd $HOME/Downloads
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

# installing numlockx
sudo apt install feh numlockx ttf-unifont

# Replacing files
mkdir $HOME/Pictures/Wallpapers
cp $HOME/Downloads/i3wm-ubuntu/Wallpapers/landscape1.jpg $HOME/Pictures/Wallpapers/landscape1.jpg
cp $HOME/Downloads/i3wm-ubuntu/config/i3/config $HOME/.config/i3/config
mkdir $HOME/.config/polybar
mkdir $HOME/.config/picom
cp $HOME/Downloads/i3wm-ubuntu/config/polybar/config $HOME/.config/polybar/config
cp $HOME/Downloads/i3wm-ubuntu/config/polybar/launch.sh $HOME/.config/polybar/launch.sh
sudo chmod +x launch.sh && chmod +x launch.sh
cp $HOME/Downloads/i3wm-ubuntu/config/picom/picom.conf $HOME/.config/picom/picom.conf