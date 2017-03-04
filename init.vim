"""""""""""""""""""""""""""""""""""""""""
" => General sttings
"""""""""""""""""""""""""""""""""""""""""

set langmenu=en_US.UTF-8
language messages en

set fileencodings=utf-8
set encoding=utf-8

filetype off
set rtp+=$USERPROFILE/.vim/bundle/Vundle.vim/
call vundle#begin('$USERPROFILE/.vim/bundle/')

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
Plugin 'jlanzarotta/bufexplorer'

call vundle#end()  

set nocompatible              	" be iMproved, required
filetype plugin indent on     

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"""""""""""""""""""""""""""""""""""""""""
" => Editor customization
"""""""""""""""""""""""""""""""""""""""""

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
set noautochdir
set nunmber
set history=7000				" Sets how many lines of history VIM has to remember
set autoread 					" Set to auto read when a file is changed from the outside
set so=7						" Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu					" Turn on the WiLd menu
set wildignore=*.o,*~,*.pyc		" Ignore compiled files
set wildignore+=*/build/**		" Ignore these directories
set ruler						" Always show current position
set cmdheight=1 				" Height of the command bar
set hidden						" A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent  " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l
set ignorecase					" Ignore case when searching
set smartcase					" When searching try to be smart about cases 
set hlsearch					" Highlight search results
set incsearch					" Makes search act like search in modern browsers
set lazyredraw					" Don't redraw while executing macros (good performance config)
set magic						" For regular expressions turn magic on
set showmatch					" Show matching brackets when text indicator is over them
set cursorline					" Highlight current line
set novisualbell
set viminfo^=%					" Remember info about open buffers on close

nnoremap <esc> :noh<return><esc>

autocmd StdinReadPre * let s:std_in=1

""""""""""""""""""""""""""""""""""""""""""
" => Leader key
""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","							" With a map leader it's possible to do extra key combinations
let g:mapleader = ","						" like <leader>w saves the current file

nnoremap <leader>w :w!<cr>					" Fast saving
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>	" Switch CWD to the directory of the open buffer
nnoremap <leader>k :Explore<cr>

""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""
" Turn backup on
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""

set expandtab				" Use spaces instead of tabs
set smarttab				" Be smart when using tabs ;)
set shiftwidth=4			" 1 tab == 4 spaces
set tabstop=4
set lbr						" Linebreak on 500 characters
set tw=500
set ai 						" Auto indent
set si 						" Smart indent
set wrap 					" Wrap lines

""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""

noremap j gj						" Treat long lines as break lines (useful when moving around in them)
noremap k gk
noremap <space> /					" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
inoremap <c-space> ?
inoremap jj <Esc>
inoremap <M-i> <Esc>
inoremap <Esc> <Nop>
noremap <silent> <leader><cr> :noh<cr>	" Disable highlight when <leader><cr> is pressed

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer
noremap <leader>bd :bdelete<cr>
noremap <leader>bw :BW<cr>

" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>

command Bd bp\|bd \#

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove

"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-t>     <Esc>:tabnew<CR>
"inoremap <C-S-w>   <Esc>:tabclose<CR>

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

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" move tabs to the end for new, single buffers (exclude splits)
autocmd BufNew * if winnr('$') == 1 | tabmove99 | endif

nnoremap <F2> :buffers<CR>:buffer<Space>

""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""
	
set laststatus=2		" Always show the status line

" Show EOL type and last modified timestamp, right after the filename
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_z = '%3p%% %#__accent_bold#%-2{g:airline_symbols.linenr}%#__accent_bold#[%v,%l/%L]%#__restore__#%#__restore__#' 

""""""""""""""""""""""""""
" => GUI
""""""""""""""""""""""""""

set background=dark
colorscheme night

hi colorcolumn guibg=#2d2d2d ctermbg=246
let &colorcolumn="100,".join(range(120,999),",")

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

"set guioptions-=m  "menu bar
set guioptions-=L  "remove left-hand scroll bar

set guifont=Consolas:h12:cANSI
au GUIEnter * simalt ~s " maximize

nnoremap <left> :vertical resize +5<cr> 
nnoremap <right> :vertical resize -5<cr>
nnoremap <up> :resize -5<cr>
nnoremap <down> :resize +5<cr>

set splitbelow
set splitright

augroup PreviewOnBottom
    autocmd InsertEnter * set splitbelow
    autocmd InsertLeave * set splitbelow!
augroup END

""""""""""""""""""""""""""
" => Ctrl-P
""""""""""""""""""""""""""

" Use <leader>t to open ctrlp
let g:ctrlp_map = '<leader>p'
" " disable caching
let g:ctrlp_use_caching=1
let g:ctrlp_working_path_mode=0

""""""""""""""""""""""""""
" => Tabline
""""""""""""""""""""""""""

" Set tabline colors
:hi TabLineFill ctermfg=DarkGray ctermbg=DarkGreen
:hi TabLineSel ctermfg=White ctermbg=Black

""""""""""""""""""""""""""
" => GUndo
""""""""""""""""""""""""""

nnoremap <F5> :GundoToggle<CR>

" let g:gundo_width = 60
" let g:gundo_preview_height = 40
let g:gundo_right=1

""""""""""""""""""""""""""
" => Netrw
""""""""""""""""""""""""""

let g:netrw_liststyle=3

""""""""""""""""""""""""""
" => DelimitMate
""""""""""""""""""""""""""

let delimitMate_expand_cr = 1

""""""""""""""""""""""""""
" => SuperTab
""""""""""""""""""""""""""

let g:SuperTabDefaultCompletionType = "<c-n>"

""""""""""""""""""""""""""
" => CppEnhanced
""""""""""""""""""""""""""

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
autocmd! FileType c,cpp,java,php call CSyntaxAfter()

""""""""""""""""""""""""""
" => Delmarks
""""""""""""""""""""""""""

command Delmarks  delmarks! | SignatureRefresh  

""""""""""""""""""""""""""
" => Various
""""""""""""""""""""""""""

au BufRead,BufNewFile *.aga setfiletype cpp
au BufReadPost *.aga set syntax=cpp

nnoremap <silent> <F12> :silent !cscope -b -R<CR><CR>:cscope reset<CR><CR>