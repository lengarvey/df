# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# exports
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

eval "$(/opt/homebrew/bin/brew shellenv)"

source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

autoload -Uz compinit
compinit

# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  # zgen oh-my-zsh

  zgen load 'lengarvey/git'
  # zgen load 'lengarvey/chruby-direnv'
  zgen load romkatv/powerlevel10k powerlevel10k

  # zgen oh-my-zsh themes/apple
  # generate the init script from plugins above
  zgen save
fi



# Ruby
#source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
#chruby ruby-3.0.1

# Python
# if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi

# JS
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# moar config
source ~/.myrc
# . "$HOME/.rea-cli/rea-shell-init.sh"

# bun completions
[ -s "/Users/leonard.garvey/.bun/_bun" ] && source "/Users/leonard.garvey/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_verify

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward


source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="eza --oneline --color=always --no-filesize --icons=always --group-directories-first"
alias cd="z"

eval "$(zoxide init zsh)"
source <(fzf --zsh)

alias cat="bat"
. "$HOME/.rea-cli/rea-shell-init.sh"
eval $(thefuck --alias)
