" =============================================================================
" NO COMPATIBILITY
" =============================================================================
" no compatibility to venerable old Vi
set nocompatible

" =============================================================================
" PATHOGEN
" =============================================================================
runtime bundle/vim-pathogen/autoload/pathogen.vim
" Disabled plugin
let g:pathogen_disabled = ['syntastic']
" call add(g:pathogen_disabled, 'plugin-name')
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
    set guifont=Hack\:h11
    set rtp+=/usr/local/opt/fzf
  else
    set guifont=Hack\ 9
    set rtp+=~/.fzf
  endif
elseif has('mac')
elseif has('win32') || has('win64')
  behave mswin
  set guifont=Hack\:9
  au GUIEnter * simalt ~n
endif

" =============================================================================
" SETTINGS
" =============================================================================
" GUI options
set guioptions=aAce                         

" Enable filetype detection
filetype on                                 

" Enable filetype-specific indenting
filetype indent on                          

" Enable filetype-specific plugins
filetype plugin on                          

" Syntax highlighting
syntax on									                  

" Set cursor position
au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn
" jump to the last known cursor position
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Show the statusline
set laststatus=2                            

" Numero riga
set nu                                      

" treat all numbers as decimals (1 - 10)
set nrformats-=octal

" allow hidden buffer
set hidden                                

" Row after cursor
set so=10                                   

" Open vertical splits to the right
set splitright                              

" Open horizontal splits to the bottom
set splitbelow                              

" Start search from the beginning
set wrapscan                                

" set the character encoding
set encoding=utf-8

" set fileformat
set fileformat=unix

" No backups, swap or viminfo
set nobackup
set nowritebackup
set noswapfile 
if !empty(&viminfo)
  set viminfo^=!
endif

" no automatically save on buffer switch
set noautowrite

" Mouse enabled
set mouse=a                                 

" normal backspace key functionality
set backspace=indent,eol,start whichwrap+=<,>,[,]

"" use a different bground color after
" set textwidth=80

"" Highlight column 81
set colorcolumn=+1
"" Highlight from column 81
" execute "set colorcolumn=" . join(range(81,335), ',')

" highlight the column the cursor is on
" set cursorcolumn

" highlight the line the cursor is on
" set cursorline

" no undo files
set noundofile

" tab and indent options 
" N space for tab
set tabstop=2                               
" N space for autoindent
set shiftwidth=2                            
set softtabstop=2
" Use space for a <Tab>.
set expandtab                               
set smarttab                                
set complete-=i
set ttimeout
set ttimeoutlen=100
set ruler
set wildmenu
set autoread

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" folding options
set foldmethod=indent
set foldlevel=1
set foldnestmax=10
" Open all folds by default
set nofoldenable

" Show command 
set showcmd                                 

" Show close bracket
set showmatch                               

" turn on incremental search
set incsearch                               

" no case sensitive search patterns
set ignorecase                              

" Highlight search results 
set hlsearch                                

" Search with caps - override ignorecase
set smartcase                               

" allow usage of cursor keys when in insert mode
set esckeys

" Copy indent when new row is started with <CR>  o O
set autoindent                              

"maximum number of changes that can be undone
set undolevels=1000 						            

" Store a ton of history (default is 20)
set history=1000  							            

" Display current mode
set showmode								                

" do not use errorbells
set noerrorbells

" insert two spaces after a period when joining two lines
set nojoinspaces

" show window title
set title

" set default spell to it
set spelllang=it

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
" ACK
" =============================================================================
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
end
let g:ack_use_dispatch = 1

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
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_y = airline#section#create_right(['ffenc','','%{rvm#statusline()}'])
let g:airline_theme = 'base16_default'
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
" let g:tmuxline_powerline_separators = 0

" =============================================================================
" SYNTASTIC
" =============================================================================
"" let g:syntastic_enable_highlighting = 1
"" let g:syntastic_auto_loc_list = 1
"" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_loc_list_height = 3
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" =============================================================================
" ALE
" =============================================================================
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_enter = 0
" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1

" =============================================================================
" NEOCOMPLETE
" =============================================================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.limittext
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#sources#tags#cache_limit_size = 5000000
"let g:neocomplete#force_overwrite_completefunc = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " Inserting <CR> key.
  "return neocomplete#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"if !exists('g:neocomplete#force_omni_input_patterns')
"let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() limittext?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#disable_runtime_snippets = { '_' : 1, }

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets/'

" =============================================================================
" FILETYPE
" =============================================================================
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading=1
"autocmd FileType ruby,eruby let g:rubycomplete_load_gemfile=1
"autocmd FileType ruby,eruby let g:rubycomplete_use_bundler=1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global=1
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
let g:rainbow#pairs =[['(',')'], ['[',']'], ['{','}']]

" =============================================================================
" INDENTLINE
" =============================================================================
let g:indentLine_setColors = 0

" =============================================================================
" VIM-TAGS
" =============================================================================
let g:vim_tags_auto_generate = 1

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
" HTML-AutoCloseTag
" =============================================================================
if !has('win32') && !has('win64')
  au FileType xhtml,xml so ~/.vim/bundle/HTML-AutoCloseTag/ftplugin/html_autoclosetag.vim
else
  au FileType xhtml,xml so C:\Program Files\Vim\vimfiles\ftplugin\html_autoclosetag.vim
endif

" =============================================================================
" VIM-INTERESTINGWORDS
" =============================================================================
nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
nnoremap <silent> n n<Plug>SearchIndex:call WordNavigation('forward')<cr>
nnoremap <silent> N N<Plug>SearchIndex:call WordNavigation('backward')<cr>

" =============================================================================
" SHORTCUTS
" =============================================================================
"<F1> open help
nmap <F2> :Calendar<CR>
nnoremap <F3> :NumbersToggle<CR>
map <F4> :set list! list? <CR>
nnoremap <F5> :GundoToggle<CR>
nmap <F7> :Ranger<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :RainbowParentheses!!<CR>
autocmd FileType ruby nmap <F11> :call RunWith("ruby")<cr>
nmap <leader>bda :bd <C-a> <CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bb :Buffers<CR>
nmap <Leader>p :FZF<CR>
nmap <Leader>a :Ag 
nmap <Leader>g :GFiles?<CR> 
nmap <Leader>gg :Gstatus<CR> 
nmap <Leader>xx :VimuxPromptCommand<CR>
nmap <silent> <Leader>sp :set spell!<CR>

" =============================================================================
" DISABLED KEYS
" =============================================================================
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>