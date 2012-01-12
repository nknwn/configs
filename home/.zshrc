export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
autoload -U colors && colors
autoload -U compinit 
compinit

setopt completealiases
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt CORRECT
setopt AUTO_LIST
setopt ALWAYS_TO_END
setopt listtypes
#####
zstyle ':completion:*' menu select
# Complete manpages by section
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections true

# Customize to your needs...
#bindkey -v
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[4~" end-of-line # End
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
# for rxvt
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
export EDITOR="vim"
export BROWSER="w3m"
alias -s html=$BROWSER
alias -s org=$BROWSER
alias -s php=$BROWSER
alias -s com=$BROWSER
alias -s net=$BROWSER
alias -s png=fbi
alias -s jpg=fbi
alias -s gif=fbi
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s java=$EDITOR
alias -s txt=$EDITOR
alias -s PKGBUILD=$EDITOR
alias -s pdf=fbpdf
alias ls='ls --color=auto -F'
alias f='find |grep'
alias mem="free -m"
alias con="pin ; con3"
alias pin="sudo wvdial pin"
alias con2='nmcli con up id "rds"'
alias con3="sudo wvdial rds &"
alias rss="canto -u"
alias music="mpd && ncmpcpp"
###########
#recolor-cmd() {
#        region_highlight=()
#        colorize=true
#        start_pos=0
#        for arg in ${(z)BUFFER}; do
#            ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
#            ((end_pos=$start_pos+${#arg}))
#            if $colorize; then
#                colorize=false
#                res=$(LC_ALL=C builtin type $arg 2>/dev/null)
#                case $res in
#                    *'reserved word'*)   style="fg=magenta,bold";;
#                    *'alias for'*)       style="fg=cyan,bold";;
#                    *'shell builtin'*)   style="fg=yellow,bold";;
#                    *'shell function'*)  style='fg=green,bold';;
#                    *"$arg is"*)
#                        [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
#                    *)                   style='none,bold';;
#                esac
#                region_highlight+=("$start_pos $end_pos $style")
#            fi
#            if [[ $arg = '|' ]] || [[ $arg = 'sudo' ]]; then
#                  colorize=true
#            fi
#            start_pos=$end_pos
#        done
#    }
#
#    check-cmd-self-insert() { zle .self-insert && recolor-cmd }
#    check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }
#
#    zle -N self-insert check-cmd-self-insert
#    zle -N backward-delete-char check-cmd-backward-delete-char
############
color_cmd() {
  res=$(builtin type $1 2>/dev/null)
  [ -z $res ] && return
  case $res in
    *'reserved word'*)  color='magenta' ;;
    *'an alias'*)       color='cyan'    ;;
    *'shell builtin'*)  color='yellow'  ;;
    *'shell function'*) color='green'   ;;
    *"$cms is"*)        color='blue'    ;;
    *)                  color='red'
  esac
  case $cmd in
    'sudo')   state=1 ;;
    'start')  state=1 ;;
    'time')   state=1 ;;
    'strace') state=1 ;;
    *)        state=2
  esac
}

color_arg() {
  case $1 in
    '--'*) color='magenta' ;;
    '-'*)  color='cyan'    ;;
    *)     color='red'
  esac
}

color_string() {
  case $1 in
    '"'*) color='yellow' ;;
    "'"*) color='yellow' ;;
    *)       color=''
  esac
}

recolor-cmd() {
  args=(${(z)BUFFER})
  offset=0
  state=1
  region_highlight=()
  for cmd in $args; do
    if [ $state -eq 1 ]; then
      color_cmd $cmd
    elif [ $state -eq 2 ]; then
      color_arg $cmd
      if [[ "$color" =~ 'red' ]]; then
        color_string $cmd
      fi
    fi
    if [ -n "$color" ]; then
      region_highlight=($region_highlight "$offset $((${#cmd}+offset))
fg=${color},bold")
    fi
    offset=$((offset+${#cmd}+1))
    case $cmd in
      *'|')  state=1 ;;
      *'&')  state=1 ;;
      *';')  state=1 ;;
    esac
  done
}

check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }
#check-cmd-expand-or-complete() { zle .expand-or-complete } # && recolor-cmd }

zle -N self-insert check-cmd-self-insert
#zle -N expand-or-complete check-cmd-expand-or-complete
zle -N backward-delete-char check-cmd-backward-delete-char
###########
when
PROMPT="%{$fg[red]%}┌[%{$reset_color%}%{$fg_bold[green]%}%n%{$reset_color%}%{$fg[red]%}@%{$reset_color%}%{$fg_bold[green]%}%m%{$reset_color%}%{$fg[red]%}]
%{$fg[red]%}└[%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[red]%}]>%{$reset_color%} "
PS2=" %{$fg[red]%}|>%{$reset_color%} "
