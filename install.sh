#!/bin/bash

set -x

rm ~/.profile
rm ~/.bashrc
rm ~/.bash_logout
rm ~/.bash_profile
rm ~/.vimrc
rm -rf ~/.vim
rm ~/.tmux.conf
rm ~/.gitconfig

cp .profile ~/
cp .bashrc ~/
cp .bash_logout ~/
cp .bash_profile ~/
cp .vimrc ~/
cp -r .vim ~/
cp .tmux.conf ~/
cp .gitconfig ~/

mkdir -p ~/.fonts
cp -r .fonts ~/
fc-cache -vf ~/.fonts

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
~/.vim/bundle/youcompleteme/install.py
