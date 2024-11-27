" ==================================vimrc version 1==================================

" Use Vim settings rather than Vi settings (better experience)
set nocompatible

" Source ~/.vimrc.before if it exists
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ================ General Config ====================
set number                      " Enable line numbers
set relativenumber              " Show relative line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of command-line history
set showcmd                     " Show incomplete commands
set showmode                    " Show current mode
set gcr=a:blinkon0              " Disable cursor blink
set visualbell                  " Disable sounds
set autoread                    " Reload files changed outside Vim
set hidden                      " Allow background buffers without saving

" Enable syntax highlighting
syntax on
set background=dark
colorscheme solarized           " Set Solarized color scheme

" Change leader to a comma (easier than backslash)
let mapleader = ","

" ================ Turn Off Swap Files ==============
set noswapfile
set nobackup
set nowritebackup               " Disable swap and backup files

" ================ Persistent Undo ==================
" Keep undo history across sessions
if has('persistent_undo')
  if !isdirectory(expand('~/.vim/backups'))
    silent !mkdir -p ~/.vim/backups
  endif
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================
set autoindent
set smartindent
set expandtab                   " Use spaces instead of tabs
set shiftwidth=2                " Indent by 2 spaces
set tabstop=2                   " Tab appears as 2 spaces
set softtabstop=2               " Spaces per Tab in Insert mode

" Display tabs and trailing spaces visually
set list
set listchars=tab:▸\ ,trail:·

set nowrap                      " Don't wrap lines
set linebreak                   " Wrap lines at convenient points

" Auto-indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

" ================ Completion =======================
set wildmenu                    " Enable visual menu for tab completion
set wildmode=list:longest       " Auto-complete the longest match
set wildignore=*.o,*.obj,*~     " Ignore unwanted file types
set wildignore+=*vim/backups*,*sass-cache*,*.DS_Store,vendor/**,log/**,tmp/**,*.png,*.jpg,*.gif

" ================ Scrolling ========================
set scrolloff=8                 " Start scrolling 8 lines from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================
set incsearch                   " Incremental search
set hlsearch                    " Highlight matches
set ignorecase                  " Case-insensitive search...
set smartcase                   " ...unless capitalized

" ================ Security =========================
set modelines=0                 " Disable modelines for security
set nomodeline

" ================ Custom Settings =================
set cmdheight=2                 " Extra space for messages
set colorcolumn=150             " Highlight column 150
set cursorline                  " Highlight the current line
set foldmethod=manual           " Enable manual folding
set updatetime=50               " Faster update time

" Highlight settings
highlight ColorColumn ctermbg=0 guibg=#064F62
highlight Insert ctermfg=25

highlight TabLineSel term=reverse cterm=reverse gui=reverse
highlight TabLine term=underline cterm=underline gui=reverse
highlight TabLinefill term=underline cterm=underline gui=reverse

highlight Folded cterm=bold ctermbg=NONE ctermfg=242

" Status line customization
au VimEnter * highlight StatusLine cterm=bold ctermbg=NONE ctermfg=30
au InsertEnter * highlight StatusLine cterm=bold ctermfg=208 ctermbg=NONE
au InsertLeave * highlight StatusLine cterm=bold ctermbg=NONE ctermfg=30

set laststatus=2                " Always show the status line
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

" Highlight user-defined group
highlight User3 cterm=bold ctermfg=7
