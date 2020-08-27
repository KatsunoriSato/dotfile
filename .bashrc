[ -f ~/.fzf.bash ] && source ~/.fzf.bash

fvim(){
  files=$(git ls-files) &&
    selected_files=$(echo "$files" | fzf -m --preview 'head -100 {}') &&
    vim $selected_files
}
fga(){
  modified_files=$(git status --short | awk '{print $2}') &&
    selected_files=$(echo "$modified_files" | fzf -m --preview 'git diff {} &&
    git add $selected_files
}

