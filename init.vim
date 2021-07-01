if has('win32') || has('win64')
  "let g:python3_host_prog = 'C:\Python37\python.exe'
  let g:python3_host_prog = '~\AppData\Local\Programs\Python\Python39\python.exe'
endif
set nocompatible
" 他のアプリとコピペ可能に
set clipboard+=unnamed
" 行番号表示
set number
set relativenumber
set ruler
" バックアップなどの余計なファイルを作らない
set noundofile
set noswapfile
set nobackup
" 不可視文字の可視化
set list
set listchars=tab:>.,trail:_,extends:>,precedes:<,nbsp:%
" かっこ入力時に対応するかっこを表示
set showmatch
" 検索列が小文字の時大小の区別をなくす
set ignorecase
" 検索列に大文字があれば大小の区別あり
set smartcase
" 検索列入力中に順次ヒットさせる
set incsearch
" 検索語をハイライト表示
set hlsearch
nnoremap <Esc><Esc> :noh<CR>
" エラー表示時にビープ音を鳴らさない
set noerrorbells
set visualbell t_vb=
" また実行していないコマンドを表示
set showcmd
" 保存せずにバッファを移動するとき，エラーを表示しない
set hidden
" tabを半角スペースに
set expandtab
" indent width
set shiftwidth=2
" tab width
set softtabstop=2
" tab の表示幅
set tabstop=2
" yでコピー時クリップボードに入れる
set guioptions+=a
" 改行時の末尾に合わせてインデント
set smartindent
set shellslash

" dein.vim settings
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein installation check
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  let s:rc_dir = expand('~/nvim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'
  let s:toml_lazy = s:rc_dir . '/dein_lazy.toml'
  let s:toml_code = s:rc_dir . '/dein_vscode.toml'
  let s:toml_code_lazy = s:rc_dir . '/dein_vscode_lazy.toml'
  if !exists('g:vscode')
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:toml_lazy, {'lazy': 1})
  else
    call dein#load_toml(s:toml_code, {'lazy': 0})
    call dein#load_toml(s:toml_code_lazy, {'lazy': 1})
  endif
  call dein#end()
  call dein#save_state()
endif
" plugin installation check {{{
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

filetype plugin indent on
syntax enable
colorscheme hybrid

"" キーマップ変更
inoremap <C-a> <Esc>A
"inoremap <C-i> <Esc>I
nnoremap <CR> i<Enter><Esc>
inoremap <C-v> <C-r>*
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
nnoremap sv :<C-u>vs<CR> " vsplit
nnoremap sh :<C-u>sp<CR> " hsplit
nnoremap st :<C-u>tabnew<CR> " newtab
nnoremap sn gt " next tab
nnoremap sp gT " previous tab
nnoremap sq :<C-u>q<CR> " quit tab
if exists('g:vscode')
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
endif