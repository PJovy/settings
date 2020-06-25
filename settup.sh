#!/bin/bash

echo "Please run this shell script at sudo."
echo "Now your are using $(echo $SHELL)"

echo "Update apt...."
apt update -y

echo "Installing zsh, vim, wget ,git..."
apt install zsh vim wget git 

echo "Changing shell to zsh"
chsh -s /usr/bin/zsh
echo $SHELL


echo "Now downloading omyzsh framework"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

echo "Setting up ohmyzsh"
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "Changing default themes, here are optional themes, we choose ys theme"
ls -a ~/.oh-my-zsh/themes/
sed -ie 's/^ZSH_THEME.*/ZSH_THEME="ys"/g' ~/.zshrc
source ~/.zshrc



echo "Downloading and enabling Oh-my-zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

sed -ie 's/^plugins=.*/plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

source ~/.zshrc










