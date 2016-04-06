set runtimepath^=/au/IT/share_vim

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'tpope/vim-fugitive'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Bundle 'groenewege/vim-less'
Bundle 'mustache/vim-mustache-handlebars'
Plugin 'tsukkee/unite-tag'
Bundle 'mileszs/ack.vim'
Plugin 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

call vundle#end()

filetype plugin indent on
au BufNewFile,BufRead *.gradle setf groovy

"
" remap Home/End keys in VNC so they work?
"
set wrap

"
" misc
"
"hi Define  term=bold ctermfg=LightGreen guifg=Blue

set autoindent

"no swap file
set uc=0

set nocp              " be vim, not vi ;-)
"set makeprg=gmake    " use gnumake for :make
set ttyfast           " redraw at reasonable times

"
" keyboard
"
set backspace=2	      " Make bacspace WORK in insert mode

"
" wrapping
"
set nowrap            " don't wrap lines!
" wrap toggle
map tw :set invwrap<cr>
" map nu :set undolevels=-1<cr>

"
" searching
"
set ignorecase        " ignore case while searching REGEX, but:
set smartcase         " if capitals are used in REGEX, use them
set hlsearch          " highlight all occurences of REGEX
set incsearch         " highlight and jump to first occurence of REGEX
" toggle hlsearch
map th :set invhlsearch

"
" code style
"
set tabstop=2         " use 2 space tabs
set softtabstop=2     " makes 2 spaces feel like tabs
set shiftwidth=2      " Indent 2 spaces
set expandtab         " expand tabs into spaces (bad for Makefiles)
  " /usr/local/share/vim/ftdetect avoids Makefiles
set formatoptions=    " disable unwanted vim formating
set showmatch         " disable matching [({ for ]}] when inserted

"
" status line
"
set ruler             " show row/col information
set shortmess=a       " show terse messages in status line
set showcmd           " show what command is being typed
set cmdheight=2       " try to eliminate some "press RETURN" messages
set laststatus=2      " always display a status line

"
" mouse (annoying, disable for now)
"
"set mouse=a           " use the mouse to move the cursor in all modes
"set mousehide         " hide the mouse cursor when appropriate

"
" filename completion
"
set wildignore+=*~      " ignore ~    files for filename completion
set wildignore+=*.bak   " ignore .bak files for filename completion
set wildignore+=*.o     " ignore .o   files for filename completion
set wildignore+=*.class " ignore .o   files for filename completion

"
" when <TAB> is used for filename completion, display the longest
" common matching strint, and display a list of all possible matches
" each time <TAB> is hit again, choose the next full match
"
set wildmode=longest:list,full

"
" emacs sytle window management
"
" split current into 2 windows
map 2 :split<cr>
" go to next window
map o 
" make current the only window
map 1 o

set hidden


"
" tags
"
"let &tags=system('tags_path | perl -pe "chop;"')
map tf g
map tn :tn!<cr>
map tp :tp!<cr>
map tb 
map tl :tags<cr>

