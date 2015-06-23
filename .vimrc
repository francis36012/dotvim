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
set statusline=[%n][%t]%m%r%h%w%y[%{&ff}][%{(&fenc!=''?&fenc:&enc)}]\ \ %=\ L%l/%L\ Col:%c\ \ \ %p%%
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
	colorscheme base16-solarized
	let base16colorspace=256
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

let g:snipMate = {}
let g:snipMate['snippets_dir'] = funcref#Function('return ["~/.vim/bundle/vim-snippets/snippets"]')

" Auto-Pairs
let g:AutoPairsFlyMode=1

" Airline
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols = {}
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#tabline#show_buffers = 1

" Neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimeter = 1
let g:neocomplete#enable_refresh_always = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary
let g:neocomplete#sources#dictionary#dictionaries = {
	\ 'default' : '',
	\ 'vimshell' : $HOME.'/.vimshell_hist',
	\ 'scheme' : $HOME.'/.gosh_completions'}

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	return neocomplete#close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" AutoComplPop like behaviour.
let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
	let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Function to remove trailing white spaces
fun! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

command! Rrc :so $MYVIMRC

" remove white spaces when writing buffer
autocmd BufWrite * :call <SID>StripTrailingWhitespaces()
