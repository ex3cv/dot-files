set nocompatible
syntax on
set encoding=utf-8
" Word wrap without line breaks
set wrap
set linebreak

set backspace=indent,eol,start

" Highlight all search pattern matches and other stuff
set hlsearch
set incsearch
set ignorecase
set smartcase

filetype indent plugin on

set modeline

" Stuff to workaround problem with background in tmux
" Fixing Vim's Background Color Erase for 256-color tmux
"set t_ut=
"set term=xterm-256color
set term=screen-256color

colorscheme badwolf
set background=dark

" Want line numbers
set nu
" Want cursorline
set cursorline
" Override default settings on tabexpand
autocmd FileType python setlocal tabstop=4 noexpandtab
set noexpandtab
set tabstop=4

" Want line numbers
set nu
" Changing default colors
hi LineNr	cterm=None ctermfg=DarkCyan ctermbg=None
" Want cursorline
set cursorline

" Backup and tmp directory modification
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
