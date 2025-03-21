" vim: et ts=2 sts=2 sw=2 tw=0
"=== Initialize ===========================================================
scriptencoding UTF-8
set encoding=UTF-8
set nocompatible

"=== Global Settings ======================================================

" VIMの動作
"set ambiwidth=double
set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis
set fileformats=unix,dos,mac
set cursorline
set noerrorbells
set visualbell t_vb=

"バックアップ関連
set nobackup
set noswapfile
if has('win32')
  set directory=
endif

" タブ関連
set tabstop=4
set shiftwidth=0
set softtabstop=-1
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
set numberwidth=4
set ruler
set signcolumn=yes
set splitbelow
set splitright
set scrolloff=5
set wrap
set wrapscan

" その他
set colorcolumn=119
set completeopt=menuone,noinsert
set formatoptions+=mM
set mouse=
set pumheight=10
set shortmess+=I
set showtabline=2
set synmaxcol=0
set title
set updatetime=400
set wildmenu

"=== Plugins =================================================================
call plug#begin('~/.vim/plugged')

" Language Server Plugin関連
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
" Plug 'psf/black'
" Plug 'rust-lang/rust.vim'

" StatusLine関連
Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Theme関連
Plug 'altercation/vim-colors-solarized'
Plug 'cocopon/iceberg.vim'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/edge'
Plug 'sjl/badwolf'
Plug 'w0ng/vim-hybrid'
Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }

" 整形等
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
"Plug 'cohama/lexima.vim'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-sandwich'
Plug 'mattn/emmet-vim'
Plug 'mattn/vim-goimports'
Plug 'tpope/vim-surround'

" ハイライト関連
"Plug 'chase/vim-ansible-yaml'
"Plug 'posva/vim-vue'
"Plug 'Glench/Vim-Jinja2-Syntax'
"Plug 'ziglang/zig.vim'

" ファイラー関連
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/nerdfont.vim'
"Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
"Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
"Plug 'mattn/vim-molder'
"Plug 'mattn/vim-molder-operations'

" その他
"Plug 'thinca/vim-quickrun'
"Plug 'lighttiger2505/gtags.vim'
Plug 'rbtnn/vim-ambiwidth'
" lug 'github/copilot.vim'

call plug#end()

"
"=== Plugin Settings =======================================================
" netrwプラグインをロードしないようにする。
let g:loaded_netrwPlugin = 1

let g:vim_json_conceal = 0

" vim-ambiwidth
let g:ambiwidth_cica_enabled = 1
let g:ambiwidth_add_list = []

" Whitespace
let g:extra_whitespace_ignored_filetypes = [
\   'vim-plug',
\   'fern'
\ ]

" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

"let g:indentLine_color_term = 245

" GUI版VIM時のlightLineの設定
let g:lightline = {
  \ 'colorscheme': 'wombat'
  \ }

" vim-go
"let g:go_fmt_command = 'gofmt'
" let g:go_fmt_command = 'goimports'
" let g:go_fmt_autosave = 1

" NERDTree
"let g:NERDTreeIgnore = [
"\ '\.pyc$',
"\ '__pycache__',
"\ '\.egg-info'
"\]

" Dirvish
" let g:dirvish_mode = ':sort ,^.*[\/],'

" gen_tags.vim
" let g:loaded_gentags#ctags = 1
" let g:gen_tags#gtags_auto_gen = 1

" -- LSP -----------------------------------------------------------------
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_float_enabled = 1
let g:lsp_signs_enabled = 1
"let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:asyncomplete_popup_delay = 100

let g:lsp_settings = {
  \  'pylsp-all': {
  \    'workspace_config': {
  \      'pylsp': {
  \        'configurationSources': ['flake8'],
  \        'plugins': {
  \          'flake8': {
  \            'enabled': 1,
  \            'max-line-length': 119,
  \          },
  \          'mccabe': {
  \            'enabled': 0
  \          },
  \          'pycodestyle': {
  \            'enabled': 0,
  \            'ignored': [],
  \            'max-line-length': 119,
  \          },
  \          'pyflakes': {
  \            'enabled': 0
  \          }
  \        }
  \      }
  \    }
  \  }
  \}

