set langmenu=en_US.UTF-8
language messages en

filetype off
set rtp+=$USERPROFILE/vimfiles/bundle/vundle/
call vundle#begin('$USERPROFILE/vimfiles/bundle/')

Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'sjl/gundo.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mkitt/tabline.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ervandew/supertab'
Plugin 'qpkorr/vim-bufkill'
Plugin 'yegappan/mru'
Plugin 'kshenoy/vim-signature'
Plugin 'terryma/vim-expand-region'
Plugin 'jlanzarotta/bufexplorer.vim'
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()  

set nocompatible              " be iMproved, required
filetype plugin indent on     

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set nu

" Setting some decent VIM settings for programming

set ai                          " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set vb                          " turn on the "visual bell" - which is much quieter than the "audio blink"
set ruler                       " show the cursor position all the time
set backspace=indent,eol,start  " make that backspace key work the way it should
set nocompatible                " vi compatible is LAME
set background=dark             " Use colours that work well on a dark background (Console is usually black)
set showmode                    " show the current mode
set clipboard=unnamed           " set clipboard to unnamed to access the system clipboard under windows
syntax on                       " turn syntax highlighting on by default
set autochdir

set background=dark
colorscheme dracula


autocmd StdinReadPre * let s:std_in=1

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

let g:SuperTabDefaultCompletionType = "<c-n>"

" Sets how many lines of history VIM has to remember
set history=7000

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
nnoremap <leader>w :w!<cr>

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
set cmdheight=1
"
" " A buffer becomes hidden when it is abandoned
set hidden
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

set fileencodings=utf-8
set encoding=utf-8

" " Don't redraw while executing macros (good performance config)
set lazyredraw
"
" " For regular expressions turn magic on
set magic
"
" " Show matching brackets when text indicator is over them
set showmatch

hi colorcolumn guibg=#2d2d2d ctermbg=246
let &colorcolumn="100,".join(range(120,999),",")

set novisualbell

" Highlight current line
set cursorline

""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""
" Turn backup on
set backup
set wb
set swapfile

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
noremap j gj
noremap k gk
"
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
noremap <space> /
inoremap <c-space> ?

inoremap jj <Esc>

inoremap <M-i> <Esc>
inoremap <Esc> <Nop>

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>
"
" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
"
" Close the current buffer
noremap <leader>bd :bdelete<cr>
noremap <leader>bw :BW<cr>
"
" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>
"
" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
"
" " Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"
" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

noremap <leader>k :Explore<cr>
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
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

let delimitMate_expand_cr = 1

" Use <leader>t to open ctrlp
let g:ctrlp_map = '<leader>p'
" " Ignore these directories
set wildignore+=*/build/**
" " disable caching
let g:ctrlp_use_caching=1
let g:ctrlp_working_path_mode=0

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

set splitbelow
set splitright

nnoremap <F5> :GundoToggle<CR>

" let g:gundo_width = 60
" let g:gundo_preview_height = 40
let g:gundo_right=1

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
     au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYVIMRC | endif
augroup END

augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END

nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
inoremap <C-S-w>   <Esc>:tabclose<CR>

" Go to buffer by number
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" move tabs to the end for new, single buffers (exclude splits)
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"set guioptions-=m  "menu bar
set guioptions-=L  "remove left-hand scroll bar

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_z = '%3p%% %#__accent_bold#%-2{g:airline_symbols.linenr}%#__accent_bold#[%v,%l/%L]%#__restore__#%#__restore__#' 

cd $USERPROFILE
set guifont=Source\ Code\ Pro\ Medium:h8:cANSI
au GUIEnter * simalt ~s " maximize

nnoremap <left> :vertical resize +5<cr> 
nnoremap <right> :vertical resize -5<cr>
nnoremap <up> :resize -5<cr>
nnoremap <down> :resize +5<cr>

nnoremap <esc> :noh<return><esc>

command Delmarks  delmarks! | SignatureRefresh  
nnoremap <F2> :buffers<CR>:buffer<Space>

autocmd! FileType c,cpp,java,php call CSyntaxAfter()

let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1