map [11~ 0A 0Dppj
map [[A 0A 0Dppj

"
" syntax hilighting
"
set background=dark
syntax enable
" Some stupid bullshit hack:
" http://stackoverflow.com/questions/5602767/why-is-vim-not-detecting-my-coffescript-filetype
filetype off
filetype on


"
" automatically handle compressed files
"
augroup gzip
    autocmd!
    autocmd BufReadPre,FileReadPre     *.gz set bin
    autocmd BufReadPost,FileReadPost   *.gz '[,']!gunzip
    autocmd BufReadPost,FileReadPost   *.gz set nobin
    autocmd BufReadPost,FileReadPost   *.gz execute ":doautocmd BufReadPost " . expand("%:r")
    autocmd BufWritePost,FileWritePost *.gz !mv <afile> <afile>:r
    autocmd BufWritePost,FileWritePost *.gz !gzip <afile>:r

    autocmd FileAppendPre              *.gz !gunzip <afile>
    autocmd FileAppendPre              *.gz !mv <afile>:r <afile>
    autocmd FileAppendPost             *.gz !mv <afile> <afile>:r
    autocmd FileAppendPost             *.gz !gzip <afile>:r
augroup END

augroup compress
    autocmd!
    autocmd BufReadPre,FileReadPre     *.Z set bin
    autocmd BufReadPost,FileReadPost   *.Z '[,']!uncompress
    autocmd BufReadPost,FileReadPost   *.Z set nobin
    autocmd BufReadPost,FileReadPost   *.Z execute ":doautocmd BufReadPost " . expand("%:r")
    autocmd BufWritePost,FileWritePost *.Z !mv <afile> <afile>:r
    autocmd BufWritePost,FileWritePost *.Z !compress <afile>:r

    autocmd FileAppendPre              *.Z !uncompress <afile>
    autocmd FileAppendPre              *.Z !mv <afile>:r <afile>
    autocmd FileAppendPost             *.Z !mv <afile> <afile>:r
    autocmd FileAppendPost             *.Z !compress <afile>:r
augroup END

set grepprg=grep\ -rni

let mapleader=","
let g:CommandTAcceptSelectionSplitMap="<C-h>"
" ,cd - Set cwd of the window to directory of current file and print it
"nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

" double percentage sign in command mode is expanded to dir of current file
"cnoremap %% <C-R>=expand('%:h').'/'<cr>

" ,f - searches everything under cwd
"map <leader>f :CommandTFlush<cr>\|:CommandT<cr>

" ,F - searches everything under directory of current file
"map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>
map <leader>c :let @/ = ""<cr>

"
" vile style buffer management
"
map bl  <leader>b
map b1  :1buffer!<cr>
map b2  :2buffer!<cr>
map b3  :3buffer!<cr>
map b4  :4buffer!<cr>
map b5  :5buffer!<cr>
map b6  :6buffer!<cr>
map b7  :7buffer!<cr>
map b8  :8buffer!<cr>
map b9  :9buffer!<cr>
map bn  :bnext!<cr>
map bp  :bprev!<cr>
map bd  :bdelete<cr>

map gw :grep <cword>

function! GrepForCurrentWord()
    ccl
    call inputsave()
    let b:tm_grep_folder = input('Folder: ', "", "file")
    call inputrestore()

    if b:tm_grep_folder == ""
      let b:tm_grep_folder = "."
    endif

    execute "grep! " . shellescape(expand("<cword>")) . " " . b:tm_grep_folder
    cw
endfunction

function! GrepForCurrentWordRails()
    ccl
    execute "grep! " . shellescape(expand("<cword>")) . " app lib config"
    cw
endfunction

nnoremap <leader>b :buffers<cr>:buffer<space>
"nnoremap <leader>g :call GrepForCurrentWord()<cr>
"nnoremap <leader>f :call GrepForCurrentWordRails()<cr>
nnoremap <leader>q :qa<cr>
nnoremap <leader>a :Ant debug install<cr>
nnoremap <leader>i :JavaImportOrganize<cr>
nnoremap <leader>u :ProjectCacheClear<cr>:ProjectRefreshAll<cr>
nnoremap <leader>n :lnext<cr>
nnoremap <leader>p :lprev<cr>
nnoremap <leader>v :vsplit<cr>
nnoremap <leader>s :split<cr>
nnoremap <leader>e :Ex<cr>
nnoremap <leader>o :only<cr>

let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#custom#source('file_rec/async', 'ignore_pattern', 'html/\|build/\|.svn/\|Debug/\|.xcodeproj/\|.vcxproj\|.suo\|.git\|.class')
"let g:unite_source_find_default_opts = "-L"
"call unite#custom#source('file_rec/async', 'filters', 'DevLibs')
map <leader>t :Unite -start-insert -no-split -buffer-name=files file_rec/async<cr>
map <leader>b :<C-u>Unite -no-split -buffer-name=buffer buffer<cr>
map <leader>g :Unite -buffer-name=grep grep:.::<c-r><c-w><cr>
map <leader>g :Unite -no-split grep:.<cr>
map <leader>e :Unite -no-split -auto-preview -start-insert tag<cr>
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
let g:unite_source_grep_recursive_opt = ''

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction


fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
"autocmd BufWritePre * :%s/\s\+$//e

"set t_Co=256
"color inkpot
"
nnoremap <Leader>m :w <BAR> !less/bootstrap.less > css/bootstrap.css<CR><space>
