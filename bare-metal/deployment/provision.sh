#!/bin/bash

# Update the package list and upgrade installed packages
sudo apt update -y
sudo apt upgrade -y

# Install fail2ban for security
sudo apt install -y fail2ban
sudo systemctl enable --now fail2ban

# Install NVIDIA drivers (adjust if needed based on your GPU)
sudo apt install -y nvidia-driver-535



# Install Docker and required packages
#install docker
sudo apt-get update
sudo apt-get install \
 ca-certificates \
 curl \
 gnupg \
 lsb-release

sudo mkdir -p /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker.io -y
sudo systemctl enable docker.socket
sudo systemctl start docker.socket
sudo systemctl status docker.socket
sudo systemctl daemon-reload
sudo systemctl restart docker
sudo apt update

sudo apt install docker-compose-plugin



sudo apt-get install -y ca-certificates curl gnupg lsb-release
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


sudo docker run hello-world


sudo apt-get update
sudo apt-get install -y nvidia-docker2

sudo systemctl restart docker
sudo apt-get install python-is-python3
sudo apt-get install python3-pip
sudo pip3 install docker

# Test Docker installation
sudo docker run hello-world

# Add the NVIDIA container toolkit and install it
curl -s -L https://nvidia.github.io/libnvidia-container/gpgkey | sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/nvidia-container-toolkit.list | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker

# Verify NVIDIA Docker installation
sudo docker run --rm --gpus all nvidia/cuda:12.2.0-base-ubuntu22.04 nvidia-smi

# Install Git
sudo apt-get install -y git

# Download and install Miniconda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p $HOME/miniconda

# Activate Conda
source $HOME/miniconda/etc/profile.d/conda.sh
source ~/miniconda/bin/activate

# Verify Conda installation
conda --version

# Final message for restarting
echo "Installation complete. You need to restart the system to finish NVIDIA driver installation."
echo "Please run 'sudo reboot' to reboot the system."