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
    echo "Do you want to install $1? (y/n)"
    read choice
    if [[ $choice == "y" ]]; then
      echo "Installing $1..."
      sudo pacman -S $1 --noconfirm
    else
      echo "Skipping $1 installation."
    fi
  else
    echo "$1 is already installed."
  fi
}

# Install various software packages
software_list=(
  "visual-studio-code-bin"
  "microsoft-edge-stable-bin"
  "brave"
  "google-chrome"
  "vlc"
  "gimp"
  "libreoffice-fresh"
  "nodejs"
  "npm"
  "docker"
  "python"
  "python-pip"
  "mongodb"
  "gnupg"
  "telegram-desktop"
  "mongodb-compass"
  "postman"
  "htop"
)

for software in "${software_list[@]}"; do
  install_if_not_installed $software
done

# Additional Developer Tools
developer_tools_list=(
  "git"
  "yarn"
  "neovim"
  "intellij-idea-community-edition"
  "jetbrains-toolbox"
  "rust"
  "go"
  "php"
  "mysql"
  "postgresql"
  "dbeaver"
)

for tool in "${developer_tools_list[@]}"; do
  install_if_not_installed $tool
done

# System Monitoring Tools
monitoring_tools_list=(
  "bpytop"
  "glances"
  "iotop"
  "iftop"
  "lm_sensors"
)

for tool in "${monitoring_tools_list[@]}"; do
  install_if_not_installed $tool
done

# System Utilities
system_utilities_list=(
  "flameshot"
  "timeshift"
  "gparted"
  "obs-studio"
  "bleachbit"
  "stacer"
)

for utility in "${system_utilities_list[@]}"; do
  install_if_not_installed $utility
done

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

echo "Installation complete (Script by Nasir Ali)!"
