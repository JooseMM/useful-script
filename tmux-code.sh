#!/bin/bash

SESSION="Happy Hacking!"
code="Code"
server="Server"
other="Other"

# Create the session in detached mode
tmux new-session -d -s "$SESSION" -n "$code"
tmux send-keys -t "$SESSION:$code" "clear" C-m
tmux send-keys -t "$SESSION:$code" "nvim ." C-m

# Create a second window and run a command
tmux new-window -t "$SESSION" -n "$server"
tmux send-keys -t "$SESSION:$server" "clear" C-m

# Create a third window
tmux new-window -t "$SESSION" -n "$other"
tmux send-keys -t "$SESSION:$other" "clear" C-m

# go to first window
tmux select-window -t "$SESSION:$code"

# Attach to the session
tmux attach -t "$SESSION"
