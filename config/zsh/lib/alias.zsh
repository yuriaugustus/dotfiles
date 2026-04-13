alias sudo='sudo '

alias ls='ls --color=auto'

# grep to ripgrep
if (( $+commands[rg] )); then
    alias grep="rg"
    alias -g ':G'="| rg"
elif (( $+commands[ripgrep] )); then
    alias grep="ripgrep"
    alias -g ':G'="| ripgrep"
else
    alias -g ':G'="| grep"
fi

# clipboard terminal
if [[ "$detected_os" == "Darwin" ]]; then
    alias copy='pbcopy'
    alias paste='pbpaste'
else
    if (( $+commands[xsel] )); then
        alias copy='xsel --clipboard --input'
        alias paste='xsel --clipboard --output'
    elif (( $+commands[xclip] )); then
        alias copy='xclip -selection clipboard'
        alias paste='xclip -selection clipboard -o'
    fi
fi

# colors in less (default PAGER in Arch)
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# directories
alias dotfiles='cd $HOME/workspace/dotfiles/'
alias work='cd $HOME/workspace/'
alias docs='cd $HOME/Documents/'
alias down='cd $HOME/Downloads/'
alias notes='cd $HOME/workspace/ObsidianNotes'

if [ $(command -v bat) ]; then alias cat='bat -p'; fi

# fedora package manager
alias updatefedora='sudo dnf update && flatpak update'
alias logout='gnome-session-quit' 
alias reboot='systemctl reboot -i'

# git commands
alias gacp='git add . && git commit -m "sync" && git push'

# If eza installed, then use exa for some ls commands
if [ $(command -v eza) ]; then
    alias l='eza -aF --icons' # Quick ls
    alias la='eza -aF --icons' # List all
    alias ll='eza -laF --icons' # Show details
    alias lm='eza -lahr --color-scale --icons -s=modified' # Recent
    alias lb='eza -lahr --color-scale --icons -s=size' # Largest / size
    alias tree='f() { eza -aF --tree -L=${1:-2} --icons };f'
else
    alias l='ls -l'
    alias l.='ls -d .*'
    alias la='ls -A' # List all files/ includes hidden
    alias ll='ls -lAFh' # List all files, with full details
    alias lb='ls -lhSA' # List all files sorted by biggest
    alias lm='ls -tA -1' # List files sorted by last modified
fi

# navigation
alias ..='cd ..;pwd'
alias ...='cd ../..;pwd'
alias ....='cd ../../..;pwd'
alias .....='cd ../../../..;pwd'

# directory stack
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index} > /dev/null"; unset index

# time gain
alias c='clear'

# config to don't fuck up all
alias cpi='cp -iv'
alias mvi='mv -iv'
alias rmi='rm -iv'

alias ping5='ping -c 5'

# get top process eating memory
alias psmem='ps -e -orss=,args= | sort -b -k1 -nr'
alias psmem10='ps -e -orss=,args= | sort -b -k1 -nr | head -n 10'

# get top process eating cpu if not work try execute : export LC_ALL='C'
alias pscpu='ps -e -o pcpu,cpu,nice,state,cputime,args | sort -k1,1n -nr'
alias pscpu10='ps -e -o pcpu,cpu,nice,state,cputime,args | sort -k1,1n -nr | head -n 10'

# top10 of the history
alias hist10='print -l ${(o)history%% *} | uniq -c | sort -nr | head -n 10'

# suffix
alias -s {md,markdown,txt}="$EDITOR"
alias -s py='python'

alias nvimd='nvim --noplugin -u NONE' # lancar sem plugins e configuracoes

# Find 10 largest files
alias top10files="find . -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}"

# Find 10 largest directories
alias top10dirs="find . -type d -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}"

# find files in current directory
alias ff="find . -maxdepth 1 -type f"

# tmux
alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

alias update-grub='sudo grub2-mkconfig -o /boot/grub/grub.cfg' # update grub

alias myxip='curl ifconfig.me' # get external IP
alias myip="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'" # Show laptop's IP addresses

#alias restartsound='systemctl --user restart pipewire pipewire-pulse && systemctl --user daemon-reload'
alias reload='source $ZDOTDIR/.zshrc'
alias editzshrc='nvim $ZDOTDIR/.zshrc'
alias editalias='nvim $ZDOTDIR/lib/alias.zsh'
