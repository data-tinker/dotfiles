#!/usr/bin/env bash
cat << EOF >> ~/.bashrc

if [ -n "\$SSH_CONNECTION" ] && [ -z "\$SCREEN_EXIST" ]; then
    export SCREEN_EXIST=1
    screen -DRi
fi
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
EOF

cat << EOF > ~/.ssh/rc
if test "\$SSH_AUTH_SOCK" ; then
    ln -sf \$SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi
EOF

rm "$(cd $(dirname $0); pwd -P)/$(basename $0)" 2>/dev/null
