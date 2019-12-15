" Leader key
let mapleader = ","

" ensure vim-plug is installed and then load it
call plug#begin('~/.vim/bundle')
call functions#PlugLoad()

" File exploring
Plug 'scrooloose/nerdtree'

" Prettier
" Plug 'sbdchd/neoformat'
" let g:neoformat_javascript_prettier = {
"            \ 'exe': 'prettier',
"            \ }
" let g:neoformat_enabled_javascript = ['prettier']
" augroup fmt
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
" augroup END

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

" ReasonML https://github.com/reasonml-editor/vim-reason-plus
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:LanguageClient_serverCommands = {
    \ 'reason': ['/Users/bwillis/bin/reason-language-server'],
    \ }
let g:deoplete#enable_at_startup = 1

nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient#textDocument_formatting()<cr>

" Handlebars & Mustache
Plug 'juvenn/mustache.vim'
Plug 'nono/vim-handlebars'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'ianks/vim-tsx'

" Javascript
" Plug 'https://github.com/othree/javascript-libraries-syntax.vim', { 'for': [ 'javascript', 'js', 'jsx' ]}
" Plug 'thinca/vim-textobj-function-javascript',    { 'for': [ 'javascript', 'js', 'jsx' ]}
" Plug '1995eaton/vim-better-javascript-completion', { 'for': [ 'javascript', 'js', 'jsx' ]}
" Plug 'chemzqm/vim-jsx-improve', { 'for': [ 'javascript', 'js', 'jsx' ]}
" Plug 'gavocanov/vim-js-indent', { 'for': [ 'javascript', 'js', 'jsx' ]}
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
" Language pack for many languages
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'

" Graphql
Plug 'jparise/vim-graphql'

" Toolkit - no syntax highlighting https://github.com/moll/vim-node
Plug 'moll/vim-node', { 'for': [ 'javascript', 'js', 'jsx' ]}

" SCSS and CSS syntax highlighting
if v:version < 704
  Plug 'JulesWang/css.vim'
endif
Plug 'cakebaker/scss-syntax.vim'

" HTML
Plug 'tpope/vim-ragtag'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'skwp/vim-html-escape'

" Lua
Plug 'https://github.com/xolox/vim-lua-ftplugin.git', {'for': ['lua']}
Plug 'https://github.com/xolox/vim-misc.git', {'for': ['lua']}

" Perl
" Plug 'https://github.com/c9s/perlomni.vim', {'for': ['pl', 'perl', 'p6', 'pm']}

" devicons https://github.com/ryanoasis/vim-devicons
" always load as last one!
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Set all the base16 stuff
" (https://github.com/chriskempson/base16-vim/issues/94) 
set background=dark
let base16colorspace=256
Plug 'chriskempson/base16-vim'

" enable 24 bit color support if supported
if (has("termguicolors"))
 set termguicolors
endif

syntax on
syntax enable
filetype plugin indent on

" colorizer https://github.com/norcalli/nvim-colorizer.lua
" lua require'colorizer'.setup()

if &term =~ '256color'
  " disable background color erase
  set t_ut=
endif

set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
set guifont=Iosevka\ Nerd\ Font:h16
set ttyfast " faster redrawing
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set hlsearch                                                 " highlight search results
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=space:·,tab:▸\ ,trail:▫,extends:>,precedes:<,nbsp:+,eol:¬
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4                                                " actual tabs occupy 8 characters
set lazyredraw
set synmaxcol=200
set updatetime=250
set nowb
set nobackup
set noswapfile
set mouse=a " Enable basic mouse behavior such as resizing buffers.
set nowrap
set linebreak
set undofile " Enable persistent undo so that undo history persists across vim sessions
set undodir=~/.vim/undo

" force javascript syntax
autocmd BufRead *.js set filetype=javascript
autocmd BufRead *.es6 set filetype=javascript
autocmd BufRead *.jsx set filetype=javascript

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

let g:lightline = {
  \ 'colorscheme': 'base16_harmonic_dark',
\ }

" FZF
Plug '/usr/local/bin/fzf'
Plug 'junegunn/fzf.vim'
let g:fzf_layout = { 'down': '~25%' }

if isdirectory(".git")
    " if in a git project, use :GFiles
    nmap <silent> <leader>t :GitFiles --cached --others --exclude-standard<cr>
else
    " otherwise, use :FZF
    nmap <silent> <leader>t :FZF<cr>
endif

if filereadable(expand("~/.vimrc_background"))
    source ~/.vimrc_background
else
    let g:onedark_termcolors=256
    let g:onedark_terminal_italics=1
    colorscheme base16-default-dark
endif

syntax on
filetype plugin indent on
" make the highlighting of tabs and other non-text less annoying
highlight SpecialKey ctermfg=19 guifg=#333333
highlight NonText ctermfg=19 guifg=#333333

" make comments and HTML attributes italic
highlight Comment cterm=italic term=italic gui=italic
highlight htmlArg cterm=italic term=italic gui=italic
highlight xmlAttrib cterm=italic term=italic gui=italic

let g:jsx_ext_required = 0
