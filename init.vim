" ================ Plugins ==================== {{{

call plug#begin('~/.local/share/nvim/bundle')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Color Schemes {{{
Plug 'crusoexia/vim-monokai'
Plug 'tomasr/molokai'
"Plug 'fmoralesc/molokayo'
"Plug 'romainl/flattened'
"Plug 'dikiaap/minimalist'
"Plug 'joshdick/onedark.vim'
"Plug 'rakr/vim-one'
"Plug 'KeitaNakamura/neodark.vim'
"}}}
Plug 'neomake/neomake'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-git'
Plug 'tpope/vim-vinegar'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
"Plug 'ryanoasis/vim-devicons'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript.jsx'] }
Plug 'vim-syntastic/syntastic'
" Language Support Plugins {{{
"Plug 'Shougo/deoplete.nvim'
"Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
"}}}
" PHP Support Plugins {{{
Plug 'StanAngeloff/php.vim'
"Plug 'stephpy/vim-php-cs-fixer'
" There are errors when using phpfolding.vim, the plugin hasn't been updated
" in 2 years.
Plug 'rayburgemeestre/phpfolding.vim'
" The phpfold plugin is newer but dies and causes major vim/nvim usability
" issues. May not be compatible with nvim.
"Plug 'lvht/phpfold.vim', { 'for': 'php' }
Plug '2072/PHP-Indenting-for-VIm'
"Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
Plug 'Rican7/php-doc-modded'
Plug 'phpstan/vim-phpstan'
"}}}
Plug 'janko-m/vim-test'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Initialize plugin system
call plug#end()

"}}}
" ================ General Config ==================== {{{

filetype plugin indent on                                                       "Enable plugins and indents by filetype

let g:mapleader = ","                                                           "Change leader to a comma
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

syntax on                                                                       "turn on syntax highlighting
"set background=dark                                                             "Set background to dark
colorscheme molokai                                                             "Set color scheme
let g:airline_theme='molokai'                                                   "Set airline theme to match color schem

"set guifont=SauceCodePro\ Nerd\ Font\ 11                                        "Set font
set title                                                                       "change the terminal's title
set number                                                                      "Line numbers are good
set relativenumber                                                              "Show numbers relative to current line
set history=1024                                                                "Store lots of :cmdline history
set undolevels=2048                                                             "Allow for undo beyond history
set showcmd                                                                     "Show incomplete cmds down the bottom
set noshowmode                                                                  "Hide showmode because of the powerline plugin
set gdefault                                                                    "Set global flag for search and replace
set gcr=a:blinkon500-blinkwait500-blinkoff500                                   "Set cursor blinking rate
set cursorline                                                                  "Highlight current line
set smartcase                                                                   "Smart case search if there is uppercase
set ignorecase                                                                  "case insensitive search
set mouse=a                                                                     "Enable mouse usage
set showmatch                                                                   "Highlight matching bracket
set nostartofline                                                               "Jump to first non-blank character
set timeoutlen=1000 ttimeoutlen=0                                               "Reduce Command timeout for faster escape and O
set fileencoding=utf-8                                                          "Set utf-8 encoding on write
set fileformats=unix,mac,dos                                                    "Set Unix line-endings for new files
set encoding=utf8                                                               "Set encoding
set wrap                                                                        "Enable word wrap
set linebreak                                                                   "Wrap lines at convenient points
set listchars=tab:\ \ ,trail:·                                                  "Set trails for tabs and spaces
set list                                                                        "Enable listchars
set lazyredraw                                                                  "Do not redraw on registers and macros
set hidden                                                                      "Hide buffers in background
set conceallevel=2 concealcursor=c                                              "neosnippets conceal marker
set splitright                                                                  "Set up new vertical splits positions
set splitbelow                                                                  "Set up new horizontal splits positions
set path+=**                                                                    "Allow recursive search
set inccommand=split                                                            "Show substitute changes immidiately in separate split
set fillchars+=vert:\│                                                          "Make vertical split separator full line
set pumheight=30                                                                "Maximum number of entries in autocomplete popup
set exrc                                                                        "Allow using local vimrc
set secure                                                                      "Forbid autocmd in local vimrc

" }}}
" ================ Indentation ====================== {{{

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=80

" }}}
" ================ Statusline ======================== {{{

hi User1 guifg=#FF0000 guibg=#2C323C
hi User2 guifg=#FFFFFF guibg=#FF1111 gui=bold
set statusline=\ %{toupper(mode())}                                             "Mode
set statusline+=\ \│\ %{fugitive#head()}                                        "Git branch
set statusline+=\ \│\ %4F                                                       "File path
set statusline+=\ %1*%m%*                                                       "Modified indicator
set statusline+=\ %w                                                            "Preview indicator
set statusline+=\ %r                                                            "Read only indicator
set statusline+=\ %q                                                            "Quickfix list indicator
set statusline+=\ %=                                                            "Start right side layout
set statusline+=\ %{&enc}                                                       "Encoding
set statusline+=\ \│\ %y                                                        "Filetype
set statusline+=\ \│\ %p%%                                                      "Percentage
set statusline+=\ \│\ %c                                                        "Column number
set statusline+=\ \│\ %l/%L                                                     "Current line number/Total line numbers
"set statusline+=\ %{gutentags#statusline('\│\ ')}                               "Tags status
set statusline+=\ %2*%{ALEGetStatusLine()}%*                                    "Errors count

"}}}
" ================ Plugin Setup ======================= {{{
" make test commands execute using dispatch.vim
let test#strategy = "neovim"
" Use deoplete.
"let g:deoplete#enable_at_startup = 1
" Setup Syntastic
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
" ================ Setup CoC ================== {{{
" jsonc comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
" FileType mappings
let g:coc_filetype_map = {
      \ 'html.swig': 'html',
      \ 'wxss': 'css',
      \ 'xml.dist': 'xml',
      \ }
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" nnoremap <c-space>
inoremap <silent><expr> <c-space> coc#refresh()
" }}}
" }}}
" ================ Custom mappings ======================== {{{
" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" " Insert real tab
inoremap <S-Tab> <C-V><Tab>
