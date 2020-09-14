set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-colors-solarized

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'rust-lang/rust.vim'

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
set showcmd         " Displays current command

" set the <leader> key to ,
let mapleader = "," 

" hybrid line numbers
:set number relativenumber
:set nu rnu

" press ctrl+N twice to toggle line numbers
:nmap <C-N><C-N> :set invnumber<CR>

" spacebar to :
:nnoremap <Space> :

" enter in normal saves
:nnoremap <CR> :w<CR>

" allow cursor to go past last character
set ve+=onemore
:nnoremap $ $l

" use rg for ack
if executable('rg')
    let g:ackprg = 'rg --vimgrep'
endif

" highlight things we find with search
set incsearch
set hlsearch
set smartcase
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

" set rust format to run when saving buffer
let g:rustfmt_autosave = 1
