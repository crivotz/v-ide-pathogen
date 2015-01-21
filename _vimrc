set nocompatible

" Check OS
if has('win32') || has('win64')
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
	set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\:h9
	au GUIEnter * simalt ~n
elseif has('macunix')
	set transparency=5
	set fuoptions=maxvert,maxhorz
	au GUIEnter * set fullscreen
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\:h11
elseif has('unix')
	set lines=999 columns=999
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9 
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
endif

color molokai                               " Color scheme
set laststatus=2
"set statusline=%F\ %m\ %w\ %h\ %=%{fugitive#statusline()}\ [FileType:\ %Y]\ [Linea:\ %l/%L\ (%p%%)]\ [Col:\ %v] "Old statusline
set guioptions=aAce
"set list                                   " Show special chars
set nu                                      " Numero riga
set nohidden                                " Close the buffer when I close the tab
set so=10                                   " Ros after cursor
set splitright                              " Open vertical splits to the right
set splitbelow                              " Open horizontal splits to the bottom
set wrapscan                                " Start search from the beginning
set nobackup
set nowritebackup
set noswapfile 
set tabstop=2                               " N space for tab
set shiftwidth=2                            " N space for indent
set noexpandtab                             " Use space for a <Tab>.
set smarttab                                
set showcmd                                 " Show command 
set showmatch                               " Show close bracket
set hlsearch                                " Highlight search results 
set incsearch                               " Show results immediately on search
set ignorecase                              " Ignora le maiuscole durante le ricerche.
set smartcase                               " Search with capsSovrasta l'opzione 'ignorecase' se il pattern di ricerca contiene caratteri maiuscoli. 
set autoindent                              " Copy indent when new row is started with <CR>  o O
"set textwidth=79                           " Max rows length
"set formatoptions=c,q,r,t                  " This is a sequence of letters which describes how
																						" automatic formatting is to be done.
																						"
																						" letter    meaning when present in 'formatoptions'
																						" ------    ---------------------------------------
																						" c         Auto-wrap comments using textwidth, inserting
																						"           the current comment leader automatically.
																						" q         Allow formatting of comments with "gq".
																						" r         Automatically insert the current comment leader
																						"           after hitting <Enter> in Insert mode. 
																						" t         Auto-wrap text using textwidth (does not apply
																						"           to comments)
"set ruler                                  
au WinLeave * set nocursorcolumn
au WinEnter * set cursorcolumn
set cursorcolumn
" Highlight the current line
"set cul
"hi CursorLine term=none cterm=none ctermbg=5
set mouse=a                                 " Abilita l'uso del mouse.
set autoindent
set undolevels=1000 						            "maximum number of changes that can be undone
set history=1000  							            " Store a ton of history (default is 20)
set showmode								                " Display current mode
filetype on                                 " Enable filetype detection
filetype indent on                          " Enable filetype-specific indenting
filetype plugin on                          " Enable filetype-specific plugins
syntax on									                  " Syntax highlighting

"**PLUGINS CONFIGURATION**

let NERDTreeShowBookmarks=1
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']
let g:airline_powerline_fonts = 1

" SYNTASTIC
"let g:syntastic_enable_highlighting = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" AUTOCOMPLETE CONFIGURATION
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	" Inserting <CR> key.
	"return neocomplcache#smart_close_popup() . "\<CR>"
	" For no inserting <CR> key.
	return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby set omnifunc=rubycomplete#Complete
"autocmd FileType ruby let g:rubycomplete_buffer_loading=1
"autocmd FileType ruby let g:rubycomplete_classes_in_global=1

" Enable heavy omni completion.
if !exists('g:neocomplcache_force_omni_patterns')
	let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
			\ "\<Plug>(neosnippet_expand_or_jump)"
			\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
	set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

"au BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
if !has('win32') && !has('win64')
	helptags  ~/.vim/doc
	au FileType xhtml,xml so ~/.vim/ftplugin/html_autoclosetag.vim
else
	helptags C:\Program Files\Vim\vimfiles\doc 
	au FileType xhtml,xml so C:\Program Files\Vim\vimfiles\ftplugin\html_autoclosetag.vim
	set diffexpr=MyDiff()
	function MyDiff()
		let opt = '-a --binary '
		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		let arg1 = v:fname_in
		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		let arg2 = v:fname_new
		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		let arg3 = v:fname_out
		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		let eq = ''
		if $VIMRUNTIME =~ ' '
			if &sh =~ '\<cmd'
				let cmd = '""' . $VIMRUNTIME . '\diff"'
				let eq = '"'
			else
				let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
			endif
		else
			let cmd = $VIMRUNTIME . '\diff'
		endif
		silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction
endif

"Shortcuts
nmap <F2> :Calendar<CR>
nnoremap <F3> :NumbersToggle<CR>
nmap <F6> :Errors<CR>
nmap <F7> :NERDTree<CR>
nmap <F8> :TagbarToggle<CR>