let g:lsp_settings_filetype_typescript = ['biome']

" -- Syntastic recommend -------------------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 0
" let g:syntastic_auto_loc_list = 0
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_python_checkers = ['mypy']
" let g:syntastic_javascript_checkers = ['eslint']

" -- Fern ----------------------------------------------------------------
let g:fern#renderer = "nerdfont"

nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=30<CR>

function! s:init_fern()
  setlocal norelativenumber
  setlocal nonumber
endfunction

augroup fernCustom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

"=== UserCommand =========================================================
" CdCurrent -- Change directory to path that edited current file.
"              backport from cmdex.vim in Kaoriya edited Vim.
command! -nargs=0 CD cd %:p:h
"
" DiffOrig -- 編集前のファイルとの比較をする。
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

augroup fileTypeImport
  au BufRead,BufNewFile *.js setlocal ts=2
augroup END

"=== Keymap (Normal) ======================================================
" ハイライトの消去
nnoremap <ESC><ESC> :noh<CR>

" 上下カーソル移動を論理移動に
nmap gj gj<SID>g
nmap gk gk<SID>g
nnoremap <script> <SID>gj gj<SID>g
nnoremap <script> <SID>gk gk<SID>g
nmap <SID>g <nop>

" ウインドウサイズ変更
nmap <C-w>+ <C-w>+<SID>ws
nmap <C-w>- <C-w>-<SID>ws
nmap <C-w>> <C-w>><SID>ws
nmap <C-w>< <C-w><<SID>ws
nnoremap <script> <SID>ws+ <C-w>+<SID>ws
nnoremap <script> <SID>ws- <C-w>-<SID>ws
nnoremap <script> <SID>ws> <C-w>><SID>ws
nnoremap <script> <SID>ws< <C-w><<SID>ws
nmap <SID>ws <Nop>

" Search時中央に
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # *zz

" auto Completion
" inoremap <expr> <Tab>   pumvisible() ? '\<C-n>' : '\<Tab>'
" inoremap <expr> <S-Tab> pumvisible() ? '\<C-p>' : '\<S-Tab>'
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : '\<cr>'

" 設定ファイル編集ショートカット
nmap <F12> :tabnew $MYVIMRC<CR>
if has('gui_running')
  nmap <S-F12> :tabnew $MYGVIMRC<CR>
endif

"=== Keymap (Insert) ======================================================

"=== Keymap (Visual) ======================================================
" ビジュアルモード時EnterでEasyAlign起動
vnoremap <silent> <Enter> :EasyAlign

"=== Keymap (Command) =====================================================
" if !has('win32')
"   cmap w!! w !sudo tee >/dev/null %
" endif

"=== ColorScheme ==========================================================
let g:colors_name = ''

colorscheme edge
" colorscheme moonfly
set background=dark

if has('termguicolors')
  set termguicolors
endif

if g:colors_name == 'edge'
  let g:edge_style = 'default'
  let g:edge_disable_italic_comment = 1
endif

"highlight LineNr      ctermfg=240 guibg=#303030
"highlight ColorColumn ctermbg=242 guibg=#6c6c6c
"highlight SpecialKey  ctermfg=242 guifg=NONE
"highlight NonText     ctermfg=Gray guifg=NONE

set t_Co=256
filetype plugin indent on
syntax on
autocmd BufEnter * :syntax sync fromstart

"=== Gui(GVim) Settings ==================================================
if has("gui_running")
  set columns=130
  set lines=70
  set guioptions=aiM
  set mouse=a
  set mousehide
  set nomousefocus
  set visualbell t_vb=

  if has('win32')
    set guifont=HackGenNerd:h11:cSHIFTJIS
  else
    set guifont=HackGenNerd\ Regular\ 11
  endif
endif

"=== Printer =============================================================
if has('printer')
  set printoptions=paper:A4,left:15mm,right:15mm,top:20mm,bottom:20mm
  if has('win32')
    set printfont=MS_Gothic:h10:cSHIFTJIS
  endif
endif
