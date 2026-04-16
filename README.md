# Larasearch

A high-performance semantic search tool for Laravel projects. It helps you quickly find routes, models, controllers, and views, and can even generate AI-ready context blocks.

## Features

- **Semantic Search:** Find code using various naming conventions (camelCase, snake_case, PascalCase) automatically.
- **Directory Scoped:** Targeted searches for Laravel modules (e.g., `larasearch model User`).
- **AI Context:** Generate a structured prompt block for a specific route/method using `larasearch ai <term>`.
- **High Performance:** Automatically utilizes `ripgrep` for lightning-fast file scanning if available.

## Installation

1. Clone this repository to your preferred location.
2. Run the install script (or manually link to your `~/.larasearch` directory):
   ```bash
   ./install.sh
   ```
3. Add `~/.larasearch` to your PATH.

## Dependencies

- **Bash 4+**
- **PHP** (for `artisan` commands)
- **ripgrep (`rg`)** (Optional but highly recommended for 10x faster searches). 
  - Install via Homebrew: `brew install ripgrep`

## Usage

### Core Commands
- `larasearch route <term>`: Search routes (fuzzy match).
- `larasearch where <term>`: Search usage across `app/`, `routes/`, and `resources/`.
- `larasearch view <term>`: Search specifically within blade views.
- `larasearch ai <term>`: Build AI context for a specific route.

### Module Searches
Quickly find definitions in specific directories:
`action`, `command`, `controller`, `event`, `job`, `listener`, `mail`, `middleware`, `model`, `notification`, `observer`, `policy`, `provider`, `request`, `resource`, `rule`, `service`, `cast`, `exception`, `channel`, `component`, `facade`, `factory`, `seeder`, `livewire`, `migration`, `repository`, `contract`, `helper`, `dto`, `filament`.

Example:
```bash
larasearch model Order
larasearch controller Payment
```

## Recent Updates

- **Ripgrep Support:** Integrated `rg` for near-instant project scanning.
- **Bash Loop Optimization:** Refactored internal pipelines to remove slow Bash loops in the AI context generator.
- **Bug Fixes:** 
    - Fixed "unbound variable" error when running commands without search terms.
    - Improved regex compatibility between standard `grep` and `ripgrep`.
    - Better handling of Laravel project root detection.
