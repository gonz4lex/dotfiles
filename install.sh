#!/usr/bin/env bash

set -e

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"
FILES=(
  .zshrc
  .gitignore_global
  .hyper.js
  .p10k.zsh
  .tmux.conf
)

echo "🔧 Installing dotfiles..."
echo "📁 Backup of existing files will be saved to: $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

for file in "${FILES[@]}"; do
  src="$DOTFILES_DIR/$file"
  dest="$HOME/$file"

  # Backup existing files
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "📦 Backing up $file..."
    mv "$dest" "$BACKUP_DIR/"
  fi

  # Create symlink
  echo "🔗 Linking $file"
  ln -s "$src" "$dest"
done

echo "✅ Dotfiles installation complete!"
