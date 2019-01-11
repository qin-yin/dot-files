set nocompatible
filetype off

set rtp+=./vim/bundle/Vundle.vim

call vundle#begin('~/.vim/bundle/Vundle.vim')

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.
set number          " Displays line numbers
set showcmd         " Displays current command

" set the <leader> key to ,
let mapleader = "," 

" press ctrl+N twice to toggle line numbers
:nmap <C-N><C-N> :set invnumber<CR>

" highlight things we find with search
set incsearch
set hlsearch
map <Leader><space> :noh<CR>


" file explorer to F2
map <F2> :Explore<CR>

" enables Solarized-vim
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" paren highlights
set showmatch
