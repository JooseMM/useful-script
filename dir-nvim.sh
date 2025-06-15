#!/bin/zsh

dir=$(find . -type d | fzf)

if [[ -n "${dir}" ]]; then
cd $dir; nvim .
fi
