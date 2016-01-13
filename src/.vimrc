runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()


" Initialization
set shortmess=atI " Don’t show the intro message when starting Vim
set nocompatible " Disable vi-compatibility (more efficient).
set fileformats=unix,dos,mac " Set file end-of-line priority.


" Terminal / GUI
set t_Co=256 " Set terminal to display 256 colors.


" Colors
set background=dark
let g:zenburn_high_Contrast=1
let g:zenburn_alternate_Visual=1
colorscheme zenburn

" Specify highlighted column color
highlight ColorColumn ctermbg=236


" Status Lines
set title " Show the filename in the window titlebar
set laststatus=2 " Always show status line.
set shortmess=at " Shortens messages in status line, truncates long messages.
set showcmd " Display an incomplete command in status line.
set showmode " Display current mode on last line.
set report=0
set ruler " Show file status ruler. NOTE: Doesn't work with buftabs.vim plugin.
"set ch=2 " Make command line two lines high
set number " Show line numbers.
set numberwidth=5 " Width of numbers column.


" Searching
set hlsearch " Highlight search.
set smartcase " Be case sensitive when input has a capital letter.
set incsearch " Show matches while typing.
set ignorecase " Ignore case when searching.
set gdefault " Add the g flag to search/replace by default
" Clear last search
map <Bslash><Bslash> :nohlsearch<CR>


" Syntax
syntax on " Syntax highlighting.
set showmatch " Show matching brace on insertion or cursor over.
set matchtime=3 " How many tenths of a second to wait before showing matching braces.
set matchpairs+=<:> " Treat '<','>' as matching braces.


" Auto Completion
set wildmenu
" Ignored files
set wildignore+=*.jpg,*.jpeg,*.png,*.gif " Ignore images
set wildignore+=*.pdf " Ignore PDF files
set wildignore+=*.pyc,*.pyo " Ignore compiled Python files
set wildignore+=*/CVS/,*/.svn/,*/.git/ " Ignore version control files


" Indentation
set autoindent " On for smartindent below.
set smartindent " Automatically set the indent of a new line (local to buffer).
set modeline " Respect modeline in files
set modelines=4 " Number of lines to search for modeline



" Formatting

" Default Options
set nowrap
set linebreak " Wrap at word.
set textwidth=0 " Desirable text width. Used for text auto-wrapping. 0 means no auto-wrapping.
" Force formatting of the current paragraph
nmap <C-G> gwap


" Folding
set foldenable " Turn on folding.
set foldmethod=marker " Fold on the marker.
set foldlevel=100 " Don't autofold anything (but I can still fold manually).
set foldopen=block,hor,tag,percent,mark,quickfix " What movements open folds.


" Backup
" Centralize backups, swapfiles and undo history with decentralized fallback
set backupdir=~/.vim/backups,.,~/tmp,~/
set directory=~/.vim/swaps,.,~/tmp,/var/tmp,/tmp
if exists("&undodir")
  set undodir=~/.vim/undo,.
endif
" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*


" Invisible characters.
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Invisible characters
set list " Display invisible characters.


"" Mouse
"set mouse=a " Enable mouse.
""set mouse-=a " Disable mouse.
"set mousehide " Hide mouse after chars typed.
"behave xterm " Make mouse behave like in xterm (instead of, e.g. Windows' command-prompt mouse).
""set selectmode=mouse " Enable visual selection with mouse.


" Bells
set novisualbell " No blinking
set noerrorbells " No noise.
"set vb t_vb= " Disable any beeps or flashes on error


" General

set ttyfast " Optimize for fast terminal connections
set history=256 " Number of things to remember in history.
set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay).
set hidden " The current buffer can be put to the background without writing to disk.

" Easily edit/source $MYVIMRC
nmap <leader>ev :edit $MYVIMRC<CR>
nmap <leader>sv :source $MYVIMRC<CR>

set backspace=indent,eol,start " Enable backspace key. Erase previously entered characters in insert mode.

set whichwrap=h,l,b,<,>,[,]

set shell=/bin/bash
" Open a shell
map <C-Z> :shell<CR>

set nostartofline " Don’t reset cursor to start of line when moving around.
set scrolloff=3 " Start scrolling three lines before the horizontal window border

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure


