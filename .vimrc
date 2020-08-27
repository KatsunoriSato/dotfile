"-------------------------------------
" この.vimrcを動作させるために必要な
" 作業は次の通り
"-------------------------------------
" 1. カラースキームの設定
" 2. vimプラグインマネージャーdein.vimのインストール
" 3. Homebrewのインストール
" 4. ripgrepのインストール
"
"-------------------------------------
" 1. カラースキームの設定
"-------------------------------------
"  $ mkdir ~/.vim
"  $ cd ~/.vim
"  $ mkdir colors
"  $ git clone https://github.com/tomasr/molokai
"  $ mv molokai/colors/molokai.vim ~/.vim/colors/
"
"
"-------------------------------------
" 2. vimプラグインマネージャーdein.vimのインストール
"-------------------------------------
"  $ mkdir -p ~/.cache/dein
"  $ curl
"  https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh "
"  sh ./installer.sh ~/.cache/dein
"
"-------------------------------------
" 3. Homebrewのインストール(Mac時)
"-------------------------------------
"  $ xcode-select --install
"  $ /usr/bin/ruby -e "$(curl -fsSL
"  https://raw.githubusercontent.com/Homebrew/install/master/install)"
"  $ brew doctor
"  $ brew --version
"
"
"-------------------------------------
" 4. ripgrepのインストール
"-------------------------------------
"  [Mac]
"  $ brew update
"  $ brew upgrade
"  $ brew install ripgrep
"
"  [Linux easy]
"  $ sudo apt install ripgrep
"
"  [Linux non easy]
"  $ cd ~/
"  $ curl https://sh.rustup.rs -sSf | sh
"  $ sudo apt-get install debhelper
"  $ sudo apt-get install devscripts
"  $ sudo apt-get install quilt
"  $ source $HOME/.cargo/env
"  $ cargo install ripgrep
"
"=======================================================================
" 以下 vim 設定
"=======================================================================
" ファイルを上書き前にバックアップしない
set nowritebackup
" ファイルを上書き前にバックアップしない
set nobackup
" vim の矩形選択で文字がなくても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効
set wildmenu

"-------------------------------
" 検索
"-------------------------------
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイルの先頭から再び検索
set wrapscan
" インクリメンタル検索（検索ワードの最初の文字を入力した時点で検索開始）
set incsearch
" 検索結果をハイライト表示
set hlsearch


"-------------------------------
" 表示設定
"-------------------------------
" カラースキーム
colorscheme molokai
" シンタックスハイライト
syntax on
" エラーメッセージの表示時にBeepを鳴らさない
set noerrorbells
" Windowsでパスの区切り文字をスラッシュで扱う
set shellslash
" 対応するカッコやブレースを表示
set showmatch matchtime=1
" インデント方法の変更
set cinoptions+=:0
" メッセージ表示欄を２行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略せずに表示
set display=lastline
" タブ文字を CTRL-I で表示し、行末に $ で表示する
set list
" 行末のスペースを可視化
set listchars=tab:^\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" コマンドラインの履歴を10000件保存
set history=10000
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" ファイルないにあるタブ文字の表示幅
set tabstop=2
" ツールバーを非表示にする
set guioptions-=T
" yでコピーした時にクリップボードに入れる
set guioptions+=a
" メニューバーを非表示にする
set guioptions-=m
" 右スクロールバーを非表示
set guioptions+=R
" 対応するカッコを強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外をおりたたむ（フォールドする）機能
" set nofoldenable
" タイトル表示
set title
" 行番号の表示
set number
" ヤンクでクリップボードにコピー
set clipboard=unnamed,autoselect
" ESCの２回でハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" すべての数を10進数として扱う
set nrformats=
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" バッファスクロール
set mouse=a

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')


  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/deoplete.nvim')

  call dein#add('godlygeek/tabular')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('previm/previm')

  call dein#add('Shougo/denite.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('itchyny/lightline.vim')
  call dein#add('itchyny/calendar.vim')

  call dein#add('junegunn/fzf', { 'build': './install -all', 'merged': 0})
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf'})

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" コメントの色を水色
highlight  Comment ctermfg=darkcyan

let g:vim_markdown_folding_disabled = 1
let g:previm_enable_realtime = 1
let g:previm_open_cmd = 'open -a Google\ Chrome'

"
" denite
" <C-o> open Denite-file-buffer-list
"   <Esc>    close Denite-file-buffer-list
"   <Space>  select multiple files/buffers
"   <CR>     open files/buffers
"   o        open files/buffers
"   s        open files/buffers in split windows (horizonal)
"   v        open files/buffers in split windows (vertical)
"   i        filter by string
"   ..       move to directory above
nnoremap <silent> <C-o> :<C-u>Denite file buffer file:new<CR>
autocmd FileTYpe denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <Esc>
          \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Space>
          \ denite#do_map('toggle_select').'j'
  nnoremap <silent><buffer><expr> <CR>
          \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> o
          \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> s
          \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v
          \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> i
          \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> ..
          \ denite#do_map('move_up_path')
endfunction

"-----------------------------------
" deniteのgrepをripgrepに変更
"-----------------------------------
" キー設定 denite-grep
" grep検索
nnoremap <silent> ,g  :<C-u>Denite grep -buffer-name=grep-buffer-denite<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>DeniteCursorWord grep -buffer-name=grep-buffer-denite<CR>
" grep検索結果の再呼び出し
nnoremap <silent> ,re :<C-u>Denite -resume -buffer-name=grep-buffer-denite<CR>
" grep検索結果の再呼び出し
nnoremap <silent> ,n :<C-u>Denite -resume -buffer-name=grep-buffer-denite -select=+1 -immediately<CR>
" grep検索結果の再呼び出し
nnoremap <silent> ,p :<C-u>Denite -resume -buffer-name=grep-buffer-denite -select=-1 -immediately<CR>


" Change file/rec command.
call denite#custom#var('file/rec', 'command',
      \ ['rg', '--files', '--glob', '!.git'])

" Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'default_opts',
      \ ['-i', '--vimgrep', '--no-heading'])

" lightline setting
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" calendar.vim setting
let g:calendar_google_calendar = 1

