# Warning: only for ubuntu 16.04 64bit version
# only for personal usage

import os

# TODO: settings File
userEmail = "goohcl777@gmail.com"
userGitAccount = "gitqwerty777"

def runShellCommand_return(command):
    return os.popen(command).read().strip("\n")

def runShellCommand(command):
    return os.system(command)

def installSystemSoftwares():
    runShellCommand("sudo add-apt-repository -y ppa:ubuntu-elisp/ppa")
    runShellCommand("sudo apt update")
    """
    explaination:
    pandoc: for md to latex
    byobu: screen alternative
    """
    aptInstallList = ["colordiff", "curl", "alien", "cmake", "python-pip", "python", "docker.io", "default-jre", "pandoc", "byobu"]
    for sname in aptInstallList:
        runShellCommand("sudo apt -y install "+sname)
    runShellCommand("sudo apt upgrade")

def installEmacs():
    #emacs-snapshot: nightly version
    runShellCommand("sudo apt -y install emacs-snapshot")
    print("get purcell emacs config...")
    runShellCommand("curl -L https://git.io/epre | sh")

def installPythonPackages():
    print("install python packages...")
    #sudo pip install --upgrade keras

def setGitConfig():
    print("set git global configs")
    runShellCommand("git config --global user.email '%s'" % userEmail)
    runShellCommand("git config --global user.name '%s'" % userGitAccount)
    runShellCommand("git config --global color.ui true")
    runShellCommand("git config --global core.editor 'emacs'")
    runShellCommand("git config --global alias.st status")
    runShellCommand("git config --global alias.br branch")
    runShellCommand("git config --global alias.co checkout")
    runShellCommand("git config --global alias.sb show-branch")
    runShellCommand("git config --global alias.amend 'commit --amend'")
    runShellCommand("git config --global alias.ai 'add -i'")
    runShellCommand("git config --global alias.cm 'commit -m'")

def installZsh():
    nowShell = runShellCommand_return("echo $SHELL")
    print("now shell: "+ nowShell)
    if(nowShell.find("zsh") == -1):
       runShellCommand("sh ./installZsh.sh") 
    else:
       print("zsh already used")

def finish():
    while(True):
        answer = raw_input("need restart to apply the install, restart now?[y/N]")
        if(answer == "Y" or answer == "y"):
            runShellCommand("sudo shutdown -r now")
        elif(answer == "N" or answer == "n"):
            return

if __name__ == "__main__":
    installSystemSoftwares()
    installEmacs()
    setGitConfig()
    installPythonPackages()
    installZsh()
    finish()
