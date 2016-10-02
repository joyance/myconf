#!/bin/sh

DIR=$( cd "$( dirname "$0" )" && pwd )

# Install bash-git-prompt
if [ -e ~/.bash-git-prompt ]
then
    echo ".bash-git-prompt exist."
else
    ln -s $DIR/bash-git-prompt ~/.bash-git-prompt
fi

# Install bashrc
if [ -e ~/.bashrc ]
then
    echo "backup old .bashrc to .bashrc.bak"
    mv ~/.bashrc ~/.bashrc.bak
fi
cp $DIR/.bashrc ~/.bashrc

# Drush init (will update .bashrc)
drush init

# Install bash_aliases
if [ -e ~/.bash_aliases ]
then
    echo "backup old .bash_aliases to .bash_aliases.bak"
    mv ~/.bash_aliases ~/.bash_aliases.bak
fi
cp $DIR/.bash_aliases ~/.bash_aliases

# Install dotvim
if [ -e ~/.vimrc ]
then
    echo ".vimrc exists."
else
    ln -s $DIR/dotvim/vimrc ~/.vimrc
    ln -s $DIR/dotvim ~/.vim
fi

# Install .gitconfig
cp $DIR/../.gitconfig ~/.gitconfig

# Install .tmux.conf
if [ -e ~/.tmux.conf ]
then
    echo ".tmux.conf exist."
else
    ln -s $DIR/.tmux.conf ~/.tmux.conf
fi

echo "Setup success."
