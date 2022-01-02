# dot-files
dot-files

#VIMRC
```mkdir -p ~/.vim/plugged/
mkdir -p ~/.vim/undodir/

curl https://raw.githubusercontent.com/jcoeder/dot-files/master/.vimrc \
    --output ~/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall```

# VIMRC
An attempt at a script to set everything up
`wget -O - https://raw.githubusercontent.com/jcoeder/dot-files/master/vimrc-setup.sh | bash -i`
