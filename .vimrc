:colors monokai 
set background=dark

:set nu
execute pathogen#infect()
syntax on
filetype plugin indent on
" gradle syntax highlighting
au BufNewFile,BufRead *.gradle set filetype=groovy

autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() >= 0 && !exists("s:std_in") | NERDTree | endif

let g:nerdtree_tabs_open_on_console_startup = 1
autocmd BufWinEnter * :NERDTreeTabsOpen
autocmd BufWinEnter * :NERDTreeMirrorOpen

let NERDTreeShowHidden=1

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

" Set tabline colors
:hi TabLineFill ctermfg=DarkGray ctermbg=DarkGreen
:hi TabLineSel ctermfg=White ctermbg=Black

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" " Fast saving
nmap <leader>w :w!<cr>

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
"
" " Turn on the WiLd menu
set wildmenu
"
" " Ignore compiled files
set wildignore=*.o,*~,*.pyc
"
" "Always show current position
set ruler
"
" " Height of the command bar
set cmdheight=2
"
" " A buffer becomes hidden when it is abandoned
set hid
"
" " Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"
" " Ignore case when searching
set ignorecase
"
" " When searching try to be smart about cases 
set smartcase
"
" " Highlight search results
set hlsearch
"
" " Makes search act like search in modern browsers
set incsearch
"
" " Don't redraw while executing macros (good performance config)
set lazyredraw
"
" " For regular expressions turn magic on
set magic
"
" " Show matching brackets when text indicator is over them
set showmatch

""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab
"
" Be smart when using tabs ;)
set smarttab
"
" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
"
" " Linebreak on 500 characters
set lbr
set tw=500
"
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
"
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>
"
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"
" Close the current buffer
map <leader>bd :Bclose<cr>
"
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>
"
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
"
" " Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"
" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"
" " Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""
" " Always show the status line
set laststatus=2
"
" " Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#09AA08'
let g:indentLine_char = '│'
let delimitMate_expand_cr = 1

" Use <leader>t to open ctrlp
let g:ctrlp_map = '<leader>p'
" " Ignore these directories
set wildignore+=*/build/**
" " disable caching
let g:ctrlp_use_caching=0

let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

nnoremap <F5> :GundoToggle<CR>

" Returns true if paste mode is enabled
function! HasPaste()
     if &paste
         return 'PASTE MODE  '
     en
     return ''
endfunction

" Auto-reload VIM config
augroup myvimrc
     au!
     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END


" Automatically find and select currently opened file in NERDTree.
let g:nerdtree_tabs_autofind=1

" When switching into a tab, make sure that focus is on the file window, not in the NERDTree window.
let g:nerdtree_tabs_focus_on_files=1

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-S-w>   <Esc>:tabclose<CR>


" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" move tabs to the end for new, single buffers (exclude splits)
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif