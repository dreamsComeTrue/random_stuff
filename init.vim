"""""""""""""""""""""""""""""""""""""""""
" => General sttings
"""""""""""""""""""""""""""""""""""""""""

set fileencodings=utf-8
set encoding=utf-8

filetype off
set rtp+=C:/Users/B0634624/Neovim/vimfiles/bundle/vundle/

call vundle#begin('C:/Users/B0634624/Neovim/vimfiles/bundle/')

Plugin 'sjl/gundo.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-airline/vim-airline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'qpkorr/vim-bufkill'
Plugin 'kshenoy/vim-signature'
Plugin 'terryma/vim-expand-region'
Plugin 'jremmen/vim-ripgrep'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'lifepillar/vim-mucomplete'
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()  

filetype plugin indent on     

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"""""""""""""""""""""""""""""""""""""""""
" => Editor customization
"""""""""""""""""""""""""""""""""""""""""

set autoindent                  " set auto-indenting on for programming
set showmatch                   " automatically show matching brackets. works like it does in bbedit.
set backspace=indent,eol,start  " make that backspace key work the way it should
set nocompatible                " vi compatible is LAME
set showmode                    " show the current mode
syntax on                       " turn syntax highlighting on by default
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
set mouse=a

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
nnoremap <leader>j :NERDTreeToggle<cr>
nnoremap <leader>h :NERDTreeFocus<cr>
nnoremap <leader>k :Explore<cr>
inoremap <C-space> <C-n>

" Find and replace
nnoremap <leader>r :%s/\<<C-r><C-w>\>//gc<left><left><left>

""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""

set backup
set wb
set swapfile

" tell vim where to put its backup files
set backupdir=C:/Users/B0634624/Neovim/backup/

" tell vim where to put swap files
set dir=C:/Users/B0634624/Neovim/swap/

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
nmap <S-Enter> ojj
nmap <C-S-Enter> Ojj

nnoremap ; :
noremap j gj						" Treat long lines as break lines (useful when moving around in them)
noremap k gk
"noremap <space> /					" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"inoremap <c-space> ?
"nnoremap * *N
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
noremap <leader>d :BD<cr>

noremap <leader>bw :BW<cr>

" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>

command Bd bp\|bd \#

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
nnoremap <Leader>, :bp<CR>
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


" Copy & paste
nnoremap <Leader>y yiw
nnoremap <Leader>p viw"0p

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

let g:python_host_prog = 'C:/Python27/python.exe'
let g:python3_host_prog = 'C:/Users/B0634624/AppData/Local/Programs/Python/Python36-32/python.exe'

"set background=dark
colorscheme night

hi colorcolumn guibg=#5e5e6e ctermbg=246
hi SignColumn guibg=#5e5e6e guifg=yellow 
hi SignatureMarkText guibg=#5e5e6e guifg=yellow 
let &colorcolumn="100,".join(range(120,999),",")

hi Normal guibg=#505060 ctermfg=grey ctermbg=darkblue
hi Pmenu gui=bold guibg=#404070 guifg=yellow
hi CursorLine guibg=#404090
hi Search guibg=blue
hi IncSearch guibg=blue

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
" => Terminal
""""""""""""""""""""""""""

tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

""""""""""""""""""""""""""
" => Ctrl-P
""""""""""""""""""""""""""

let g:ctrlp_map = '<leader>p'
let g:ctrlp_use_caching=1
let g:ctrlp_working_path_mode=0
let g:ctrlp_follow_symlinks=2
nnoremap <leader>l :CtrlPBookmarkDir<CR>
nnoremap <leader>P :CtrlPClearAllCaches<CR> :CtrlP<CR>

nnoremap <leader><F2> :CtrlPMRUFiles<CR>>

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

autocmd! FileType c,cpp,java,php call CSyntaxAfter()

""""""""""""""""""""""""""
" => Delmarks
""""""""""""""""""""""""""

command Delmarks  delmarks! | SignatureRefresh  

""""""""""""""""""""""""""
" => Rg
""""""""""""""""""""""""""

noremap <leader>a :Rg <cword><cr>
noremap <leader>A :Rg 
noremap <leader>c :cclose<cr>
noremap <leader>o :botright copen<cr>

""""""""""""""""""""""""""
" => IndentLine
""""""""""""""""""""""""""

let g:indentLine_color_gui = '#555555'

""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""

nnoremap <leader>nt :NERDTreeToggle<cr>
nnoremap <leader>nf :NERDTreeFind<cr>

"""""""""""""""""""""""""
" => Complete
""""""""""""""""""""""""""

set completeopt+=menuone
set completeopt+=noselect
set completeopt+=noinsert
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

"""""""""""""""""""""""""
" => ZeaVim
""""""""""""""""""""""""""

let g:zv_zeal_executable = 'zeal.exe'

""""""""""""""""""""""""""
" => Various
""""""""""""""""""""""""""
map @@x !%xmllint --format -<CR>
map @@j !%python -m json.tool<CR>

nnoremap <C-'> :registers<CR>

set path+=*/**
set path+=../**

"let g:EclimCompletionMethod = 'omnifunc'
"noremap <leader>s :JavaSearch<CR>

au BufRead,BufNewFile *.aga setfiletype cpp
au BufReadPost *.aga set syntax=cpp

function! CodeCompletion()
    :!c:/cygwin64/bin/find.exe -name *.java -o -name *.scala > cscope.files 
    :!cscope -b -R    
    :cscope reset 
endfunction

nnoremap <silent> <F12> :call CodeCompletion() <CR><CR>
" autocmd VimEnter * cscope add cscope.out
  
set updatetime=10
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]' 
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/' 
    else 
        match none 
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

:cd C:\Users\B0634624\Projects\EL\

