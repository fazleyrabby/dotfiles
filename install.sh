#!/usr/bin/env bash
# install.sh — dotfiles installer
# Idempotent: safe to run multiple times

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ZSHRC="$HOME/.zshrc"

echo "📦 Installing dotfiles..."
echo "----------------------------------------"

# Tools to install
TOOLS=("larasearch" "nestsearch" "nextsearch")

for tool in "${TOOLS[@]}"; do
  echo "→ Setting up $tool..."
  TOOL_DIR="$HOME/.$tool"
  mkdir -p "$TOOL_DIR"
  
  if [[ -f "$DOTFILES_DIR/$tool/$tool" ]]; then
    cp "$DOTFILES_DIR/$tool/$tool" "$TOOL_DIR/$tool"
    cp "$DOTFILES_DIR/$tool/dev" "$TOOL_DIR/dev"
    chmod +x "$TOOL_DIR/$tool"
    chmod +x "$TOOL_DIR/dev"
    echo "  ✅ Copied to $TOOL_DIR"
  else
    echo "  ⚠️  $tool files not found in $DOTFILES_DIR/$tool/"
  fi

  # Add to PATH if not already present
  EXPORT_LINE="export PATH=\"\$HOME/.$tool:\$PATH\""
  if ! grep -qF ".$tool" "$ZSHRC" 2>/dev/null; then
    {
      echo ""
      echo "# $tool"
      echo "$EXPORT_LINE"
    } >> "$ZSHRC"
    echo "  ✅ Added $tool to PATH in $ZSHRC"
  else
    echo "  ⏭  $tool PATH already set in $ZSHRC"
  fi
done

# ---------------------------------------------------------------------------
# Shared shell files — source into .zshrc if present and not already sourced
# ---------------------------------------------------------------------------
for file in aliases.sh env.sh functions.sh; do
  src="$DOTFILES_DIR/shared/$file"
  if [[ -f "$src" ]]; then
    if ! grep -qF "shared/$file" "$ZSHRC" 2>/dev/null; then
      {
        echo ""
        echo "# dotfiles: $file"
        echo "source \"$src\""
      } >> "$ZSHRC"
      echo "  ✅ Sourced shared/$file into $ZSHRC"
    else
      echo "  ⏭  shared/$file already sourced"
    fi
  fi
done

# ---------------------------------------------------------------------------
# Done
# ---------------------------------------------------------------------------
echo ""
echo "----------------------------------------"
echo "✅ Installation complete."
echo ""
echo "Reload your shell:"
echo "  exec zsh"
echo ""
echo "Try out your new search tools:"
echo "  larasearch route user"
echo "  nestsearch controller signal"
echo "  nextsearch page admin"
