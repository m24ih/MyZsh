#!/usr/bin/env bash

# Renk tanımlamaları
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Zsh ortamı kurulumu başlatılıyor...${NC}"

# Scriptin bulunduğu dizini bul (Repo dizini)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1. Dağıtım tespiti
if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$ID
else
  OS=$(uname -s)
fi

# 2. Sistem Paketlerinin Kurulumu
echo -e "${GREEN}Sistem paketleri kuruluyor... ($OS)${NC}"
case "$OS" in
arch | cachyos)
  AUR_HELPER=$(command -v paru || command -v yay)
  if [ -z "$AUR_HELPER" ]; then
    sudo pacman -S --needed --noconfirm neovim fastfetch eza bat ripgrep trash-cli zoxide fzf multitail tree unrar p7zip zsh-theme-powerlevel10k
  else
    $AUR_HELPER -S --needed --noconfirm neovim fastfetch eza bat ripgrep trash-cli zoxide fzf multitail tree unrar p7zip zsh-theme-powerlevel10k
  fi
  ;;
debian | ubuntu)
  sudo apt update
  sudo apt install -y neovim eza bat ripgrep trash-cli zoxide fzf multitail tree unrar p7zip curl git zsh
  ;;
esac

# 3. Oh My Zsh Kurulumu
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo -e "${GREEN}Oh My Zsh kuruluyor...${NC}"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

# 4. Custom Pluginlerin Kurulumu
declare -A PLUGINS
PLUGINS=(
  ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions"
  ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
  ["zsh-completions"]="https://github.com/zsh-users/zsh-completions"
  ["zsh-history-substring-search"]="https://github.com/zsh-users/zsh-history-substring-search"
  ["zsh-autopair"]="https://github.com/hlissner/zsh-autopair"
)

for plugin in "${!PLUGINS[@]}"; do
  if [ ! -d "$ZSH_CUSTOM/plugins/$plugin" ]; then
    echo -e "${GREEN}Plugin kuruluyor: $plugin${NC}"
    git clone "${PLUGINS[$plugin]}" "$ZSH_CUSTOM/plugins/$plugin"
  fi
done

# 5. Powerlevel10k Kurulumu (Manuel fallback)
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo -e "${GREEN}Powerlevel10k teması indiriliyor...${NC}"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# 6. Symlink İşlemi
echo -e "${GREEN}Symlink işlemleri başlatılıyor...${NC}"

if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  echo -e "${YELLOW}Mevcut .zshrc bulundu, .zshrc.bak olarak yedekleniyor...${NC}"
  mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
fi

echo -e "${GREEN}.zshrc symlink oluşturuluyor: $REPO_DIR/.zshrc -> $HOME/.zshrc${NC}"
ln -sf "$REPO_DIR/.zshrc" "$HOME/.zshrc"

# Powerlevel10k konfigürasyonu varsa onu da linkle (Opsiyonel)
if [ -f "$REPO_DIR/.p10k.zsh" ]; then
  ln -sf "$REPO_DIR/.p10k.zsh" "$HOME/.p10k.zsh"
  echo -e "${GREEN}.p10k.zsh linklendi.${NC}"
fi

echo -e "${GREEN}Kurulum başarıyla tamamlandı!${NC}"
echo -e "${YELLOW}Değişikliklerin aktif olması için 'zsh' yazarak kabuğu başlatın.${NC}"
