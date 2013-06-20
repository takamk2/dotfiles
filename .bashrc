# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias kaihatsu='cd /var/www/html/'

export PATH=$PATH:~/bin
