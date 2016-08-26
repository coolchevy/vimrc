" .vimrc file
" Maintainer:	coolchevy@gmail.com
"-------------------------------------------------------

"-------------------------------------------------------
" Vundle

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim wombat colorscheme for pathogen.vim
Plugin 'cschlueter/vim-wombat'
" vim colorscheme https://github.com/jonathanfilip/lucius
Plugin 'jonathanfilip/vim-lucius'
" The Erlang plugin for Vim.
"Plugin 'jimenezrick/vimerl'
"Plugin 'vim-erlang/vim-erlang-runtime'
Plugin 'oscarh/vimerl'
Plugin 'vim-erlang/vim-erlang-skeletons'
Plugin 'edkolev/erlang-motions.vim'
Plugin 'mbbx6spp/vim-rebar'
Plugin 'akalyaev/vim-erlang-spec'
Plugin 'vim-erlang/vim-erlang-omnicomplete'
Plugin 'vim-erlang/vim-erlang-tags'
"Erlang-friendly gVim/MacVim colorscheme (dark, lo-co)
Plugin 'aerosol/vim-compot'
" syntax checker
Plugin 'scrooloose/syntastic'
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
Plugin 'ctrlpvim/ctrlp.vim'
" sensible.vim: Defaults everyone can agree on
Plugin 'tpope/vim-sensible'
"A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
" The ultimate vim statusline utility. DEPRECATED in favor of Lokaltog/powerline.
Plugin 'bling/vim-airline'
" fugitive.vim: a Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'
" nginx webserver
Plugin 'nginx.vim'
" Simple indent for apache config files
Plugin 'apachestyle'
" Vim script for text filtering and alignment
Plugin 'godlygeek/tabular'




" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-------------------------------------------------------

"ignore case when search
"set ignorecase

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent		" always set autoindenting on

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set winaltkeys=no
set filetype=on
set fileformat=unix
set wrap

autocmd FileType python set softtabstop=4 shiftwidth=4 expandtab nowrap smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"au! BufRead,BufNewFile *.json set filetype=javascript "foldmethod=syntax
au BufRead,BufNewFile *.json set filetype=json foldmethod=syntax

autocmd FileType php set softtabstop=4 shiftwidth=4 expandtab
autocmd BufRead * silent! %s/[\r \t]\+$//
"au BufNewFile,BufRead *.dump set filetype=sql

let PHP_removeCRwhenUnix = 1

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p <Esc>:let current_reg = @"<CR>gvs<C-R>=current_reg<CR><Esc>

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
"  autocmd GUIEnter * winpos 0 0
"  autocmd GUIEnter * simalt ~x


endif " has("autocmd")

"Key mapping
map  <F3> :sp.<CR>
map  <C-TAB> :bnext<CR>
"map <F8> :Tlist<CR>
map <F8> :set nu!<CR>
"map <F9> :TlistSync<CR>
map <F6> :bprevious<CR>
map <F7> :bnext<CR>
nmap <F10> :q<CR>
imap <F10> <ESC>:q<CR>
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>i<Right>
nmap ,s :source ~/.vimrc<CR>
nmap ,v :e ~/.vimrc<CR>
"nmap <F9> :make<CR>
"imap <F9> <ESC>:make<CR>
nmap ,t :read !my_date <CR>
"HTML
imap <C-B> <br>
imap <C-Space> &nbsp;
vmap sb "zdi<b><C-R>z</b><ESC>
vmap s! "zdi<!--<C-R>z--><ESC>

"PHP
nmap ,/ I//<ESC>
vmap sp "zdi<?php = <C-R>z ?><ESC>

" show '(' when ')' is inputed
set showmatch
set matchtime=3

" don't create '~' files
set nobackup






" don't bell
set noeb
set vb

" indenting
set expandtab
set tabstop=4
set shiftwidth=4
set si
set smarttab
"set nowrap
"set number

" virtual editing
set virtualedit=block
set textwidth=255

set encoding=8bit-utf-8
set termencoding=utf-8

set wildmenu
set wcm=<Tab>
menu Encoding.koi8-u   :e ++enc=koi8-u<CR>
menu Encoding.koi8-r   :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.ibm-866      :e ++enc=ibm866<CR>
menu Encoding.utf-8                :e ++enc=utf-8 <CR>
menu Encoding.utf-16                :e ++enc=utf-16 <CR>
map <F9> :emenu Encoding.<TAB>
nmap <C-J> :%!python -m json.tool<CR>

"clean html
nmap <C-L> :%s/>/>\r/g <CR> :%s/</\r</gc <CR> :%s/^[\ \t]*\n//g <CR>



" some funcs

let b:encindex=0
function! RotateEnc()
	let y = -1
	while y == -1
		let encstring = "#8bit-cp1251#8bit-cp866#utf-8#koi8-r#koi8-u#"
		let x = match(encstring,"#",b:encindex)
		let y = match(encstring,"#",x+1)
		let b:encindex = x+1
		if y == -1
			let b:encindex = 0
		else
			let str = strpart(encstring,x+1,y-x-1)
			return ":set encoding=".str
		endif
	endwhile
endfunction

" SET GUI FONT
if has("gui_running")
    if has("gui_gtk2")
	set guifont=Terminus\ 12
    elseif has("x11")
	set guifont=-*-Terminus-medium-r-normal-*-*-180-*-*-m-*-*
    else
"        set guifont=Terminus:h12:cDEFAULT
	set guifont=Monaco:h14
    endif
endif
" / SET GUI FONT

