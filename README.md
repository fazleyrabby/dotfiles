# dotfiles

Personal dotfiles including `larasearch` — a semantic, fuzzy search CLI for Laravel projects.

## Install

```bash
git clone https://github.com/fazleyrabby/dotfiles.git ~/Desktop/Projects/dotfiles
cd ~/Desktop/Projects/dotfiles
./install.sh
exec zsh
```

## larasearch

Works from any subdirectory inside a Laravel project. Auto-detects Laravel root via `artisan`.

### Commands

```bash
# Search routes (fuzzy)
larasearch route cancel order
larasearch route cancel_order
larasearch route cancelOrder

# Search usage across app/, routes/, resources/
larasearch where cancelOrder
larasearch where OrderService

# Generate AI context block
larasearch ai cancel order
larasearch ai cancel_order
```

### Fuzzy Normalization

All three forms match identically:

```
cancelOrder   → cancel order
cancel_order  → cancel order
Cancel-Order  → cancel order
```

### ai command output

```
🧠 Building AI context for: cancel order
----------------------------------------

📍 Route:
  POST /orders/{id}/cancel | OrderController@cancel

🎮 Controller:
  App\Http\Controllers\OrderController@cancel

📂 Scanning:
  [1] app/Http/Controllers/OrderController.php
  [2] app/Services/OrderService.php
  ...

📊 Scanned 84 files

🔍 Related Usage:
  app/Services/OrderService.php:   public function cancel(Order $order)

----------------------------------------

📦 AI PROMPT:

Route:
  POST /orders/{id}/cancel | OrderController@cancel

Controller:
  App\Http\Controllers\OrderController@cancel

Focus:
  cancel
```

Paste the `📦 AI PROMPT` block into any AI assistant alongside your question for minimal, high-signal context.

## Structure

```
dotfiles/
├── install.sh           # idempotent installer
├── larasearch/
│   ├── larasearch       # entry point (artisan detection)
│   └── dev              # core engine (all commands)
├── shared/
│   ├── aliases.sh
│   ├── env.sh
│   └── functions.sh
├── zsh/
│   └── .zshrc
├── claude/config/
├── codex/config/
└── gemini/config/
```

## Requirements

- macOS / zsh
- PHP (for `php artisan route:list`)
- bash, grep, awk, sed, find (all standard)
