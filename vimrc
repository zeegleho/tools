" ============================================================
" Options() - used to display some important option values
" within the status line (see below at "set statusline".
" ============================================================

fu! Options()
  let opt=""
  " autoindent
" if &ai|   let opt=opt." ai"   |else|let opt=opt." noai"   |endif
  if &ai|   let opt=opt." ai"   |endif
  "  expandtab
" if &et|   let opt=opt." et"   |else|let opt=opt." noet"   |endif
  if &et|   let opt=opt." et"   |endif
  "  hlsearch
" if &hls|  let opt=opt." hls"  |else|let opt=opt." noet"   |endif
  if &hls|  let opt=opt." hls"  |endif
  "  paste
" if &paste|let opt=opt." paste"|else|let opt=opt." nopaste"|endif
  if &paste|let opt=opt." paste"|endif
  "  shiftwidth
  if &shiftwidth!=8|let opt=opt." sw=".&shiftwidth|endif
  "  textwidth - show always!
                    let opt=opt." tw=".&tw
"   let opt=opt."\[".&lines.",".&columns."\]"
  return opt
endf

" highlight for status
set laststatus=2
"set statusline=%(%M%R%H%)\ %F\ %=%{Options()}\ <%l,%c%V>
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

" ============================================================
" Colorizing that status lines!  Whee!  :-)
" ============================================================
" 
"liush color
"hi Normal guibg=DarkBlue guifg=grey
hi Normal guibg=DarkBlue guifg=Blue
hi Comment    term=bold ctermfg=DarkGreen guifg=#0
hi Constant   term=underline ctermfg=Magenta guifg=#0
hi Special    term=bold ctermfg=Red guifg=Orange
hi Identifier term=underline cterm=bold ctermfg=Red guifg=#0
hi Statement  term=bold ctermfg=Red guifg=#0 gui=bold
hi PreProc    term=underline ctermfg=Red guifg=#0
hi Type   term=underline ctermfg=Blue guifg=#0 gui=bold
hi Ignore ctermfg=black guifg=bg
hi Statement  ctermfg=Blue gui=bold guifg=Red
"end liush color

"       User2: color for filename
  hi    User2 cterm=NONE    ctermfg=green  ctermbg=white  guifg=green  guibg=white
"       User3: color for position
  hi    User3 cterm=NONE    ctermbg=blue   ctermbg=white  guifg=blue   guibg=white

" choose the number of colors first

