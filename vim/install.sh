#!/bin/bash

BASE_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


#Check if the vimrc exists on the current profile

timestamp=$(date + "%T")

if [ -f "~/.vimrc" ]; then
	echo "vimrc present, we are going to rename it to vimrc_backup_$timestamp"
	mv  "~/.vimrc" "~/.vimrc_backup_$timestamp"
fi

if [ -d "~/.vim" ]; then
	echo "vim folder present, renaming it to ~/.vim_backup_timestamp"
	mv "~/.vim" "~/.vim_backup_$timestamp"
fi


if [ -d "~/.vim/bundle/Vundle.vim" ]; then

  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

fi

#Creating the symlink to the vimrc inside the dot-file
echo "Creating symlink to .vimrc"
ln -s $BASE_PATH/vimrc ~/.vimrc

echo "Creating symlink to .vim folder"
ln -s $BASE_PATH/vim_folder ~/.vim

echo "Installing plugins for Vundle"
vim +PluginInstall +qall

echo "Installing the silver searcher"

brew install the_silver_searcher
