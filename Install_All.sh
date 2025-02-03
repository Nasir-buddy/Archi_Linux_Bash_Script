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
      echo "Installing nvidia-dkms..."
      sudo pacman -S nvidia-dkms --noconfirm
      ;;
    2)
      echo "Installing nvidia-open-dkms..."
      sudo pacman -S nvidia-open-dkms --noconfirm
      ;;
    3)
      echo "Installing nvidia-lts..."
      sudo pacman -S nvidia-lts --noconfirm
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

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
sudo pacman -S visual-studio-code-bin --noconfirm

# Install Microsoft Edge
echo "Installing Microsoft Edge..."
sudo pacman -S microsoft-edge-stable-bin --noconfirm

# Install Brave Browser
echo "Installing Brave Browser..."
sudo pacman -S brave --noconfirm

# Install Google Chrome
echo "Installing Google Chrome..."
sudo pacman -S google-chrome --noconfirm

# Install VLC Media Player
echo "Installing VLC Media Player..."
sudo pacman -S vlc --noconfirm

# Install GIMP (GNU Image Manipulation Program)
echo "Installing GIMP..."
sudo pacman -S gimp --noconfirm

# Install LibreOffice
echo "Installing LibreOffice..."
sudo pacman -S libreoffice-fresh --noconfirm

# Install Node.js
echo "Installing Node.js..."
sudo pacman -S nodejs npm --noconfirm

# Install Docker
echo "Installing Docker..."
sudo pacman -S docker --noconfirm

# Install Python and pip
echo "Installing Python and pip..."
sudo pacman -S python python-pip --noconfirm

# Install MongoDB
echo "Installing MongoDB..."
sudo pacman -S mongodb --noconfirm

# Start and enable MongoDB service
echo "Starting and enabling MongoDB service..."
sudo systemctl start mongodb
sudo systemctl enable mongodb

# Install Mongoose via npm
echo "Installing Mongoose..."
npm install mongoose


# Install gnupg
echo "installing gnupg"
sudo pacman -S gnupg

# Install Telegram Desktop
echo "Installing Telegram Desktop"
sudo pacman -S telegram-desktop

#Install MongoDB compass
echo "Installing Mongodb Compass"
sudo pacman -S mongodb-compass

echo "Installation complete (Script by Nasir Ali)!"
