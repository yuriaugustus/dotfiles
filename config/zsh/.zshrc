source $ZDOTDIR/lib/alias.zsh
source $ZDOTDIR/lib/keybinds.zsh
source $ZDOTDIR/lib/expansions.zsh
source $ZDOTDIR/lib/cursor.zsh
source $ZDOTDIR/lib/completions.zsh
source $ZDOTDIR/lib/options.zsh

# plugins
# get zsh_unplugged
if [[ ! -d $ZPLUGINDIR/zsh_unplugged ]]; then
  git clone --quiet https://github.com/mattmc3/zsh_unplugged $ZPLUGINDIR/zsh_unplugged
fi

source $ZPLUGINDIR/zsh_unplugged/zsh_unplugged.zsh

# plugins list, loaded in order of listing
repos=(
  romkatv/zsh-defer
  zsh-users/zsh-completions
  zdharma-continuum/fast-syntax-highlighting
  zsh-users/zsh-history-substring-search
  zsh-users/zsh-autosuggestions
)

# loading plugins
plugin-load $repos

# plugins update
function plugin-update {
  for d in $ZPLUGINDIR/*/.git(/); do
    echo "Updating ${d:h:t}..."
    command git -C "${d:h}" pull --ff --recurse-submodules --depth 1 --rebase --autostash
  done
}

fpath=($ZDOTDIR/lib/functions $fpath)
autoload -U $ZDOTDIR/lib/functions/*(:t)

declare -U path                             # prevent duplicate entries in path

# prints colors
palette() {
    local -a colors
    for i in {000..255}; do
        colors+=("%F{$i}$i%f")
    done
    print -cP $colors
}
palette2() {
  for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

if command -v dircolors > /dev/null 2>&1; then
  eval "$(dircolors "$XDG_CONFIG_HOME/dircolors/dir_colors")"
fi

if command -v thefuck >/dev/null 2>&1; then
  eval "$(thefuck --alias fuck)"
fi

if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source <(fzf --zsh)
