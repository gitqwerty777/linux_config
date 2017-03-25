#!/bin/bash

# Warning: only for ubuntu 16.04 64bit version
# only for personal usage

myusername="$(id -u -n)"

function installSystemSoftwares(){
    sudo add-apt-repository ppa:ubuntu-elisp/ppa
    sudo apt update
    sudo apt -y install colordiff curl alien
    sudo apt -y install cmake
    sudo apt -y install emacs-snapshot # nightly version
    sudo apt -y install python-pip ipython
    sudo apt -y install docker.io
    sudo apt -y install default-jre
    sudo apt -y install pandoc # for md to latex
    sudo apt -y install byobu # screen alternative
    sudo apt upgrade
}

function installEmacsConfig(){
    echo "get purcell emacs config..."
    curl -L https://git.io/epre | sh
}

function setGitConfig(){
    echo "set git global configs"
    git config --global user.email "goohcl777@gmail.com"
    git config --global user.name "gitqwerty777"
    git config --global color.ui true
    git config --global core.editor "emacs"
    git config --global alias.st status
    git config --global alias.br branch
    git config --global alias.co checkout
    git config --global alias.sb show-branch
    git config --global alias.amend "commit --amend"
    git config --global alias.ai "add -i"
    git config --global alias.cm "commit -m"
}

function installPythonPackages(){
    echo "install python packages..."
    sudo pip install --upgrade keras
}

function installZsh(){
    echo "install oh-my-zsh..."
    echo "change shell from $0 to zsh"
    sudo chsh $myusername -s $(which zsh) # change shell
    echo "now shell is $0"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install
    echo "install powerline font"
    git clone https://github.com/powerline/fonts
    sh ./fonts/install.sh
}

function finish(){
    echo "need restart to complete, restart now?[y/N]"
    read -r answer
    if [ $answer = "Y" ] || [ $answer = "y" ]; then
        sudo shutdown -r now
    fi
}

echo "Please run with sudo"
installSystemSoftwares
installEmacsConfig
installZsh
installPythonPackages
setGitConfig
finish
