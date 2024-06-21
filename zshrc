# ~/.zshrc
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
SHELL=/bin/zsh
EDITOR=/usr/bin/nvim
unsetopt autocd
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/$USER/.zshrc'
#source /home/$USER/zsh-z/zsh-z.plugin.zsh

autoload -Uz compinit
compinit
# End of lines added by compinstall
setopt prompt_subst

# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo ' ('$branch')'
  fi
}

function shell_suffix_symbol()
{
  if [[ $USER == "root" ]];
  then
    echo '#'
  else
    echo '%%'
  fi
}

function shell_usercolor()
{
  if [[ $USER == "root" ]];
  then
    echo 'red'
  else
    echo 'blue'
  fi
}

# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='%B[%{%F{$(shell_usercolor)}%}%n%{%f%}@%{%F{green}%}%m%f %F{cyan}%}%?%f%} %{%F{yellow}%}%~%f$(git_branch_name)]$(shell_suffix_symbol)% %b '

#alias fclone="python /opt/forgejo.py"
alias vim="nvim"
alias vi="nvim"
alias history="history 1"
alias ls='ls --color=auto'
alias ll='ls -lAh --color=auto'
alias lt='ls -lAhtr --color=auto'

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
bindkey '\e.' insert-last-word
zstyle ':completion:*' menu select
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey '5~' kill-word
bindkey '^[^?' backward-kill-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
export LANG=en_US.utf8
export XDG_DATA_DIRS=/var/lib/flatpak/exports/share:/home/$USER/.local/share/flatpak/exports/share
#export GTK_IM_MODULE=fcitx
setopt interactivecomments
