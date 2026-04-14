# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
skip_global_compinit=1

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="${HOME}/.local/bin"
export XDG_LIB_HOME="${HOME}/.local/lib"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZDATADIR="$XDG_DATA_HOME/zsh"
export ZCACHEDIR="$XDG_CACHE_HOME/zsh"
export ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}

export TMUX_PLUGIN_MANAGER_PATH="${XDG_DATA_HOME}/tmux/plugins"

export HISTFILE="$ZCACHEDIR/zhistory"     # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

export DOTFILES="$HOME/Workspace/dotfiles"

if builtin command -v nvim > /dev/null 2>&1; then
    export EDITOR="nvim"
    export VISUAL="nvim"
else
    export EDITOR="vim"
    export VISUAL="vim"
fi

# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"
export FZF_COMPLETION_DIR_COMMANDS="cd pushd rmdir tree ls"

export BAT_THEME="tokyonight_night"
export TERMINAL="pytxis"
export BROWSER="firefox"
export PAGER="less"

export STARSHIP_CONFIG="$XDG_CONFIG_HOME/starship/snes.toml"
