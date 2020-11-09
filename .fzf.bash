# Setup fzf
# ---------
if [[ ! "$PATH" == */home/stormvermin/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/stormvermin/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/stormvermin/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/stormvermin/.fzf/shell/key-bindings.bash"
