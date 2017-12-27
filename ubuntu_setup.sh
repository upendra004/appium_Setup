sudo add-apt-repository ppa:git-core/ppa
sudo add-apt-repository ppa:webupd8team/atom
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install git
sudo apt-get install atom
sudo apt-get install -y openjdk-8-jdk
sudo update-alternatives --config java
sudo update-alternatives --config javac
sudo apt-get install python-pip
sudo apt-get install -y libxml2-dev libxslt1-dev python-dev
sudo pip install virtualenv
# Install chromedriver
# Get latest version of chromedriver
latest_ver="`wget http://chromedriver.storage.googleapis.com/LATEST_RELEASE -q -O -`"
sudo apt-get install unzip
wget -N "http://chromedriver.storage.googleapis.com/$latest_ver/chromedriver_linux64.zip"
unzip chromedriver_linux64.zip
chmod +x chromedriver
sudo mv -f chromedriver /usr/local/share/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver
sudo ln -s /usr/local/share/chromedriver /usr/bin/chromedriver
# Install geckodriver
echo "We will need 'sudo' for this"
GECKODRIVER_VERSION=`curl -s https://api.github.com/repos/mozilla/geckodriver/releases/latest|grep tag_name|cut -d '"' -f 4`
wget --no-verbose -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v$GECKODRIVER_VERSION/geckodriver-v$GECKODRIVER_VERSION-linux64.tar.gz \
  && rm -rf /opt/geckodriver \
  && tar -C /opt -zxf /tmp/geckodriver.tar.gz \
  && rm /tmp/geckodriver.tar.gz \
  && sudo mv /opt/geckodriver /opt/geckodriver-$GECKODRIVER_VERSION \
  && sudo chmod 755 /opt/geckodriver-$GECKODRIVER_VERSION \
  && sudo ln -fs /opt/geckodriver-$GECKODRIVER_VERSION /usr/bin/geckodriver
# install pip
sudo apt-get install -y python-pip
sudo apt-get install -y libxml2-dev libxslt1-dev python-dev
sudo pip install virtualenv
# install oh my zsh
sudo apt-get install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
echo "Please restart you machine so oh my zsh can take effect"
# install linuxbrew
sudo apt-get install -y build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/linuxbrew/go/install)"
# add env param programmitically
cp ~/.bashrc ~/.bashrc.bak
echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> ~/.bashrc
echo "" >> /.bashrc
echo 'export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"' >> ~/.bashrc
echo "" >> /.bashrc
echo 'export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"' >> ~/.bashrc
echo "" >> /.bashrc
source ~/.bashrc