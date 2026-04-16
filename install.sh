#!/usr/bin/env bash
# install.sh — dotfiles installer
# Idempotent: safe to run multiple times

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LARASEARCH_DIR="$HOME/.larasearch"
ZSHRC="$HOME/.zshrc"

echo "📦 Installing dotfiles..."
echo "----------------------------------------"

# ---------------------------------------------------------------------------
# larasearch
# ---------------------------------------------------------------------------
echo "→ Setting up larasearch..."

mkdir -p "$LARASEARCH_DIR"
cp "$DOTFILES_DIR/larasearch/larasearch" "$LARASEARCH_DIR/larasearch"
cp "$DOTFILES_DIR/larasearch/dev"        "$LARASEARCH_DIR/dev"
chmod +x "$LARASEARCH_DIR/larasearch"
chmod +x "$LARASEARCH_DIR/dev"

echo "  ✅ Copied to $LARASEARCH_DIR"

# ---------------------------------------------------------------------------
# PATH — add to .zshrc if not already present
# ---------------------------------------------------------------------------
EXPORT_LINE='export PATH="$HOME/.larasearch:$PATH"'

if ! grep -qF '.larasearch' "$ZSHRC" 2>/dev/null; then
  echo "" >> "$ZSHRC"
  echo "# larasearch" >> "$ZSHRC"
  echo "$EXPORT_LINE" >> "$ZSHRC"
  echo "  ✅ Added larasearch to PATH in $ZSHRC"
else
  echo "  ⏭  PATH already set in $ZSHRC"
fi

# ---------------------------------------------------------------------------
# Shared shell files (source into .zshrc if not already)
# ---------------------------------------------------------------------------
for file in aliases.sh env.sh functions.sh; do
  src="$DOTFILES_DIR/shared/$file"
  marker="# source: $file"
  if [[ -f "$src" ]]; then
    if ! grep -qF "$file" "$ZSHRC" 2>/dev/null; then
      echo "" >> "$ZSHRC"
      echo "$marker" >> "$ZSHRC"
      echo "source \"$src\"" >> "$ZSHRC"
      echo "  ✅ Sourced $file into $ZSHRC"
    else
      echo "  ⏭  $file already sourced"
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
echo "Then try:"
echo "  larasearch route cancel order"
echo "  larasearch ai cancel_order"
echo "  larasearch where cancelOrder"
