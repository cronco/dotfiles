filetype off

call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

source $VIMRUNTIME/ftplugin/man.vim
source $VIMRUNTIME/macros/matchit.vim

let base16colorspace=256

set background=dark

if has('gui_running')
  colorscheme base16-ocean
else
  colorscheme seoul256
endif

syntax on
filetype on
filetype plugin indent on

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
set gfn=Mensch\ 9
set matchpairs+=<:>     
let g:slimv_menu=1
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = { 'mode': 'active',
			\ 'active_filetypes': ['ruby', 'php', 'javascript', 'json']
      \	}

autocmd FileType c set omnifunc=ccomplete#Complete

au BufRead, BufNewFile *.md set ft=markdown syntax=markdown
au BufRead, BufNewFile *.h set ft=c syntax=c

autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType xhtml let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType mason let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd FileType xml let b:match_words = '<\(\w\w*\):</\1,{:}'
autocmd BufNewFile,BufReadPost *.md set filetype=markdown " set md extension for markdown files

nnoremap <F5> :GundoToggle<CR>
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprev<CR>
nmap <C-T> :tabnew<CR>
map <F2> :NERDTreeToggle<CR>


let g:Powerline_symbols = 'fancy'
let mapleader=","
let maplocalleader= "\\"
set laststatus=2


set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions+=a


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

autocmd BufWritePost *.cpp,*.h,*.c, call UpdateTags()

"Here i'll add different indentation settings for different filetypes
autocmd Filetype haml setlocal noexpandtab ts=2 sts=2

let g:ctrlp_map = '<leader>t'

let g:ctrlp_cmd = 'CtrlP'

nnoremap <leader>b :CtrlPBuffer<CR>

"also take in consideration local .vimrc files
set exrc


"folding
set foldenable
set foldlevelstart=99 "if this doesn't open all folds, you have a problem
"
" space open/closes folds
nnoremap <space> za

set foldmethod=indent   " fold based on indent level

" highlight last inserted text
nnoremap gV `[v`]


" jk is escape
inoremap jk <esc>

nnoremap <leader>sv :source $MYVIMRC<CR>


set wildmenu "autocomplete for commands
set lazyredraw " redraw only when we need to.

set autoread "no more file has changed prompts.

let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

set incsearch " setup incremental search

set hlsearch " setup highlight search results

let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 0


function! LessToCss()
  " hack because we need to compile style.less
  let current_file = shellescape(expand('%:p'))
  let filename = shellescape(expand('%:r'))
  let command = "silent !lessc less/style.less static/css/style.css" 
  execute command
endfunction
autocmd BufWritePost,FileWritePost *.less call LessToCss()

" Maximize window
  fu! ZoomWindow()
    let [l:i, l:max, l:min] = [1, 0, 999999]
    while winwidth(l:i) > 0
      if winwidth(l:i) > l:max
        let l:max = winwidth(l:i)
      endif
      if winwidth(l:i) < l:min
        let l:min = winwidth(l:i)
      endif
      let l:i = l:i + 1
    endwhile
 
    if abs(l:max - l:min) > 5
      execute "normal ^W="
    else
      execute "normal ^W\|^W_"
    endif
  endfunction

  map <Leader>m :call ZoomWindow()<CR>

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:mustache_abbreviations= 1

set  t_Co=256 "256 terminal colors
