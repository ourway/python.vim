" vimrc file for following the coding standards specified in PEP 7 & 8.
"
" To use this file, source it in your own personal .vimrc file (``source
" <filename>``) or, if you don't have a .vimrc file, you can just symlink to it
" (``ln -s <this file> ~/.vimrc``).  All options are protected by autocmds
" (read below for an explanation of the command) so blind sourcing of this file
" is safe and will not affect your settings for non-Python or non-C files.
"
"
" All setting are protected by 'au' ('autocmd') statements.  Only files ending
" in .py or .pyw will trigger the Python settings while files ending in *.c or
" *.h will trigger the C settings.  This makes the file "safe" in terms of only
" adjusting settings for Python and C files.
"
" Only basic settings needed to enforce the style guidelines are set.
" Some suggested options are listed but commented out at the end of this file.

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.h,*html,*js set tabstop=8

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
" Python: 4 spaces
" C: tabs (pre-existing files) or 4 spaces (new files)
au BufRead,BufNewFile *.py,*pyw,*.html,*.js set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw,*.html,*.js set expandtab
fu Select_c_style()
    if search('^\t', 'n', 150)
        set shiftwidth=8
        set noexpandtab
    el
        set shiftwidth=4
        set expandtab
    en
endf
au BufRead,BufNewFile *.c,*.h call Select_c_style()
au BufRead,BufNewFile Makefile* set noexpandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
" Python: No limit
" C: 79
" Uncomment this if you want to limit your textwidth in python
" can be very annoying ..
" au BufRead,BufNewFile *.py,*.pyc set textwidth=79
au BufRead,BufNewFile *.c,*.h set textwidth=79

" Turn off settings in 'formatoptions' relating to comment formatting.
" - c : do not automatically insert the comment leader when wrapping based on
"    'textwidth'
" - o : do not insert the comment leader when using 'o' or 'O' from command mode
" - r : do not insert the comment leader when hitting <Enter> in insert mode
" Python: not needed
" C: prevents insertion of '*' at the beginning of every line in a comment
au BufRead,BufNewFile *.c,*.h set formatoptions-=c formatoptions-=o formatoptions-=r

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
" Python: yes
" C: yes
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix







set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set nu

set autochdir
"set nowrap
set encoding=utf8
"set paste
set textwidth=0
set backspace=indent,eol,start
set cindent
set incsearch
set ignorecase
set vb
set ruler
set wildmenu
set commentstring=\ #\ %s
set foldlevel=2
set nofoldenable    " disable folding
set clipboard+=unnamed
set nobackup
set nowritebackup
set noswapfile
set lines=40
set columns=80
set tabstop=4
"set shiftwidth=4
"set softtabstop=4
set autoindent
set smarttab
let python_highlight_all=1
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
set wildignore=*.swp,*.bak,*.pyc,*.class,*.pyo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
"set noswapfile
autocmd filetype python set expandtab
autocmd filetype html,xml set listchars-=tab:>.
" always trim trailing whitespace .. is there ever a good reason?
autocmd BufWritePre * :%s/\s\+$//e
" http://vim.wikia.com/wiki/In_line_copy_and_paste_to_system_clipboard
" sudo apt-get install xclip
" Doesn't seem to hurt MacVim
vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p


"This should be in /etc/vim/vimrc or wherever you global vimrc is.
"But, if not, I for one can't live without it.
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif




"set guifont=UbuntuMono\ 13
set guifont=monaco\ 12

colo jellybeans

"colo github
"set colorcolumn=85
augroup filetypedetect
au BufNewFile,BufRead *.tjp,*.tji               setf tjp
augroup END

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

map <F5> :<ESC>:!./%<cr>
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

"update every 1 sec
"set updatetime=1000
autocmd CursorHoldI * silent w

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
set cursorline
set laststatus=2

py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
