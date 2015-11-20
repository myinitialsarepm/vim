"make current file in pane 2 of current tmux session on F9
nnoremap <F9> :echo system("tmux send-keys -t 2 'make ".expand("%:t:r")."' C-m")<CR>
"run resulting program on F10
nnoremap <F10> :echo system("tmux send-keys -t 2 '".expand("%:p:r")."' C-m")<CR>
"clear pane 2
nnoremap <F8> :echo system("tmux send-keys -t 2 'clear' C-m")<CR>
