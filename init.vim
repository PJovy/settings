" ================================
" Welcome to Jovy's neo-vim settings file
" ================================
set termguicolors
" --------------------------------
" Plugins
" --------------------------------
set nocompatible              " be iMproved, required
filetype on          " required

" set the runtime path to include vim-plug and initialize
set rtp+=~/.local/share/nvim/site/autoload/plug.vim


call plug#begin("~/.local/share/nvim/site/plugged")
" Plugins
Plug 'michaeljsmith/vim-indent-object'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'taigacute/thinkvim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary' " gc to comment out
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'szw/vim-g'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go' " golang development
Plug 'jamesroutley/vim-logbook'
Plug 'sheerun/vim-polyglot'   " syntax highlighting in most languages
Plug 'joshdick/onedark.vim'   " Atom-style dark theme

" All of your Plugins must be added before the following line
call plug#end()

" ctrlp setting
let g:ctrlp_working_path_mode = 0 " make ctrlp work from current dir

" airline-theme setting
let g:airline_theme='deus'

" startify setting , disallow startify to change dir
let g:startify_change_to_dir = 0

" sudo to write
cnoremap w!! w !sudo tee % >/dev/null

filetype plugin indent on

" --------------------------------
" Pretty things
" --------------------------------
syntax on
colorscheme onedark

" Set Airline bar theme
let g:airline_theme='bubblegum'

"rainbow Plugin Options (luochen1990/rainbow)
let g:rainbow_active = 1    " 0 if you want to enable it later via :RainbowToggle

" Colour at column 100
set colorcolumn=100

" --------------------------------
" Basic stuff
" --------------------------------
let g:mapleader = " " " Set leader to spacebar
set spelllang=en_gb
set backspace=indent,eol,start " Bring backspace to life
set number          " Line numbers
set relativenumber  " Relative numbers"
set hlsearch        " Highlight whole word when searching
set ignorecase      " Ignore case when searching...
set smartcase       " ...except when serach query contains a capital letter
set autoread        " Auto load files if they change on disc
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>
map <Leader>y "*y  )
nnoremap <Leader><Leader> :w<CR>
inoremap jj <ESC>:w<CR>

" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$

" Pasting - indent last pasted
nnoremap gz '[=']

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><ESC> :noh<cr>

" NerdTree setting
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'



"Cursor
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Open current file in a new vertical split with '='
nnoremap = :vsplit<cr>

" Easy split navigation
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Simplify using tabs
nnoremap ˙ gT
nnoremap ¬ gt
nnoremap T :tabnew<cr>

" Open new splits to right and bottom
set splitbelow
set splitright

"Tab completion
set wildmenu
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
    endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Tab size
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Disable swap files
set noswapfile

" Disable arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
