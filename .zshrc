
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
export PATH=$PATH:/usr/local/sbin 

# nodebrew
export NODEBREW_ROOT=/usr/local/var/nodebrew

# pyenv
# eval "$(pyenv init -)"

# MacVimをデフォルトのエディタに指定しておく
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias mvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/mvim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# ctags alias
alias ctags="`brew --prefix`/bin/ctags"
alias readlink='greadlink'

# colorls alias
alias lc='colorls -r -1'

# up関数
function up(){ cpath=./; for i in `seq 1 1 $1`; do cpath=$cpath../; done; cd $cpath;}
setopt nonomatch

# 内臓キーボードを有効化するエアリアス
alias kextloadkeyboard='sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'
# 外付けキーボーの為に内臓キーボードを無効化するエアリアス
alias kextunloadkeyboard='sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="kafeitu"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_HIDE_GIT_PROMPT_STATUS="true"
POWERLINE_SHOW_GIT_ON_RIGHT="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# vim:ft=zsh ts=2 sw=2 sts=2
#
# agnoster's Theme - https://gist.github.com/3712874
# A Powerline-inspired theme for ZSH
#
# # README
#
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://gist.github.com/1595572).
#
# In addition, I recommend the
# [Solarized theme](https://github.com/altercation/solarized/) and, if you're
# using it on Mac OS X, [iTerm 2](http://www.iterm2.com/) over Terminal.app -
# it has significantly better color fidelity.
#
# # Goals
#
# The aim of this theme is to only show you *relevant* information. Like most
# prompts, it will only show git information when in a git working directory.
# However, it goes a step further: everything from the current user and
# hostname to whether the last call exited with an error to whether background
# jobs are running in this shell will all be displayed automatically when
# appropriate.

### Segment drawing
# A few utility functions to make it easy and re-usable to draw segmented prompts

#CURRENT_BG='NONE'
#SEGMENT_SEPARATOR='⮀'
#
## Begin a segment
## Takes two arguments, background and foreground. Both can be omitted,
## rendering default background/foreground.
#prompt_segment() {
#  local bg fg
#  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
#  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
#  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
#    echo -n " %{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%} "
#  else
#    echo -n "%{$bg%}%{$fg%} "
#  fi
#  CURRENT_BG=$1
#  [[ -n $3 ]] && echo -n $3
#}
#
## End the prompt, closing any open segments
#prompt_end() {
#  if [[ -n $CURRENT_BG ]]; then
#    echo -n " %{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
#  else
#    echo -n "%{%k%}"
#  fi
#  echo -n "%{%f%}"
#  CURRENT_BG=''
#}
#
#### Prompt components
## Each component will draw itself, and hide itself if no information needs to be shown
#
#### Prompt components
## Each component will draw itself, and hide itself if no information needs to be shown
#
## Context: user@hostname (who am I and where am I)
#prompt_context() {
#  local user=`whoami`
#   # prompt_segment black default "%(!.%{%F{yellow}%}.)fujioka@MacBook-Air"
#  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
#    prompt_segment 232 252 "%(!.%{%F{yellow}%}.)fujioka@MBA"
#  fi
#}
#
## Git: branch/detached head, dirty status
#prompt_git() {
#  local ref dirty
#  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
#    ZSH_THEME_GIT_PROMPT_DIRTY='±'
#    dirty=$(parse_git_dirty)
#    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git show-ref --head -s --abbrev |head -n1 2> /dev/null)"
#    if [[ -n $dirty ]]; then
#      prompt_segment 232 171
#    else
#      prompt_segment 232 252
#    fi
#    echo -n "${ref/refs\/heads\//⭠ }$dirty"
#  fi
#}
#
## Dir: current working directory
#prompt_dir() {
#  prompt_segment 232 252 '%~' 
#}
#
## Status:
## - was there an error
## - am I root
## - are there background jobs?
#prompt_status() {
#  local symbols
#  symbols=()
#  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
#  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
#  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{247}%}⚙"
#
#  [[ -n "$symbols" ]] && prompt_segment 158 default "$symbols"
#}
#
### Main prompt
#build_prompt() {
#  RETVAL=$?
##  prompt_status
##  prompt_context
##  prompt_dir
##  prompt_git
##  prompt_end
#}
#
#PROMPT='%{%f%b%k%}$(build_prompt) '
#
## git のブランチ名を zsh の右プロンプトに表示＋ status に応じて色をつける
## ${fg[...]} や $reset_color をロード
#autoload -U colors; colors
#
#function rprompt-git-current-branch {
#        local name st color
#
#        if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
#                return
#        fi
#        name=$(basename "`git symbolic-ref --short HEAD 2> /dev/null`")
#        if [[ -z $name ]]; then
#                return
#        fi
#        st=`git status 2> /dev/null`
#        if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#                color=${fg[green]}
#        elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
#                color=${fg[yellow]}
#        elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
#                color=${fg_bold[red]}
#        else
#                color=${fg[red]}
#        fi
#
#        # %{...%} は囲まれた文字列がエスケープシーケンスであることを明示する
#        # これをしないと右プロンプトの位置がずれる
#        echo "%{$color%}$name%{$reset_color%} "
#}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

#RPROMPT='[`rprompt-git-current-branch`%F{068}%D{%m/%d %T}]'
# 現在の時刻を右プロンプトとして表示
RPROMPT="%F{255}[%D{%m/%d %T}]"

#!/bin/sh
#
# 256色のカラーパレットを表示する
#  bash と zsh にて実行可能
#
#target_shell=$1
#
#if [ -z "$1" ]; then
#  target_shell=$(basename "$SHELL")
#fi
#
#if [ "$target_shell" = "bash" ]; then
#  bash <<< 'for code in {0..255}; do echo -n "[38;05;${code}m $(printf %03d $code)"; [ $((${code} % 16)) -eq 15 ] && echo; done'
#elif [ "$target_shell" = "zsh" ]; then
#  zsh  <<< 'for code in {000..255}; do print -nP -- "%F{$code}$code %f"; [ $((${code} % 16)) -eq 15 ] && echo; done'
#else
#  echo "error: Invalid argument ($target)"
#  echo "Usage: $0 [bash|zsh]"
#fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
 
# PERL_MB_OPT="--install_base \"/Users/fujioka/perl5\""; export PERL_MB_OPT;
# PERL_MM_OPT="INSTALL_BASE=/Users/fujioka/perl5"; export PERL_MM_OPT;

#=============================
# source zsh-syntax-highlighting
#=============================
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

#=============================
# source zsh-url-highlighter
#=============================
if [ -f ~/.zsh/zsh-url-highlighter/url/url-highlighter.zsh ]; then
  source ~/.zsh/zsh-url-highlighter/url/url-highlighter.zsh
fi
