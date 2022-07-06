#list
alias la='ls -larth'
alias treel='tree -L 2'

#repositories
alias fe='cd ~/repositories/frontend'

#development
alias sshmyserver='sshpass -p $(pass server/ssh) ssh myuser@myserver.com'
alias nr='npm run'

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
