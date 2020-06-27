#!/bin/sh

if [ $SHELL = $(which zsh) ]; then
  echo "You are using zsh."
  echo "Continuing script."
else
  echo "Changing to zsh now."
  chsh -s $(which zsh)
  echo $SHELL
  echo "Please rerun."
  sleep 5
  exit 0
fi

echo "~~~~~##########     Welcome to Jovy's setup script!     ##########~~~~~"

echo "~~~~~##########     Your current shell: $SHELL     ##########~~~~~"


if [[ $(uname) = "Darwin" ]]; then
  echo "You are using Mac."
else
  echo "You are using Linux"
fi


