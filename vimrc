" Hugo Shaka's vimrc
set nocp
scriptencoding utf-8
set encoding=utf-8

" -----  Pathogen load  -----
  runtime bundle/vim-pathogen/autoload/pathogen.vim
  execute pathogen#infect()

" -----  General Config  -----
  set number                      "Line numbers are good
  set numberwidth=3               "But they take too much space
  set backspace=indent,eol,start  "Allow backspace in insert mode
  set history=1000                "Store lots of :cmdline history
  set showcmd                     "Show incomplete cmds down the bottom
  set showmode                    "Show current mode down the bottom
  set gcr=a:blinkon0              "Disable cursor blink
  set visualbell                  "No sounds
  set virtualedit=onemore       " allow for cursor beyond last character
  set autoread                    "Reload files changed outside vim
  filetype plugin indent on       " Automatically detect file types.
  set mouse=a                     "Enable the mouse
  
  " This makes vim act like all other editors, buffers can
  " exist in the background without being in a window.
  " http://items.sjbach.com/319/configuring-vim-right
  set hidden
  
  "turn on syntax highlighting
  syntax on
  
  " Change leader to a comma because the backslash is too far away
  " That means all \x commands turn into ,x
  let mapleader=","
  
  set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')

" -----  Turn Off Swap Files  -----
  set noswapfile
  set nobackup
  set nowb

" -----  Persistent Undo  -----
  " Keep undo history across sessions, by storing in file.
  " Only works all the time.
  if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
    silent !mkdir ~/.vim/backups > /dev/null 2>&1
    set undodir=~/.vim/backups
    set undofile
  endif

" -----  Indentation & Formatting  -----
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
  set list listchars=tab:\|_,trail:·
  
  set nowrap       "Don't wrap lines
  set linebreak    "Wrap lines at convenient points

  set tabpagemax=15         " only show 15 tabs
" -----  Folds  -----
  set foldmethod=indent   "fold based on indent
  set foldnestmax=3       "deepest fold is 3 levels
  set foldenable        "fold by default
  """ Code folding options
  nmap <leader>f0 :set foldlevel=0<CR>
  nmap <leader>f1 :set foldlevel=1<CR>
  nmap <leader>f2 :set foldlevel=2<CR>
  nmap <leader>f3 :set foldlevel=3<CR>
  nmap <leader>f4 :set foldlevel=4<CR>
  nmap <leader>f5 :set foldlevel=5<CR>
  nmap <leader>f6 :set foldlevel=6<CR>
  nmap <leader>f7 :set foldlevel=7<CR>
  nmap <leader>f8 :set foldlevel=8<CR>
  nmap <leader>f9 :set foldlevel=9<CR>

" -----  Completion  -----
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

"
" -----  Scrolling  -----
  set scrolloff=8         "Start scrolling when we're 8 lines away from margins
  set sidescrolloff=15
  set sidescroll=1
  set whichwrap=b,s,h,l,<,>,[,] " backspace and cursor keys wrap to
  set scrolljump=5        " lines to scroll when cursor leaves screen

" -----  Search  -----
  set incsearch       " Find the next match as we type the search
  set hlsearch        " Highlight searches by default
  set ignorecase      " Ignore case when searching...
  set smartcase       " ...unless we type a capital
  set showmatch         " show matching brackets/parenthesis
  set incsearch         " find as you type search
  set winminheight=0        " windows can be 0 line high 


" -----  Graphical  -----
  set showmode        "Display the current mode
  set ruler           "Display the ruler
  set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
  set showcmd
  colorscheme molokai
  set cursorline      "highlight current line
  " hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
  hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

  if has('statusline')
    set laststatus=2
    " Broken down into easily includeable segments
    set statusline=%<%f\    " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=\ [%{&ff}/%Y]            " filetype
    set statusline+=\ [%{getcwd()}]          " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif
  set backspace=indent,eol,start

" -----  Commands  -----
  cmap W w
  cmap WQ wq
  cmap wQ wq
  cmap Q q
  cmap Tabe tabe

" -----  NERDTree  -----
  autocmd vimenter * NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

