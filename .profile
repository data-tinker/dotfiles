export HISTSIZE=10000
export HISTCONTROL=ignoreboth
export EDITOR=vim
export SHELL_CONNECTION=true

customSsh() {
    ssh -o SendEnv=SHELL_CONNECTION -t $1 screen -DRi
}
alias s=customSsh
alias auth="kinit && mwinit"
alias bb="brazil-build"
alias build="brazil-recursive-cmd --allPackages brazil-build"
alias b="brazil"

#color control
export PS1="\[\033[37m\]\u@\[\033[32m\]local\[\033[m\]:\[\033[31m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='31'
export LSCOLORS=ExExExExDxegedabagacad

export PATH=/usr/bin:$PATH
export PATH=/usr/local/bin:$PATH
#export PATH=$HOME/bin:$PATH
export PATH=$HOME/.toolbox/bin:$PATH
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.5.jdk/Contents/Home
