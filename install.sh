#!/bin/bash

# http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Logging stuff.
function info()     { echo -e "\n\033[1m$@\033[0m"; }
function success()  { echo -e " \033[1;32m✔\033[0m  $@"; }
function error()    { echo -e " \033[1;31m✖\033[0m  $@"; }
function arrow()    { echo -e " \033[1;33m➜\033[0m  $@"; }

link() {
  ln -sfn $SCRIPTDIR/$1 $HOME/.$1
  success "Linked: $HOME/.$1"
}

info "Processing vim files"

link vimrc

info "Install Vundle"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

info "Install Vundles"
vim +BundleInstall +qall

info "Complete"
