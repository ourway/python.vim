set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)


set autochdir
set encoding=utf8
"set paste
set textwidth=0
set backspace=indent,start
set cindent
set incsearch
set ignorecase
set ruler
set wildmenu
set commentstring=\ #\ %s
set foldlevel=0
set clipboard+=unnamed
set nobackup
set nowritebackup
set noswapfile
set lines=40
set columns=80
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smarttab
"set nowrap
set gdefault
"set hlsearch
set number
syntax on
set expandtab
filetype indent on
filetype on
filetype plugin on
set hidden
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
"set noswapfile
autocmd filetype python set expandtab
autocmd filetype html,xml set listchars-=tab:>.

"set guifont=UbuntuMono\ 13
set guifont=monaco\ 12

colo molokai
"colo github
"set colorcolumn=85

nnoremap ; :

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


if has('gui_running')
":set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
":set guioptions-=r  "remove right-hand scroll bar
endif

" Paste
"nmap p "+p

"map <F2>s#^#\##<cr>
map <F2> :s#^#\##<cr>
map <F3> :s#^\###<cr>

map <F5> :<ESC>:!make<cr>
map <F6> :<ESC>oimport pdb; pdb.set_trace()<ESC>
set pastetoggle=<F4>
map <F8> :<ESC><c-w>c
map <F9> :<ESC><c-w>v
map <F10> :<ESC><c-w>s
map <F11> :<ESC><c-w>\|<c-w>_
map <F12> :<ESC><c-w>=
"map <F3>s#^\###<cr>
"nnoremap <leader>p oimport pdb; pdb.set_trace()^[
map <c-v> :<ESC><F4>"+p
map <c-s> :<ESC>:wa<cr>
let g:pep8_map='F7' 

execute pathogen#infect()
let g:syntastic_python_checkers=['pyflakes']

"nnoremap / /\v
"vnoremap / /\v

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>


au FocusLost * :wa


