#!/bin/bash

echo "Please run this shell script at sudo."
echo "Now your are using $(echo $SHELL)"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "########### APT Install #########"
  apt update -y
  echo "Installing zsh, vim, wget ,git..."
  apt install zsh vim wget git 
  echo "Apt install finished."
  echo "########## Updating APT ##########"

elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "############# Brew install ############"
  brew update -y
  brew install zsh vim wget git
  echo "########## Brew Install Finished #########"

echo "##########Adding git aliases##########"
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
echo "git aliases setting finished."
sleep 2
echo "##########Adding git aliases##########"


echo "###############  Setting up ohmyzsh  ###############"
echo "Now downloading omyzsh framework"
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "Changing default theme to ys:"
sed -ie 's/^ZSH_THEME.*/ZSH_THEME="ys"/g' ~/.zshrc

echo "Downloading and enabling Oh-my-zsh plugins"
FILE1=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
FILE2=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

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

sed -ie 's/^plugins=.*/plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc 
source ~/.zshrc
echo "###############  Setting up ohmyzsh  ###############"


echo "Changing shell to zsh"
chsh -s /usr/bin/zsh
echo "Now you are using: $SHELL"
sleep 2

echo "####################"
echo "Setup finished, enjoy it~"
echo "####################"
