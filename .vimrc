" NeoBundleで管理してるプラグインを読み込む
source ~/.vimrc.bundle

" Vi互換をオフ
set nocompatible
" スワップファイルを作成する
set swapfile
" スワップファイル用ディレクトリ
set directory=~/.vimtmp
" バックアップファイルを作成する
set backup
" バックアップファイル用ディレクトリ
set backupdir=~/.vimtmp
" OSのクリップボードを使用する
set clipboard=unnamed
" 行番号を表示する
set number
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" インクリメンタルサーチを行う
set incsearch
" シフト移動幅
set shiftwidth=4
" ファイル内の Tab が対応する空白の数
set tabstop=4
" タブの代わりに空白文字を挿入する
set expandtab
" 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
set smarttab
" 新しい行のインデントを現在行と同じにする
set autoindent
" 新しい行を作ったときに高度な自動インデントを行う
set smartindent
" タブ文字、行末など不可視文字を表示する
set list
" listで表示される文字のフォーマットを指定する
set listchars=eol:$,tab:>\ ,extends:<
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" 閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
" 検索時に大文字を含んでいたら大/小を区別
set smartcase
" 検索をファイルの先頭へループしない
set nowrapscan
" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" unite.vmの設定
" insert modeで開始
let g:unite_enable_start_insert = 1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" unite grep に ag (The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" NERDTreeの設定
" <C-e>でNERDTreeをオンオフ いつでもどこでも
nmap <silent> <C-e>      :NERDTreeToggle<CR>
vmap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
omap <silent> <C-e>      :NERDTreeToggle<CR>
imap <silent> <C-e> <Esc>:NERDTreeToggle<CR>
cmap <silent> <C-e> <C-u>:NERDTreeToggle<CR>
" 引数なしでvimを開いたらNERDTreeを起動、
" 引数ありならNERDTreeは起動しない、引数で渡されたファイルを開く
autocmd vimenter * if !argc() | NERDTree | endif
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 無視するファイルを設定する
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
" 隠しファイルを表示するか
let g:NERDTreeShowHidden=0
" ブックマークやヘルプのショートカットをメニューに表示する
let g:NERDTreeMinimalUI=1
" +|`などを使ってツリー表示をするか
" 0 : 綺麗に見せる
" 1 : +|`などを使わない
let g:NERDTreeDirArrows=1
" マウス操作方法
" 1 : ファイル、ディレクトリ両方共ダブルクリックで開く
" 2 : ディレクトリのみシングルクリックで開く
" 3 : ファイル、ディレクトリ両方共シングルクリックで開く
let g:NERDTreeMouseMode=2

" Color Scheme
syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized

" Libraries for Script Language Interfaces
"let $PERL_DLL="/usr/local/lib/perl5/5.12.0/darwin-2level/CORE/libperl.dylib"
let $PYTHON_DLL="/usr/local/Frameworks/Python.framework/Versions/2.7/Python"
"let $PYTHON3_DLL="/usr/local/Frameworks/Python.framework/Versions/3.3/Python"
"let $RUBY_DLL="/usr/local/lib/libruby.1.8.dylib"
"let $LUA_DLL="/usr/local/Cellar/lua52/5.2.1/lib/liblua.dylib"
