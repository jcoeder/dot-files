#!/bin/bash

if [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    sudo apt-get install vim curl -y
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    sudo apt-get install vim curl -y
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    sudo apt-get install vim curl -y
fi


sudo mkdir -p ~/.vim/plugged/
sudo mkdir -p ~/.vim/undodir/

sudo curl https://raw.githubusercontent.com/jcoeder/dot-files/master/.vimrc \
    --output ~/.vimrc

sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
