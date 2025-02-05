#!/bin/bash

# Function to install selected NVIDIA driver
install_nvidia_driver() {
  echo "Select the NVIDIA driver to install:"
  echo "1. nvidia-dkms"
  echo "2. nvidia-open-dkms"
  echo "3. nvidia-lts"
  echo "4. None"
  read -p "Enter the number of your choice: " choice

  case $choice in
    1)
      if ! pacman -Qs nvidia-dkms > /dev/null; then
        echo "Installing nvidia-dkms..."
        sudo pacman -S nvidia-dkms --noconfirm
      else
        echo "nvidia-dkms is already installed."
      fi
      ;;
    2)
      if ! pacman -Qs nvidia-open-dkms > /dev/null; then
        echo "Installing nvidia-open-dkms..."
        sudo pacman -S nvidia-open-dkms --noconfirm
      else
        echo "nvidia-open-dkms is already installed."
      fi
      ;;
    3)
      if ! pacman -Qs nvidia-lts > /dev/null; then
        echo "Installing nvidia-lts..."
        sudo pacman -S nvidia-lts --noconfirm
      else
        echo "nvidia-lts is already installed."
      fi
      ;;
    4)
      echo "No NVIDIA driver will be installed."
      ;;
    *)
      echo "Invalid choice. No NVIDIA driver will be installed."
      ;;
  esac
}

# Update the system
echo "Updating system..."
sudo pacman -Syu --noconfirm

# Install the selected NVIDIA driver
install_nvidia_driver

# Function to install a package if not already installed
install_if_not_installed() {
  if ! pacman -Qs $1 > /dev/null; then
    echo "Installing $1..."
    sudo pacman -S $1 --noconfirm
  else
    echo "$1 is already installed."
  fi
}

# Install various software packages
install_if_not_installed visual-studio-code-bin
install_if_not_installed microsoft-edge-stable-bin
install_if_not_installed brave
install_if_not_installed google-chrome
install_if_not_installed vlc
install_if_not_installed gimp
install_if_not_installed libreoffice-fresh
install_if_not_installed nodejs
install_if_not_installed npm
install_if_not_installed docker
install_if_not_installed python
install_if_not_installed python-pip
install_if_not_installed mongodb
install_if_not_installed gnupg
install_if_not_installed telegram-desktop
install_if_not_installed mongodb-compass
install_if_not_installed postman
install_if_not_installed htop

# Check and start MongoDB service if not already started
echo "Checking MongoDB service status..."
if ! systemctl is-active --quiet mongodb; then
  echo "Starting MongoDB service..."
  sudo systemctl start mongodb
else
  echo "MongoDB service is already running."
fi

# Check and enable MongoDB service if not already enabled
echo "Checking MongoDB service enablement status..."
if ! systemctl is-enabled --quiet mongodb; then
  echo "Enabling MongoDB service..."
  sudo systemctl enable mongodb
else
  echo "MongoDB service is already enabled."
fi

# Check and install Mongoose via npm
if ! npm list -g mongoose > /dev/null; then
  echo "Installing Mongoose..."
  npm install -g mongoose
else
  echo "Mongoose is already installed."
fi


echo "Installation complete (Script by Nasir Ali)!"
