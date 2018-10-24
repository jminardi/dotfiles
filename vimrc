set nocompatible              " be iMproved, required
filetype off                  " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'klen/python-mode'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'JuliaLang/julia-vim'
Plugin 'tomlion/vim-solidity'
Bundle 'yssl/QFEnter'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///Users/jack/code/mine/dotfiles/enaml'
"Plugin 'file:///Users/jack/code/mine/dotfiles/gcode'

call vundle#end()            " required

let mapleader = ","

set number
set nocompatible
set smartindent
set autoindent
set hlsearch
set incsearch
set showmatch
set autochdir
set showcmd         " display incomplete commands
set ruler           " show the cursor position all the time
set cursorline
set nospell

syntax on
colorscheme desert 
set background=dark
set guifont=Menlo\ Regular:h12

filetype on            " enables filetype detection
filetype plugin on     " enables filetype specific plugins
filetype indent on

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set scrolloff=2 " keep three lines at the bottom or top

set colorcolumn=80,81,82
highlight ColorColumn ctermbg=darkgrey guibg=#313131

nmap ,. :tabnext<CR>
nmap ., :tabpre<CR>

" run current file in python
nmap rr :!/Users/jack/Library/Enthought/Canopy_64bit/User/bin/python %<CR>
" run the tests of the file
nmap rt :!/Users/jack/Library/Enthought/Canopy_64bit/User/bin/python tests/test_%:h<CR>

" pretty print json
com PrettyPrintJSON :%!python -c "import json, sys, collections; print json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), indent=2)"

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
        set undodir=~/.vim/undo
endif

"PYTHON-MODE OPTIONS
"Check code on every save (if file has been modified)
let g:pymode_lint_on_write = 1
" Enable python folding
let g:pymode_folding = 0
let g:pymode_lint_checkers = ['pyflakes']
" Run linter on the fly
let g:pymode_lint_on_fly = 0
" Minimal height of pylint error window
let g:pymode_lint_minheight = 1
" Load run code plugin
let g:pymode_run = 0
" Skip errors and warnings
" E.g. "E501,W002", "E2,W" (Skip all Warnings and Errors startswith E2) and etc
"let g:pymode_lint_ignore = "C01,C0303,R0921,R0201,F0401,W0511,R0914,E1002"
let g:pymode_rope_complete_on_dot = 0

" close omnicomplete description automatically
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"syntax highlighting
autocmd BufNewFile,BufRead,BufEnter *.enaml setfiletype enaml
autocmd BufNewFile,BufRead,BufEnter *.ngc setfiletype gcode

"no icon bar
set guioptions-=T
"only show filename and saved status in tab. See help 'statusline' for more.
set guitablabel=%t%M

let g:gitgutter_eager = 0 "only run on write

set wildignore+=*.pyc "ignore *.pyc files in ctrl-p

"save and load a vim session for the current git branch
function! GetCurrentBranch()
    return substitute(system("git rev-parse --abbrev-ref HEAD"), '\n', '', '')
endfunction
nnoremap <leader>s :execute 'mksession! ~/.vim/sessions/' . GetCurrentBranch() . '.vim'<CR>
nnoremap <leader>l :execute 'source ~/.vim/sessions/' . GetCurrentBranch() . '.vim'<CR>

"remap Caps to lowercase
command WQ wq
command Wq wq
command W w
command Q q

" Open quickfix files in new tab or split (QFEnter plugin)
let g:qfenter_vopen_map = ['<C-v>']
let g:qfenter_hopen_map = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_topen_map = ['<C-t>']

" Search the current git repo for the word under the cursor
map <leader>8 :Ggrep <cword><CR><CR>:copen<CR>
