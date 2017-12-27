# Installing oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
zsh
##installiing brew
echo "Installing brew, please provide password if prompted \n\n"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update && brew doctor
brew cleanup
##installin brew packages
echo "Installing brew packages"
brew install android-sdk ideviceinstaller ios-webkit-debug-proxy maven libimobiledevice node nvm thefuck
brew install docker-machine imagemagick tree vim wget yarn trash python3 tig git curl htop pbcoby pbpaste
curl -sSL https://get.rvm.io | bash -s stable
pip3 install -U pip
echo "Adding variables to profile"
echo 'eval "$(thefuck --alias)"' >> ~/.zshrc
echo export ANDROID_HOME=/Users/admin/Library/Android/sdk >> ~/.zshrc
echo "Installing brew cask packages."
brew cask install java
echo export JAVA_HOME=$(/usr/libexec/java_home) >> ~/.zshrc
brew cask install cheatsheet
brew cask install alfred
brew cask install licecap
brew cask install keycastr
brew cask install android-file-transfer
brew cask install sublime-text
brew cask install hyperterm
brew cask install atom
brew cask install sourcetree
brew cask install google-chrome
brew cask install spectacle
brew cask install vlc
brew cask install flux
brew cask install menumeters
brew cask install beyond-comapare meld

echo "Clening the cask."
brew cask cleanup
brew cleanup