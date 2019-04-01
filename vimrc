" =============================================================================
" NO COMPATIBILITY
" =============================================================================
set nocompatible

" =============================================================================
" PATHOGEN
" =============================================================================
runtime bundle/vim-pathogen/autoload/pathogen.vim
" Disabled plugin
let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'ultisnips')
" Infect
execute pathogen#infect()

" =============================================================================
" SET THE GUI COLOR SCHEME - BASE16-SHELL
" =============================================================================
if filereadable(expand("~/.vimrc_background"))
  set t_Co=256
  let base16colorspace=256
  source ~/.vimrc_background
else
  color base16-default-dark
endif

" =============================================================================
" CHECK OS
" =============================================================================
if has('unix')
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    set guifont=Knack\ Nerd\ Font\:h11
    set rtp+=/usr/local/opt/fzf
  else
    set guifont=Knack\ Nerd\ Font\ 8
    set rtp+=~/.fzf
  endif
elseif has('win32') || has('win64')
  behave mswin
  set guifont=Hack\:9
  au GUIEnter * simalt ~n
endif

" =============================================================================
" SETTINGS
" =============================================================================
filetype on                               " Enable filetype detection
filetype indent on                        " Enable filetype-specific indenting
filetype plugin on                        " Enable filetype-specific plugins
syntax on									                " Syntax highlighting
set shell=/bin/zsh                        " Shell
set guioptions=aAce                       " GUI options
set laststatus=2                          " Show the statusline
set number                                " Numero riga
set nrformats-=octal                      " treat all numbers as decimals
set hidden                                " allow hidden buffer
set so=10                                 " Row after cursor
set splitright                            " Open vertical splits to the right
set splitbelow                            " Open horizontal splits to the bottom
set wrapscan                              " Start search from the beginning
set encoding=utf-8                        " set the character encoding
set fileformat=unix                       " set fileformat
set nobackup                              " No backups
set nowritebackup                         " No backups
set noswapfile                            " No swap 
set tabstop=2                             " N space for tab
set shiftwidth=2                          " N space for autoindent
set noautowrite                           " no auto save on buffer switch
set mouse=a                               " Mouse enabled
set colorcolumn=+1                        " Highlight column 81
set noundofile                            " no undo files
set backupcopy=yes
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
set nofoldenable                          " Open all folds by default
set showcmd                               " Show command 
set showmatch                             " Show close bracket
set incsearch                             " turn on incremental search
set ignorecase                            " no case sensitive search patterns
set hlsearch                              " Highlight search results 
set smartcase                             " Search with caps - override ignorecase
set esckeys                               " cursor keys in I mode
set autoindent                            " Copy indent after <CR>  o O
set undolevels=1000 						          " n of changes that can be undone
set history=1000  							          " history
set showmode								              " Display current mode
set noerrorbells                          " do not use errorbells
set nojoinspaces                          " two spaces after a period on join
set title                                 " show window title
set spelllang=it                          " set default spell to it
set softtabstop=2
set expandtab                               
set smarttab                                
set ttimeout
set ttimeoutlen=100
set ruler
set wildmenu
set autoread
set backspace=indent,eol,start whichwrap+=<,>,[,] " normal backspace

" jump to the last known cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" No viminfo
if !empty(&viminfo)
  set viminfo^=!
endif

" Set cursor position
au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn

" =============================================================================
" COMMENTED SETTINGS
" =============================================================================
" set textwidth=80 " use a different bground color after
" execute "set colorcolumn=" . join(range(81,335), ',') " Highlight from column 81
" set cursorcolumn " highlight the column the cursor is on
" set cursorline " highlight the line the cursor is on

" =============================================================================
" WINDOWS BEHAVIOR
" =============================================================================
" backspace in Visual mode deletes selection
vnoremap <BS> d
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+

" =============================================================================
" FZF
" =============================================================================
" let g:fzf_commits_log_options = 'log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

" =============================================================================
" RANGER
" =============================================================================
let g:ranger_map_keys = 0
let g:ranger_replace_netrw = 1

" =============================================================================
" NETRW
" =============================================================================
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_preview = 1
" let g:netrw_alto = 0

" =============================================================================
" VIM-SIGNATURE
" =============================================================================
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1

" =============================================================================
" NUMBERS
" =============================================================================
let g:numbers_exclude = ['tagbar', 'gundo', 'netrw']

