#!/bin/bash

dir=~/come/mine/dotfiles           # dotfiles directory
files="profile vimrc gitconfig"    # list of files/folders to symlink in homedir

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# create symlinks 
for file in $files; do
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
