#!/bin/bash

# aarons-essentials.sh
# based on Linux Mint 18.1 (serena) which is based on Ubuntu 16.04 (xenial)

# this was installed on XPS 13 9360
# since my laptop has a small screen and QHD screen (hidpi)
# fix hidpi by going to Preferences > General > User interface scaling from Normal to Double

# update to latest
sudo apt-get update
sudo apt-get upgrade -y

# get some needed packages installed
sudo apt-get install -y build-essentials
sudo apt-get install -y git
sudo apt-get install -y meld
sudo apt-get install -y chromium-browser

# edit ~/.gitconfig with meld for difftool and mergetool
#---------------------------------------------------------------
#[diff]
#    tool = meld
#[difftool]
#    prompt = false
#[difftool "meld"]
#    cmd = meld "$LOCAL" "$REMOTE"
#[merge]
#    tool = meld
#[mergetool "meld"]
#    # Choose one of these 2 lines (not both!)
#    cmd = meld "$LOCAL" "$MERGED" "$REMOTE" --output "$MERGED"
#    #cmd = meld "$LOCAL" "$BASE" "$REMOTE" --output "$MERGED"
#---------------------------------------------------------------

# get vs code
cd ~/Downloads
wget https://go.microsoft.com/fwlink/?LinkID=760868
sudo dpgk -i code_1.11.2-1492070517_amd64.deb
# note: could try JetBrains Rider also (at this time only at early access builds

# get gitkraken
wget https://www.gitkraken.com/download/linux-deb
sudo dpkg -i gitkraken-amd64.deb

# get nodejs
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs

# get .net core
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.3

# get docker ce
sudo apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       xenial \
       stable"
sudo apt-get update
sudo apt-get -y install docker-ce
# test docker installation
sudo docker run hello-world
