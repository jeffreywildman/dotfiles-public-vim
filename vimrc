runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on


" Colors
set background=dark
let g:zenburn_high_Contrast=1
let g:zenburn_alternate_Visual=1
colorscheme zenburn


" MiniBufExplorer Configuration
" cycle buffers forward and backward
nmap <C-n> :MBEbn<CR>
nmap <C-p> :MBEbp<CR>
" allow cycling around the end of buffer list
let g:miniBufExplCycleArround = 1 

map <Leader>b :MBEOpen<CR> 
map <Leader>c :MBEClose<CR>
map <Leader>t :MBEToggle<CR>

" always display MBE
let g:miniBufExplBuffersNeeded = 1

" split below or right of the current window
let g:miniBufExplBRSplit = 1
