# Warning: only for ubuntu-gnome 16.04 64bit version
# only for personal usage

sudo apt update
sudo apt -y install colordiff curl alien
sudo apt -y install emacs24
sudo apt -y install python-pip ipython
sudo apt -y install docker.io
sudo apt -y install default-jre
sudo apt -y install pandoc # for md to latex
sudo apt -y install byobu # screen alternative
sudo apt upgrade

echo "copy emacs config"
#git clone https://github.com/purcell/emacs.d.git ~/.emacs.d
curl -L https://git.io/epre | sh

echo "install python packages"
sudo pip install --upgrade keras

echo "install oh-my-zsh..."
echo "change shell from $0 to zsh"
sudo chsh -s $(which zsh) # change shell
echo "now shell is $0"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # install
