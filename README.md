# Semantic Search Tools

A collection of high-performance semantic search tools for modern frameworks. These tools help you quickly find files, definitions, and context within your projects using various naming conventions automatically.

## Included Tools

- **Larasearch:** Optimized for Laravel projects.
- **Nestsearch:** Optimized for NestJS projects.
- **Nextsearch:** Optimized for Next.js projects.

## Common Features

- **Semantic Search:** Find code using various naming conventions (camelCase, snake_case, PascalCase) automatically.
- **Framework Aware:** Targeted searches based on each framework's directory structure and patterns.
- **High Performance:** Automatically utilizes `ripgrep` (`rg`) for lightning-fast file scanning if available.
- **Smart Root Detection:** Automatically finds the project root from any subdirectory.

---

## 🐘 Larasearch (Laravel)

### Core Commands
- `larasearch route <term>`: Search routes (fuzzy match).
- `larasearch where <term>`: Search usage across `app/`, `routes/`, and `resources/`.
- `larasearch view <term>`: Search specifically within blade views.
- `larasearch ai <term>`: Build AI context for a specific route.

### Module Searches
Quickly find definitions in specific directories:
`action`, `controller`, `model`, `service`, `request`, `resource`, `middleware`, `provider`, `job`, `event`, `listener`, `mail`, `notification`, etc.

---

## 🦁 Nestsearch (NestJS)

### Core Commands
- `nestsearch where <term>`: Search all `src/` files.
- `nestsearch controller <term>`: Search `@Controller` definitions.
- `nestsearch service <term>`: Search `@Injectable` definitions.
- `nestsearch module <term>`: Search `@Module` definitions.
- `nestsearch dto <term>`: Search DTOs (filename/class).
- `nestsearch entity <term>`: Search Entities (`@Entity`).

---

## ⚛️ Nextsearch (Next.js)

### Core Commands
- `nextsearch where <term>`: Search across `src/`, `app/`, `pages/`, and `components/`.
- `nextsearch page <term>`: Find pages (`page.tsx` or `pages/*.tsx`).
- `nextsearch api <term>`: Find API routes (`route.ts` or `pages/api/*.ts`).
- `nextsearch component <term>`: Find components (PascalCase filenames).

---

## Installation

1. Clone this repository.
2. Run the install script:
   ```bash
   ./install.sh
   ```
3. Restart your shell or run `exec zsh`.

## Dependencies

- **Bash 4+**
- **ripgrep (`rg`)** (Optional but highly recommended for 10x faster searches). 
  - Install via Homebrew: `brew install ripgrep`
- **PHP** (Required for Larasearch's `artisan` integrations)

## Recent Updates

- **Unified Toolset:** Added `nestsearch` and `nextsearch` to the collection.
- **Ripgrep Support:** Integrated `rg` for near-instant project scanning across all tools.
- **Optimized Pipelines:** Refactored internal pipelines for better performance and reliability.
- **Framework Root Detection:** Improved detection for Next.js and NestJS project roots.
