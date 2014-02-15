filetype off

call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

source $VIMRUNTIME/ftplugin/man.vim
source $VIMRUNTIME/macros/matchit.vim

let base16colorspace=256

if has('gui_running') 
  colorscheme base16-ocean
else 
  colorscheme base16-solarized
endif
set background=dark
syntax on
filetype on
filetype plugin indent on

"set foldmethod=syntax

set nu
set smartindent
set ts=2
set ch=2
set shiftwidth=2
set expandtab
set nostartofline    
set showmatch " When a bracket is inserted, briefly jump to the matching one.
set matchtime=3
" Put a colored line at the 80 char line
set colorcolumn=80
set vb
set matchpairs+=<:>     
let g:slimv_menu=1
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = { 'mode': 'active',
			\ 'active_filetypes': ['ruby', 'php', 'javascript', 'json'],
			\ 'passive_filetypes': ['puppet'] }

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType js set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

au BufRead, BufNewFile *.md set ft=markdown syntax=markdown
au BufRead, BufNewFile *.h set ft=c syntax=c

au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
au BufRead,BufNewFile behave.js set ft=javascript syntax=jquery

autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType xhtml let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType mason let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType xml let b:match_words = '<\(\w\w*\):</\1,{:}'

nnoremap <F5> :GundoToggle<CR>
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprev<CR>
nmap <C-S-t> :tabnew<CR>
map <F2> :NERDTreeToggle<CR>

"fuzzy finder, find files quickly.
"map <leader>t :FuzzyFinderTextMate<CR>


let g:Powerline_symbols = 'fancy'
let mapleader=","
set laststatus=2


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar


function! DelTagOfFile(file)
  let fullpath = a:file
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let f = substitute(fullpath, cwd . "/", "", "")
  let f = escape(f, './')
  let cmd = 'sed -i "/' . f . '/d" "' . tagfilename . '"'
  let resp = system(cmd)
endfunction

function! UpdateTags()
  let f = expand("%:p")
  let cwd = getcwd()
  let tagfilename = cwd . "/tags"
  let cmd = 'ctags -a -f ' . tagfilename . ' --c++-kinds=+p --fields=+iaS --extra=+q ' . '"' . f . '"'
  call DelTagOfFile(f)
  let resp = system(cmd)
endfunction

autocmd BufWritePost *.cpp,*.h,*.c, *.hpp call UpdateTags()

"Here i'll add different indentation settings for different filetypes
autocmd Filetype haml setlocal noexpandtab ts=2 sts=2

let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
set exrc
