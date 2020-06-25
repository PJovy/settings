#!/bin/bash


echo "~~~~~##########     Welcome to Jovy's setup script!     ##########~~~~~"

echo "~~~~~##########     Your current shell: $SHELL     ##########~~~~~"


if [[ $(uname) = "Darwin" ]]; then
  echo "You are using Mac."
else
  echo "You are using Linux"
fi


