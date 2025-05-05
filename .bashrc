[[ $- != *i* ]] && return

alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias clear="clear && fastfetch"
alias py="python3"
alias update="yay && pacman -Rns $(pacman -Qdtq)"

PS1='[\u@\h \W]\$ '
export XCURSOR_SIZE=30
eval "$(starship init bash)"
fastfetch --color white
