# Path to your oh-my-zsh configuration.
 ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
 ZSH_THEME="robbyrussell"

# Example aliases
 alias zshconfig="vim ~/.zshrc"
 #alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
 plugins=(git history github gitignore node npm sublime git-flow pip zsh-syntax-highlighting wd grunt vi-mode frontend-search meteor yarn yarn-autocompletions git-open)

 source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/cronco/.rvm/bin:/home/cronco/.yarn/bin
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH:/$HOME/.bin/nvim-osx64/bin:$HOME/apache-maven-3.6.0/bin:$PATH"

set -o vi
bindkey "^R" history-incremental-search-backward 

export TERM="xterm-256color"

 #Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-ocean.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL


autoload -U zmv
alias mmv="noglob zmv -W"
alias cb="git checkout"
alias gf="git fetch"
alias gp="git pull"
alias gs="git status"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
alias zi="say -v "
alias spune="say -r 100 -v "
#autoload -U promptinit; promptinit
#prompt pure
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#export PATH="/Users/cronco/miniconda3/bin:$PATH"

export CHROME_DRIVER_PATH="/Users/cronco/Developer/selenium/macos/chromedriver"

export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home"

alias git-wd="diff -w --word-diff --word-diff-regex=[^[:space:],]+"
