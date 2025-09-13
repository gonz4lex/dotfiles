#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# Map of repo path → $HOME destination
declare -A FILES=(
  ["zsh/.zshrc"]=".zshrc"
  ["config/.p10k.zsh"]=".p10k.zsh"
  ["config/.tmux.conf"]=".tmux.conf"
  ["config/.hyper.js"]=".hyper.js"
  ["git/.gitignore_global"]=".gitignore_global"
  ["git/.gitconfig"]=".gitconfig"
)

echo "🔧 Installing dotfiles..."
echo "📁 Backup of existing files will be saved to: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

for src_rel in "${!FILES[@]}"; do
  dest="${FILES[$src_rel]}"
  src="$DOTFILES_DIR/$src_rel"
  dest="$HOME/$dest"

  # Backup existing file
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "📦 Backing up $dest..."
    mv "$dest" "$BACKUP_DIR/"
  fi

  # Symlink
  if [ -f "$src" ]; then
    echo "🔗 Linking $dest → $src"
    ln -s "$src" "$dest"
  else
    echo "⚠️ Skipping $dest, source $src not found"
  fi
done

#!/usr/bin/env bash
set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Map of repo path → $HOME destination
declare -A FILES=(
  ["zsh/.zshrc"]=".zshrc"
  ["config/.p10k.zsh"]=".p10k.zsh"
  ["config/.tmux.conf"]=".tmux.conf"
  ["config/.hyper.js"]=".hyper.js"
  ["git/.gitignore_global"]=".gitignore_global"
  ["git/.gitconfig"]=".gitconfig"
)

echo "🔧 Installing dotfiles..."
echo "📁 Backup of existing files will be saved to: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

for src_rel in "${!FILES[@]}"; do
  dest="${FILES[$src_rel]}"
  src="$DOTFILES_DIR/$src_rel"
  dest="$HOME/$dest"

  # Backup existing file
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "📦 Backing up $dest..."
    mv "$dest" "$BACKUP_DIR/"
  fi

  # Symlink
  if [ -f "$src" ]; then
    echo "🔗 Linking $dest → $src"
    ln -s "$src" "$dest"
  else
    echo "⚠️ Skipping $dest, source $src not found"
  fi
done

echo "🔧 Installing Oh My Zsh plugins and themes..."

# Powerlevel10k theme
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "🌟 Installing Powerlevel10k theme..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

# zsh-autosuggestions plugin
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "⚡ Installing zsh-autosuggestions plugin..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# zsh-syntax-highlighting plugin
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "🎨 Installing zsh-syntax-highlighting plugin..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

echo "✅ Dotfiles and plugins installation complete!"