" =============================================================================
" VIM-AIRLINE
" =============================================================================
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_statusline_fileformat_symbols = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = airline#section#create_right(['ffenc','','%{rvm#statusline()}'])
let g:airline_theme = 'base16'
let g:airline#extensions#ale#enabled = 1
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep= ''
let g:airline_left_sep = ''

" =============================================================================
" TMUXLINE
" =============================================================================
let g:tmuxline_separators = {
      \ 'left' : '',
      \ 'left_alt': '',
      \ 'right' : '',
      \ 'right_alt' : '',
      \ 'space' : ' '}
let g:airline#extensions#tmuxline#enabled = 0
" let g:tmuxline_powerline_separators = 0

" =============================================================================
" ALE
" =============================================================================
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" =============================================================================
" NEOSNIPPET
" =============================================================================
let g:UltiSnipsExpandTrigger = "<f6>"        " Do not use <tab>
let g:UltiSnipsJumpForwardTrigger = "<c-b>"  " Do not use <c-j>

" =============================================================================
" VIM-MUCOMPLETE
" =============================================================================
set completeopt+=menuone,preview,noselect
set shortmess+=c
set belloff+=ctrlg
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['ulti', 'omni', 'path', 'keyn', 'keyp', 'file']
let g:jedi#popup_on_dot = 1
inoremap <silent> <expr> <Plug>MyCr mucomplete#ultisnips#expand_snippet("\<cr>")
imap <cr> <Plug>MyCr

" =============================================================================
" FILETYPE
" =============================================================================
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
" autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
" autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile=1
" autocmd FileType ruby,eruby let g:rubycomplete_use_bundler=1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd BufRead,BufNewFile *.md setlocal spell

" =============================================================================
" FUNCTION
" =============================================================================
function RunWith (command)
  execute "w"
  execute "!clear;time " . a:command . " " . expand("%")
endfunction

" =============================================================================
" SUBTYPES
" =============================================================================
" Ruby
augroup ruby_subtypes
  autocmd!
  autocmd BufNewFile,BufRead *.pdf.erb let b:eruby_subtype='html'
  autocmd BufNewFile,BufRead *.pdf.erb set filetype=eruby
augroup END

" Jquery
au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

" =============================================================================
" VIM-JSON
" =============================================================================
let g:vim_json_syntax_conceal = 0

" =============================================================================
" RAINBOW
" =============================================================================

" =============================================================================
" INDENTLINE
" =============================================================================
" let g:indentLine_setColors = 0
let g:indentLine_char = '·'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'

" =============================================================================
" VIM-RUBOCOP
" =============================================================================
let g:vimrubocop_keymap = 0
let g:vimrubocop_confi = '.rubocop.yml'

" =============================================================================
" VIM-ROOTER
" =============================================================================
let g:rooter_silent_chdir = 1
let g:rooter_use_lcd = 1

" =============================================================================
" VIM-SMOOTH-SCROLL
" =============================================================================
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" =============================================================================
" DEVDOCS
" =============================================================================
let g:devdocs_filetype_map = {
      \   'ruby': 'rails',
      \   'javascript.js': 'jquery',
      \ }

" =============================================================================
" MatchTagAlways
" =============================================================================
let g:mta_use_matchparen_group = 1

" =============================================================================
" Vim-gutentags
" =============================================================================
let g:gutentags_enabled = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_resolve_symlinks = 1
let g:gutentags_ctags_tagfile = '.git/tags'
let g:gutentags_project_root = ['.git']
let g:gutentags_add_default_project_roots = 0

" =============================================================================
"<F1> open help
nmap <F2> :Calendar<CR>
nnoremap <F3> :NumbersToggle<CR>
map <F4> :set list! list? <CR>
nnoremap <F5> :GundoToggle<CR>
nmap <F7> :Ranger<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> <CR>
autocmd FileType ruby nmap <F10> :call RunWith("ruby")<cr>
nmap <Leader>bda :bd <C-a> <CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>nm :Dispatch npm start<CR>
nmap <Leader>p :FZF<CR>
nmap <Leader>a :Ag 
nmap <Leader>l :Lines 
nmap <Leader>g :G<CR> 
nmap <Leader>gg :GFiles?<CR> 
nmap <Leader>xx :VimuxPromptCommand<CR>
nmap <Leader>% :MtaJumpToOtherTag<CR>
nmap <silent> <Leader>sp :set spell!<CR>
nmap K <Plug>(devdocs-under-cursor)
nmap <Leader><< <Plug>(Prettier)
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordExec
nnoremap <C-F>t :CtrlSFToggle<CR>

" =============================================================================
" DISABLED KEYS
" =============================================================================
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
