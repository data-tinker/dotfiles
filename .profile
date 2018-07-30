export HISTSIZE=10000
export HISTCONTROL=ignoreboth
export EDITOR=vim
export SHELL_CONNECTION=true

alias s="ssh -o SendEnv=SHELL_CONNECTION"

#color control
export PS1="\[\033[37m\]\u@\[\033[32m\]local\[\033[m\]:\[\033[31m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='31'
export LSCOLORS=ExExExExDxegedabagacad

export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
#export PATH=$HOME/bin:$PATH

PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

export PATH="$HOME/.cargo/bin:$PATH"

# Setting PATH for Python 2.7
# The original version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# added by Anaconda2 5.1.0 installer
export PATH="/anaconda2/bin:$PATH"
