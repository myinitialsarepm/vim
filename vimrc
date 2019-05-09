set noswapfile
set nobackup
set nocompatible
set backspace=indent,eol,start
filetype plugin indent on
set nu
"set tabs to less extreme
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

"default encryption method
set cm=blowfish2

"md is markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Set folders for tags
set tags+=~/.vim/tags/cpp

"Config for powerline
set laststatus=2
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
"don't show insert etc in default bar
set noshowmode


"***keymappings***
nnoremap <F5> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
nnoremap <silent> <F6> :TagbarToggle<CR>
"Dash
nnoremap <leader>d :Dash<CR>
nnoremap <leader>D :Dash 
"reload vimrc file
nnoremap <leader>v :source ~/.vim/vimrc<CR>
"enable spellcheck
nnoremap <silent> <leader>s :set spell! spelllang=en_gb<CR>
"toggle relative numbering with <F2>
nnoremap <silent> <leader>r :setlocal rnu!<CR>
nnoremap <silent> <leader>n :setlocal nu!<CR>
"toggle paste mode with <F3>
set pastetoggle=<F3>
"disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"move by screen line rather than file lines
nnoremap j gj
nnoremap k gk

"open split tmux style
set splitbelow
set splitright
"move around splits more easily
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

function! s:MyFollowSymlink()
	silent! let s:fname = resolve(expand('%:p'))
        silent! bwipeout
	silent! exec "edit " .s:fname
endfunction
command! FollowSymlink call s:MyFollowSymlink()

"augroup followsymlink
"	autocmd!
"	autocmd BufReadPost * FollowSymlink
"augroup END
execute pathogen#infect()
let g:slime_target = "tmux"

"matchit
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
	runtime! macros/matchit.vim
endif

"Delete comment character when joining lines
if v:version > 703 || v:version == 703 && has("patch541")
	set formatoptions+=j
endif

"Solarized
syntax enable
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
