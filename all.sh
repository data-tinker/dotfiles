#!/usr/bin/env bash


# download vim config
rm ~/vim.zip*
wget -O ~/vim.tar.gz r.mytty.ru/vim.tar.gz
tar -xzvf ~/vim.tar.gz --directory ~
rm ~/vim.tar.gz 2>/dev/null;


# download screen config
cat << EOF >> ~/.bashrc

if [ -n "$SSH_CONNECTION" ] && [ -n "$SHELL_CONNECTION" ] && [ -z "$SCREEN_EXIST" ]; then
    export SCREEN_EXIST=1
    screen -DRi
fi

export HISTSIZE=10000
export HISTFILE=/home/$USER/.bh
export HISTCONTROL=ignoreboth
export EDITOR=vim
export PAGER='less -S'
listAll() {
    if [ $# -eq 0 ]
        then
            find .* -type f | grep -v node_modules | grep -v '.un~' | grep -E '[^/]*$'
        else
            find $1* -type f | grep -v node_modules | grep -v '.un~' | grep -E '[^/]*$'
    fi
}
alias l=listAll
alias iperl="perl -de1"
alias likemore-kill="sudo netstat -tulpn | grep 8000 | awk {'print \$7'} | grep -Eo '[0-9]+' | xargs kill"

#color control
export PS1="\[\033[37m\]\u@\[\033[33m\]dev\[\033[m\]:\[\033[31m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='31'
export LS_COLORS='rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;2'

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export PERLBREW_ROOT="$HOME/perl5/perlbrew"
source "$HOME/perl5/perlbrew/etc/bashrc"

export PERL5LIB=/home/a.martishin/projects/admin/app/lib:/home/a.martishin/projects/admin/app/t/lib:/home/a.martishin/projects/admin/app/utils/lib:$PERL5LIB
EOF

cat << EOF > ~/.screenrc
term xterm-256color
autodetach on
hardstatus on
termcapinfo xterm* ti@:te@
termcapinfo xterm* 'hs:ts=\E]2;:fs=07:ds=\E]2;screen07
vbell off
hardstatus alwayslastline
hardstatus alwayslastline "%{b kw}%H %{r}%1\` %{w}| %{-b}%c %{w}| %{-b}%d.%m.%Y %{w}| %{-b kw}%u %-Lw%{= rW}%50> %n%f %t %{-}%+Lw%<"
startup_message off
setenv SSH_AUTH_SOCK \$HOME/.ssh/ssh_auth_sock
bindkey ^[^[OD prev
bindkey ^[^[OC next
EOF

cat << EOF > ~/.ssh/rc
if test "\$SSH_AUTH_SOCK" ; then
    ln -sf \$SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi
EOF

# remove script
# rm "$(cd $(dirname $0); pwd -P)/$(basename $0)"

echo "success"
