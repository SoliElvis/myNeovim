"Neovim config
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


call plug#begin('~/.config/nvim/plugged')

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

"emacsy---------------------------------
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'pelodelfuego/vim-swoop'
Plug 'tpope/vim-speeddating'
Plug 'jceb/vim-orgmode'
"vimy stuff-------------------------------------
Plug 'zhou13/vim-easyescape'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'easymotion/vim-easymotion'
Plug 'farmergreg/vim-lastplace'
Plug 'airblade/vim-gitgutter'
Plug 'Chiel92/vim-autoformat'
Plug 'ntpeters/vim-better-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'pbrisbin/vim-mkdir'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
"" fuzzy finder
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
"" language
Plug 'sheerun/vim-polyglot'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"" color
Plug 'cocopon/iceberg.vim'
Plug 'sjl/badwolf'
call plug#end()

" Quickly edit/reload this configuration file
nnoremap gev :e $MYVIMRC<CR>
nnoremap gsv :so $MYVIMRC<CR>
set clipboard=unnamedplus
" pure vim
augroup Rc
  autocmd!
augroup END

set autoread
set nobackup
set nolazyredraw
set nowritebackup
set swapfile
set tildeop
set ttyfast
set visualbell
set wildmenu
set wildmode=full
filetype plugin indent on
autocmd Rc BufWinEnter * set mouse=
"" space setting

set autoindent
set list
set shiftround
set shiftwidth=2
set smartindent
set smarttab
set tabstop=2
set expandtab

"" appearance
syntax on
set backspace=indent,eol,start
set colorcolumn=80
set completeopt=menu
set cursorline
set hlsearch
set inccommand=nosplit
set incsearch
set number
set relativenumber
set shortmess=a
set showcmd
set showmatch
set showmode
set splitbelow
set splitright
set wrap
autocmd Rc BufEnter * EnableStripWhitespaceOnSave


""------------------------------------------------------------"
"" keymaps

"basic
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap gj j
nnoremap gk k
nnoremap <esc><esc> :nohlsearch<cr>
nnoremap Y y$

let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>


"drag stuff with meta
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"emacs in insert mode
inoremap <c-a> <Home>
inoremap <c-b> <Left>
inoremap <c-e> <End>
inoremap <c-f> <Right>
inoremap <M-b> <C-O>b
inoremap <M-f> <C-O>w
inoremap <M-b> <C-O>b
inoremap <M-f> <C-O>w
inoremap <c-k> <Esc>lDa
inoremap <c-u> <Esc>d0xi
inoremap <c-y> <Esc>Pa
inoremap <c-x><c-s> <Esc>:w<CR>

"fzf
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
      \ 'prefix': '^.*$',
      \ 'source': 'rg -n ^ --color always',
      \ 'options': '--ansi --delimiter : --nth 3..',
      \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }}))
"words completion
"inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

" Default fzf layout
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =  {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'],
      \}

""-------------------------------"
" which key
autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
set timeoutlen=500
let g:which_key_map =  {}
let g:which_key_map['g'] = {
      \ 'name' : '+git fugitive',
      \ 's': ['Gstatus' , 'status'],
      \ 'd': ['Gdiff' , 'diff'],
      \ 'e': ['Gedit' , 'edit'],
      \ }

let g:which_key_map['f']= {
      \ 'name' : '+find' ,
      \ 'F' : ['Files' , 'files'],
      \ 'f' : ['GitFiles' , 'git files'],
      \ 't' : ['BTags' , 'buffer tags'],
      \ 'T' : ['Tags' , 'all buffer tags'],
      \ 'b' : ['Buffers'  , 'search buffers' ],
      \ 'h' : ['History' , 'history'],
      \ 'r' : ['Rg', 'rip'],
      \ 'l' : ['Lines' , 'Lines'],
      \ 'w' : ['Helptags' , 'Help'],
      \ }

let g:which_key_map['w'] = {
      \ 'name' : '+windows' ,
      \ 'w' : ['<C-W>w'     , 'other-window']          ,
      \ 'd' : ['<C-W>c'     , 'delete-window']         ,
      \ '-' : ['<C-W>s'     , 'split-window-below']    ,
      \ '|' : ['<C-W>v'     , 'split-window-right']    ,
      \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
      \ 'h' : ['<C-W>h'     , 'window-left']           ,
      \ 'j' : ['<C-W>j'     , 'window-below']          ,
      \ 'l' : ['<C-W>l'     , 'window-right']          ,
      \ 'k' : ['<C-W>k'     , 'window-up']             ,
      \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
      \ 'J' : ['resize +5'  , 'expand-window-below']   ,
      \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
      \ 'K' : ['resize -5'  , 'expand-window-up']      ,
      \ '=' : ['<C-W>='     , 'balance-window']        ,
      \ 's' : ['<C-W>s'     , 'split-window-below']    ,
      \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
      \ '?' : ['Windows'    , 'fzf-window']            ,
      \ 'm' : ['only'   ,      'maximize']                   ,
      \ }

"------------------------------------""
" plugin settings
"" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1


let g:current_line_whitespace_disabled_soft=1
let g:defaultWinSwoopHeight = 15

"" auto-pairs
let g:AutoPairsMapCh = 0
let g:AutoPairsMapCR = 0
let g:AutoPairsShortcutBackInsert='<M-i>'

"" autoformat
autocmd Rc BufEnter,BufWinEnter,BufRead,BufNewFile *
      \ if &filetype == "" | set filetype=text | endif
autocmd Rc BufWrite * :Autoformat

let g:lightline = { 'colorscheme': 'iceberg' }
colorscheme iceberg
highlight Normal      ctermbg=none
highlight NonText     ctermbg=none
highlight EndOfBuffer ctermbg=none
highlight VertSplit   cterm=none ctermfg=240 ctermbg=240


command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

command! -bang Colors
      \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)


"functions
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()


function! DeleteFileSwaps()
  write
  let l:output = ''
  redir => l:output
  silent exec ':sw'
  redir END
  let l:current_swap_file = substitute(l:output, '\n', '', '')
  let l:base = substitute(l:current_swap_file, '\v\.\w+$', '', '')
  let l:swap_files = split(glob(l:base.'\.s*'))
  " delete all except the current swap file
  for l:swap_file in l:swap_files
    if !empty(glob(l:swap_file)) && l:swap_file != l:current_swap_file
      call delete(l:swap_file)
      echo "swap file removed: ".l:swap_file
    endif
  endfor
  " Reset swap file extension to `.swp`.
  set swf! | set swf!
  echo "Reset swap file extension for file: ".expand('%')
endfunction
command! DeleteFileSwaps :call DeleteFileSwaps()
