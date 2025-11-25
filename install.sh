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
if [ ! -f "README.md" ] || [ ! -d "config" ]; then
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

# Backup existing configs
echo -e "${YELLOW}Backing up existing configs...${NC}"
if [ -d "$HOME/.config" ]; then
    backup_dir="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
    cp -r "$HOME/.config" "$backup_dir"
    echo -e "${GREEN}Backup created at: $backup_dir${NC}"
fi

# Deploy configs
echo -e "${YELLOW}Deploying configs...${NC}"
for dir in config/*; do
    item=$(basename "$dir")
    echo "  - Installing $item"
    cp -r "$dir" "$HOME/.config/"
done

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
