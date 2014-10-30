#!/bin/bash

# list of files/folders to symlink in homedir
files="profile vimrc gitconfig"
dir=="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"   # dotfiles directory

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir

# remove files if they already exist
for file in $files; do
    rm ~/.$file
done
# create symlinks 
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# setup vim and install plugins
mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
