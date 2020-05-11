#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
USER=/home/$(echo $DIR | cut -d/ -f3)

declare -A loc0=(
    [name]="bashrc"
    [local]="./bash/.bashrc"
    [remote]="$USER"
)
declare -A loc1=(
    [name]="lightdm"
    [local]="./lightdm/*"
    [remote]="/etc/lightdm/"
)
declare -A loc2=(
    [name]="gtk2"
    [local]="./gtk/.gtkrc-2.0"
    [remote]="$USER/"
) declare -A loc3=(
    [name]="gtk3"
    [local]="./gtk/settings.ini"
    [remote]="$USER/.config/gtk-3.0/"
)
declare -A loc4=(
    [name]="GTK themes"
    [local]="./.themes/*"
    [remote]="$USER/.themes/"
)
declare -A loc5=(
    [name]="picom"
    [local]="./picom/picom.conf"
    [remote]="$USER/.config/"
)
declare -A loc6=(
    [name]="fish"
    [local]="./fish/config.fish"
    [remote]="$USER/.config/fish/"
)
declare -A loc7=(
    [name]="alacritty"
    [local]="./alacritty/alacritty.yml"
    [remote]="$USER/.config/alacritty/"
)
declare -A loc8=(
    [name]="konsole"
    [local]="./konsole/*"
    [remote]="$USER/.local/share/konsole/"
)
declare -A loc9=(
    [name]="vimrc"
    [local]="./vim/.vimrc"
    [remote]="$USER/"
)
declare -A loc10=(
    [name]="neovim config"
    [local]="./vim/init.vim"
    [remote]="$USER/.config/nvim/"
)
declare -A loc11=(
    [name]="pinky vim airline theme"
    [local]="./vim/pinky_airline.vim"
    [remote]="$USER/.vim/plugged/vim-airline-themes/autoload/airline/themes/"
)
declare -A loc12=(
    [name]="icon locks"
    [local]="./icons/*"
    [remote]="$USER/.local/share/icons/"
)
declare -A loc13=(
    [name]="polybar"
    [local]="./polybar/*"
    [remote]="$USER/.config/polybar/"
)
declare -A loc14=(
    [name]="polybar scripts"
    [local]="./scripts/polybar/*"
    [remote]="$USER/.config/polybar/scripts/"
)
declare -A loc15=(
    [name]="cmus"
    [local]="./cmus/*"
    [remote]="$USER/.config/cmus/"
)
declare -A loc16=(
    [name]="cli-visualizer"
    [local]="./cli-visualizer/*"
    [remote]="$USER/.config/vis/"
)
declare -A loc17=(
    [name]="i3 lock script"
    [local]="./scripts/lock.sh"
    [remote]="$USER/"
)
declare -A loc18=(
    [name]="lock picture"
    [local]="./assets/lock.png"
    [remote]="$USER/"
)
declare -A loc19=(
    [name]="wallpapers"
    [local]="./wallpapers/.wallpapers/*"
    [remote]="/usr/share/wallpapers/custom/"
)

RED='\033[0;31m'
GREEN='\033[0;32m'
PURPLE='\033[1;35m'
REVERSE='\033[7m'
RESET='\033[0m'

declare -n loc
for loc in ${!loc@}; do
    printf "${PURPLE} Transfering ${REVERSE}${loc[name]}${RESET}"
    cp -f -u -r -p ${loc[local]} ${loc[remote]}
    if [ $? -eq 0 ]; then
        printf "${GREEN} OK"
    else
        printf "${RED} OK"
    fi
    printf "\n"
done
