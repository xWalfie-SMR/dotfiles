#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Dotfiles directory
DOTFILES="$HOME/dotfiles"

echo -e "${GREEN}=== Hyprland Rice Installer ===${NC}\n"

# Check if running from dotfiles directory
if [ ! -f "README.md" ] || [ ! -d ".config" ]; then
    echo -e "${RED}Error: Run this script from the dotfiles directory${NC}"
    exit 1
fi

# Install packages
echo -e "${YELLOW}Installing packages...${NC}"
if command -v pacman &> /dev/null; then
    sudo pacman -S --needed - < packages/pkglist.txt
else
    echo -e "${RED}pacman not found. Are you on Arch?${NC}"
    exit 1
fi

# AUR helper check
echo -e "${YELLOW}Installing AUR packages...${NC}"
if command -v yay &> /dev/null; then
    yay -S --needed - < packages/pkglist-aur.txt
elif command -v paru &> /dev/null; then
    paru -S --needed - < packages/pkglist-aur.txt
else
    echo -e "${YELLOW}No AUR helper found. Install yay/paru first or install AUR packages manually.${NC}"
    echo "Skipping AUR packages..."
fi

# Install Oh My Zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${YELLOW}Installing Oh My Zsh...${NC}"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install zsh plugins
echo -e "${YELLOW}Installing zsh plugins...${NC}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# Backup existing configs
echo -e "${YELLOW}Backing up existing configs...${NC}"
if [ -d "$HOME/.config" ]; then
    backup_dir="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
    cp -r "$HOME/.config" "$backup_dir"
    echo -e "${GREEN}Backup created at: $backup_dir${NC}"
fi

# Backup shell configs
[ -f "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
[ -f "$HOME/.bashrc" ] && cp "$HOME/.bashrc" "$HOME/.bashrc.bak"
[ -f "$HOME/.bash_profile" ] && cp "$HOME/.bash_profile" "$HOME/.bash_profile.bak"

# Deploy configs
echo -e "${YELLOW}Deploying configs...${NC}"
for dir in .config/*; do
    item=$(basename "$dir")
    echo "  - Installing $item"
    cp -r "$dir" "$HOME/.config/"
done

# Deploy shell configs
echo -e "${YELLOW}Deploying shell configs...${NC}"
cp .zshrc "$HOME/.zshrc"
cp .bashrc "$HOME/.bashrc"
cp .bash_profile "$HOME/.bash_profile"

# Deploy zsh theme
if [ -d ".zsh" ]; then
    echo -e "${YELLOW}Deploying zsh theme...${NC}"
    mkdir -p "$HOME/.zsh"
    cp -r .zsh/* "$HOME/.zsh/"
fi

# Deploy wallpapers if they exist
if [ -d "Pictures" ]; then
    echo -e "${YELLOW}Copying wallpapers...${NC}"
    mkdir -p "$HOME/Pictures"
    cp -r Pictures/* "$HOME/Pictures/"
fi

# Set Zsh as default shell
if [ "$SHELL" != "$(which zsh)" ]; then
    echo -e "${YELLOW}Setting Zsh as default shell...${NC}"
    chsh -s $(which zsh)
fi

echo -e "\n${GREEN}=== Installation Complete! ===${NC}"
echo -e "${YELLOW}Please log out and back in for all changes to take effect.${NC}"
echo -e "${YELLOW}Check ~/.config/hypr/hyprland.conf for keybindings.${NC}"
