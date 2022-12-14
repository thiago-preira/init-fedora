#!/bin/bash
sudo dnf update && sudo dnf -y upgrade && sudo dnf -y install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc


sudo dnf -y install brave-browser    
sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo dnf -y install tilix
sudo dnf -y install vlc
sudo dnf -y install zsh

sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

curl -sS https://starship.rs/install.sh | sh

curl -fL https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs && ./cs setup
