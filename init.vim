"""""""""""""""""""""""""""""""""""""""""
" => General sttings
"""""""""""""""""""""""""""""""""""""""""

set fileencodings=utf-8
set encoding=utf-8

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()  

Plugin 'VundleVim/Vundle.vim'
Plugin 'sjl/gundo.vim'
Plugin 'mileszs/ack.vim'
Plugin 'qpkorr/vim-bufkill'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'kshenoy/vim-signature'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-airline/vim-airline'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
    
call vundle#end()  

filetype plugin indent on     

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"""""""""""""""""""""""""""""""""""""""""
" => Editor customization
"""""""""""""""""""""""""""""""""""""""""

syntax on                       " turn syntax highlighting on by default
set autoindent                  " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set nocompatible                " vi compatible is LAME
set showmode                    " show the current mode
set noautochdir
set number                      " Line numbers on
set relativenumber              " Relative numbers on
set history=7000				" Sets how many lines of history VIM has to remember
set autoread 					" Set to auto read when a file is changed from the outside
set so=7						" Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu					" Turn on the WiLd menu
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
set novisualbell                " turn on the "visual bell" - which is much quieter than the "audio blink"
set viminfo^=%					" Remember info about open buffers on close

" Ignore compiled files
set wildignore=*.o,*.obj,*.a,*.lib,*.dll,*~,*.pyc,*.zip,*.exe		
" Ignore these directories
set wildignore+=*/build/**		

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
nnoremap <leader>r :%s/\<<C-r><C-w>\>/
inoremap <C-space> <C-n>
noremap <silent> <leader><cr> :noh<cr>	    " Disable highlight when <leader><cr> is pressed

""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""

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
set linebreak				" Linebreak on 500 characters
set tw=500
set autoindent  			" Auto indent
set smartindent				" Smart indent
set wrap 					" Wrap lines

""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""

" Move cursor in Insert Mode, not pretty :)
inoremap <M-j> <down>
inoremap <M-k> <up>
inoremap <M-h> <left>
inoremap <M-l> <right>

" New lines on Enter key
nmap <S-Enter> Ojj
nmap <CR> ojj
set backspace=2 " make backspace work like most other programs

nnoremap ; :
" Treat long lines as break lines (useful when moving around in them)
noremap j gj						
noremap k gk
inoremap jj <Esc>
inoremap <M-i> <Esc>
inoremap <Esc> <Nop>

" Smart way to move between windows
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Close the current buffer
noremap <leader>D :bdelete<cr>
noremap <leader>d :BD<cr>

noremap <leader>bw :BW<cr>

" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>te :tabedit %<cr>
noremap <leader>tc :tabclose<cr>

"nnoremap <C-S-tab> :tabprevious<CR>
"nnoremap <C-tab>   :tabnext<CR>
"nnoremap <C-t>     :tabnew<CR>
"inoremap <C-t>     <Esc>:tabnew<CR>
"inoremap <C-S-w>   <Esc>:tabclose<CR>

" Go to buffer by number
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>< :bp<CR>
nnoremap <Leader>. :bn<CR>
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

noremap <F2> :buffers<CR>:buffer<Space>

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

hi colorcolumn guibg=#404060 ctermbg=246
let &colorcolumn="100,".join(range(120,999),",")

hi Pmenu gui=bold guibg=#404090 guifg=yellow
hi CursorLine guibg=#404090
hi Search guibg=blue 
hi IncSearch guibg=blue  

" Highlight all occurences for word on cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""
" => Ctrl-P
""""""""""""""""""""""""""

let g:ctrlp_map = '<leader>p'
let g:ctrlp_use_caching=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_follow_symlinks=2

nnoremap <leader>l :CtrlPBookmarkDir<CR>
nnoremap <leader>P :CtrlPClearAllCaches<CR> :CtrlP<CR>

nnoremap <leader><F2> :CtrlPMRUFiles<CR>

""""""""""""""""""""""""""
" => GUndo
""""""""""""""""""""""""""

nnoremap <F5> :GundoToggle<CR>

let g:gundo_width = 60
let g:gundo_preview_height = 40
let g:gundo_right=1

""""""""""""""""""""""""""
" => Netrw
""""""""""""""""""""""""""

let g:netrw_liststyle=2

""""""""""""""""""""""""""
" => DelimitMate
""""""""""""""""""""""""""

let delimitMate_expand_cr = 1

""""""""""""""""""""""""""
" => CppEnhanced
""""""""""""""""""""""""""

let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_concepts_highlight = 1

""""""""""""""""""""""""""
" => Ack
""""""""""""""""""""""""""

noremap <leader>a :Ack! --smart-case --ignore-dir={.git} --ignore-file=match:.obj --ignore-file=match:.class <cword><cr>
noremap <leader>A :Ack! --smart-case --ignore-dir={.git} --ignore-file=match:.obj --ignore-file=match:.class 
"noremap <leader>a :Ack! --smart-case --cc --cpp --csharp --cmake --html --java --js --json --python --sql --xml --ignore-dir={.git} --ignore-file=match:.obj --ignore-file=match:.class <cword><cr>
"noremap <leader>A :Ack! --smart-case --cc --cpp --csharp --cmake --html --java --js --json --python --sql --xml --ignore-dir={.git} --ignore-file=match:.obj --ignore-file=match:.class 
noremap <leader>c :cclose<cr>
noremap <leader>o :copen<cr>

""""""""""""""""""""""""""
" => IndentLine
""""""""""""""""""""""""""

let g:indentLine_color_gui = '#555555'

""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""

noremap <leader>j :NERDTreeToggle<CR>

""""""""""""""""""""""""""
" => YouCompleTme
""""""""""""""""""""""""""

noremap <C-g> :YcmCompleter GoTo<CR>

""""""""""""""""""""""""""
" => Various
""""""""""""""""""""""""""

map @@x !%xmllint --format --recover -^M

set path+=*/**
set path+=../**

" autocmd VimEnter * cscope add cscope.out

"   Code completion using cscope
function! CodeCompletion()
    :silent !find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files
    :silent !cscope -b -R
    :cscope reset
endfunction

nnoremap <silent> <F12> :call CodeCompletion()<CR><CR>

"   Compilation
function! CompileAndRun ()
    :!make --directory=Binaries/ -j4
    :cd ./Binaries/
    :!./RobotTales
    :cd ..
endfunction

nnoremap <silent> <F8> :call CompileAndRun()<CR>

:cd ~/RobotTales
