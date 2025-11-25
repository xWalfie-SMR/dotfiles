# Dotfiles

Clean Hyprland rice configuration for Arch Linux.

## System Information

- **OS**: Arch Linux
- **Window Manager**: Hyprland (Wayland)
- **Shell**: Zsh
- **Terminal**: Kitty
- **Prompt**: Starship
- **Application Launcher**: Rofi
- **Notification Daemon**: SwayNC
- **Text Editor**: Neovim
- **Browser**: Zen Browser
- **Theme**: Catppuccin Mocha

## Structure

    dotfiles/
    ├── config/              # Application configurations
    │   ├── btop/           # System monitor
    │   ├── colors/         # Color schemes
    │   ├── gtk-3.0/        # GTK3 theme settings
    │   ├── gtk-4.0/        # GTK4 theme settings
    │   ├── hypr/           # Hyprland WM config
    │   ├── kitty/          # Terminal config
    │   ├── nvim/           # Neovim config
    │   ├── nwg-look/       # GTK theme manager
    │   ├── rofi/           # Application launcher
    │   ├── starship.toml   # Shell prompt
    │   ├── swaync/         # Notifications
    │   ├── WallRizz/       # Wallpaper manager
    │   ├── waypaper/       # Wallpaper selector
    │   └── xsettingsd/     # X settings daemon
    ├── packages/
    │   ├── pkglist.txt     # Official packages
    │   └── pkglist-aur.txt # AUR packages
    ├── Pictures/           # Wallpapers
    ├── install.sh          # Installation script
    └── README.md

## Quick Install

    git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    chmod +x install.sh
    ./install.sh

## Manual Installation

### 1. Install Packages

    # Official packages
    sudo pacman -S --needed - < packages/pkglist.txt

    # AUR packages (requires yay/paru)
    yay -S --needed - < packages/pkglist-aur.txt

### 2. Deploy Configs

    # Backup existing configs
    cp -r ~/.config ~/.config.bak

    # Copy configs
    cp -r config/* ~/.config/

    # Copy wallpapers (if any)
    cp -r Pictures/* ~/Pictures/

### 3. Set Zsh as Default Shell

    chsh -s $(which zsh)

## Key Bindings

Check config/hypr/hyprland.conf for all keybindings.

## Customization

- **Theme**: Catppuccin Mocha (GTK via nwg-look)
- **Fonts**: JetBrains Mono Nerd Font
- **Wallpapers**: Use WallRizz or waypaper GUI

## License

Feel free to use and modify as you wish.
