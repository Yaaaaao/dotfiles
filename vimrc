" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0  foldmethod=marker :
" Description:
"     Customized vimrc from spf13-vim
"
" Revision: 2017-05-07
"
" Modeline end }

" Vim specific {
	" VI iMproved, none VI-compatible mode
	set nocompatible
	filetype on

	" autocmds at open/refresh/close a file
	augroup aucmd_open_or_refresh_or_close " {
		autocmd!

		" Reload vimrc after modification
		autocmd BufWritePost $MYVIMRC source $MYVIMRC

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		" Also don't do it when the mark is in the first line, that is the default
		" position when opening a file.
		autocmd BufReadPost *
		\ if line("'\"") > 1 && line("'\"") <= line("$") |
		\   exe "normal! g`\"" |
		\ endif

	augroup END " }
" Vim end }

" Plugins manager Vundle {
	filetype off                  " required by Vundle

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim

	" Keep Plugin commands between vundle#begin/end.
	call vundle#begin()
	" Examples
	"   a. plugin on GitHub repo <https://github.com/>
	"      Plugin 'tpope/vim-fugitive'
	"   b. plugin from http://vim-scripts.org/vim/scripts.html
	"      Plugin 'L9'
	"   c. Git plugin not hosted on GitHub
	"      Plugin 'git://git.wincent.com/command-t.git'
	"   d. git repos on your local machine
	"      Plugin 'file:///home/gmarik/path/to/plugin'
	"   e. The sparkup vim script is in a subdirectory of this repo called vim.
	"      Pass the path to set the runtimepath properly.
	"      Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
	"   e. Avoid a name conflict with L9
	"      Plugin 'user/L9', {'name': 'newL9'}

	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'

	Plugin 'Valloric/YouCompleteMe'
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	Plugin 'majutsushi/tagbar'
	Plugin 'aceofall/gtags.vim'
	Plugin 'flazz/vim-colorschemes'
	call vundle#end()            " required
" Plugins end}

" General {
	filetype plugin indent on   " Automatically detect file types and indent based on the filetype.
	set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,gb2312,latin1
	set autoread	    " Reload on detecting file changing
	set autowriteall    " Autowrite buffer contents into file if changed
	set autochdir	    " Auto change working directory as the current buffer
	set background=dark
	colorscheme solarized
" General end }

" Vim UI {
	set number                      " Line numbers on
	set showmode                    " show insert/replace/visual mode

	" Search and highlight
	set cursorline                  " Highlight current line
	set showmatch                   " Show matching brackets/parenthesis
	set incsearch                   " Find as you type search
	set hlsearch                    " Highlight search terms
	set ignorecase                  " Case insensitive search
	set smartcase                   " Case sensitive when upper case present

	" Vim Status line
	set laststatus=2                  " Always show status line
	set statusline=%(%l,%c%V%)\ %p%%  " Left aligned buffer position info
	set statusline+=%w%h%m%r          " Options
	set statusline+=\ [%{&ff}/%Y]     " Filetype
	set statusline+=\ [%{getcwd()}]   " Current dir
	set statusline+=\ %f              " Filename

	set wildmenu                    " Show list instead of just completing
	set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.

"	set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
	set foldenable                  " Auto fold code

"	set list
"	set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight special chars
	set backspace=indent,eol,start  " Allow backspace over everything in insert mode
" Vim UI end }

" Formatting {
	set autoindent                  " Indent at the same level of the previous line
	set smartindent

	" linux kernel style for C source file
	"
	" 1. Wrap long lines exceeding 80 bytes
	" 2. Don't expand tab into spaces
	" 3. An indentation every four columns
	" 4. Let backspace delete indent
	" 5. Shitf 8 spaces for '>>'
	autocmd FileType c
		\ set wrap |
		\ set textwidth=80 |
		\ set noexpandtab |
		\ set tabstop=8 |
		\ set softtabstop=8 |
		\ set shiftwidth=8 |
" Formatting end }

" Plugins Settings {
	" Ultisnips.vim {
		let g:UltiSnipsExpandTrigger = "<c-j>"
		let g:UltiSnipsListSnippets = "<c-tab>"
		let g:UltiSnipsUsePythonVersion = 3
		let g:UltiSnipsSnippetDirectories=$HOME.'/.vim/vim-snippets/UltiSnips'
	" }
	" YouCompleteMe {
		let g:ycm_autoclose_preview_window_after_completion = 1
		let g:ycm_confirm_extra_conf = 0
	" }

	" tagbar.vim {
		let g:tagbar_left = 1
		let g:tagbar_width = 25
		let g:tagbar_indent = 2
		let g:tagbar_singleclick = 1
		let g:tagbar_autoshowtag = 1
		let g:tagbar_sort = 0
	" }

	" gtags.vim {
		" It take a little while to update GTAGS database
		" after editing a file and exit by ':wq', but it is
		" fast if no file got edited and exit by ':q'
		let g:Gtags_Auto_Update=1
		" Load on demand
		let GtagsCscope_Auto_Load=0
		let GtagsCscope_Keep_Alive=1
		let GtagsCscope_Absolute_Path=1
		let g:GtagsCscope_Auto_Map=1
	" }
" Plugins Settings end }

" Keys mapping {
	" map leader, for shortcout mapping
	let mapleader=","

	" Space to command mode
        nnoremap <space> :

	nmap <Leader>y  "+y
	nmap <Leader>p  "+p

	" Gtags/Gtags-cscope shortcut
	map <Leader>gl :GtagsCscope<CR>

	map <Leader>tb :Tagbar<CR>
" Keys mapping end }
