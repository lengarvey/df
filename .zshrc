# exports
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

precmd_functions=(zvm_init "${(@)precmd_functions:#zvm_init}")
precmd_functions+=(set-long-prompt)
zvm_after_init_commands+=("zle -N zle-line-finish; zle-line-finish() { set-short-prompt }")

set-long-prompt() {
    PROMPT=$(starship prompt)
    RPROMPT=""
}

export COLUMNS=$(($COLUMNS + ($COLUMNS*0.1)))
set-short-prompt() {
    # setting this doesn't seem to actually work
    PROMPT="$(STARSHIP_KEYMAP=${KEYMAP:-viins} starship module character)"
    RPROMPT=$'%{\e[999C%}\e[8D%F{8}%*%f ' # remove if you don't want right prompt
    zle .reset-prompt 2>/dev/null # hide the errors on ctrl+c
}

zle-keymap-select() {
    set-short-prompt
}
zle -N zle-keymap-select

zle-line-finish() { set-short-prompt }
zle -N zle-line-finish

trap 'set-short-prompt; return 130' INT

# try to fix vi mode indication (not working 100%)
zvm_after_init_commands+=('
  function zle-keymap-select() {
    if [[ ${KEYMAP} == vicmd ]] ||
       [[ $1 = "block" ]]; then
      echo -ne "\e[1 q"
      STARSHIP_KEYMAP=vicmd
    elif [[ ${KEYMAP} == main ]] ||
         [[ ${KEYMAP} == viins ]] ||
         [[ ${KEYMAP} = "" ]] ||
         [[ $1 = "beam" ]]; then
      echo -ne "\e[5 q"
      STARSHIP_KEYMAP=viins
    fi
    zle reset-prompt
  }
  zle -N zle-keymap-select

  # Ensure vi mode is set
  zle-line-init() {
    zle -K viins
    echo -ne "\e[5 q"
  }
  zle -N zle-line-init
')

autoload -Uz compinit
compinit

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
  # specify plugins here

  zgen load 'lengarvey/git'
  zgen save
fi

    echo "trying to loading myrc"
if [[ -f "$HOME/.myrc" ]]; then
    echo "loading myrc"
    # computer specific config
    source ~/.myrc
fi

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

alias ls="eza --oneline --color=always --no-filesize --icons=always --group-directories-first"
alias cd="z"
alias vim="nvim"

eval "$(zoxide init zsh)"
source <(fzf --zsh)

alias cat="bat"
eval $(thefuck --alias)

eval "$(mise activate zsh)"
