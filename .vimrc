" ==================================vimrc==================================
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO: this may not be in the correct place. It is intended to allow overriding <Leader>.
" source ~/.vimrc.before if it exists.
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif



" ================ General Config ====================

set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on
set background=dark
"set colorScheme
"change colorscheme
"colorscheme vimCustomColor
colorscheme solarized

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","


" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

"set foldmethod=indent   "fold based on indent
"set foldnestmax=3       "deepest fold is 3 levels
"set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" ================ Security ==========================
set modelines=0
set nomodeline

" ================ Custom Settings ========================
"so ~/.yadr/vim/settings.vim
" Give more space for displaying messages.
set cmdheight=2
set relativenumber
set colorcolumn=150
set cursorline
set foldmethod=manual
set updatetime=50
"set rulerformat=%15(%c%V\ %p%%%)

"ColorColumn fg colour
highlight ColorColumn ctermbg=0 guibg=#064F62 
highlight Insert ctermfg=25

"ColourStatusLine and file/path
"highlight CursorColumn ctermbg=0

"ColorTabLine active and none active
highlight TabLineSel term=reverse cterm=reverse gui=reverse
highlight TabLine term=underline cterm=underline gui=reverse
highlight TabLinefill term=underline cterm=underline gui=reverse

"highlight folded line
highlight Folded cterm=bold ctermbg=NONE ctermfg=242

"Statusbar colorModification
au VimEnter * hi StatusLine cterm=bold ctermbg=NONE ctermfg=30
au InsertEnter * hi StatusLine cterm=bold ctermfg=208 ctermbg=None
au InsertLeave * hi StatusLine  cterm=bold ctermbg=NONE ctermfg=30

" Use status bar even with single buffer and other modifications
" set statusline+=%{StatuslineGit()}
set laststatus=2
set statusline+=%#PmenuSel#
set statusline+=%#LineNr#
set statusline+=%3*\ %F%m%r%h%w[+] 
set statusline+=%*\ pos:
set statusline+=\%04l,%04c
set statusline+=\(%p%%)
set statusline+=\x(%L)
set statusline+=\ typ:
set statusline+=%m
set statusline+=\%y
set statusline+=\/ 
set statusline+=\%{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ a(%04v)
set statusline+=\ h(%03B0)
" ___________________StatusLine user colour_______________________________________
hi User3 cterm=bold ctermfg=7

