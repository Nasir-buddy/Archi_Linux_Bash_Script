# Automated Software Installation Script

This script automates the installation of various software packages, developer tools, and monitoring utilities on an Arch-based Linux system using `pacman`. It provides options to install different NVIDIA drivers and other essential tools for development and system monitoring.

## Table of Contents

- [Prerequisites](#prerequisites)
- [How to Clone the Repository](#how-to-clone-the-repository)
- [How to Run the Script](#how-to-run-the-script)
- [What the Script Does](#what-the-script-does)
- [Customization](#customization)
- [Contribution](#contribution)
- [Author](#author)

## Prerequisites

- An Arch Linux or Arch-based distribution installed.
- `git` should be installed on your system. If not, install it using:

```bash
sudo pacman -S git --noconfirm
```

## How to Clone the Repository

- Open your terminal.
- Navigate to the directory where you want to clone the repository.
- Clone the repository using the following command.

```bash
git clone https://github.com/Nasir-buddy/Arch_Linux_Bash_Script.git
```

- Navigate into the cloned repository:

```bash
cd Arch_Linux_Bash_Script
```

## How to Run the Script

- Make the script executable:

```bash
chmod +x Install_All.sh
```

- Run the script:

```bash
./Install_All.sh
```

## What the Script Does

- **NVIDIA Driver Selection**: You'll be prompted to select an NVIDIA driver to install.
- **Software Installation**: For each software package, you'll be asked if you want to install it.
- **MongoDB Service**: The script will check and start the MongoDB service if it's not already running.
- **Software Packages**: Installs a list of various software packages if they are not already installed.
- **Developer Tools**: Installs additional developer tools for programming and development.
- **System Monitoring Tools**: Installs various monitoring tools categorized into:
  - Process Monitoring Tools
  - Network Monitoring Tools
  - Disk/IO Monitoring Tools
  - Hardware Sensors Tools
  - Complete System Monitoring Tools
  - Performance Analysis Tools
  - Memory Monitoring Tools
  - Desktop Monitoring Tools
  - System Information Tools
- **System Utilities**: Installs utilities for system optimization and management.
- **MongoDB Service Management**: 
  - Checks if the MongoDB service is active; starts it if not.
  - Checks if the MongoDB service is enabled to start on boot; enables it if not.

## Customization

You can customize the script by adding or removing packages from the arrays defined in the script:

- **Software Packages**: Modify the `software_list` array.
- **Developer Tools**: Modify the `developer_tools_list` array.
- **Monitoring Tools**: Modify the various monitoring tool arrays like `process_monitoring`, `network_monitoring`, etc.
- **System Utilities**: Modify the `system_utilities_list` array.

## Contribution

Contributions are welcome! To contribute to this repository, follow these steps:

1. **Fork the Repository**: Click the "Fork" button at the top right of this page to create a copy of this repository in your GitHub account.
2. **Clone Your Fork**: Clone your forked repository to your local machine using the following command:

   ```bash
   git clone https://github.com/<your-username>/Arch_Linux_Bash_Script.git
   ```
   
3. **Create a New Branch**: Create a new branch for your changes:

   ```bash
   cd Arch_Linux_Bash_Script
   ```
   
4. **Make Your Changes**: Add or modify the software packages in the script by any code editer or any notepad editer. For example, to add a new monitoring tool, update the relevant array in the `Install_All.sh` script.

5. **Update the README**: If you add new software packages or tools, update the README to reflect these changes. Ensure the new software packages are documented under the appropriate sections.

6. **Commit Your Changes**: Commit your changes with a meaningful commit message:

   ```bash
   git add .
   git commit -m "<Your new changes message>"
   ```

7. **Push to Your Fork**: Push your changes to your forked repository:

   ```bash
   git push -u origin
   ```

8. **Create a Pull Request**: Go to the original repository and create a pull request from your forked repository. Provide a detailed description of your changes and why they should be merged.

By following these steps, you can contribute to the development of the `Arch_Linux_Bash_Script` project and help improve its functionality.

## Author

**Nasir Ali**

