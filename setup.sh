#!/bin/bash

echo "Please run this shell script at sudo."
echo "Now your are using $(echo $SHELL)"


echo "##########     Welcome to Jovy's setup script!     ##########"

echo "##########     Your current shell: $SHELL     ##########"

if [[ $(uname) = "Darwin" ]]; then
  echo "You are using Mac."
  echo "########### brew install #########"
  brew update -y
  echo "installing zsh, vim, wget ,git..."
  brew install zsh vim wget git 
  echo "brew install finished."
  echo "########## brew install finished ##########"
else
  echo "You are using Linux"
  echo "########### apt install #########"
  apt update -y
  echo "installing zsh, vim, wget ,git..."
  apt install zsh vim wget git 
  echo "apt install finished."
  echo "########## apt install finished ##########"
fi



echo "##########  adding git aliases  ##########"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.lg "log --color --graph --pretty=format:'%cred%h%creset -%c(yellow)%d%creset %s %cgreen(%cr) %c(bold blue)<%an>%creset' --abbrev-commit"
echo "git aliases setting finished."
sleep 2
echo "##########  adding git aliases finished  ##########"


echo "###############  setting up ohmyzsh  ###############"
echo "now downloading oh-my-zsh framework"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -o - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "changing default theme to ys:"
sed -ie 's/^zsh_theme.*/zsh_theme="ys"/g' ~/.zshrc

echo "downloading and enabling oh-my-zsh plugins"
file1=${zsh_custom:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
file2=${zsh_custom:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo $FILE1
echo $FILE2

if [[ -d "$FILE1" ]]; then
    echo "zsh-autosuggestions exist, won't download."
else
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [[ -d "$FILE2" ]]; then                                                                                                                             
    echo "syntax-highlighting exists, won't download."
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

sed -ie 's/^plugins=.*/plugins=(vi-mode git docker zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc 
source ~/.zshrc
echo "###############  Setting up ohmyzsh finished  ###############"


echo "Changing shell to zsh"
chsh -s /usr/bin/zsh
echo "Now you are using: $SHELL"
sleep 2

echo "####################"
echo "Setup finished, enjoy it~"
echo "####################"
