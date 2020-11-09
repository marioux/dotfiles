# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source profile
if [ -f ~/.profile ]; then
    . ~/.profile
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Forward backward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## P10K theme
[[ ! -f ~/.config/powerlevel10k/powerlevel10k.zsh-theme ]] || source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# Syntax highlighting
[[ ! -f ~/$HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source $HOME/.config/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Nim
if [[ ! "$PATH" == */opt/nim-1.2.6/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/nim-1.2.6/bin"
fi
if [[ ! "$PATH" == *$HOME/.nimble/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.nimble/bin"
fi

# Node
if [[ ! "$PATH" == */opt/node-v12/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/node-v12/bin"
fi

# Nvim
if [[ ! "$PATH" == */opt/nvim-linux64/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/nvim-linux64/bin"
  alias vim=nvim
fi

# ccls
if [[ ! "$PATH" == */opt/ccls/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/opt/ccls/bin"
fi

# Clang
if [[ ! "$PATH" == */usr/lib/llvm-10/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/lib/llvm-10/bin"
fi

export PATH=$PATH:/usr/local/go/bin:$HOME/.go/bin
export GOPATH=$HOME/.go

# FZF Plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Pyenv
export PATH="/home/stormvermin/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#Configure RIPGREP
export BAT_THEME="gruvbox-light"
if type rg &> /dev/null; then
  #export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_COMMAND='rg --files --ignore-case --hidden -g "!{.git,node_modules,vendor}/*"'
  #export FZF_DEFAULT_OPTS='-m --height 50% --border'
  export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

fi

# Colorize man pages
#export PAGER=most

export DOT_DEST=.dotman
export DOT_REPO=git@github.com:marioux/dotfiles.git

