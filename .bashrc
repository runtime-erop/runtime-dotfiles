[[ $- != *i* ]] && return

alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias clear="clear && neofetch"
alias py="python3"
alias pacinstall="sudo pacman --color=always -S"
alias pacremove="sudo pacman --color=always -R"
alias pacsearch="pacman --color=always -Qs"

alias upd='\
sudo -v && \
echo -e "\n\033[1;32m==> Starting full system update...\033[0m" && \
echo -e "\n\033[1;34m[1/6] Updating pacman databases...\033[0m" && \
sudo pacman -Syy && \
\
echo -e "\n\033[1;34m[2/6] Updating system packages with yay...\033[0m" && \
yay -Syu --devel --timeupdate --noconfirm && \
\
echo -e "\n\033[1;34m[3/6] Updating flatpak packages...\033[0m" && \
flatpak update -y && \
\
echo -e "\n\033[1;34m[4/6] Cleaning package cache...\033[0m" && \
yay -Sc --noconfirm && \
\
echo -e "\n\033[1;34m[5/6] Checking for broken packages...\033[0m" && \
sudo pacman -Dk && \
\
echo -e "\n\033[1;34m[6/6] Rebuilding missing or corrupted files...\033[0m" && \
sudo pacman -Qqn | sudo pacman -Dq --asdeps && \
sudo pacman -Qq | sudo pacman -Dq --asexplicit && \
\ 
echo -e "\n\033[1;32m==> Full update completed!\033[0m" && \
echo -e "\033[1;33mNote: If you use AUR helpers other than yay, run them separately.\033[0m"'

alias dotcommit='cd ~/runtime-dotfiles && \
cp -r \
~/.config/nvim \
~/.config/Thunar \
~/.config/neofetch \
~/.config/hypr \
~/.config/kitty \
~/.config/networkmanager-dmenu \
~/.config/rofi \
~/.config/waybar \
~/.bashrc \
. && \
git add . && \
git commit -m "update dotfiles" && \
git pull --rebase && \
git push && \
cd ~ && rm -rf ~/runtime-dotfiles'


PS1='[\u@\h \W]\$ '
export XCURSOR_SIZE=30
eval "$(starship init bash)"
neofetch
