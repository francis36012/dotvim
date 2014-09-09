set ts=4
set sts=4
set sw=4 noexpandtab
set nowrap
set noeol
set autoindent
set number

" What I'm used to
set nocp
set bs=indent,eol,start
set whichwrap+=<,>,h,l

" Show current line
set cursorline

set laststatus=2
set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%
set ruler

set fileformat=unix
set fileformats=unix,dos
set encoding=utf8

" try	
"	set t_Co=256
"	colorscheme solarized 
" catch
"	set t_Co=8
"	colorscheme evening
" endtry

"set t_Co=256
"set background=dark
"colorscheme solarized

execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

try	
	set t_Co=256
	set background=dark
	colorscheme hemisu 
catch
	set t_Co=8
	colorscheme evening
endtry

set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : <C-x><C-0><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Make search easier by ignoring case showing matches
set ignorecase
set showmatch
set hlsearch
noremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Setup NERDTree
" Toggle with F2
map <F2> :NERDTreeToggle<CR>

" Show hidden files
let NERDTreeShowHidden=0

" Bind 'jk' and 'kj' to <Esc>
inoremap jk <Esc>
inoremap kj <Esc>

" TagList
map <F8> :TlistToggle<CR>
let Tlist_Show_One_File=1	" Show tags for the current buffer only
let Tlist_Use_Right_Window=1	" Open on right side of window
let Tlist_Enable_Fold_Column=0	" Dont fold
let Tlist_Use_SingleClick=1	" Single click takes cursor to where tag is
let Tlist_Inc_Winwidth=0	" Don't increase window width automatically

" Auto-Pairs
let g:AutoPairsFlyMode=1
