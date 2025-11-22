#!/bin/bash

# Update package lists and install prerequisites
sudo apt update
sudo apt install -y zsh curl wget git

# Set Zsh as the default shell
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Clone Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Clone default configuration files (zshrc, vim, powerlevel10k)
mkdir ~/.vim/ 
git clone https://github.com/ant-body/auto_config.git ~/.vim/config_files

# Move files to proper location
mv .vimrc ~/.vim/.vimrc
mv .zshrc ~/.zshrc
mv .p10k.zsh ~/.p10k.zsh

# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install Fira Code Nerd Fonts
mkdir -p ~/.local/share/fonts
curl -fLo "$HOME/.local/share/fonts/FiraCodeNerdFont-Regular.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf"
curl -fLo "$HOME/.local/share/fonts/FiraCodeNerdFont-Bold.ttf" "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Bold/FiraCodeNerdFont-Bold.ttf"

fc-cache -fv

# Install pyenv
curl -fsSL https://pyenv.run | bash

# Install zsh helpers
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
