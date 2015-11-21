#!/bin/sh
rm -f ~/.vim
VIM_FOLDER=$(cd $(dirname $0) && pwd -P)
ln -s $VIM_FOLDER ~/.vim
git --git-dir=$VIM_FOLDER/.git --work-tree=$VIM_FOLDER submodule update --init --recursive
$VIM_FOLDER/bundle/YouCompleteMe/install.py
