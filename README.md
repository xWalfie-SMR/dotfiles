# Dotfiles

Personal configuration files for my Arch Linux system with Hyprland.

## 🖥️ System Information

- **OS**: Arch Linux
- **Window Manager**: Hyprland (Wayland)
- **Shell**: Zsh with Oh My Zsh
- **Terminal**: Kitty
- **Prompt**: Starship
- **Application Launcher**: Rofi
- **Status Bar**: Waybar
- **Notification Daemon**: SwayNC
- **File Manager**: Thunar
- **Text Editor**: Neovim
- **Browser**: Zen Browser, Firefox
- **Theme**: Catppuccin Mocha

## 📁 Structure

```
.
├── .bash_profile          # Bash profile configuration
├── .bashrc               # Bash shell configuration
├── .zshrc                # Zsh shell configuration
├── .config/              # Application configurations
│   ├── hypr/            # Hyprland window manager config
│   ├── waybar/          # Status bar configuration
│   ├── kitty/           # Terminal emulator config
│   ├── nvim/            # Neovim editor configuration
│   ├── rofi/            # Application launcher themes
│   ├── swaync/          # Notification daemon config
│   ├── btop/            # System monitor config
│   ├── spicetify/       # Spotify customization
│   ├── starship.toml    # Shell prompt configuration
│   └── ...              # Other app configs
├── Pictures/
│   └── wallpapers/      # Wallpaper collection
├── icons/               # Custom icon themes
│   ├── catppuccin-mocha-mauve-cursors/
│   └── default/
├── pkglist.txt          # Official Arch packages
├── pkglist-aur.txt      # AUR packages
└── flatpak-list.txt     # Flatpak applications
```

## 🚀 Installation

### Prerequisites

- Fresh Arch Linux installation
- Git installed
- `yay` or another AUR helper (or install manually from AUR)

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/xWalfie-SMR/dotfiles.git
   cd dotfiles
   ```

2. **Install packages**:
   ```bash
   # Install official repository packages
   sudo pacman -S --needed - < pkglist.txt
   
   # Install AUR packages (using yay)
   yay -S --needed - < pkglist-aur.txt
   
   # Install Flatpak applications
   flatpak install $(cat flatpak-list.txt)
   ```

3. **Deploy configuration files**:
   ```bash
   # Backup existing configs (recommended)
   mkdir -p ~/.config-backup
   cp -r ~/.config/* ~/.config-backup/ 2>/dev/null
   
   # Copy dotfiles
   cp .bash_profile ~/.bash_profile
   cp .bashrc ~/.bashrc
   cp .zshrc ~/.zshrc
   cp -r .config/* ~/.config/
   cp -r Pictures/* ~/Pictures/
   cp -r icons/* ~/.icons/
   ```

4. **Install Oh My Zsh** (if not already installed):
   ```bash
   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

5. **Set Zsh as default shell**:
   ```bash
   chsh -s $(which zsh)
   ```

6. **Reboot or log out and back in** to apply all changes.

## 🎨 Customization

### Themes
The configuration uses the **Catppuccin Mocha** color scheme across most applications.

### Wallpapers
Wallpapers are stored in `~/Pictures/wallpapers/`. You can:
- Use `hyprpaper` or `swww` for wallpaper management
- Use `waypaper` GUI for easy wallpaper selection

### Keybindings
Refer to `.config/hypr/hyprland.conf` for Hyprland keybindings.

## 📦 Package Lists

- **pkglist.txt**: Contains official Arch Linux repository packages
- **pkglist-aur.txt**: Contains packages from the AUR (Arch User Repository)
- **flatpak-list.txt**: Contains Flatpak applications

### Key Software Included

- **Display Server**: Hyprland (Wayland compositor)
- **Graphics**: NVIDIA drivers with Wayland support
- **Audio**: PipeWire with ALSA and PulseAudio compatibility
- **Tools**: btop, fastfetch, fzf, git, neovim
- **Apps**: Spotify (with Spicetify), Discord (Vesktop), Firefox, Zen Browser

## ⚙️ Configuration Highlights

### Hyprland
Tiling Wayland compositor with custom keybindings and window rules.

### Waybar
Custom status bar with system information, workspaces, and media controls.

### Kitty
Fast GPU-based terminal emulator with custom theme.

### Starship
Minimal, fast prompt with git integration.

### Neovim
Modern text editor configuration (check `.config/nvim/` for details).

## 📝 Notes

- This configuration is tailored for NVIDIA graphics cards with Wayland support
- Some applications may require additional setup (e.g., Spicetify for Spotify)
- GTK themes are configured for Catppuccin Mocha

## 🤝 Credits

- [Catppuccin](https://github.com/catppuccin) - Color scheme
- [Hyprland](https://hyprland.org/) - Window manager
- [Oh My Zsh](https://ohmyz.sh/) - Zsh framework
- [Starship](https://starship.rs/) - Shell prompt

## 📄 License

These are personal configuration files. Feel free to use and modify them as you wish.
