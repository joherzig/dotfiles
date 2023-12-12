#list
alias la='ls -la'
alias treel='tree -L 2'

#repositories
alias fe='cd ~/repositories/frontend'

#development
alias sshmyserver='sshpass -p $(pass server/ssh) ssh myuser@myserver.com'
alias nr='npm run'
alias dc="docker-compose"

#git
alias gp='git pull'

#misc
alias vf='nvim $(fzf)'
alias vim=nvim

function lazygit() {
   local message="$1"
   local push_branch="${2:-$(git rev-parse --abbrev-ref HEAD)}"
   echo "Commit Message: $message"
   echo "Push Branch: ${push_branch}"
   git add --all
   git commit -m "$message"
   git push origin "$push_branch"
}

function rename() {
  for file in *; do mv "$file" "$(echo "$file" | sed s/"$1"/"$2"/)"; done
  echo "Replaced "$1" with "$2" in all files"
}

#kubernetes
alias k=kubectl
complete -o default -F __start_kubectl k
