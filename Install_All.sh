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
  "thunderbird"
  "slack-desktop"
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


# Process Monitoring Tools
process_monitoring=(
    "htop"          # Interactive process viewer
    "btop"          # Resource monitor with mouse support
    "atop"          # Advanced system monitor
    "bashtop"       # Resource monitor written in bash
    "bpytop"        # Python resource monitor
    "glances"       # Cross-platform monitoring tool
)

# Network Monitoring Tools
network_monitoring=(
    "iftop"         # Network bandwidth monitor
    "nethogs"       # Per-process network bandwidth monitor
    "bandwhich"     # Network utilization tool
    "nload"         # Real-time network traffic monitor
    "iptraf-ng"     # Interactive network monitor
    "goaccess"      # Real-time web log analyzer
)

# Disk/IO Monitoring Tools
disk_monitoring=(
    "iotop"         # I/O monitoring per process
    "ioping"        # I/O latency monitoring tool
    "ftop"          # File system monitor
    "fatrace"       # File access tracer
    "dstat"         # Versatile disk stats tool
)

# Hardware Sensors Tools
hardware_monitoring=(
    "lm_sensors"    # Hardware sensor information
    "psensor"       # Hardware temperature monitoring
    "s-tui"         # CPU monitoring and stress testing
    "nvtop"         # NVIDIA GPU process monitoring
    "powertop"      # Power consumption monitor
)

# Complete System Monitoring Tools
system_monitoring=(
    "netdata"       # Real-time performance monitoring
    "prometheus"    # Monitoring system & time series database
    "grafana"       # Analytics and monitoring solution
    "zabbix-agent"  # Enterprise monitoring solution
    "telegraf"      # Server monitoring agent
    "monit"         # System monitoring and error recovery
)

# Performance Analysis Tools
performance_tools=(
    "perf"          # Performance analysis tools
    "sysstat"       # System performance tools collection
    "collectl"      # Performance data collector
    "sar"           # System activity reporter
    "strace"        # System call tracer
    "latencytop"    # System latency monitoring
)

# Memory Monitoring Tools
memory_monitoring=(
    "vmstat"        # Virtual memory statistics
    "slabtop"       # Kernel slab cache information
    "smem"          # Memory reporting tool
)

# Desktop Monitoring Tools
desktop_monitoring=(
    "conky"         # Desktop system monitor
    "stacer"        # System optimizer and monitor
    "gotop"         # Terminal based graphical monitor
    "bottom"        # Rust-based system monitor
)

# System Information Tools
system_info=(
    "inxi"          # System information script
    "neofetch"      # System information tool
    "screenfetch"   # System information tool
)

# Install monitoring tools from each category
echo "Installing Process Monitoring Tools..."
for tool in "${process_monitoring[@]}"; do
    install_if_not_installed $tool
done

echo "Installing Network Monitoring Tools..."
for tool in "${network_monitoring[@]}"; do
    install_if_not_installed $tool
done

echo "Installing Disk/IO Monitoring Tools..."
for tool in "${disk_monitoring[@]}"; do
    install_if_not_installed $tool
done

echo "Installing Hardware Sensors Tools..."
for tool in "${hardware_monitoring[@]}"; do
    install_if_not_installed $tool
done

echo "Installing Complete System Monitoring Tools..."
for tool in "${system_monitoring[@]}"; do
    install_if_not_installed $tool
done

echo "Installing Performance Analysis Tools..."
for tool in "${performance_tools[@]}"; do
    install_if_not_installed $tool
done

echo "Installing Memory Monitoring Tools..."
for tool in "${memory_monitoring[@]}"; do
    install_if_not_installed $tool
done

echo "Installing Desktop Monitoring Tools..."
for tool in "${desktop_monitoring[@]}"; do
    install_if_not_installed $tool
done

echo "Installing System Information Tools..."
for tool in "${system_info[@]}"; do
    install_if_not_installed $tool
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
