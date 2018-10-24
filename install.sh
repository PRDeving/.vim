#!/usr/bin/env bash
# -*- coding: utf-8 -*-

git=`which git 2>&1`
if [ $? -ne 0 ]; then
    echo "Please install git before continue :-("
    exit 1
fi


case $( uname -s ) in
    Linux) sudo apt-get -y install vim-nox exuberant-ctags;;

    Darwin) 
        brew=`which brew 2>&1`
        if [ $? -ne 0 ]; then
            echo 'Please install brew before continue :-('
            exit 1
        fi
        brew install macvim --override-system-vim
        brew install ctags-exuberant
        ;;

    *) echo 'Unsupported system install'; exit 1;;
esac

echo "Installing vim config"
rm -rf ~/.vim ~/.vimrc /.gvimrc
cd && git clone https://github.com/PRDeving/.vim.git

ln -s ~/.vim/.vimrc ~/.vimrc

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cd ~/.vim && 
    git submodule update --init --recursive &&
    vim +BundleInstall +qall

echo "Successfully installed"
