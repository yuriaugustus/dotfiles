# Setup fzf
# ---------
if [[ ! "$PATH" == */home/yuri/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/yuri/.fzf/bin"
fi

eval "$(fzf --bash)"
