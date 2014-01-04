
export LANG=ja_JP.UTF-8

# Zsh ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

########################################
# Zsh 補完

# zsh-completions
[ -d /usr/local/share/zsh-completions ] && fpath=(/usr/local/share/zsh-completions $fpath)

# 補完機能を有効にする
autoload -Uz compinit
compinit -u

########################################
# Zsh オプション

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'

# Set architecture flags
#export ARCHFLAGS="-arch x86_64"

# pkg-config pc file search paths
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig:/usr/X11/lib/pkgconfig

# alias commands for using tmuxx
#alias tmux='tmuxx'
#alias tm='tmuxx'
#alias tma='tmux attach'
#alias tml='tmux list-window'

# Ensure the user-installed binaries take precedence
#export PATH=$HOME/bin:$PATH
# Set Python script paths
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages

# pythonz settings
[[ -s $HOME/.pythonz/etc/bashrc ]] && source $HOME/.pythonz/etc/bashrc
#CPYTHON_VERSION=2.7.5
if [ -n "$CPYTHON_VERSION" -a -d $HOME/.pythonz/pythons/CPython-$CPYTHON_VERSION ]; then
    export PYTHONZ_CPYTHON=$HOME/.pythonz/pythons/CPython-$CPYTHON_VERSION
    export PYTHONZ_CPYTHON_EXECUTABLE=true
    export PYTHONZ_CPYTHON_VIRTUALENV=true
fi

# virtualenvwrapper settings
if [ -n "$PYTHONZ_CPYTHON_EXECUTABLE" -a "${PYTHONZ_CPYTHON_EXECUTABLE}" = true ]; then
    export PATH=$PYTHONZ_CPYTHON/bin:$PATH
    export LD_LIBRARY_PATH=$PYTHONZ_CPYTHON/opt/opencv:$LD_LIBRARY_PATH
    if [ -f $PYTHONZ_CPYTHON/bin/virtualenvwrapper.sh -a "${PYTHONZ_CPYTHON_VIRTUALENV}" = true ]; then
        export VIRTUALENVWRAPPER_PYTHON=$PYTHONZ_CPYTHON/bin/python
        export VIRTUALENVWRAPPER_VIRTUALENV=$PYTHONZ_CPYTHON/bin/virtualenv
        export WORKON_HOME=$HOME/.virtualenvs
        export PIP_RESPECT_VIRTUALENV=true
        source $PYTHONZ_CPYTHON/bin/virtualenvwrapper.sh
    fi
fi
if [ -z "${VIRTUALENVWRAPPER_PYTHON}" ]; then
    if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
        export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
        export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
        export WORKON_HOME=$HOME/.virtualenvs
        export VIRTUALENV_DISTRIBUTE=true
        export PIP_RESPECT_VIRTUALENV=true
        source /usr/local/bin/virtualenvwrapper.sh
    fi
fi

# Node.js settings
#export PATH=$PATH:/usr/local/share/npm/bin
#export NODE_PATH=/usr/local/lib/node_modules

# Settings for MacVim
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi
