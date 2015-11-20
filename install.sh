#!/bin/sh
rm ~/.vim
ln -s ~/.dotfiles/vim ~/.vim
git submodule update --init --recursive
bundle/YouCompleteMe/install.py
