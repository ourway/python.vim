set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)



set encoding=utf8
"set paste
set textwidth=0
set backspace=indent,eol,start
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
set nowrap
set number
syntax on
set expandtab
filetype indent on
filetype on
filetype plugin on

set guifont=UbuntuMono\ 12

colo slate

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

map <F5> :<ESC>:!python -OO -u -d %<cr>
map <F6> :<ESC>oimport pdb; pdb.set_trace()<ESC>

map <F8> :<ESC><c-w>c<cr>
map <F9> :<ESC><c-w>v<cr>
map <F10> :<ESC><c-w>s<cr>
map <F11> :<ESC><c-w>\|<cr>
map <F12> :<ESC><c-w>=<cr>
"map <F3>s#^\###<cr>
"nnoremap <leader>p oimport pdb; pdb.set_trace()^[
map <c-v> :<ESC>"+p
map <c-s> :<ESC>:wa<cr>








