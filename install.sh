#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="$HOME/.config/ralph-wiggum"
BIN_DIR="$HOME/.local/bin"

echo "Installing Ralph Wiggum..."

mkdir -p "$CONFIG_DIR"
mkdir -p "$BIN_DIR"
mkdir -p "$CONFIG_DIR/.claude-for-linux"

cp "$SCRIPT_DIR/Dockerfile.claude" "$CONFIG_DIR/Dockerfile.claude"
cp "$SCRIPT_DIR/ralph-wiggum.md" "$CONFIG_DIR/ralph-wiggum.md"
cp "$SCRIPT_DIR/ralph-wiggum" "$BIN_DIR/ralph-wiggum"
chmod +x "$BIN_DIR/ralph-wiggum"

echo ""
echo "Installed:"
echo "  $CONFIG_DIR/Dockerfile.claude"
echo "  $CONFIG_DIR/ralph-wiggum.md"
echo "  $CONFIG_DIR/.claude-for-linux/  (put your Claude credentials here)"
echo "  $BIN_DIR/ralph-wiggum"
echo ""

if ! echo "$PATH" | tr ':' '\n' | grep -qx "$BIN_DIR"; then
    echo "WARNING: $BIN_DIR is not in your PATH."
    echo "Add this to your shell profile:"
    echo ""
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
fi

echo "Done."
