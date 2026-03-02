#!/usr/bin/env bash

set -euo pipefail

DOTFILES_PATH="$HOME/dotfiles"
INSTALL_LOG="$HOME/dotfiles-install.log"

exec > >(tee -a "$INSTALL_LOG") 2>&1
echo "[install.sh] started at $(date)"

# Install packages
echo "[install.sh] running apt-get update..."
sudo apt-get update -y
echo "[install.sh] installing rsync..."
sudo apt-get install -y rsync
echo "[install.sh] rsync installed: $(which rsync)"

# Symlink dotfiles to the root within your workspace
echo "[install.sh] symlinking dotfiles..."
find $DOTFILES_PATH -type f -path "$DOTFILES_PATH/.*" |
while read df; do
  link=${df/$DOTFILES_PATH/$HOME}
  mkdir -p "$(dirname "$link")"
  ln -sf "$df" "$link"
done

echo "[install.sh] done"
