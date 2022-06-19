#!/bin/sh

# This script is meant to be run in Git Bash.

printf 'This will DELETE SOME FILES. Read the script before running. Run script (y/n)? '
read -r answer

if [ "$answer" = "${answer#[Yy]}" ]; then
  return
fi

# Meaningful directory.
startup="$HOME/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup"
wa=$(cd "$(dirname "$0")" && pwd)

# Remove files that will be replaced with symlinks.
rm -vf "$startup/wa.ahk"

# Symlink ahk script.
ln -sv "$wa/wa.ahk" "$startup"

# Run ahk script in the background.
autohotkey.exe "$wa/wa.ahk" &

