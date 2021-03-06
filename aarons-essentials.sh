#!/bin/bash

# aarons-essentials.sh
# based on Linux Mint 18.1 (serena) which is based on Ubuntu 16.04 (xenial)

# this was installed on XPS 13 9360
# since my laptop has a small screen and QHD screen (hidpi)
# fix hidpi by going to Preferences > General > User interface scaling from 
# Normal to Double

# update to latest
sudo apt-get update
sudo apt-get upgrade -y

# remove hibernate
sudo mv -v /etc/pokit-1/localauthority/50-local.d/com.ubuntu.enable-hibernate.pkla /
# refer to this link for other goodies:
# https://sites.google.com/site/easylinuxtipsproject/mint-mate-first

# remove unwanted apps
sudo apt-get remove -y gnome-orca

# get some needed packages installed
sudo apt-get install -y build-essentials
sudo apt-get install -y git
sudo apt-get install -y git-flow
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
# some packages for global installation
sudo npm install -g yo

# get .net core
sudo sh -c 'echo "deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
sudo apt-get update
sudo apt-get install -y dotnet-dev-1.0.3
# install some spa templates
dotnet new --install Microsoft.AspNetCore.SpaTemplates::*dotnet new --install Microsoft.AspNetCore.SpaTemplates::*
# nowsee the list of templates installed
dotnet new -all
