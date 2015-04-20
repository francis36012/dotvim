set nocp
set ts=4
set sts=4
set sw=4 noexpandtab
set colorcolumn=80
set nowrap
set noeol
set autoindent
set number

" What I'm used to
set bs=indent,eol,start
set whichwrap+=<,>,h,l

" Show current line
set cursorline

set laststatus=2
set statusline=[%n]\ %<%F\ \ \ [%M%R%H%W%Y][%{&ff}]\ \ %=\ line:%l/%L\ col:%c\ \ \ %p%%
set ruler

set fileformat=unix
set fileformats=unix,dos
set encoding=utf-8
setglobal fileencoding=utf-8

"set t_Co=256
"set background=dark
"colorscheme solarized

call pathogen#infect()
execute pathogen#helptags()
filetype off
syntax on
filetype plugin indent on

let g:go_disable_autoinstall = 0

try
	set t_Co=256
	colorscheme hybrid
	set background=dark
catch
	set t_Co=8
	colorscheme pablo
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

" Airline
let g:airline_theme="dark"
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" :let g:airline_detect_whitespace=0

" Neocomplcache
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 4

" Function to remove trailing white spaces
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

" remove white spaces when writing buffer
autocmd BufWrite * :call <SID>StripTrailingWhitespaces()
