# functions.sh — shared shell functions

# Create dir and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Quick Laravel log tail
artlog() {
  tail -f storage/logs/laravel.log
}

# Find artisan root from any subdir
laravel_root() {
  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    [[ -f "$dir/artisan" ]] && echo "$dir" && return
    dir="$(dirname "$dir")"
  done
  echo "Not in a Laravel project" >&2
  return 1
}
