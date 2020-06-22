"Neovim setup

call plug#begin('~/.local/share/nvim/site/pack/bundle/start')
  Plug 'mileszs/ack.vim'
  Plug 'Valloric/MatchTagAlways'
  Plug 'dense-analysis/ale'
  Plug 'jiangmiao/auto-pairs'
  Plug 'APZelos/blamer.nvim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'kien/ctrlp.vim'
  Plug 'mattn/emmet-vim'
  Plug 'shumphrey/fugitive-gitlab.vim'
  Plug 'zivyangll/git-blame.vim'
  Plug 'preservim/nerdtree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'smerrill/vcl-vim-plugin'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'jparise/vim-graphql'
  Plug 'machakann/vim-highlightedyank'
  Plug 'yardnsm/vim-import-cost', { 'do': 'npm install' }
  Plug 'jxnblk/vim-mdx-js'
  Plug 'prettier/vim-prettier'
  Plug 'tpope/vim-repeat'
  Plug 'hashivim/vim-terraform'
  Plug 'vim-syntastic/syntastic'
  Plug 'juliosueiras/vim-terraform-completion'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ianks/vim-tsx'
  Plug 'wesQ3/vim-windowswap'
  Plug 'vim-scripts/xoria256.vim'
  Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

set nocompatible

syntax on 

colorscheme xoria256

filetype plugin indent on

autocmd VimResized * :wincmd =

let mapleader = ","
let g:mapleader = ","

"show hidden dot files
let NERDTreeShowHidden=1

"close nerdtree when we open a file
let NERDTreeQuitOnOpen = 1

set linespace=15

set incsearch

set ignorecase

set hlsearch

set visualbell

set noerrorbells

set mouse=a

set t_Co=256

set title

set mat=5

set ruler

set relativenumber

set number

set nowrap

set cursorline

set scrolloff=10

set shortmess=atI

set laststatus=2

set showmode

set tabstop=2

set shiftwidth=2

set softtabstop=2

set expandtab

set tags=./tags;,tags

set shiftround

set backspace=indent,eol,start

set autoindent

set copyindent

set showcmd

set encoding=utf-8

set backupdir=~/.vim/backup//

set directory=~/.vim/swap//

command! H let @/=""

autocmd BufRead,BufNewFile *.es6 setfiletype javascript

autocmd cursorhold * set nohlsearch

autocmd cursormoved * set hlsearch

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

autocmd InsertLeave * if pumvisible() == 0|pclose|endif

imap jj <esc>

nmap :sp :rightbelow sp<cr>

nmap :vs :vsplit<cr>

nmap sp :split<cr>

nmap :ed :edit %:p:h/

nmap <leader>w :w!<cr>

nmap <C-b> :NERDTreeToggle<cr>

nmap <C-v> :NERDTreeFind<cr>

nmap <C-h> <C-w>h

nmap <C-j> <C-w>j

nmap <C-k> <C-w>k

nmap <C-l> <C-w>l

nmap ,c :!open -a Google\ Chrome<cr>

" Zoom a split window into a tab and or close it
nmap <Leader>zi :tabnew %<CR>
nmap <Leader>zo :tabclose<CR>

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>a :Ack!<Space>

nnoremap <Leader>b :ls<CR>:b<Space>

" Prettier configs

" Favor config file in projects
let g:prettier#config#config_precedence = 'prefer-file'

let g:prettier#exec_cmd_async = 1

" print semicolons
let g:prettier#config#semi = 'false'

" print spaces between brackets
let g:prettier#config#bracket_spacing = 'true'

" all prettier to auto format the code on file save
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier

let g:windowswap_map_keys = 0 "prevent default bindings
nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>mm :call WindowSwap#EasyWindowSwap()<CR>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" neovim virtual text settings
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = '>>> '
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}
let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
\}
highlight ALEError ctermbg=DarkRed

" ctrl p ignore regex
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn|snap)|node_modules|coverage|tag.temp$'

" yaml formatter indentation setting
let g:yaml_formatter_indent_collection=1

" vim fugitive :Gbrowse url
let g:fugitive_gitlab_domains = ['https://git.tmaws.io']

"change git gutter background color
let g:gitgutter_override_sign_column_highlight = 1
highlight SignColumn guibg=bg
highlight SignColumn ctermbg=bg

"Add buffer info in tagline (vim-airline plugin)
let g:airline#extensions#tabline#enabled = 1

"Show buffer number in tagline (vim-airline plugin)
let g:airline#extensions#tabline#buffer_nr_show = 1

"Hide git information in tagline so I can see entire file path
let g:airline_section_b = ''

"Enable gitblamer a plugin to mimic Gitlens VSCode extension
let g:blamer_enabled = 1

"import coc settings
source $HOME/.config/nvim/coc.vimrc

