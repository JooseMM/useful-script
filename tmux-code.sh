#!/bin/zsh

#!/bin/bash

SESSION="Happy Hacking!"
front="Front"
back="Back"
server="Server"
goToCodeDir="cd ~/code"

# Create the session in detached mode
tmux new-session -d -s "$SESSION" -n "$back"
# CD into ~/code
tmux send-keys -t "$SESSION:$back" "$goToCodeDir" C-m
# Start directory selection to Neovim
tmux send-keys -t "$SESSION:$back" "vim" C-m

# Create a second window and run a command
tmux new-window -t "$SESSION" -n "$front"
# CD into ~/code
tmux send-keys -t "$SESSION:$front" "$goToCodeDir" C-m
# Start directory selection to Neovim
tmux send-keys -t "$SESSION:$front" "vim" C-m

# Create a third window
tmux new-window -t "$SESSION" -n "$server"
# CD into ~/code
tmux send-keys -t "$SESSION:$server" "$goToCodeDir" C-m
# Clear the console
tmux send-keys -t "$SESSION:$server" "clear" C-m
# go to first window
tmux select-window -t "$SESSION:$back"

# Attach to the session
tmux attach -t "$SESSION"

