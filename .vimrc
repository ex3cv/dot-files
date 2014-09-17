"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
 " plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
 " Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

"call vundle#end() 

set nocompatible
syntax on
set encoding=utf-8
set wrap
set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set background=dark
set ic
filetype indent plugin on
set modeline
colorscheme solarized

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
