# Dotfiles

Minimalistic catppuccin-mocha themed rice for Hyprland (Arch Linux).

## System Information

- **OS**: Arch Linux
- **Window Manager**: Hyprland (Wayland)
- **Shell**: Zsh with Oh My Zsh
- **Terminal**: Kitty
- **Prompt**: Starship
- **Application Launcher**: Rofi
- **Bar**: Quickshell
- **Notification Daemon**: SwayNC
- **Text Editor**: Neovim
- **Browser**: Zen Browser
- **Theme**: Catppuccin Mocha

## Structure

    dotfiles/
    ├── .config/
    │   ├── btop/
    │   ├── colors/
    │   ├── gtk-3.0/
    │   ├── gtk-4.0/
    │   ├── hypr/
    │   ├── kitty/
    │   ├── nwg-look/
    │   ├── quickshell/
    │   ├── rofi/
    │   ├── starship.toml
    │   ├── swaync/
    │   ├── WallRizz/
    │   ├── waypaper/
    │   └── xsettingsd/
    ├── .zsh/
    │   └── catppuccin_mocha-zsh-syntax-highlighting.zsh
    ├── packages/
    │   ├── pkglist.txt
    │   └── pkglist-aur.txt
    ├── Pictures/
    ├── .zshrc
    ├── .bashrc
    ├── .bash_profile
    ├── install.sh
    └── README.md

## Quick Install

    git clone https://github.com/xWalfie-SMR/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    chmod +x install.sh
    ./install.sh

### With curl:
    curl -fsSL https://raw.githubusercontent.com/xWalfie-SMR/dotfiles/main/install.sh | sh

### With wget:
    wget -qO- https://raw.githubusercontent.com/xWalfie-SMR/dotfiles/main/install.sh | sh

## Manual Installation

### 1. Install Packages

    sudo pacman -S --needed - < packages/pkglist.txt
    yay -S --needed - < packages/pkglist-aur.txt

### 2. Deploy Configs

    cp -r .config/* ~/.config/
    cp .zshrc ~/.zshrc
    cp .bashrc ~/.bashrc
    cp .bash_profile ~/.bash_profile
    mkdir -p ~/.zsh
    cp -r .zsh/* ~/.zsh/

### 3. Setup Zsh

    # Install Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    # Install plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    
    # Set as default shell
    chsh -s $(which zsh)

## Key Bindings

Check .config/hypr/hyprland.conf for keybindings.

## NVIDIA Users

Uncomment the line:
```bash
```
source = ~/.config/hypr/nvidia.conf

In:

`~/.config/hypr/hyprland.conf`
```


## Credits

- Catppuccin theme
- Hyprland
- Quickshell

## License

MIT License (see [LICENSE](LICENSE))

## TODO

- [ ] Modify hyprland.conf
- [ ] Add screenshots
- [x] Change quickshell status bar to be symlink to my repo
- [ ] Links and references
