syntax on

colorscheme desert

setlocal incsearch
"setlocal number
setlocal autoindent
setlocal hlsearch
setlocal tabstop=4
setlocal expandtab
setlocal shiftwidth=4
setlocal ambiwidth=double
setlocal formatoptions=mM
setlocal smartcase
setlocal wrapscan
setlocal showcmd
setlocal display=lastline

highlight Todo ctermfg=7 ctermbg=8

" ハイライトを消す
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" 行末の半角スペースを削除する。
nmap @a :%s/\s*$//g<CR><Esc><Esc>

autocmd FileType * setlocal formatoptions-=ro

" シンタックス切り替え
nmap ;s :call ToggleSyntax()<CR>
function ToggleSyntax()
  if exists("g:syntax_on")
    syntax off
    setlocal paste
  else
    syntax on
    setlocal nopaste
  endif
endfunction

" -----------------------------------------------------------------------------
" Vundle
setlocal nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Vundle本体
Bundle 'gmarik/vundle'

" 追加
Bundle 'mattn/zencoding-vim'
Bundle 'surround.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'thinca/vim-ref'

" -----------------------------------------------------------------------------
" Zen-codingの設定
let g:user_zen_settings = {
\ 'lang' : 'ja',
\ 'indentaioon': '  '
\}

" -----------------------------------------------------------------------------
"neocomplcacheの設定

" 補完ウインドウの設定
setlocal completeopt=menuone

" 起動時に有効
let g:neocomplcache_enable_at_startup = 1

" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
 
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
 
let g:neocomplcache_enable_camel_case_completion  =  1
 
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
 
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
 
" ディクショナリ定義
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php' : $HOME . '/.vim/dict/php.dict',
    \ 'ctp' : $HOME . '/.vim/dict/php.dict'
    \ }
 
if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
 
" スニペットを展開する。スニペットが関係しないところでは行末まで削除
imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
smap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
 
" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()
 
" 補完候補のなかから、共通する部分を補完します
inoremap <expr><C-l> neocomplcache#complete_common_string()
 
" 改行で補完ウィンドウを閉じる
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
 
"tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
 
" <C-h>や<BS>を押したときに確実にポップアップを削除します
" 「無効な式です」とでて動かないのでコメントアウト
"inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
 
" 現在選択している候補を確定します
inoremap <expr><C-y> neocomplcache#close_popup()
 
" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel

" -----------------------------------------------------------------------------
" vim-refの設定
let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'

" -----------------------------------------------------------------------------
