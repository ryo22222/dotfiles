scriptencoding utf-8

" 文字コード、改行コード {{{
set encoding=utf-8
set fileformats=unix,dos,mac
" }}} / 文字コード、改行コード

" neobundle.vim {{{
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
call neobundle#end()

" color schema
NeoBundle 'tomasr/molokai'
NeoBundle 'Align'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'minibufexpl.vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'rking/ag.vim'
NeoBundle 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
" NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'The-NERD-tree'
NeoBundle 'toyamarinyon/vim-swift'
" NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-abolish'
" NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'vim-ruby/vim-ruby'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'

""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""

filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
" }}} / neobundle.vim

" matchit.vim {{{
source $VIMRUNTIME/macros/matchit.vim
" }}} / matchit.vim

" Load Settings {{{
" http://vim-users.jp/2009/12/hack108/
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
" }}} / Load Settings

" Leader {{{
let mapleader="," " <Leader>キー
" }}} / Leader


" Color Settings {{{
if &t_Co > 1
  syntax enable
endif
colorscheme molokai
" }}} / Color Settings

" Settings {{{
set autoindent
set autoread " 自動読み直し
set backspace=indent,eol,start "バックスペースキーで削除できるものを指定
set clipboard=unnamed " コピーしたものがレジスタにも入るようにする
" set cursorline " カーソル行をハイライト 重い...
set hidden " 編集中でも他のファイルを開けるようにする
set history=50 " コマンド・検索パターン履歴数
set laststatus=2 " 常にステータラスラインを表示
set list " 不可視文字表示
" set listchars=tab:>\ ,extends:<
set listchars=tab:>-,trail:-,extends:>,precedes:<
set modelines=0 " モードラインは無効
set nobackup
" set backup
" set backupdir=~/.vim/backups
set noswapfile
" set swapfile
" set directory=~/.vim/swaps
set number " 行番号表示
set ruler " ルーラーを表示
set scrolloff=5 " スクロール時の余白確保
set showcmd " コマンドをステータス行に表示
set showmatch " 対応する括弧をハイライト
set showmode " 現在のモードを表示
set smartindent
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc  " ワイルドカードで表示するときに優先度を低くする拡張子
set textwidth=0 " 自動で折り返しをしない
set title " タイトルを表示する
set ttyfast " 高速ターミナル接続を行う
set vb t_vb= " ビープ音を鳴らさない
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末で止まらないようにする
set wildchar=<tab> " コマンド補完開始キー
set wildmenu " コマンド補完を強化
set wildmode=list:longest " リスト表示
" set wildmode=list,full
" }}} / Settings

" Search Settings {{{
set incsearch " インクリメンタルサーチ
set ignorecase " 大文字小文字無視
set hlsearch " 検索文字をハイライト
set smartcase " 大文字は区別する
" }}} / Search Settings

" FileType Settings {{{
" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2

set expandtab
set smarttab

if has("autocmd")
  augroup MyAutoCmd
    autocmd!

    autocmd FileType * set formatoptions-=ro " 改行時にコメントしない

    autocmd FileType php setlocal ts=2 sts=2 sw=2
    autocmd FileType c setlocal ts=4 sw=4 noexpandtab
    autocmd FileType java setlocal ts=4 sts=4 sw=4
    autocmd FileType html,xhtml,css,scss,javascript,coffee,sh,sql,yaml setlocal ts=2 sts=2 sw=2

    " for Rails
    autocmd BufNewFile,BufRead app/*/*.erb setlocal ft=eruby fenc=utf-8
    autocmd BufNewFile,BufRead app/**/*.rb setlocal ft=ruby  fenc=utf-8
    autocmd BufNewFile,BufRead app/**/*.yml setlocal ft=ruby  fenc=utf-8
    autocmd FileType ruby,haml,eruby,sass,mason setlocal ts=2 sts=2 sw=2 et nowrap

    " for Cake PHP
    autocmd BufNewFile,BufRead *.ctp set filetype=php

    " for Node.js
    autocmd BufNewFile,BufRead *.ejs set filetype=javascript

    " for markdown
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    autocmd FileType markdown hi! def link markdownItalic LineNr

    " for coffeescript
    autocmd FileType coffee setlocal nowrap
  augroup END
