" vim: et ts=2 sts=2 sw=2 tw=0

"=== Global Settings ======================================================
scriptencoding utf-8
set encoding=utf-8
set nocompatible

" VIMの動作
set ambiwidth=double
set cursorline
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac
set noerrorbells
set visualbell t_vb=

"バックアップ関連
set nobackup
set noswapfile
if has('win32')
  set directory=
else

endif

" タブ関連
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" インデント関連
set autoindent
set smartindent

" 検索関連
set hlsearch
set incsearch
set smartcase

" 下部モードライン関連
set cmdheight=2
set laststatus=2
set modeline
set showcmd
set showmatch

" フォールド関連
set foldcolumn=0
set foldlevel=99
set foldmethod=syntax

" 編集領域設定関連
set backspace=indent,eol,start
set list
set listchars=tab:>-,extends:<,trail:-
set number
set ruler
set splitbelow
set splitright
set scrolloff=5
set wrap
set wrapscan

" その他
set colorcolumn=100
set formatoptions+=mM
set shortmess+=I
set showtabline=2
set title
set wildmenu
set pumheight=10
set synmaxcol=300
set completeopt=menuone,noinsert

"=== Plugin Settings =======================================================
"let g:go_bin_path = expand("~/Application/go/bin")

let g:vim_json_syntax_conceal = 0

" Whitespace
let g:extra_whitespace_ignored_filetypes = [
  \ 'vim-plug',
  \ ]

" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

let g:indentLine_color_term = 245

" GUI版VIM時のlightLineの設定
"let g:lightline = {
"          \ 'colorscheme': 'wombat'
"          \ }

" vim-go
"let g:go_fmt_command = 'gofmt'
let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1

" NERDTree
let g:NERDTreeIgnore = [
\ '\.pyc$',
\ '__pycache__',
\ '\.egg-info'
\]

" Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'

" gen_tags.vim
let g:loaded_gentags#ctags = 1
let g:gen_tags#gtags_auto_gen = 1

" lsp-python
"if executable('pyls')
"  au User lsp_setup call lsp#register_server({
"  \ 'name': 'pyls',
"  \ 'cmd': {server_info->['pyls']},
"  \ 'whitelist': ['python'],
"  \ })
"endif

" Syntastic recommend
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['mypy']
let g:syntastic_javascript_checkers = ['eslint']

" lsp-setting
"let g:lsp_settings = {}
"
"=== Plugins =================================================================
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/wombat256.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'lifepillar/vim-solarized8'
Plug 'w0ng/vim-hybrid'
"Plug 'fenetikm/falcon'
Plug 'sainnhe/edge'
Plug 'cocopon/iceberg.vim'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
"Plug 'koron/imcsc-vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
"Plug 'thinca/vim-quickrun'
"Plug 'rking/ag.vim'

"Plug 'davidhalter/jedi-vim'
"Plug 'fatih/vim-go'

"Plug 'ryanolsonx/vim-lsp-python'
"Plug 'mattn/vim-goimports'

"Plug 'vim-syntastic/syntastic'
Plug 'tkztmk/vim-vala'
Plug 'leafgarland/typescript-vim'
Plug 'chase/vim-ansible-yaml'
"Plug 'nvie/vim-flake8'
Plug 'posva/vim-vue'
Plug 'elzr/vim-json'
Plug 'udalov/kotlin-vim'
Plug 'Glench/Vim-Jinja2-Syntax'

Plug 'lighttiger2505/gtags.vim'

call plug#end()

"=== UserCommand =========================================================
" CdCurrent -- Change directory to path that edited current file.
"              backport from cmdex.vim in Kaoriya edited Vim.
command! -nargs=0 CdCurrent cd %:p:h
"
" DiffOrig -- 編集前のファイルとの比較をする。
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

"=== Keymap (Normal) ======================================================
" ハイライトの消去
nnoremap <ESC><ESC> :noh<CR>

" 上下カーソル移動を論理移動に
nnoremap <silent>j gj
nnoremap <silent>k gk

" Search時中央に
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # *zz

" ショートカット
nmap <F12>   :tabnew $MYVIMRC<CR>
if has('gui_running')
  nmap <S-F12> :tabnew $MYGVIMRC<CR>
endif

" Auto Completion
" inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr><S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr><cr> pumvisible() ? "\<C-y>" : "\<cr>"

"=== Keymap (Insert) ======================================================

"=== Keymap (Visual) ======================================================
" ビジュアルモード時のEnterでEasyAlign起動
vnoremap <silent> <Enter> :EasyAlign

"=== Keymap (Command) =====================================================
if !has('win32')
  cmap w!! w !sudo tee > /dev/null %
endif
"
"=== ColorScheme ==========================================================
set termguicolors
set background=dark
let g:edge_style = 'default'
let g:edge_disable_italic_comment = 1
colorscheme iceberg

syntax on
filetype plugin indent on

"highlight LineNr      ctermfg=240 guibg=#303030
"highlight ColorColumn ctermbg=242 guibg=#6c6c6c
highlight SpecialKey  ctermfg=242 guifg=NONE
highlight NonText     ctermfg=Gray guifg=NONE

"=== Printer =============================================================
" プリンターの設定
if has('printer')
  set printoptions=paper:A4,left:15mm,right:15mm,top:20mm,bottom:20mm
  if has('win32')
    "set printfont=MS_Mincho:h12:cSHIFTJIS
    set printfont=MS_Gothic:h10:cSHIFTJIS
  endif
endif
