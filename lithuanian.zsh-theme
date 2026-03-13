right_triangle() {
   echo $'\u276f'
}

prompt_indicator() {
   echo $'%B\u276f%b'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

ok_username() {
   ARROW_FG="016"
   ARROW_BG="226"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="226"
   echo "$(arrow_start) %n $(arrow_end)"
}

err() {
  echo "%{$FG[160]✘%}"
}

err_username() {
   ARROW_FG="016"
   ARROW_BG="226"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="226"
   echo "$(err) $(arrow_start) %n $(arrow_end)"
}

# return err_username if there are errors, ok_username otherwise
username() {
   echo "%(?.$(ok_username).$(err_username))"
}

directory() {
   ARROW_FG="016"
   ARROW_BG="034"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="034"
   echo "$(arrow_start) %2~ $(arrow_end)"
}

current_time() {
   echo "%{$fg[white]%}%*%{$reset_color%}"
}

# set the git_prompt_info text - prefix/suffix contain the arrow styling
ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[016]%}%{$BG[196]%}%B "
ZSH_THEME_GIT_PROMPT_SUFFIX=" %b%{$reset_color%}%{$FG[196]%}❯%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

PROMPT='$(username)$(directory)$(git_prompt_info) '
RPROMPT='$(git_prompt_status) $(current_time)'
