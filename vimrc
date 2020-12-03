set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/vim-colors-solarized
set rtp+=~/.fzf

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
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

" highlight things we find with search
set incsearch
set hlsearch
set ignorecase
set smartcase
map <Leader><space> :noh<CR>

" no backup files
set nobackup
set noswapfile

" <F2> to bring up file explorer with current file highlighted.
map <F2> :let g:f2_filename=expand("%:t")<CR>:e %:h<CR>10j:call search('^\V' . g:f2_filename, 'c')<CR>

" paren highlights
set showmatch

" bash-like tab autocomplete
set wildmode=longest,list 

" keep all buffers
set hidden

" persistent undo
let &undodir=$HOME . "/.vim_undo"

if !isdirectory(&undodir)
    :call mkdir(&undodir)
endif

set undolevels=1000
set undoreload=10000

""""" Ack """""
if executable('rg')
    let g:ackprg = 'rg --vimgrep'
endif

""""" Solarized-vim """""
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

""""" Rust """""
let g:rustfmt_autosave = 1
let g:ycm_language_server =
\ [
\   {
\     'name': 'rust',
\     'cmdline': ['rust-analyzer'],
\     'filetypes': ['rust'],
\     'project_root_files': ['Cargo.toml']
\   }
\ ]
