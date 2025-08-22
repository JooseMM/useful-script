#!/bin/bash

if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as a root. Please use sudo."
 exit 1
fi

HOME="/home/$SUDO_USER"

# Install and update packages 
pacman -Syu --noconfirm && pacman -S --noconfirm \
 git waybar ripgrep hyprland hyprpaper neovim kitty wofi \
 zsh zsh-autocomplete zsh-syntax-highlighting starship tmux which

# create an config folder if needed and cd into it
mkdir -p "$HOME/.config" && cd "$HOME/.config"

# clone configuration files from github
git clone https://www.github.com/JooseMM/nvim.git
git clone https://www.github.com/JooseMM/kitty.git
git clone https://www.github.com/JooseMM/hyprland.git
git clone https://www.github.com/JooseMM/starship.git
git clone https://www.github.com/JooseMM/tmux.git

# cd into user directory and clone zsh configuration file
cd "$HOME"
git clone https://www.github.com/JooseMM/zsh.git

# set zsh configuration file
mv "$HOME/zsh/zsh" "$HOME/.zshrc" && rm -rf "$HOME/zsh"
# create history file
touch "$HOME/.zsh_history"

# change terminal emulator 
chsh -s $(which zsh) $SUDO_USER

echo "Configuration files installed successfully, source your new .zshrc file to finish"