endif
" }}} / FileType Settings

" Window Settings {{{
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

" height
nnoremap + <C-w>+
nnoremap - <C-w>-
" width
nnoremap ) <C-w>>
nnoremap ( <C-w><LT>

" }}} / Window Settings


" Tab Settings {{{
nnoremap T :tabnew<CR>
nnoremap <leader>tx :tabclose<CR>
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tn :tabNext<CR>
" }}} / Tab Settings


" Other Settings {{{
nnoremap <silent><Space>j :Explore<CR> " ファイラー起動

" .vimrcや.gvimrcを編集するためのKey-mappingを定義する
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

nnoremap <ESC><ESC> :nohlsearch<CR><ESC> " 検索結果ハイライトをESCキーの連打でリセットする

" インサートモードでもhjklで移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" インサートモードを抜ける
inoremap <silent> jj <esc>

" 0, 9で行頭、行末へ
nmap 0 ^
nmap 9 $

" ビジュアルモード時vで行末まで選択
xnoremap v $h

function! s:remove_dust()
  let cursor = getpos(".")
  %s/\s\+$//ge " 保存時に行末の空白を除去する
  %s/\t/  /ge " 保存時にtabを2スペースに変換する
  call setpos(".", cursor)
  unlet cursor
endfunction
augroup RemoveDust
  "autocmd BufWritePre * call <SID>remove_dust()
augroup END

"挿入モードで",date",',time'で日付、時刻挿入
inoremap <Leader>date <C-R>=strftime('%Y/%m/%d')<CR>
inoremap <Leader>time <C-R>=strftime('%H:%M')<CR>

" Buffer Settings
noremap <Space> :bn!<CR>
noremap <S-Space> :bp!<CR>

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=red guibg=darkgray
match ZenkakuSpace /　/

" copypath
function! CopyPath()
  let @*=expand('%:P')
endfunction

function! CopyFullPath()
  let @*=expand('%:p')
endfunction

function! CopyFileName()
  let @*=expand('%:t')
endfunction

command! CopyPath     call CopyPath()
command! CopyFullPath call CopyFullPath()
command! CopyFileName call CopyFileName()

nnoremap <silent>cp :CopyPath<CR>
nnoremap <silent>cfp :CopyFullPath<CR>
nnoremap <silent>cf :CopyFileName<CR>

" http://vim-users.jp/2011/04/hack214/
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(
" }}} / Other Settings


" PHP Settings {{{
let php_sql_query = 1 " SQLをハイライトする
let php_htmlInStrings = 1 " HTMLをハイライト
let php_noShortTags = 1 " ショートタグ「< ?」はハイライトしないようにする
" let php_folding = 1 " クラスと関数の折りたたむ
" }}} / PHP Settings


" Plugin Settings {{{

" Align {{{
let g:Align_xstrlen = 3 " Alignを日本語環境で使用するための設定
" }}} / Align


" NERDTree {{{
map <C-n> :NERDTreeToggle<CR>
" }}} / NERDTree


" neocomplcache {{{
"  " Disable AutoComplPop.
"  let g:acp_enableAtStartup = 0
"  " Use neocomplcache.
"  let g:neocomplcache_enable_at_startup = 0
"  " Use smartcase.
"  let g:neocomplcache_enable_smart_case = 1
"  " Set minimum syntax keyword length.
"  let g:neocomplcache_min_syntax_length = 3
"  let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"  " Define dictionary.
"  let g:neocomplcache_dictionary_filetype_lists = {
"      \ 'default' : '',
"      \ 'ruby' : $HOME . '/dotfiles/.vim/dict/ruby.dict',
"      \ 'php' : $HOME . '/dotfiles/.vim/dict/php.dict',
"      \ 'javascript' : $HOME.'/dotfiles/.vim/dict/javascript.dict',
"      \ 'coffee' : $HOME.'/dotfiles/.vim/dict/javascript.dict',
"      \ 'ejs' : $HOME.'/dotfiles/.vim/dict/javascript.dict',
"      \ 'css' : $HOME.'/dotfiles/.vim/dict/css.dict'
"      \ }
"
"
"  " Define keyword.
"  if !exists('g:neocomplcache_keyword_patterns')
"      let g:neocomplcache_keyword_patterns = {}
"  endif
"  let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"  " Plugin key-mappings.
"  inoremap <expr><C-g>     neocomplcache#undo_completion()
"  inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"  " Recommended key-mappings.
"  " <CR>: close popup and save indent.
"  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"  function! s:my_cr_function()
"    return neocomplcache#smart_close_popup() . "\<CR>"
"  endfunction
"  " <TAB>: completion.
"  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"  " <C-h>, <BS>: close popup and delete backword char.
"  inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"  inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"  inoremap <expr><C-y>  neocomplcache#close_popup()
"  inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
"  " Enable heavy omni completion.
"  if !exists('g:neocomplcache_omni_patterns')
"    let g:neocomplcache_omni_patterns = {}
"  endif
"  let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"  let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"  let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"  let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"
"  " Disable NeoComplCache for certain filetypes
"  if has('autocmd')
"    autocmd FileType ruby nested NeoComplCacheLock
"    autocmd FileType eruby nested NeoComplCacheLock
"  endif
" }}} / neocomplcache


" neosnippet {{{
" Plugin key-mappings.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

imap <C-t> <Plug>(neosnippet_expand_or_jump)
smap <C-t> <Plug>(neosnippet_expand_or_jump)
xmap <C-t> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/dotfiles/.vim/snippets'
" }}} / neosnippet


" MiniBufExplorer {{{
noremap <C-m> :TMiniBufExplorer<CR>
" let g:miniBufExplVSplit = 20
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
" }}} / MiniBufExplorer


" quickrun.vim {{{
" 初期化
let g:quickrun_config = {}
" runnerにvimprocを設定
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config._ = {'runner/vimproc/updatetime' : 100}
" 横分割をするようにする
let g:quickrun_config={'*': {'split': ''}}
" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright

" PHPUnit
augroup PHPUnitQuickRun
  autocmd!
  autocmd BufWinEnter,BufNewFile *test.php set filetype=phpunit
augroup END

let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter/buffer/split'] = 'vertical 35'
let g:quickrun_config['phpunit']['command'] = 'phpunit'
let g:quickrun_config['phpunit']['cmdopt'] = ''
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'
let g:quickrun_config['phpunit']['output_filetype'] = 'phpunit-result'

" markdownファイルをブラウザで開く
let g:quickrun_config['markdown'] = {
    \ 'outputter': 'browser',
    \ }

" coffeeScript
let g:quickrun_config.coffee = {'command': 'coffee'}
" }}} / quickrun.vim


" unite.vim {{{
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]

" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" 最近使ったファイルの一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" 最近使ったファイルとバッファ
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 全部
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" }}} / unite.vim

" emmet-vim {{{
let g:user_emmet_settings = {
\   'lang' : 'ja'
\ }
" }}} / emmet-vim


" open-browser.vim {{{
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" 検索する
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>
" }}} / open-browser.vim


" vim-over {{{
nnoremap <Leader>o :OverCommandLine<CR>

" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>

" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>
" }}} / vim-over

" vim-rails {{{
" map <Leader>m :Rmodel
" map <Leader>c :Rcontroller
" map <Leader>v :Rview
" map <Leader>u :Runittest
" map <Leader>f :Rfunctionaltest
" map <Leader>tm :RTmodel
" map <Leader>tc :RTcontroller
" map <Leader>tv :RTview
" map <Leader>tu :RTunittest
" map <Leader>tf :RTfunctionaltest
" map <Leader>sm :RSmodel
" map <Leader>sc :RScontroller
" map <Leader>sv :RSview
" map <Leader>su :RSunittest
" map <Leader>sf :RSfunctionaltest
" }}} / vim-rails

" markdown {{{
let g:markdown_fenced_languages = [
\  'coffee',
\  'css',
\  'erb=eruby',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'sass',
\  'xml',
\  'php'
\]
" }}} / markdown

" }}} / Plugin Settings