" MiniBufExplorer Configuration
" cycle buffers forward and backward
nmap <C-n> :MBEbn<CR>
nmap <C-p> :MBEbp<CR>
" allow cycling around the end of buffer list
let g:miniBufExplCycleArround = 1

map <leader>b :MBEOpen<CR>
map <leader>c :MBEClose<CR>
map <leader>t :MBEToggle<CR>

" always display MBE
let g:miniBufExplBuffersNeeded = 1

" split below or right of the current window
"let g:miniBufExplBRSplit = 1


"" Search tag list from current dir up till root.
"set tags=./tags;/
""
"" Stuff for tag list
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Use_Right_Window = 1
"let Tlist_WinWidth = 60
""let Tlist_Compact_Format = 1
"let Tlist_Exit_OnlyWindow = 1
"nnoremap <silent> <leader>TO :Tlist<CR>
"nnoremap <silent> <leader>TC :TlistClose<CR>
"
""Stuff for ctags
"let g:ctags_path = '/usr/bin/ctags'
""let g:ctags_args='-I __declspec+'
"let g:ctags_title=1	" To show tag name in title bar.
"let g:ctags_statusline=1	" To show tag name in status line.
"let generate_tags=1	" To start automatically when a supported file is opened.

"if has('cscope')
"  set cscopetag cscopeverbose
"
"  if has('quickfix')
"    set cscopequickfix=s-,c-,d-,i-,t-,e-
"  endif
"
"  cnoreabbrev csa cs add
"  cnoreabbrev csf cs find
"  cnoreabbrev csk cs kill
"  cnoreabbrev csr cs reset
"  cnoreabbrev css cs show
"  cnoreabbrev csh cs help
"
"  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
"endif


" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>


" Automatic commands
if has("autocmd")
  " Filetype Detection
  filetype plugin indent on " Automatically detect file types, and enable file-type-specific plugins and indentation
  autocmd BufNewFile,BufRead .bash_*      setlocal filetype=sh
  autocmd BufNewFile,BufRead *.txt        setlocal filetype=text
  autocmd BufNewFile,BufRead *.am         setlocal filetype=automake
  autocmd BufNewFile,BufRead *.cu,*.cuh   setlocal filetype=cpp
  autocmd BufNewFile,BufRead *.bbx,*.cbx  setlocal filetype=plaintex
  autocmd BufNewFile,BufRead *.tsv        setlocal filetype=tsv


  " FileType Specific Options
  autocmd FileType *                setlocal formatoptions=r nocindent colorcolumn=+1
  autocmd FileType tex,plaintex,bib setlocal textwidth=120 wrap formatoptions+=q colorcolumn=""
  autocmd FileType text             setlocal textwidth=120 wrap formatoptions+=tqn
  " Enable auto-wrapping comments, comment leader auto-insertion in <Insert> mode,
  " auto-format paragraphs, keep last line indentation. Disable all other format options.
  " NOTE: Requires 'set autoindent'. autocmd FileType is required since formatoptions is
  " set differently for each file type (.c, .py, etc.).
  " set cinoptions=>s,{0,}0,?0,^0,:0,=s,g0,p0,t0,+s,(0,)20,*30
  " autocmd FileType python,pl,java,h,hpp,c,cpp,cuda set textwidth=120 formatoptions+=coq cindent
  " autocmd FileType java,h,hpp,c,cpp,cuda set comments=sr:/*,mb:*,ex:*/
  " autocmd FileType java,h,hpp,c,cpp,cuda set comments=bsl:///,m://,be:///

  " FileType Specific Indentation
  " expandtab = All tabs will be spaces.
  " softabstop = How many spaces will a tab take when 'expandtab' is on.
  " smarttab = delete chunks of spaces like tabs.
  " tabstop = How many spaces is a tab (visually).
  " shiftwidth = How many spaces will a 'shift' command take.
  autocmd FileType *                    setlocal expandtab smarttab tabstop=2 softtabstop=2 shiftwidth=2 " This includes default behaviour.
  autocmd FileType make,automake        setlocal noexpandtab
  autocmd FileType python               setlocal tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType html,javascript,css  setlocal tabstop=2 softtabstop=2 shiftwidth=2
  autocmd FileType tsv                  setlocal tabstop=15 softtabstop=4 shiftwidth=4
endif
