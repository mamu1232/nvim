let g:python3_host_prog = 'C:\Users\akira\AppData\Local\Programs\Python\Python37\python.exe'
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

" dein.vim
if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')
  call dein#load_toml('~/.config/nvim/dein.toml',{'lazy':0})
  call dein#load_toml('~/.config/nvim/dein_lazy.toml',{'lazy':1})
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
filetype plugin indent on
syntax enable
colorscheme hybrid

"" キーマップ変更
inoremap <C-z> <Esc>A
inoremap <C-a> <Esc>I
nnoremap <CR> i<Enter><Esc>
inoremap <C-h> <Left>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-v> <C-r>*
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