""iab dprint print "<pre>debug: \n";<CR>print_r($);<CR>print "</pre>\n";<CR>
"iab dprint <CR>print 'DEBUG'<CR>
"iab fwred $this->Redirect();
"iab ro require_once();
"iab io include_once();
"iab sqlq $db->query();
"iab sqlqs $db->query_result(, FM_);
"iab dtbl {$db->tbl}
"iab dp dump(, '');
"python
"iab utfheader # -*- coding:utf-8 -*-
"iab vinow :r! date<CR><Esc>


set statusline=%<%f%h%m%r%=%b\ %{&encoding}\ 0x%B\ \ %l,%c%V\ %P

" SHIFT-Del Cut
vnoremap <S-Del> "+x

" CTRL-Insert Copy
vnoremap <C-Insert> "+y

" SHIFT-Insert Paste
map <S-Insert>		"+gP
cmap <S-Insert>		<C-R>+

" CTRL-a Select All
map <C-a>	ggVG

let python_highlight_all = 1


function! Pep8all()
    let oldGrepPrg=&grepprg
    let &grepprg='pep8 --filename="*py" .'
    execute "grep"
    let &grepprg=oldGrepPrg
    cw
endf
command! Pep8all call Pep8all()

function <SID>Pep8()
    set lazyredraw
    " Close any existing cwindows.
    cclose
    let l:grepformat_save = &grepformat
    let l:grepprogram_save = &grepprg
    set grepformat&vim
    set grepformat&vim
    let &grepformat = '%f:%l:%m'
    let &grepprg = 'pep8 --repeat'
    if &readonly == 0 | update | endif
    silent! grep! %
    let &grepformat = l:grepformat_save
    let &grepprg = l:grepprogram_save
    let l:mod_total = 0
    let l:win_count = 1
    " Determine correct window height
    windo let l:win_count = l:win_count + 1
    if l:win_count <= 2 | let l:win_count = 4 | endif
    windo let l:mod_total = l:mod_total + winheight(0)/l:win_count |
		\ execute 'resize +'.l:mod_total
    " Open cwindow
    execute 'belowright copen '.l:mod_total
    nnoremap <buffer> <silent> c :cclose<CR>
    set nolazyredraw
    redraw!
endfunction

if ( !hasmapto('<SID>PEP8()') && (maparg('<F5>') == '') )
    map <F5> :call <SID>Pep8()<CR>
    map! <F5> :call <SID>Pep8()<CR>
else
    if ( !has("gui_running") || has("win32") )
	echo "Python PEP8 Error: No Key mapped.\n".
		    \ "<F5> is taken and a replacement was not assigned."
    endif
endif

"nmap <buffer> <F5> :w<Esc>mwG:r!python %<CR>`.




"autocmd BufRead *.py set tabstop=4
"autocmd BufRead *.py set nowrap
"autocmd BufRead *.py set go+=b
"autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
"autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
"autocmd BufRead *.py nmap <F5> :!python %<CR>



"BINDINGS
" Changing Case
" guu                             : lowercase line
" gUU                             : uppercase line
" Vu                              : lowercase line
" VU                              : uppercase line
" g~~                             : flip case line
" vEU                             : Upper Case Word
" vE~                             : Flip Case Word
" ggguG                           : lowercase entire file
" set list/nolist :show advanced symbols

"let erlang_keywords = 1
"let erlang_functions = 1
"let erlang_characters = 1
"
"HL
"set nowrap list listchars=eol:¿,tab:¿¿,trail:_,extends:¿,precedes:¿

"wildmenu
set wildmenu
set wildmode=list:longest,full

"gotofile
nnoremap gf :vertical wincmd f<CR>

"mouse
"set mouse=a


" VimClojure
"execute pathogen#infect()
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
let g:vimclojure#WantNailgun = 1

au FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"

"" --------------------------------------
"" colors
"" --------------------------------------
set t_Co=256
if has("gui_running")
"if has("gui_gtk2")
"    if has("x11")
"    colorscheme desert
"    colorscheme MetaCosm
"    colorscheme wombat
    colorscheme compot
    set guioptions=-t
    "highlight Normal guibg=lightyellow
else
    colorscheme lucius
endif
set background=dark
"colorscheme koehler
"colorscheme slate
"colorscheme desert
"hi Folded ctermbg=yellow
"let g:colors_name="desert"
"highlight Comment cterm=italic
"highlight Comment font=Verdana:h14
"highlight Comment term=italic cterm=italic gui=italic
"highlight Constant term=bold cterm=bold gui=bold
"highlight Comment ctermbg=DarkGray
"highlight Comment cterm=none term=italic gui=italic
"


"folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf


let g:erlangManPath='/opt/local/lib/erlang/man'
"let g:erlangCompletionDisplayDoc=1
"let g:erlangHighlightBif=1

"Erlang skeleton

let g:erl_author="Vitalii Kulchevych <coolchevy@gmail.com>"
let g:erl_company="coolchevy"
let g:erl_replace_buffer=1

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" hide error list
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'

let g:syntastic_python_checkers=['python', 'flake8']
let g:syntastic_python_flake8_post_args='--ignore=W391'
let erlang_show_errors = 1



"-------------------------------------------------------
" erlang spec
" \s added spec
nnoremap <leader>s :ErlangSpec<CR>
"
"-------------------------------------------------------
" erlang tags
let g:erlang_tags_outfile = '.tags'


" show column limit to 80
augroup collumnLimit
    autocmd!
    autocmd BufEnter,WinEnter,FileType scala,java,erlang
                \ highlight CollumnLimit ctermbg=DarkGrey guibg=DarkGrey
    let collumnLimit = 79 " feel free to customize
    let pattern =
                \ '\%<' . (collumnLimit+1) . 'v.\%>' . collumnLimit . 'v'
    autocmd BufEnter,WinEnter,FileType scala,java,erlang
                \ let w:m1=matchadd('CollumnLimit', pattern, -1)
augroup END
