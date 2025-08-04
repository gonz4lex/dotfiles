# Dotfiles

My personal dotfiles for Zsh, Git, and more.

## Installation

Clone the repo and run the install script:

```bash
git clone https://github.com/username/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installation script:

- backs up any existing dotfiles to ~/.dotfiles_backup/
- creates symlinks from your home directory to the files in this repo
- sets up a consistent shell and Git environment across machines

## Structure

- zsh/: Zsh shell configuration
- git/: Global Git config
- config/: Terminal and prompt config

## Requirements

- `zsh`