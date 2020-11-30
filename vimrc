set encoding=utf-8

" ##########################
" The ':syntax enable' command will keep your current color settings.
" enable syntax processing
syntax enable


" ##########################
" leader is comma
let mapleader=","


" ##########################
" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on


" ##########################
" vim-plug
" https://github.com/junegunn/vim-plug
" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Nerd-tree
" https://github.com/preservim/nerdtree
Plug 'preservim/nerdtree'
" map <C-n> :NERDTreeToggle<CR>
" 'i' to open the file using a horizontal split
" 's' for a vertical split
" 'm' to see the menu

" gitgutter
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'
" nmap ]c <Plug>GitGutterNextHunk
" nmap [c <Plug>GitGutterPrevHunk
" nmap <Leader>hs <Plug>GitGutterStageHunk
" nmap <Leader>hu <Plug>GitGutterUndoHunk

" Vim Airline
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" fzf
" Fzf is a fast and portable fuzzy finder application written in Go
" Requires:
" - https://github.com/ggreer/the_silver_searcher
" - https://github.com/BurntSushi/ripgrep
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" ctrl-x    split
" ctrl-v    vsplit

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" commands:
" :PlugInstall  to install the plugins
" :PlugUpdate   to update the plugins
" :PlugDiff     command you can review the changes from the last :PlugUpdate
" :PlugClean    it will detect and remove undeclared plugins


" ##########################
" Plugin setting

" NERDTree toggle
nnoremap <C-n> :NERDTreeToggle<CR>

" FZF find files
nnoremap <C-f> :Files<CR>

" Ag search inside files
nnoremap <C-c> :Ag<CR>

" Airline theme:
" https://github.com/vim-airline/vim-airline/wiki/Screenshots
let g:airline_theme='simple'

" gitgutter
" sign column colour to terminal default
highlight! link SignColumn LineNr


" ##########################
" Whitespaces
set tabstop=4                               " number of visual spaces per TAB
set softtabstop=4                           " number of spaces in tab when editing
set shiftround                              " when shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set expandtab                               " tabs are spaces
set wrap                                    " enable line wrapping
set linebreak                               " avoid wrapping a line in the middle of a word
set list listchars=tab:»·,trail:·,nbsp:·    " display extra whitespace


" ##########################
" Visual vim
set number                                  " show line numbers
set numberwidth=4
set cursorline                              " highlight current line
set wildmenu                                " visual autocomplete for command menu
set showcmd                                 " show command in bottom bar


" ##########################
" Speed-ups
set lazyredraw                              " redraw only when we need to do
set ttyfast                                 " indicates fast terminal connection


" ##########################
" Highlighting
set showmatch                               " highlight matching [{()}]


" ##########################
" Search
set incsearch                               " search as characters are entered


" ##########################
" Open new split panes to right and bottom
set splitbelow
set splitright


" ##########################
" Remapping

" Mapping jk to ESC
:imap jk <Esc>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" move vertically by visual line (if lines are longer than one visual line)
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Paste mode without any auto-indentation
set pastetoggle=<F2>