"if (&term=="xterm") || (&term=="xterm-16color")
"    if has("terminfo")
"	set t_Co=16
""	set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
""	set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
"    else
"	set t_Co=16
""	set t_Sf=[3%dm
""	set t_Sb=[4%dm
"    endif
" else
"    set t_Co=8
""    set t_AB=[%?%p1%{8}%<%t%p1%{40}%+%e%p1%{92}%+%;%dm
""    set t_AF=[%?%p1%{8}%<%t%p1%{30}%+%e%p1%{82}%+%;%dm
" endif

"disable the color for using default
"if (&term!="vt100") 
"    set background=dark
"    syn on 
"    endif
"
":function! ReverseBackground()
":   let Mysyn=&syntax
":   if &bg=="light"
":       se bg=dark
":   else
":       se bg=light
":   endif
":   syn on
":   exe "set syntax=" . Mysyn
"":   echo "now syntax is "&syntax
":endfunction
":command! Invbg call ReverseBackground()
"imap <F9> <ESC>:Invbg<CR>
"nmap <F9> :Invbg<CR>

"GUI related
set guifont=10x20

" disable alternate screen so that when we exit vim, the original screen
" is still there
set t_ti= t_te=
" <Tab> always stands for 8 spaces in the saved files
set tabstop=8
" however, when we press <Tab> during editing, we put in 4 spaces
" vim will take care of the translation between space and tab
set softtabstop=4
" number of spaces when we indent 
set shiftwidth=4
" max text width per line. this can be changed depending on the file
" type
" set textwidth=72
" auto indent
set autoindent
" smart indent
set smartindent
" enable using mouse in normal, visual, insert mode
"set mouse=nvi
"set mouse=ni
" when creating a new window, create below the current window
set splitbelow
" disable digraphs
set nodigraph	
" allow backspace over indent, eol and start 
set backspace=2
set   formatoptions=cqrt
set nojoinspaces
set cmdheight=1

set dict+=/usr/share/dict/words

set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
set title
set icon
set iconstring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

" some search options
set hlsearch
set incsearch
" ignore case during search
set ignorecase
" however if we have upper case letter in the search pattern,
" use case sensitive search
set smartcase

" show the matching bracket
set showmatch

set nostartofline
set history=100

" save the information for the session. somehow this is not done 
" automatically
set viminfo='50,\"1000,:0,n~/.viminfo

" my make program
"set makeprg=mmake
set makeprg=make
" my grep program
"set grepprg=fstr

" if there are multiple matches for the auto-complete, list
" the match list and automatically finish the name using the 
" first match
set wildmode=list:full
"enhanced mode for command-line completion
set wildmenu
"when auto-complete a file name, ignore the following files:
"au FileType cpp set suffixes=.bak,~,.o,.swp,.obj
set wildignore+=*.o,*.obj,*~,*.exe,*-g

" add horizontal scroll bar for gvim
set guioptions+=b

" c indent options
"
set cinoptions+=:0,g0,(0
" automatically indent when I type the following 
set cinkeys=0{,0},:,0#,!^F,o,O,e,!<Tab>

set tags=tags,./tags,../tags,../../tags
    
" mapping sections

"imap <C-J> <C-O>gqap
"nmap <C-J>      gqap
"vmap <C-J>      gq

""Emacs style commands
"imap <C-E> <ESC>A
"imap <C-A> <ESC>I
""imap <C-Back> <C-W>
""imap <C-K> <ESC>Da
"imap <C-Y> <ESC>pa
"nmap <C-E> A
"nmap <C-A> 0i 
""imap <C-D> <ESC>lxa
""nmap <C-D> x
""map <C-X><C-S> <ESC>wa
""map <C-X><C-C> <ESC>zz
"imap <C-X>2 <ESC><C-W>na
"nmap <C-X>2 <C-W>n
"imap <C-X>1 <ESC><C-W>oa
"nmap <C-X>1 <C-W>o
"imap <C-X>0 <ESC><C-W>c
"nmap <C-X>0 <C-W>c
"imap <C-X>o <ESC><C-W>wa
"nmap <C-X>o <C-W>w
"nmap <C-W>h :split<CR>

"nmap <C-L> i<C-X><C-L><ESC>
"imap <C-L> <C-X><C-L>
"nmap <C-I> a<C-I><ESC>

" Copy
imap <F11> <ESC>"*y
nmap <F11> "*y
vmap <F11> "*y

"nmap Y "*y
vmap Y "*y

" Paste
"imap <F12> <ESC>"*p
"nmap <F12> "*p
"vmap <F12> "*p
"
nmap P "*p
vmap P "*p

imap <F12> <ESC>:make compile<cr>
nmap <F12> :make compile<cr>


" Cut
imap <F10> <ESC>"*d
nmap <F10> "*d
vmap <F10> "*d
vmap D "*d

" weird bug of vim ... have to map Ctrl-V < to <
imap < <
map <CR> G
imap <F3> <ESC>:w<cr>:make -j3 exe-g<cr>
nmap <F3> :w<cr>:make -j3 exe-g<cr>

imap <F4> <ESC>:make -j3 compile<cr>
nmap <F4> :make -j3 compile<cr>

" grep the word under the cursor in the current directory
nmap gc :grep <cword> *.cxx *.c *.cpp *.C *.cc<cr>
" grep the word under the cursor in the current file's directory
nmap gC :grep <cword> %:p:h/*.cxx %:p:h/*.cpp %:p:h/*.C %:p:h/*.cc %:p:h/*.c<cr>

" grep the word under the cursor in the current directory
nmap gh :grep <cword> *.h<cr>
" grep the word under the cursor in the current file's directory
nmap gH :grep <cword> %:p:h/*.h<cr>
"for clear case usage
nmap <F5> :! cleartool co -nc %<CR>

"for building ctags
nmap <F6> :!ctags -o tags -R .<CR>
nmap <F7> :!ctags -o tags -R ..<CR>

nmap gs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap gt <C-]>
nmap gb <C-T>

nmap <F2> :w<cr>
imap <F2> <ESC>:w<cr>
" spelling checker
:map ,is :w<CR>:!ispell % <CR>:e!<CR><CR>		" spell checker

map ,s :source ~/.vimrc<CR>
map ,v :e ~/.vimrc<CR>

" replace x with y and y with x
" very useful ... 
nmap ,x :s/y/x/cg<CR>
nmap ,y :s/x/y/cg<CR>

"map ,c f_x~ 
"nmap ,k kly$jp
"nmap ,c "*y
"nmap ,p "*p
"
nmap ,w :set co=90\| set lines=50<cr>

:filetype on
:syntax on
" auto commands
:au FileType tex	 map <F12> :!dotex -ps %<<cr>
:au FileType html   	 map <F12> :!links file://%<cr>
:au FileType c	    	 set number| set cin|set tw=0
:au FileType cpp    	 set number| set cin|set tw=0 
:au FileType matlab 	 set tw=0 
:au FileType perl   	 set number| set tw=0 |set cin
:au FileType python 	 set number| set tw=0 |set cin

" this is causing some trouble when vim is used in workshop
" and we are using 5.60 in workshop. Disable it for now
if version >= 600
    " When editing a file, always jump to the last cursor position
    au  BufReadPost * if line("'\"") | exe "normal '\"" | endif
endif

let &shell="bash"

:function! Fixdel()
:      set t_kb=
:   fixdel
:endfunction
:command! Fixd call Fixdel()

" common types
iab fro for
iab teh the
 
" 
"iab fb licRioBasic
"iab fm licRioMagic
"iab fr licRioRDL

"operations on multiple vim window
"nmap <C-J> <C-W>j<C-W>_
"nmap <C-K> <C-W>k<C-W>_
"set wmh=0
"config from MiniBufExplorer
"ctrl + <Tab> ctrl+shift+tab
let g:miniBufExplMapCTabSwitchBufs=1
"ctrl + <h j k l> to move the cursor
let g:miniBufExplMapWindowNavVim = 1
"ctrl + <up down left right arrow> to move the cursor
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplSplitBelow=0  " Put new window above

"for taglist.vim config
"http://www.vim.org/scripts/script.php?script_id=273
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
"let TList_Inc_Winwidth=0
"creates a normal mode mapping for the <F8> key to toggle the taglist window.
nnoremap <silent> <F8> :TlistToggle<CR>

"for winmanager.vim config
"http://www.vim.org/scripts/script.php?script_id=95
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
"SuperTab
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"set wildmenu
"set wildmode=list:longest,full

"use quickfix for cscope
:set cscopequickfix=s-,c-,d-,i-,t-,e-

"for C/C++ programming
ab printf printf("\n");
ab class class Name {<CR>public:<CR>Name(){}<CR>};<ESC>kkkllll
set fileencodings=utf-8,gbk,gb2312,gb18030
