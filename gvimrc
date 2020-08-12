"=== Gui(GVim) Settings =============================================================
"colorscheme leo
"colorscheme koehler
"colorscheme badwolf
colorscheme onedark
set background=dark

set columns=130
set lines=30
set guioptions=aiM
set mouse=a
set mousehide
set nomousefocus
set visualbell t_vb=

"=== Functions & Scripts ===================================================
if has('win32')
  set guifont=HackGen:h11:cSHIFTJIS
else
  "set guifont=Ricty\ Discord\ 12
  "set guifont=M+\ 1m\ Regular\ 11
  "set guifont=Sarasa\ Mono\ J\ Regular\ 11
  set guifont=HackGen\ Regular\ 11
endif

" IME動作時の動作
if has('multi_byte_ime') || has('xim')
  highlight CursorIM guibg=Purple guifg=NONE
"   " 挿入モード・検索モードでのデフォルトのIME状態設定
"   set iminsert=0 imsearch=0
"   if has('xim') && has('GUI_GTK')
"     " XIMの入力開始キーを設定:
"     " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
"     set imactivatekey=sc-space
"   endif
"   " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
"   "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

