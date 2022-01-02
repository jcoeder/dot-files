#!/bin/bash

if [ -f /etc/lsb-release ]; then
    # For some versions of Debian/Ubuntu without lsb_release command
    . /etc/lsb-release
    apt-get install curl git make build-essential libncurses-dev -y
elif [ -f /etc/debian_version ]; then
    # Older Debian/Ubuntu/etc.
    apt-get install curl git make build-essential libncurses-dev -y
elif [ -f /etc/redhat-release ]; then
    # Older Red Hat, CentOS, etc.
    apt-get install curl git make -y
fi

git clone https://github.com/vim/vim.git
cd vim
git pull
make distclean
./configure --with-features=huge \
    --enable-multibyte \
    --enable-pythoninterp=yes \
    --with-python-config-dir=/usr/lib/python2*/config-* \
    --enable-python3interp=yes \
    --with-python3-config-dir=/usr/lib/python3.*/config-* \
    --enable-cscope \
    --prefix=/usr/local/


make
make install

cd ~

mkdir -p ~/.vim/plugged/
mkdir -p ~/.vim/undodir/

curl https://raw.githubusercontent.com/jcoeder/dot-files/master/.vimrc \
    --output ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall
