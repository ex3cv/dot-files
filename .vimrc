set nocompatible
set encoding=utf-8
scriptencoding utf-8

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

Plugin 'flazz/vim-colorschemes'
Plugin 'shinchu/lightline-gruvbox.vim'

Plugin 'puppetlabs/puppet-syntax-vim'

"True Sublime Text style multiple selections for Vim
Plugin 'terryma/vim-multiple-cursors'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" needed by lightline plugin
set laststatus=2

" lightline and fugitive toghether
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'readonly': 'LightLineReadonly',
      \   'filename': 'LightLineFilename'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "⭤"
  else
    return ""
  endif
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

" end of lightline and fugitive toghether

syntax on
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

" pgdown and up behavior correction
set nostartofline
map <silent> <PageUp> 1000<C-U>
map <silent> <PageDown> 1000<C-D>
imap <silent> <PageUp> <C-O>1000<C-U>
imap <silent> <PageDown> <C-O>1000<C-D>

" Stuff to workaround problem with background in tmux
" Fixing Vim's Background Color Erase for 256-color tmux
set term=screen-256color

" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen-256color'
	map <Esc>OH <Home>
	map! <Esc>OH <Home>
	map <Esc>OF <End>
	map! <Esc>OF <End>
endif

colorscheme gruvbox
set background=dark

" Want line numbers
set nu
" Want cursorline
set cursorline
" Override default settings on tabexpand
autocmd FileType python setlocal tabstop=4
set expandtab
set tabstop=4
set autoindent
set copyindent
set shiftwidth=4
set shiftround

" Changing default colors
hi LineNr	cterm=None ctermfg=DarkCyan ctermbg=None
" Want cursorline
set cursorline

" Backup and tmp directory modification
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
