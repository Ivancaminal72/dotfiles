""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       ToDos
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" - test unnamedplus (with tmux)
" - (rt) is not working?
" - (al) with "->" delimiter (use <C-x> for generic delimiters)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       General options (set)                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                   " Use Vim settings, rather than Vi settings (much better!).
                                   " This must be first, because it changes other options as a side effect.

set encoding=utf-8                 " to avoid problems woth listchars
set backspace=indent,eol,start     " allow backspacing over everything in insert mode
set history=100                    " keep 100 lines of command line history
set ruler                          " show the cursor position all the time
set showcmd                        " show still incomplete cmdline (eg. commands in visual mode)
set incsearch                      " show first match while typing the pattern
set mouse=a                        " use mouse
set ttymouse=sgr                   " to be able to use mouse on vim borders when vim is run over tmux
set nowrap                         " avoid wrapping
set virtualedit=onemore            " really go to EOL (see "Cursor Position" to avoid moving left when leaving insert mode)
set splitright                     " vsplit on right
set splitbelow                     " split below
set autowrite                      " automatically save changes (build without save)
set laststatus=2                   " always see the status bar (see "Coloring" to use the bar to highlight the current mode)
set showtabline=2                  " always see the tab bar (see "Coloring" to use the bar to highlight the current mode)
set textwidth=120                  " desired width limit
set colorcolumn=0                  " to see a line to the text limit (see "Coloring", SwitchDecorations) (disabled)
set nocursorline nocursorcolumn    " cursor colum and line non visible by default
set autoindent                     " autoindent
set foldmethod=syntax              " use the syntax to decide folding 
set nofoldenable                   " disable folding by default (using tagbar is much better)
set pastetoggle=<F1>               " remove all auto* features when pasting from X
set scrolloff=10                   " to scroll before first/last line
set sidescrolloff=10               " to scroll before first/last character in a line
set sidescroll=1                   " to scroll a signle character horizontally
set wildmode=longest:list          " use cmdline completion (tab) as a normal shell completion
set autoread                       " file is reloaded if changed in a cmdline (:! whatever), very useful for "wds" and "wdg" commands
set undofile                       " for persistent undo
set ignorecase                     " to search case insesitive
set smartcase                      " to search case insesitive, unless using an upper case
set listchars=tab:>·,trail:·,eol:· " special characters
set nolist                         " to not visualize special special characters (see 'listchars'), use <F3> to toggle (see SwitchDecorations)
set whichwrap=b,s,<,>,[,]          " to move line up/down with left/right at the begin/end of a line
set nobackup                       " no backup files, we should use git/svn always, and we have the persistent undo
set noswapfile                     " no swap files, we should use git/svn always, and we have the persistent undo
set undodir=~/.vim/tmp/            " location of the undo directory
"set keywordprg=                   " used by 'K' (man -s), 
set grepprg=grep\ -n\ --exclude-dir=.svn\ $*\ /dev/null " to exclude svn/git results from search results

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  General options (non-set)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let &colorcolumn=join(range(91,999),",") " all the columns from the textwidth are colored as the limiting colum (how to use textwidth var?) (see SwitchDecorations)
" let mapleader='+'                  " maybe, because the remaps, I can just use the default...?
let mapleader='¡'                  " maybe, because the remaps, I can just use the default...?
runtime ftplugin/man.vim           " to be able to render man pages
runtime ftplugin/vim.vim           " to use the vim help
source $VIMRUNTIME/menu.vim        " just to have some fancy (useless?) menus with (:emenu<space><tab>)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Plugins list (vundle)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype off                                 " required by vundle

set rtp+=~/.vim/bundle/Vundle.vim            " set the runtime path to include Vundle and initialize
call vundle#begin()

" Plugin Manager
Plugin 'VundleVim/Vundle.vim'                " let Vundle manage Vundle, required

" Browsing
Plugin 'scrooloose/nerdtree.git'             " file browser (not really useful... ctrlp/unite and wildmode are better?)
"Plugin 'ctrlp.vim'                           " I'm just not using it...?
Plugin 'majutsushi/tagbar'                   " outline window (uses its own ctag of current file only)
Plugin 'mbbill/undotree'                     " visualization of the undotree as a version control (F5 -> :UndotreeToggle)
Plugin 'bufexplorer.zip'                     " visualization of the buffers list
" Plugin 'derekwyatt/vim-fswitch'            " (not tested, using manual setup with sh+st)

" Version Control and Project Management
Plugin 'vcscommand.vim'                      " version control git+svn together
" Plugin 'vitra'                               " trac integration (TTOpen) (removed to avoid loading problems with EMCommand)
" Plugin 'Align'                               " used by vitra
" Plugin 'tracwiki'                            " used by vitra

" Less typing
" Plugin 'Valloric/YouCompleteMe'            " too requieriments to be build?
" Plugin 'Shougo/neocomplete.vim'            " not semantics -> use clan_complete (see fix in advanced setup)
" Plugin 'Rip-Rip/clang_complete'            " only works for C/C++... but works great!
Plugin 'vim-scripts/OmniCppComplete'         " simpler, it uses ctags (not works in auto mode for unscoped vars)
Plugin 'mbbill/code_complete'                " for arguments and snippets (CodeComplete)
" Plugin 'vim-scripts/AutoComplPop'          " used for unescoped vars (works in automode forunscoped
" Plugin 'ervandew/supertab'                 " to complex, homade function is simpler and enough
Plugin 'matchit.zip'                         " improves surroundings with more than simple characters
                                             " maybe we should use 'runtime macros/matchit.vim' instead of a plugin?
" Plugin 'AutoClose'                         " autoclosing the surroundings (not necessary with code_complete?)
                                             " it closes the preview if line 162 (pclose) is not commented
" Plugin 'Raimondi/delimitMate'                " the expanding with <Return> fails because of the not miving cursor when InsertLeave
Plugin 'jiangmiao/auto-pairs'                " to autoclose pairs

" Plugin 'tpope/vim-commentary'              " I don't like the commenting style for C/C++, and only works for lines
Plugin 'tomtom/tcomment_vim'                 " add the comment action (gc -> cm) for motions and text objects

" Async commands
Plugin 'tpope/vim-dispatch.git'              " background/async builds (how to use it for grep?)
" Plugin 'AsyncCommand'                      " background/async builds (needs vim --servername)

" Project management
Plugin 'vim-scripts/DfrankUtil'              " needed by vimprj
Plugin 'vim-scripts/vimprj'                  " .vimprj directory is source
" Plugin 'vim-scripts/indexer.tar.gz'        " to generate ctags (needs servername -> done manually with .vimprj + vim-dispatch)
Plugin 'dkprice/vim-easygrep'
" More
Plugin 'milkypostman/vim-togglelist'         " toggle quickfix list (see ToggleQuickfixList) (ql with Copen for disapth)

" Easy motions
Plugin 'easymotion/vim-easymotion'           " best motion ever!
Plugin 'haya14busa/vim-easyoperator-line'    " use 2 easymotions to define a range of lines (y,d,v operators only)
Plugin 'haya14busa/vim-easyoperator-phrase'  " use 2 easymotions to define a range between chars (y,d,v only)
Plugin 'haya14busa/incsearch.vim'            " necessary dependency
Plugin 'haya14busa/incsearch-easymotion.vim' " necessary dependency
Plugin 'haya14busa/incsearch-fuzzy.vim'      " fuzzy motion

" Plugin 'rhysd/open-pdf.vim'                " pdfs (not very useful, but...)
Plugin 'kshenoy/vim-signature'               " tu visualitze marks (smm)
" Plugin 'vim-scripts/yate'                  " much slower than simple :*tag
" Plugin 'bling/vim-airline'                 " too fancy for me? I'll give it a second chance in a while...
" Plugin 'vim-scripts/YankRing.vim'  "replaced by easyclip?
Plugin 'tpope/vim-repeat'                    " needed dependency (surround, abolish, and easy-clip)
Plugin 'svermeulen/vim-easyclip'             " much better yank, cut, delete and rotating paste
Plugin 'terryma/vim-expand-region'
Plugin 'kana/vim-textobj-user' 
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-entire'

Plugin 'tpope/vim-surround'                  " defines surroundings as text objects (yank surroundings mean 'add' them)

" Languages
Plugin 'ekalinin/Dockerfile.vim'             " dockerfile syntax

Plugin 'blueyed/vim-diminactive'             " to dim the inactive window
Plugin 'szw/vim-maximizer'                   " :MaximizerToggle works nice
" Plugin 'vim-scripts/ZoomWin'               " to zoom in/out a window (buggy?)
" Plugin 'tmux-plugins/vim-tmux-focus-events' " it fires some error...?

Plugin 'vim-scripts/visualrepeat'            " used easy-align
Plugin 'junegunn/vim-easy-align'             " adding the align operator (al)
" Plugin 'tommcdo/vim-lion'                  " cannot right-align the first column?

Plugin 'tpope/vim-abolish'                   " adding snake/camel/mixed/upper case control in the iw and with :S
Plugin 'tommcdo/vim-exchange'                " to add the cx operator

call vundle#end()                  " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                              Coloring
"
" Issues
" - should I use guicolorscheme or CSApprox?
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if &t_Co > 2 || has("gui_running")  
    " Also switch on highlighting the last used search pattern.
    syntax on

    set term=xterm-256color                                 " must be also set in tmux!
    set t_ut=''                                             " avoid conflict in with BackgroundColorErase tmux (does it force bg color?)
    colorscheme ron                                         " other alternatives I liked: koehler delek
    highlight clear Search                                  " Search: matched results
    highlight Search term=reverse cterm=reverse gui=reverse
    highlight clear IncSearch                               " IncSearch: while typing a search pattern
    highlight IncSearch term=bold ctermbg=4 guibg=slateblue
    highlight clear Todo                                    " Todo: Special hi
    highlight Todo term=reverse cterm=reverse gui=reverse
    highlight clear Pmenu                                   " Pmenu: used by Neocomplete/YouCompleteMe
    "    highlight Pmenu term=reverse cterm=reverse gui=reverse
    highlight Pmenu term=bold    ctermfg=LightGreen ctermbg=DarkGrey 
    highlight clear MatchParen                              " MatchParen: surroundings
    highlight MatchParen term=underline cterm=underline gui=underline

    "    highlight CursorColumn 
    highlight clear CursorLine 
    highlight CursorLine term=reverse ctermbg=242 guibg=Grey40
    highlight clear ColorColumn
    highlight ColorColumn term=reverse ctermbg=242 guibg=Grey40

    au InsertEnter * hi StatusLine  term=reverse ctermbg=Black ctermfg=Red 
    au InsertEnter * hi VertSplit   term=reverse ctermbg=Black ctermfg=Red 
    au InsertEnter * hi TabLineFill term=reverse ctermbg=Black ctermfg=Red 
    au InsertEnter * hi TabLineSel  term=reverse ctermbg=Black ctermfg=Red 
    au InsertEnter * hi Title       term=reverse ctermbg=Black ctermfg=Red 
    au InsertLeave * hi StatusLine  term=reverse ctermbg=Black ctermfg=White 
    au InsertLeave * hi VertSplit   term=reverse ctermbg=Black ctermfg=White 
    au InsertLeave * hi TabLineFill term=reverse ctermbg=Black ctermfg=White 
    au InsertLeave * hi TabLineSel  term=reverse ctermbg=Black ctermfg=White 
    au InsertLeave * hi Title       term=reverse ctermbg=Black ctermfg=White 


    "    hi link EasyMotionTarget        ErrorMsg
    "    hi link EasyMotionShade         Comment
    "    hi link EasyMotionTarget2First  MatchParen
    "    hi link EasyMotionTarget2Second MatchParen
    hi link EasyMotionMoveHL        Search

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        File Types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au FileType help wincmd L " forcing help to be vertical splitted
au FileType man  wincmd L " forcing man to be vertical splitted

filetype plugin indent on " Enable file type detection.
                          " Use the default filetype settings, so that mail gets 'tw' set to 72,
                          " 'cindent' is on in C files, etc.
                          " Also load indent files, to automatically do language-dependent indenting.

"
" Known extensions
"
au BufRead,BufNewFile .vimprj		set filetype=vim 
au BufRead,BufNewFile *.build		set filetype=python
au BufRead,BufNewFile *.scons		set filetype=python
au BufRead,BufNewFile *onstruct     set filetype=python
au BufRead,BufNewFile *.hpp 		set filetype=cpp.doxygen
au BufRead,BufNewFile *.test		set filetype=cpp.doxygen

"
" Matchit is not working properly on my setup for C/C++?
" (should be in share/.../ftplugin/c.vim)
"
au FileType c,cpp let b:match_words='\%(\<else\s\+\)\@<!\<if\>:\<else\s\+if\>:\<else\%(\s\+if\)\@!\>,\<switch\>:\<case\>:\<default\>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Plugins configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" tcomment
"
let g:tcommentMapLeaderOp1 = 'cm'        " use 'cm' instead of 'gc'
let g:tcommentOptions      = {'col': 1}  " line comments on the first column

"
" NERDTree
"
let g:NERDTreeHijackNetrw=0             " to avoid conflicts between VCSStatus and NeerdTree


"
" CtrlP
"
let g:ctrlp_working_path_mode = 'a'     " to search on the ecurrent directory
" let g:ctrlp_working_path_mode = 'ar'

"
" Signature
"
let g:SignatureEnabledAtStartup = 0  " not showing marks by default


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                         Tab Completion, OmniCppComplete and Surrounding
"
" - AutorPairs works with "", '', {}, [], () in insert mode
"   - Open pairs wirtes both
"   - Closing pairs flies to end of that closing pair 
"   - <Space> and <Return> inside pairs expand both sides 
" - In normal mode:
"   - Open pairs search for previos open pair
"   - Closing pairs search for next closing pair
"   - s+pair flies to current open/close pair
" - See Text Objects for next/last inner/outer pairs
" - yank surrounding is add surround -> ys == as
" - using omnicomplete with tags and cscope
" - Tab is context aware:
"   - filename if '/' if is found 
"   - omnicomplete if '.','->' or '::' is found
"   - arguments completion if in parenthesis
"     - <S-Tab> to loop arguments
"   - normal compete if none of the previous
"   - normal tab if no word already typed
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" AutoPairs in insert mode
let g:AutoPairsShortcutToggle     = '<F4>'  " Enable/Disable AutoPairs
let g:AutoPairsFlyMode            = 1       " to fly several brackets when pressing the closing bracket
let g:AutoPairsShortcutBackInsert = '<C-l>' " to disable just pressed fly bracket (alternative: <C-v> in imode forces direct input)
let g:AutoPairsShortcutJump       = '<C-j>' " jump to next closed pair (pressing closing pair in insert also jumps)
let g:AutoPairsMapBS              = 1       " map <Backspace> to remove in pairs
let g:AutoPairsMapCh              = 1       " to remove brackets in pairs
let g:AutoPairsMapCR              = 1       " to map <Return>
let g:AutoPairsCenterLine         = 1       " center current line after <Return>
let g:AutoPairsMapSpace           = 1       " to map <Space>
let g:AutoPairsMultilineClose     = 1       " to change line after closing bracket

" Pairs navigation in normal mode
nnoremap s( [(
nnoremap s{ [{
" nnoremap [ [[
nnoremap s) ])
nnoremap s} ]}
" nnoremap ] ]]

nnoremap ( :call JumpBracket('(', 'h')<CR>
nnoremap { :call JumpBracket('{', 'h')<CR>
nnoremap [ :call JumpBracket('[', 'h')<CR>
nnoremap ) :call JumpBracket(')', 'l')<CR>
nnoremap } :call JumpBracket('}', 'l')<CR>
nnoremap ] :call JumpBracket(']', 'l')<CR>

function! JumpBracket(key,dir)
    if a:dir == 'l'
        if search(a:key, 'W')
            " force break the '.' when jump to different line
            return "\<Right>"
        endif
    else
        if search(a:key, 'bW')
            " force break the '.' when jump to different line
            return "\<Left>"
        endif
    endif
endfunc

" yank surround is add surround
map as ys

" to add missing ; at the end of the line (and return to begin of line)
nnoremap ;; A;<Esc>^

" Options
set completeopt=menuone,longest    " preview discarted, menuone to keep as much as possible menu (to read params)

" Automands: select the correct omnifunc
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.test set omnifunc=omni#cpp#complete#Main

" OmniCpp Options
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot      = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow    = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope    = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]

" CodeComplete
let g:completekey = '<S-Tab>'           " code_complete: to avoid conflicts with normal omnicomplete with tab
" let g:completekey = '<C-a>'
let g:rs = '·<'                         " arguments separators
let g:re = '>·'

"
" Tab mappings;
" - visual and normal mode: indentation
" - insert mode: manual selection between normal tab, file completion, omnicomplete and existing text complete         "
"
vnoremap <Tab>   >gv
vnoremap <S-Tab> <gv
nnoremap <Tab>   >>
nnoremap <S-Tab> <<
inoremap <Tab>   <C-r>=TabComplete()<CR>

" Functions
function! TabComplete()

    let line = getline('.')                       " current line
    let substr = strpart(line, -1, col('.'))      " from the start of the current
    " line to one character right
    " of the cursor
    "  return substr
    let substr = matchstr(substr, "[^ \t]*$")     " word till cursor
    if (strlen(substr)==0)                        " nothing to match on empty string
        return "\<tab>"
    endif
    let has_word   = strlen(substr)      !=  0 
    let has_period = match(substr, '\.') != -1    " position of period, if any
    let has_arrow  = match(substr, '->') != -1    " position of arrow, if any
    let has_slash  = match(substr, '\/') != -1    " position of slash, if any
    let has_parent = match(substr, '(')  != -1    " position of open parenthesis, if any
    if (has_word)
        if     ( has_slash )
            return "\<C-X>\<C-F>"                 " file completion
        elseif ( has_period || has_arrow )
            return "\<C-X>\<C-O>"                 " omni-complete
        elseif ( has_parent )
            "        return g:completekey         " arguments completion (not working?)
            "        return "\<S-Tab>"
            "       call CodeComplete() 
"             return "\<tab>"
            
"             let code_comp = CodeComplete() . "\<C-r>=".SwitchRegion()
"             let code_comp = CodeComplete() . SwitchRegion()
            let code_comp = CodeComplete()
"             let var = input(code_comp)
            return code_comp
"             return CodeComplete()
"             return SwitchRegion()
"             return CodeComplete() . "\<C-r>=".SwitchRegion()
        else
            return "\<C-X>\<C-P>"                 " existing text completion
        endif
    else
        return "\<tab>"                           " no-completion, just a tab
    endif
endfunction

"
" Deprecated
"
" au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif " auto open/close the popup menu/preview windows
"
" To use autopairs fly also in normal mode (not properly working?)
" nnoremap ) v"_c)<Esc>
" nnoremap ) i<C-R>=AutoPairsInsert('")"')<CR><Esc>
" nmap ) i)<Esc>
" nmap } i}<Esc>
" nmap ] i]<Esc>
" nmap ) :call JumpBracket(')', 'l')<CR>
" nmap } :call JumpBracket('}', 'l')<CR>
" nmap ] :call JumpBracket(']', 'l')<CR>

" nmap ( %
" nmap ( :call JumpBracket('(', 'h')<CR>
" nmap { %
" nmap [ %

" au FileType c,cpp,perl let b:delimitMate_eol_marker = ";"
" au FileType c,cpp,perl let b:delimitMate_insert_eol_marker = 0
" let delimitMate_autoclose            = 1 " basic functionality
" let delimitMate_expand_cr            = 1 " expand with <Return>, but keep current text if any
" let delimitMate_expand_space         = 1 " expand with <Space>
" let delimitMate_expand_inside_quotes = 1 " also expand in quotes 
" let delimitMate_jump_expansion       = 0 " 
" let delimitMate_balance_matchpairs   = 1 " to try to fix missing pairs
" let delimitMate_excluded_regions     = "" " always auto close, event in Comments or String


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                            EasyClip and Exchange
"
" - three new operators: cut (x), replace (r) and exchange (cx)
"   - (cx) doesn't work with previous yank, but two consecutive (cx) must be executed
" - action after pasting: rotate yanks (,yy) (.yy) (not persistent for next pastes)
" - action before pasting: rotate yanks (,yr) and (.yr) (persistent)
" - interactive pasting: (yp) and (YP)
" - toggle auto-format after paste (F2) or (,yf)
" - paste on insert and command modes with <C-v> (see EMCommandLineNoreMap for search mode)
" - see the list of available yanks (sy)
" - AutoFormat sometimes is not good... <F2> after paste to toogle it
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Direct paste from clipboard not working
"set clipboard=unnamedplus " conflict with YankRing?
" set clipboard+=unnamed   " conflict ith EasyClip and unnecessary?
" set clipboard^=unnamed     " working fine now?
set clipboard^=unnamedplus " unamedplus is more keyboard-centric (ctrl-c)... like vim is 
                           " but anyway, the important part is that we should match tmux:
                           " unnamed     -> xclip -selection primary
                           " unnamedplus -> xclip -selection clipboard

"
" EasyClip - Options
"
let g:EasyClipUseGlobalPasteToggle            =   0 " to be able to use my maps (<F1>)
let g:EasyClipUsePasteToggleDefaults          =   0 " to be able to use my maps (,y and .y)
let g:EasyClipUseCutDefaults                  =   0 " to be able to use my maps (x)
let g:EasyClipUseSubstituteDefaults           =   0 " to be able to use my maps (r)
let g:EasyClipUseYankDefaults                 =   1 " default yanks are ok (y)
let g:EasyClipUsePasteDefaults                =   1 " default paste are ok (p)
let g:EasyClipAlwaysMoveCursorToEndOfPaste    =   1 " to move to end of paste (,j to go back)
let g:EasyClipAutoFormat                      =   1 " to enable auto-format (EasyClipToggleFormattedPaste to remove format)
let g:EasyClipShareYanks                      =   1 " probably not a good option to enable...?
let g:EasyClipCopyExplicitRegisterToDefault   =   1 " paste last yanked even if it was saved to a register
let g:EasyClipPreserveCursorPositionAfterYank =   1 " not move my cursor!
let g:EasyClipShowYanksWidth                  = 120 " we have bigger screens!
let g:EasyOperator_phrase_do_mapping          =   0 " to be able to have fuzzysearch

"
" EasyClip - Maps
"
nmap x     <Plug>MoveMotionPlug
xmap x     <Plug>MoveMotionXPlug
nmap xx    <Plug>MoveMotionLinePlug

nmap r     <Plug>SubstituteOverMotionMap
xmap r     <Plug>XEasyClipPaste
nmap rr    <Plug>SubstituteLine

nmap ,y    <Plug>EasyClipSwapPasteForward
nmap .y    <Plug>EasyClipSwapPasteBackwards
nmap ,yy   <Plug>EasyClipSwapPasteForward
nmap .yy   <Plug>EasyClipSwapPasteBackwards

nmap ,yr   <Plug>EasyClipRotateYanksForward
nmap .yr   <Plug>EasyClipRotateYanksBackward

nmap yp    :IPaste<cr>
nmap YP    :IPasteBefore<cr>

nmap <F2>  <Plug>EasyClipToggleFormattedPaste<cr>
nmap ,yf   <Plug>EasyClipToggleFormattedPaste<cr>

imap <C-v> <Plug>EasyClipInsertModePaste
cmap <C-v> <Plug>EasyClipCommandModePaste

inoremap <C-u> <C-v>
" cnoremap <C-u> <C-v>

nmap sy    :Yanks<cr>

" visual selected pasted
noremap vp `[v`]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                            EasyMotions
"
" - replacing operators t, f (g), b, e
" - replacing search system / (-), n, N and *
"   - * is added just to be able to use n/N after *
"   - (-) is fuzzy and overwin!, (_) is not
" - replacing <C-Arrows> (word motions) (also in insert mode)
" - fast access to easymotions with arrows also for v, x, r, cm, al/L and cx
" - (yl),(dl),(vl) and (yr),(dr),(vr) to yank, delete and select lines or ranges from different positions than cursor
"
" Issues:
" - lineforward is not inclusive?
" - ge includes the current char and the target
" - fuzzy search only works on the visible scrren
" - new * doesn't always go to the next (if not in present in the screen), it needs an extra n keytroke
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" EasyMotion - Options
"
let g:EasyMotion_enter_jump_first = 1                            " quick selection
let g:EasyMotion_space_jump_first = 0                            " to be able to use space as target key
let g:EasyMotion_use_upper        = 1                            " for better readeability
" let g:EasyMotion_keys             = 'asdghklqwertyuiopzxcvbnmfj' " defaults, without the last ';'
" let g:EasyMotion_keys             = 'ASDFQWERTZXCVBGLOKIJMNP '   " only left hand keys, and last for the right
let g:EasyMotion_keys             = 'asdfqwertzxcvbglokijmnp '   " only left hand keys, and last for the right
let g:Easymotion_startofline      = 0                            " to be able to move to eol and sol
" let g:EasyMotion_smartcase = 1                                 " case insenitive (using normal ignorecas+smartcase)

"
" EasyMotion - Maps
"
map  t                 <Plug>(easymotion-bd-t)
map  f                 <Plug>(easymotion-bd-f)

map  b                 <Plug>(easymotion-bd-w)
map  bb                <Plug>(easymotion-bd-w)
map  b<Right>          <Plug>(easymotion-w)
map  b<Left>           <Plug>(easymotion-b)

map  e                 <Plug>(easymotion-bd-e)
map  ee                <Plug>(easymotion-bd-e)
map  e<Right>          <Plug>(easymotion-e)
map  e<Left>           <Plug>(easymotion-ge)

map  <expr> -          incsearch#go(<SID>config_easyfuzzymotion())
map  _                 <Plug>(easymotion-sn)
map  /                 <Plug>(easymotion-sn)
map  N                 <Plug>(easymotion-prev)
map  n                 <Plug>(easymotion-next)
nmap *                 viwy<Plug>(easymotion-sn)<C-v><cr><cr>
map Oj               viwy<Plug>(easymotion-sn)<C-v><cr><cr>

map  <C-Right>         <Plug>(easymotion-lineforward)
map  <C-Left>          <Plug>(easymotion-linebackward)
map  <C-Up>            <Plug>(easymotion-k)
map  <C-Down>          <Plug>(easymotion-j)
map  <C-Up><C-Up>      <Plug>(easymotion-k)
map  <C-Down><C-Down>  <Plug>(easymotion-j)
map  <C-Up><C-Left>    <Plug>(easymotion-sol-k)
map  <C-Down><C-Left>  <Plug>(easymotion-sol-j)
map  <C-Up><C-Right>   <Plug>(easymotion-eol-k)
map  <C-Down><C-Right> <Plug>(easymotion-eol-j)

imap <C-Right>         <Esc><Plug>(easymotion-lineforward)
imap <C-Left>          <Esc><Plug>(easymotion-linebackward)
imap <C-Up><C-Up>      <Esc><Plug>(easymotion-k)
imap <C-Down><C-Down>  <Esc><Plug>(easymotion-j)
imap <C-Up><C-Left>    <Esc><Plug>(easymotion-sol-k)
imap <C-Down><C-Left>  <Esc><Plug>(easymotion-sol-j)
imap <C-Up><C-Right>   <Esc><Plug>(easymotion-eol-k)
imap <C-Down><C-Right> <Esc><Plug>(easymotion-eol-j)

nmap y<Up>             y<Plug>(easymotion-k)
nmap y<Down>           y<Plug>(easymotion-j)
nmap y<Right>          y<Plug>(easymotion-lineforward)
nmap y<Left>           y<Plug>(easymotion-linebackward)
nmap yl                <Plug>(easyoperator-line-yank)
nmap yr                <Plug>(easyoperator-phrase-yank)

nmap d<Up>             d<Plug>(easymotion-k)
nmap d<Down>           d<Plug>(easymotion-j)
nmap d<Right>          d<Plug>(easymotion-lineforward)
nmap d<Left>           d<Plug>(easymotion-linebackward)
nmap dl                <Plug>(easyoperator-line-delete)
nmap dr                <Plug>(easyoperator-phrase-delete)

nmap c<Up>             c<Plug>(easymotion-k)
nmap c<Down>           c<Plug>(easymotion-j)
nmap c<Right>          c<Plug>(easymotion-lineforward)
nmap c<Left>           c<Plug>(easymotion-linebackward)

nmap x<Up>             x<Plug>(easymotion-k)
nmap x<Down>           x<Plug>(easymotion-j)
nmap x<Right>          x<Plug>(easymotion-lineforward)
nmap x<Left>           x<Plug>(easymotion-linebackward)

nmap cx<Up>            cx<Plug>(easymotion-k)
nmap cx<Down>          cx<Plug>(easymotion-j)
nmap cx<Right>         cx<Plug>(easymotion-lineforward)
nmap cx<Left>          cx<Plug>(easymotion-linebackward)

nmap r<Up>             r<Plug>(easymotion-k)
nmap r<Down>           r<Plug>(easymotion-j)
nmap r<Right>          r<Plug>(easymotion-lineforward)
nmap r<Left>           r<Plug>(easymotion-linebackward)

nmap v<Up>             v<Plug>(easymotion-k)
nmap v<Down>           v<Plug>(easymotion-j)
nmap v<Right>          v<Plug>(easymotion-lineforward)
nmap v<Left>           v<Plug>(easymotion-linebackward)
nmap vl                <Plug>(easyoperator-line-select)
nmap vr                <Plug>(easyoperator-phrase-select)

nmap cm<Up>            cm<Plug>(easymotion-k)
nmap cm<Down>          cm<Plug>(easymotion-j)
nmap cm<Right>         cm<Plug>(easymotion-lineforward)
nmap cm<Left>          cm<Plug>(easymotion-linebackward)
nmap cmm               cmc

nmap aL<Up>            aL<Plug>(easymotion-k)
nmap aL<Down>          aL<Plug>(easymotion-j)
nmap aL<Right>         aL<Plug>(easymotion-lineforward)
nmap aL<Left>          aL<Plug>(easymotion-linebackward)

nmap al<Up>            al<Plug>(easymotion-k)
nmap al<Down>          al<Plug>(easymotion-j)
nmap al<Right>         al<Plug>(easymotion-lineforward)
nmap al<Left>          al<Plug>(easymotion-linebackward)

"
" EasyMotion - AutoCommands
"
au VimEnter,BufEnter * :EMCommandLineNoreMap <C-v> <C-r>0 " to be able to paste on easymotion command with <C-v>
                                                          " as we do on imap and cmap


"
" EasyMotion - Functions
"
" The following functions are/should be part of the plugin?
" They are used in the fuzzy search map (_)
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

"
" Deprecated
"

" I'm not using overwin...
" function! s:incsearch_config(...) abort
"     return incsearch#util#deepextend(deepcopy({
"                 \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"                 \   'keymap': {
"                 \     "\<CR>": '<Over>(easymotion)'
"                 \   },
"                 \   'is_expr': 0
"                 \ }), get(a:, 1, {}))
" endfunction

" nmap       fwl         :DimInactiveOff<cr><Plug>(easymotion-overwin-line)
" nmap       fwa         :DimInactiveOff<cr><Plug>(easymotion-overwin-w)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                   EasyAlign
" - new al{opts}{delimiter} operator
"   - opts are:
"     - <Enter> to switch right/left/center alignment *before* the operator
"     - <Right>/<Left> to add/remove spaces before the delimiter
"     - <Down> /<Up>   to remove/add spaces after the delimiter
"     - ** to alternate left-right alignment
"     - 1,2... or * to specify which delimiters we want to align
"     - <C-x> to use regular expresion as delimiter instead of single character (<C-x> again to save the align)
"     - there are extra options that can be configured with some <C- > keystrokes
"       - :help easy-align-alignment-options-in-interactive-mode
"
" - aL operator is the same, but without the preview and the extra confirmation of the delimiter
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:easy_align_ignore_groups = [] " 'Comments' and 'Strings' can be aligned...

xmap aL  <Plug>(EasyAlign)
nmap aL  <Plug>(EasyAlign)

xmap al <Plug>(LiveEasyAlign)
nmap al <Plug>(LiveEasyAlign)

" Examples: select visually, then:
" al::
" aL:
" al:<Return>:<Return>
" al:<Right>:<Left>
"
" first: test1
" second: test2
" nth: testn
"
" first: test1
" second: test2
" nth: testn

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               VimPrj
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimprj_changeCurDirIfVimprjFound = 1  " always change the current dir to the dir where the .vimprj file is
let g:cpp_header_ext='hpp'                  " each project can define its headers extension (.h or .hpp)

"
" Reload .vimprj just after writing ist
"
autocmd BufWritePost .vimprj source .vimprj

"
" Function to define the dafult options 
" Called when leaving a project, and now
"
function! <SID>SetMainDefaults()

    set softtabstop=4
    set tabstop=4
    set shiftwidth=4
    set expandtab               " using spaces instead of tabs
    set smarttab                " doesn't do anything...?
    set formatoptions=ronj      " auto create comment characters/leaders

    set path=.,/usr/local/include,/usr/include
    compiler gcc
    let g:cpp_header_ext='hpp'

    if exists("b:dispatch")
        unlet b:dispatch
    endif
    if exists("g:myvimprj")
        autocmd! myvimprj FileWritePost *
        autocmd! myvimprj BufWritePost *
        unlet g:myvimprj
    endif

endfunction

call <SID>SetMainDefaults()
call vimprj#init()

function! g:vimprj#dHooks['SetDefaultOptions']['main_options'](dParams)
    call <SID>SetMainDefaults()
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           EasyGrep
"
" - (gw) and (g*) to grep current word or only current word and listing results in quickfix
" - (gcw) and (gc*) to grep and change current word 
" - :Grep and ':Replace old new'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:EasyGrepMode                 = 0       " 0 all files / 2 - based on files extension
let g:EasyGrepCommand              = 1       " 0 vimgrep / 1 grep
let g:EasyGrepRoot                 = "cwd"   " use current dir... maybe .vimprj or .git could be alternatives?
let g:EasyGrepRecursive            = 1       " recursive files search
let g:EasyGrepIgnoreCase           = 0       " use case
let g:EasyGrepHidden               = 0       " not hidden
let g:EasyGrepFilesToExclude       = "*bkp*" " files to exclude (not working with vimgrep)
let g:EasyGrepAllOptionsInExplorer = 1       " to show all options in the menu
let g:EasyGrepOpenWindowOnMatch    = 1       " automatically opens the quickfix window
let g:EasyGrepWindow               = 0       " Use Quickfix (not Location)
let g:EasyGrepEveryMatch           = 1       " disable multiple matches in same line
let g:EasyGrepJumpToMatch          = 0       " not autojumping
let g:EasyGrepReplaceAllPerFile    = 1       " less global replace

map gw     <leader>vv
map g*     <leader>vV
map gOj  <leader>vV
map grw    <leader>vr
map gr*    <leader>vR
map grOj <leader>vR
map gcw    <leader>vr
map gc*    <leader>vR
map gcOj <leader>vR

vmap gw     <leader>vv
vmap g*     <leader>vV
vmap gOj  <leader>vV
vmap grw    <leader>vr
vmap gr*    <leader>vR
vmap grOj <leader>vR
vmap gcw    <leader>vr
vmap gc*    <leader>vR
vmap gcOj <leader>vR

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Text objects
"
" - indentations as text objects: (ii) and (ai) -> removed because it conflicts with for(ii=0...)
"   - so, you can (dii), (yai), (vii)...
" - next/last inner/outer objects
"   - cin( will change next inner ()
"   - cil( will change last inner ()
"   - NOTE: al doesn't conflict with align because this is a text object an align is an operator
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" removed because it conflicts with for(ii=0...)
" onoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR>
" onoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR>
" vnoremap <silent>ai :<C-U>cal <SID>IndTxtObj(0)<CR><Esc>gv
" vnoremap <silent>ii :<C-U>cal <SID>IndTxtObj(1)<CR><Esc>gv

" Motion for "next/last object". For example, "din(" would go to the next "()" pair
" and delete its contents.
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

" removed because it conflicts with al (align) in visual mode
" onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
" xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
" onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
" xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
    let c = nr2char(getchar())

    if c ==# "b"
        let c = "("
    elseif c ==# "B"
        let c = "{"
    elseif c ==# "d"
        let c = "["
    endif

    exe "normal! ".a:dir.c."v".a:motion.c
endfunction

function! s:IndTxtObj(inner)
    let curline = line(".")
    let lastline = line("$")
    let i = indent(line(".")) - &shiftwidth * (v:count1 - 1)
    let i = i < 0 ? 0 : i
    if getline(".") !~ "^\\s*$"
        let p = line(".") - 1
        let nextblank = getline(p) =~ "^\\s*$"
        while p > 0 && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
            -
            let p = line(".") - 1
            let nextblank = getline(p) =~ "^\\s*$"
        endwhile
        normal! 0V
        call cursor(curline, 0)
        let p = line(".") + 1
        let nextblank = getline(p) =~ "^\\s*$"
        while p <= lastline && ((i == 0 && !nextblank) || (i > 0 && ((indent(p) >= i && !(nextblank && a:inner)) || (nextblank && !a:inner))))
            +
            let p = line(".") + 1
            let nextblank = getline(p) =~ "^\\s*$"
        endwhile
        normal! $
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Fixing Annoyances
"
" - not moving cursor when leaving insert mode
" - using (zz) and (ZZ) to expand/shrink visual selection and go to select mode (note that <S-Arrows> go directly to <C-v>
"   - also addin (zz) and (vv) instead of (V)
" - as I use (s) in several places as 'see whatever' prefix, I'm disabling (s) (substitue character)
"   - using (cl) (change-letter) instead
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Not moving cursor when leaving insert mode
"
let CursorColumnI = 0                                                               " 
au InsertEnter  * let CursorColumnI = col('.')                                      " Code to avoid moving left when 
au CursorMovedI * let CursorColumnI = col('.')                                      " leaving the insert mode
au InsertLeave  * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif "

" mapping z to v for convenience
" nnoremap z     v
" nnoremap vv    V
" nnoremap zz    V
" nnoremap Z     V
" nnoremap <C-z> <C-v>
map zz <Plug>(expand_region_expand)
map ZZ <Plug>(expand_region_shrink)

let g:expand_region_use_select_mode = 1 " to auto select-mode when expanding

" let g:expand_region_text_objects = {'ie': 0, 
"                                  \  'ip': 0, 
"                                  \  'iw': 0, 
"                                  \  'iB': 1,
"                                  \  'il': 0,
"                                  \  'iW': 0,
"                                  \  'i''': 0,
"                                  \  'ib': 1,
"                                  \  'i]': 1,
"                                  \  'i"': 0}

" as I use (s) in several places as 'see whatever' prefix, I'm disabling (s) (substitue character)
" in normal mode using (cl) (change-letter) instead 
" in visual mode, to switch to select mode
nnoremap s  <Esc>
nnoremap cl s
vnoremap s    <C-g>

" to be able to use . in other maps but keep fast repeat
nmap .. .
vmap .. .
xmap .. .
" to quickly add (delay added by the 'al'ign maps/operator
nnoremap aa a

" sudo write (never used!? I should use it more!)
cmap w!! w !sudo tee % >/dev/null

map q: :q

" refresh vim files
noremap    <F5>       :e<cr>
noremap    <F6>       :source ~/.vimrc<cr>

" move between brackets
nmap  k   %
map   sn  %
map   br  %

"
" ge
"
fu! MyCustomGE()
    return "\<c-u>:norm! ".v:count1."ge "
endfu
onoremap ge :<c-u><c-r>=MyCustomGE()<cr><cr>

"
" Key bindings
"
" See movements
noremap    s<PageUp>   gg
noremap    s<PageDown> G

" Undos (i'm very lazzy and I never use the original U concept (line undo))
nnoremap   U          <C-r>
nnoremap   <C-u>      U


" registers
" - not using registers thanks to EasyClip (YankRing)
" - (r) is used as 'replace' by EasyClip  
nnoremap R "
vnoremap R "


" <C-k> used to:
" - open edition in command line (never used?)
" - single normal mode command while in insert mode  
inoremap <C-k>  <C-o>
set cedit=<C-k>

" Deprecated

" au VimEnter * vertical ba " to open all buffer when entering vim (conflcits with wgd)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Arrows and special keys (home, end, delete, backspace and return)
"
" - <S+Arrows> to go directly to visual block (<C-v>)
"   - as this is the prefered method to go to Visual, remapping z Z <C-Z> as v V <C-V> for convenience in visual mode
" - scrolling with <C-PageUp/Down>
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"shift+arrow selection
nmap <S-Up>           <C-v><Up>
nmap <S-Down>         <C-v><Down>
nmap <S-Left>         <C-v><Left>
nmap <S-Right>        <C-v><Right>
nmap <S-Home>         <C-v><Home>
nmap <S-End>          <C-v><End>
nmap <S-PageUp>       <C-v><PageUp>
nmap <S-PageDown>     <C-v><PageDown>

vmap <S-Up>                <Up>
vmap <S-Down>              <Down>
vmap <S-Left>              <Left>
vmap <S-Right>             <Right>
vmap <S-Home>              <Home>
vmap <S-End>               <End>

imap <S-Up>      <Esc><C-v><Up>
imap <S-Down>    <Esc><C-v><Down>
imap <S-Left>    <Esc><C-v><Left>
imap <S-Right>   <Esc><C-v><Right>
imap <S-Home>    <Esc><C-v><Home>
imap <S-End>     <Esc><C-v><End>

"ctrl+shift+arrow selection
nmap <C-S-Up>         <C-v><C-Up>
nmap <C-S-Down>       <C-v><C-Down>
nmap <C-S-Left>       <C-v><C-Left>
nmap <C-S-Right>      <C-v><C-Right>

vmap <C-S-Up>              <C-Up>
vmap <C-S-Down>            <C-Down>
vmap <C-S-Left>            <C-Left>
vmap <C-S-Right>           <C-Right>

imap <C-S-Up>    <Esc><C-v><C-Up>
imap <C-S-Down>  <Esc><C-v><C-Down>
imap <C-S-Left>  <Esc><C-v><C-Left>
imap <C-S-Right> <Esc><C-v><C-Right>

"
" scrolling
"
nnoremap <C-PageUp>    <C-Y>
nnoremap <C-PageDown>  <C-E>

"
" Go to insert mode directly
"
" - <Enter> goes to insert mode directly, except in some windows
"
nnoremap <Backspace>         i<Backspace>
nnoremap <Space>             i<Space>
nnoremap <Delete>            i<Delete>

vnoremap <Backspace> <Delete>i
vnoremap <Space>     <Delete>i<Space>
vnoremap <Delete>    <Delete>i
" vnoremap i           <Delete>i

" Adding at begin/end and previous/next lines
noremap a<Right>  A
noremap a<Left>   I
" noremap a<Down>   o
" noremap a<Up>     O
" noremap a<Return> o<Esc>
" noremap A<Return> O<Esc>
noremap a<Down>   o<Esc>
noremap a<Up>     O<Esc>
" noremap a<Return> o
" noremap A<Return> O
noremap a<Return> i<Return><Esc>
nmap    d<Return> dd
nmap    D<Return> DD
nmap    DD        dd<Up>

" noremap A<S-Down> o<Esc>
" noremap A<S-Up>   O<Esc>


"
" Deprecated
"
" nnoremap <Enter>             i<Enter> " I've not being able to unmap/map it for some windows
" vnoremap <Return>    <Delete>i<Return>
" au FileType qf,undotree,nerdtree,tagbar au BufEnter <buffer> unmap <Enter>
" au FileType qf,undotree,nerdtree,tagbar au BufLeave <buffer> nmap  <Enter> i<Enter>

" nnoremap <C-o>               o<Esc>
" vnoremap <C-o>               do<Esc>
" nnoremap <C-S-o>             O<Esc>
" nnoremap <C-O>               O<Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Windows, Tabs and Buffers
"
" - w in normal mode is the main prefix-leader <C-w>
"   - w<Arrows> move between windows
" - (we) to toogle zoom/expand on a window
" - (wm) to mark a window and (ws) to swap with the marked (works between tabs!)
" - w<S-Arrows> for changing layout (forcing a window/pane to be on one side)
" - w<C-Arrows> to resize (almonst not used?)
" - (w,) and (w.) for tab navigation
" - (W;) and (W:) for tab moves
"   - w<PageUp/Down> also for tab navigation
" - (sb), (b,), (b.) and (sbb) for buffers navigation
"   - (sba) see all splitted in current window
"   - (sb) allows to delete buffers with (d)
" - (,w) and (,t) for previous window, tab and buffer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader: w is the leader key for all windows and tabs (is <C-w>)
nnoremap w           <C-w>

" To restore the previous 'view' of the buffer (keep cursor position)
" Very-very useful (with sh)!
au BufLeave * let b:winview = winsaveview()
au BufEnter * if(exists('b:winview')) | call winrestview(b:winview) | endif

" Decoretions
map        wh         :set hls!<cr>
noremap    <F3>       :call SwitchDecorations()<cr>
nnoremap   wn         :call NumberToggle()<cr>

" Maximize (ww) and 'Tabize' (wt)
set wmh=0                                   " to fullly maximize in height
set wmw=0                                   " to fullly maximize in width 
let g:maximizer_restore_on_winleave = 1     " to force restore when leaving maximized window (tmux like)

nnoremap ww :MaximizerToggle!<CR>
vnoremap ww :MaximizerToggle!<CR>gv
nnoremap we :MaximizerToggle!<CR>
vnoremap we :MaximizerToggle!<CR>gv
" inoremap we <C-o>:MaximizerToggle!<CR>

nnoremap wt          <C-w>T
vnoremap wt          <C-w>Tgv
" inoremap wt     <C-o><C-w>T<CR>

" Resizes
" nnoremap we          <C-w>=
nnoremap w<c-right>  :vertical resize +20<cr>
nnoremap w<c-left>   :vertical resize -20<cr>
nnoremap w<c-up>     :resize          +10<cr>
nnoremap w<c-down>   :resize          -10<cr>
nnoremap w<s-right>  <c-w>L<c-p>
nnoremap w<s-left>   <c-w>H<c-p>
nnoremap w<s-up>     <c-w>K<c-p>
nnoremap w<s-down>   <c-w>J<c-p>

" Last/Previous Window / Tab
nnoremap ,w          <c-w>p
nnoremap ,t          :exe "tabn ".g:lasttab<CR>
nnoremap wp          <c-w>p
nnoremap tt          :exe "tabn ".g:lasttab<CR>

" Tabs
nnoremap wo          :tabnew<cr>
nnoremap wc          :tabclose<cr>

nnoremap w<pagedown> :tabnext<cr>
nnoremap w<pageup>   :tabprevious<cr>
nnoremap w.          :tabnext<cr>
nnoremap w,          :tabprevious<cr>
nnoremap w;          :-tabmove<cr>
nnoremap w:          :+tabmove<cr>
nnoremap W;          :-tabmove<cr>
nnoremap W:          :+tabmove<cr>

" buffer exploring
nnoremap sb   :BufExplorer<cr>
" nnoremap sbb  :b#<cr>
nnoremap bb   :b#<cr>
nnoremap sab  :vertical ba<cr>
nnoremap ,b   :bprevious<cr>
nnoremap .b   :bnext<cr>
nnoremap b,   :bprevious<cr>
nnoremap b.   :bnext<cr>


"
" Functions
"

function! MarkWindowSwap()
    " marked window number
    let g:markedTabNum = tabpagenr()
    let g:markedWinNum = winnr()
    let g:markedBufNum = bufnr("%")
endfunction

function! DoWindowSwap()
    let curTabNum = tabpagenr()
    let curWinNum = winnr()
    let curBufNum = bufnr("%")
    " Switch focus to marked window
    exe "tabnext " . g:markedTabNum
    exe g:markedWinNum . "wincmd w"

    " Load current buffer on marked window
    exe 'hide buf' curBufNum

    " Switch focus to current window
    exe "tabnext " . curTabNum
    exe curWinNum . "wincmd w"

    " Load marked buffer on current window
    exe 'hide buf' g:markedBufNum
endfunction

function! DoWindowJoin()
    let curTabNum = tabpagenr()
    let curWinNum = winnr()
    let curBufNum = bufnr("%")
    " Switch focus to marked window
    exe "tabnext " . g:markedTabNum
    exe g:markedWinNum . "wincmd w"

    " Close the marked window
    close!

    " Switch focus to current window
    exe "tabnext " . curTabNum
    exe curWinNum . "wincmd w"

    " Create a new split and load the marked window
    exe "vsplit"
    exe 'hide buf' g:markedBufNum
endfunction

nmap <silent> wm :call MarkWindowSwap()<CR>
nmap <silent> ws :call DoWindowSwap()<CR>
nmap <silent> wj :call DoWindowJoin()<CR>

nnoremap wb          <C-w>T
vnoremap wb          <C-w>Tgv

" Function to enable disable decorations (they should be disabled by default)
let g:mydecoration=0
function! SwitchDecorations()
    if g:mydecoration == 1
        set nolist
        set colorcolumn=0
        let g:mydecoration=0
    else
        set list
        set colorcolumn=+1
        let g:mydecoration=1
    endif
endfunction

" window numbers
function! NumberToggle()
    if(&relativenumber == 0)
        if(&number == 0)
            set number
            set relativenumber
        else
            set nonumber
        endif
    else
        set norelativenumber
    endif
endfunc

" last used tab
let g:lasttab = 1                         " Code to be able to go to 
au TabLeave * let g:lasttab = tabpagenr() " last active tab


"
" Deprecated
"
"nnoremap   ww         :ZoomWin<cr>
"nnoremap   ww         <C-w><Bar>
" nnoremap   <Bar>      :vspl<cr>
" nnoremap   -          :spl<cr>
" nnoremap wm          :tab split<cr>
" nnoremap ww          <c-w>T
" nnoremap ww          <C-w>_<c-w><Bar>

" function! MarkWindowSwap()
"     let g:markedWinNum = winnr()
" endfunction
"
" function! DoWindowSwap()
"     "Mark destination
"     let curNum = winnr()
"     let curBuf = bufnr( "%" )
"     exe g:markedWinNum . "wincmd w"
"     "Switch to source and shuffle dest->source
"     let markedBuf = bufnr( "%" )
"     "Hide and open so that we aren't prompted and keep history
"     exe 'hide buf' curBuf
"     "Switch to dest and shuffle source->dest
"     exe curNum . "wincmd w"
"     "Hide and open so that we aren't prompted and keep history
"     exe 'hide buf' markedBuf 
" endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Abolish - Naming convention and Search/Replace
"
" - adding the pseudo-operator cnc{style} (change-naming-convention)
"   - it's not an actual operator:
"     - it doesn't accept any motion/object, only works inner-word
"     - it only works in normal mode
"
" - naming convention styles (I've swapped the original c and m):
"   - s: snake_case
"   - c: CamelCase
"   - m: mixedCase
"   - u: UPPER_CASE
"
" - adding the :S(ubvert) command to improve the built in :s(ubstitute)
"   - support for all naming conventions in search (and repleace)
"   - can be used also for greping?
" - adding the :Abolish command to create abbreviations to be automatically replaced while typing (never used)
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap cncs crs
nmap cncc crm
nmap cncm crc
nmap cncu cru

nmap cns crs
nmap cnc crm
nmap cnm crc
nmap cnu cru

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                   See and Jump
"
" - see into files (sf), into a tab (stf) or in a vsplit (svf)
" - jumps (sj) (,j) (.j)
" - changes (sc) (,c) (.c)
" - marks
"   - using (M) to set a mark (few times) and (m) to jump to it (more times)
"   - using Signature plugin to list marks: (sm) for a interactive list (swm) on the windowa
" - file explorer (se), buffers (sb), undo tree (su), and outline pane (so)
" - vimprj (sprj) and vimrc (svim)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open files
noremap  sf   gf
noremap  stf  <C-w>gf
noremap  svf  :vertical wincmd f<cr>

" nnoremap sj   :jumps<cr>
nmap     sj  :call GotoJump()<CR>
nnoremap ,j  <C-o>
nnoremap .j  <C-i>
nnoremap ,s  <C-o>
nnoremap .s  <C-i>
nnoremap ,ss <C-o>
nnoremap .ss <C-i>

" changes
noremap  sc   :changes<cr>
noremap  ,c   g;
noremap  .c   g,

" marks
nnoremap  sm   :SignatureListMarks<cr>
nmap      swm  :SignatureToggleSigns<cr>
nnoremap  M    m
nnoremap  m    '
nnoremap  dM   :delmarks
nnoremap  MM   mM
nnoremap  mm   'M

" exploring file
nnoremap se   :NERDTreeToggle<cr>

" vimproj and vimrc
noremap  sp   :wincmd l<CR>:e .vimprj<cr>
noremap  sprj :wincmd l<CR>:e .vimprj<cr>
noremap  svim :wincmd l<CR>:e ~/.vimrc<cr>


" undotree
nnoremap su   :UndotreeToggle<cr>

" registers
noremap  sr   :registers<cr>

" jumps
function! GotoJump()
    jumps
    let j = input("Please select your jump: ")
    if j != ''
        let pattern = '\v\c^\+'
        if j =~ pattern
            let j = substitute(j, pattern, '', 'g')
            execute "normal! " . j . "\<c-i>"
        else
            execute "normal! " . j . "\<c-o>"
        endif
    endif
endfunction

" Deprecated
" map      sm  `

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Tags (cscope, tagbar tjumps, source/header)
"
" - (so) tooglea local outline
" - (ls) lists symbol ocurrences to quicklist (cscope)
" - (lg) goes to symbol definition (global) (cscope)
" - (lc) lists who calls this function to quicklist (cscope)
" - (lt) lists text ocurrences to quicklist (cscope)
" - (lf) lists file ocurrences to quicklist (cscope)
" - (li) lists files including this to quicklist (cscope)
" - (ld) lists function called by me to quicklist (cscope)
"
" - (sh) and (st) to switch header and test files
"   - use g:cpp_header_ext in vimprj to specify header extesion
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tagbar (outline)
let g:tagbar_autoclose = 1              " autoclose the outline/tagbar when a selection is done
nnoremap so   :TagbarToggle<cr>

" cscope
" use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
" set cscopetag

" check cscope for definition of a symbol before checking ctags: set to 1
" if you want the reverse search order.
set csto=0

" all cscope results are placed in quickfix
set cscopequickfix=s-,g-,c-,d-,i-,t-,e-

nmap ls :cs find s  <C-R>=expand("<cword>")<CR><CR>sq
nmap lg :cs find g  <C-R>=expand("<cword>")<CR><CR>
nmap lc :cs find c  <C-R>=expand("<cword>")<CR><CR>sq
nmap lt :cs find t  <C-R>=expand("<cword>")<CR><CR>sq
nmap le :cs find e  <C-R>=expand("<cword>")<CR><CR>sq
nmap lf :cs find f  <C-R>=expand("<cfile>")<CR><CR>sq
nmap li :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>sq
nmap ld :cs find d  <C-R>=expand("<cword>")<CR><CR>sq

" tags/links
noremap    sl         :tjump /<C-r><C-w><cr>
noremap    sll        <C-]>
noremap    swl        :vert :stjump /<C-r><C-w><cr>
noremap    swll       :vsplit<cr><C-]>
"noremap    stt        g<C-]>
noremap    ,l         :tprev<cr>
noremap    .l         :tnext<cr>
noremap    l           <C-]>
noremap    ll          <C-]>


" show in preview (list option if necessary)
noremap    lp          <C-w>g}
" noremap    wl         :vsplit<cr><C-]>

"
" Switching header / source / test
"
" au BufRead,BufNewFile *.h   		nmap  sh :find %:t:r.cpp<cr>
" au BufRead,BufNewFile *.hpp 		nmap  sh :find %:t:r.cpp<cr>
" au BufRead,BufNewFile *.cpp 		nmap  sh :find %:t:r.<c-r>=g:cpp_header_ext<cr><cr>
" au BufRead,BufNewFile *.test 		nmap  sh :find %:t:r.<c-r>=g:cpp_header_ext<cr><cr>
"
" au BufRead,BufNewFile *.h   		nmap  st :find %:t:r.test<cr>
" au BufRead,BufNewFile *.hpp 		nmap  st :find %:t:r.test<cr>
" au BufRead,BufNewFile *.cpp 		nmap  st :find %:t:r.test<cr>
" au BufRead,BufNewFile *.test 		nmap  st :find %:t:r.hpp<cr>

au BufRead,BufNewFile,WinEnter *.h   		nmap  sh :call SeeHeader( 'cpp', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.hpp 		nmap  sh :call SeeHeader( 'cpp', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.cpp 		nmap  sh :call SeeHeader( g:cpp_header_ext, 'l')<cr>
au BufRead,BufNewFile,WinEnter *.test 		nmap  sh :call SeeHeader( g:cpp_header_ext, 'l')<cr>

au BufRead,BufNewFile,WinEnter *.h   		nmap  st :call SeeHeader( 'test', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.hpp 		nmap  st :call SeeHeader( 'test', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.cpp 		nmap  st :call SeeHeader( 'test', 'l')<cr>
au BufRead,BufNewFile,WinEnter *.test 		nmap  st :call SeeHeader( g:cpp_header_ext, 'l')<cr>

function! SeeHeader( ext, dir )
"     let var = input( "ext: ".a:ext." dir: ".a:dir )
    let curr_buf = bufnr("%")
    if a:dir != 'none'
        exe "wincmd ".a:dir
        exe "buf " . curr_buf
    endif
    exe "find %:t:r.".a:ext
endfunction


" Deprecated
"nnoremap   ll         :call ToggleLocationList()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                           Quickfix (with ToogleList.vim)
" 
" - (sq) to toggle quickfix, (sqq) to toogle and move to quick fix
" - jump between next/prev entry (,q .q)
"   - (,,q) is used to jump to current error (for convenience, as I don't jump to it auromatically)
" - jump between prev/next quickfix list (,sq .sq)
" - (sqe) to create a new quickfix list from the current one, without warnings
" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" forcing quickfix to be full width
au FileType qf   wincmd J

" let g:toggle_list_copen_command='Copen' " to use Copen instead of copen when toggling...
let g:toggle_list_copen_command='copen'   " ...or keep using :copen to avoid overwriting :grep results
let g:toggle_list_no_mappings=1           " to be able to use ',q' (I want MY mappings! ;-)

nnoremap sq   :call ToggleQuickfixList()<cr>
nnoremap sqq  :call ToggleQuickfixList()<cr><C-w><Down>
nnoremap ,sq  :colder<cr>
nnoremap .sq  :cnewer<cr>
nnoremap ,,q  :cc<cr>
nnoremap ,q   :cprev<cr>
nnoremap .q   :cnext<cr>
nnoremap q,   :cprev<cr>
nnoremap q.   :cnext<cr>

" to remove warings entries
" info/text lines are kept, but ,q and .q will loop on no-warning entries
nnoremap sqe  :call setqflist(filter(getqflist(), 'v:val.type != "W"'), ' ')<cr>

" this automand is not called...? not sure way...
" autocmd QuickfixCmdPost make call setqflist(filter(getqflist(), 'v:val.type == "E"'), 'r')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                          (VCSCommand)
" for all the files in the root directori: 
"   1.- open a new vim with the files obtained from git/svn cmdline in tabs (swap file are annoying)
"   2.- run vcsdiff in all tabs (why the nice <C-w><Left>]c cannot be passed to the tabdo?) 
"   3.- edit files freely
"   4.- once edition it's done the forked vim is closed, we return to the original vim and we refresh all our tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" open/close win-diff
nnoremap <silent> wd     :VCSVimDiff<cr><C-w><Left>]c
nnoremap <silent> wgd    :! vim -p $(git diff --name-only) -c "tabdo VCSVimDiff"<cr>
nnoremap <silent> wsd    :! vim -p $(svn st <Bar> grep "M " <Bar> awk '{print $2}') -c "tabdo VCSVimDiff"<cr>
nnoremap <silent> wdq     <C-w><Right>:q<cr>

" win-diff commands: status, revert, add, commit
nnoremap <silent> wds     :VCSStatus .<cr>
nnoremap          wdr     :VCSRevert<cr>
nnoremap          wda     :VCSAdd<cr>
nnoremap          wdc     :tabnew .<cr>:VCSCommit<cr>i

" get: all current diff
" get-line: 
nnoremap <silent> do     V:diffget<cr>
nnoremap <silent> dl     V:diffget<cr>
nnoremap <silent> dg     :diffget<cr>
nnoremap          ,d     ]c
nnoremap          .d     [c

" nnoremap <silent> swd    :VCSVimDiff<cr><C-w><Left>]c
" nnoremap <silent> wd     :VCSVimDiff<cr><C-w><Left>]c
" " for all the files in the root directori: 
" "   1.- open a new vim with the files obtained from git/svn cmdline in tabs (swap file are annoying)
" "   2.- run vcsdiff in all tabs (why the nice <C-w><Left>]c cannot be passed to the tabdo?) 
" "   3.- edit files freely
" "   4.- once edition it's done the forked vim is closed, we return to the original vim and we refresh all our tabs
" nnoremap <silent> wgd    :! vim -p $(git diff --name-only) -c "tabdo VCSVimDiff"<cr>
" nnoremap <silent> wsd    :! vim -p $(svn st <Bar> grep "M " <Bar> awk '{print $2}') -c "tabdo VCSVimDiff"<cr>
" nnoremap <silent> wds     :VCSStatus .<cr>
" nnoremap <silent> wdo     V:diffget<cr>
" nnoremap <silent> wdg     :diffget<cr>
" nnoremap <silent> wdq     <C-w><Right>:q<cr>
" nnoremap          wdr     :VCSRevert<cr>
" nnoremap          wda     :VCSAdd<cr>
" nnoremap          wdc     :tabnew .<cr>:VCSCommit<cr>i
" nnoremap          wd.     ]c
" nnoremap          wd,     [c

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       Dispatch / Build
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" build directly from any mode
nnoremap <C-b>                :Make<cr>
inoremap <C-b>           <Esc>:Make<cr>
vnoremap <C-b>           <Esc>:Make<cr>
" nnoremap <C-d>                :Dispatch!<cr>
" inoremap <C-d>           <Esc>:Dispatch!<cr>
" vnoremap <C-d>           <Esc>:Dispatch!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                               Extras
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" passwds
if filereadable(glob('~/.vimrc.pass'))
    source ~/.vimrc.pass
"else
"    echo "Not loading vimrc.pass"
endif










""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                        Deprecated Setup                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" function! ToggleYCMComplete()
"     if g:ycm_auto_trigger == 1
"         let g:ycm_auto_trigger = 0
"         let g:ycm_show_diagnostics_ui=0
"     else
"         let g:ycm_auto_trigger = 1
"         let g:ycm_show_diagnostics_ui=1
"     endif
" endfunction
" nmap ycm :call ToggleYCMComplete()<cr>

" never used?
" function! ToggleOmniCppComplete()
"     if g:OmniCpp_MayCompleteDot == 1
"         let g:OmniCpp_MayCompleteDot   = 0
"         let g:OmniCpp_MayCompleteArrow = 0
"         let g:OmniCpp_MayCompleteScope = 0
" "        execute "AcpDisable"
"     else
"         let g:OmniCpp_MayCompleteDot   = 1
"         let g:OmniCpp_MayCompleteArrow = 1
"         let g:OmniCpp_MayCompleteScope = 1
" "        execute "AcpEnable"
"     endif
" endfunction
" nmap ba :call ToggleOmniCppComplete()<cr>
"
"call ToggleOmniCppComplete()  " disable autocomplete by default

"
" Commenting blocks of code (replaced by tcomment)
"
" let s:comment_map = {
"     \   "c": '\/\/',
"     \   "cpp": '\/\/',
"     \   "cpp.doxygen": '\/\/',
"     \   "go": '\/\/',
"     \   "java": '\/\/',
"     \   "javascript": '\/\/',
"     \   "php": '\/\/',
"     \   "python": '#',
"     \   "ruby": '#',
"     \   "conf": '#',
"     \   "sh": '#',
"     \   "make": '#',
"     \   "Dockerfile": '#',
"     \   "vim": '"',
"     \ }
"
" Replaced by tcomment to have a new action to work with motions and text objects
" function! ToggleComment()
"     if has_key(s:comment_map, &filetype)
"         let comment_leader = s:comment_map[&filetype]
"         if getline('.') =~ "^" . comment_leader
"             " Uncomment the line
"             execute "silent s/^" . comment_leader . "//"
"         else
"             " Comment the line
"             execute "silent s/^/" . comment_leader . "/"
"         endif
"     else
"         echo "No comment leader found for filetype"
"     end
" endfunction
" nmap cm :call ToggleComment()<cr>
" vmap cm :call ToggleComment()<cr>

" autocomplete
"unmap     <C-a>
"imap     <C-a>           <C-x><C-o>
"imap     <C-a>           <C-r>=CodeComplete()<cr><C-r>=SwitchRegion()<cr>
"imap     <C-a>           <C-r>=CodeComplete()<cr>

" Folding
" nnoremap   zz         :set foldenable!<cr>

" noremap    <F5>       :source .vimprj<cr>

"set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX

" noremap    s<Left>     ^
" noremap    s<Right>    $<Right>
" map        s<Up>       <Plug>(easymotion-k)
" map        s<Down>     <Plug>(easymotion-j)


" on search commands (too hard to me?)
" cnoremap <C-f>y <CR>:t''<CR>
" cnoremap <C-f>s <CR>:m''<CR>
" cnoremap <C-f>d <CR>:d<CR>''
"
" nnoremap <C-f>y :t''<CR>
" nnoremap <C-f>s :m''<CR>
" nnoremap <C-f>d :d<CR>''

" nnoremap   i          :nohl<cr>i
"nnoremap   /          :set hls<cr>/
" nnoremap   /          /

" <Home> go to first character (^) (/todo)
"t_kh <Home>      ^[[1;*H
" nmap <Home> ^
"imap <Home> ^
" nmap 0      ^
" vmap 0      ^

"ctrl+arrows movements (http://stackoverflow.com/a/6528201/5349914)
" function! <SID>GotoPattern(pattern, dir) range
"     let g:_saved_search_reg = @/
"     let l:flags = "We"
"     if a:dir == "b"
"         let l:flags .= "b"
"     endif
"     for i in range(v:count1)
"         call search(a:pattern, l:flags)
"     endfor
"     let @/ = g:_saved_search_reg
" endfunction
"
" "nnoremap <C-Right> w
" "nnoremap <C-Left>  b
" nnoremap <silent> <C-Right> :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9]', 'f')<cr>
" nnoremap <silent> <C-Left>  :<C-U>call <SID>GotoPattern('\(^\\|\<\)[A-Za-z0-9]', 'b')<cr>
" vnoremap <silent> <C-Right> :<C-U>let g:_saved_search_reg=@/<cr>gv/\(^\\|\<\)[A-Za-z0-9]<cr>:<C-U>let @/=g:_saved_search_reg<cr>gv
" vnoremap <silent> <C-Left>  :<C-U>let g:_saved_search_reg=@/<cr>gv?\(^\\|\<\)[A-Za-z0-9]<cr>:<C-U>let @/=g:_saved_search_reg<cr>gv

" map <silent> <C-Right><C-Right> <Plug>(easymotion-lineforward)<cr>
" map <silent> <C-Left><C-Left>   <Plug>(easymotion-linebackward)<cr>

"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ CTRL-X CTRL-O
"function! s:check_back_space() "{{{
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}

"function! SuperCleverTab()
"    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
"        return "\<Tab>"
"    else
"        if &omnifunc != ''
"            return "\<C-X>\<C-O>"
"        elseif &dictionary != ''
"            return "\<C-K>"
"        else
"            return "\<C-N>"
"        endif
"    endif
"endfunction
"
"inoremap <Tab> <C-R>=SuperCleverTab()<cr>

"
" to use TAB for autocomplete
" 
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ neocomplete#start_manual_complete()
"function! s:check_back_space() "{{{
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~ '\s'
"endfunction"}}}

" to use longest completeopt with supertab
"let g:SuperTabLongestEnhanced = 1

" the (exuberant-)ctags command
"ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp cpp_src

"
" To avoid conflicts between neocomplete and clang_complete
"
"if !exists('g:neocomplete#force_omni_input_patterns')
"  let g:neocomplete#force_omni_input_patterns = {}
"endif
"let g:neocomplete#force_omni_input_patterns.c =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"let g:neocomplete#force_omni_input_patterns.cpp =
"      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"let g:neocomplete#force_omni_input_patterns.objc =
"      \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)'
"let g:neocomplete#force_omni_input_patterns.objcpp =
"      \ '\[\h\w*\s\h\?\|\h\w*\%(\.\|->\)\|\h\w*::\w*'
"let g:clang_complete_auto = 0
"let g:clang_auto_select = 0
"let g:clang_default_keymappings = 0
""let g:clang_use_library = 1

" " Airline
" let g:airline_section_y = ''
" "let g:airline#extensions#branch#use_vcscommand = 1
" let g:airline#extensions#tagbar#flags = 's' 
" let g:airline#extensions#wordcount#enabled = 1 
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#tab_nr_type = 1 
" let g:airline#extensions#tabline#buffer_idx_mode = 1
" nmap <leader>1 <Plug>AirlineSelectTab1
" nmap <leader>2 <Plug>AirlineSelectTab2
" nmap <leader>3 <Plug>AirlineSelectTab3
" nmap <leader>4 <Plug>AirlineSelectTab4
" nmap <leader>5 <Plug>AirlineSelectTab5
" nmap <leader>6 <Plug>AirlineSelectTab6
" nmap <leader>7 <Plug>AirlineSelectTab7
" nmap <leader>8 <Plug>AirlineSelectTab8
" nmap <leader>9 <Plug>AirlineSelectTab9
" let g:airline#extensions#tabline#show_close_button = 0

" yank ring
" let g:yankring_manage_numbered_reg = 1
" "let  g:yankring_default_menu_mode = 3
" let g:yankring_window_use_horiz    = 0  " Use vertical split
" let g:yankring_window_width        = 40
" let g:yankring_replace_n_pkey = '<nul>'
" let g:yankring_replace_n_nkey = '<nul>'

" Remove any trailing whitespace that is in the file
"autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Improving paste
" nmap       sy          :YRShow<cr>
" nmap       y,          :<C-U>YRReplace '-1', P<cr>
" nmap       y.          :<C-U>YRReplace '+1', P<cr>
" " noremap    y<Left>     `[
" " noremap    y<Right>    `]
" nnoremap   S           diw"0P "using easyclip?

" TODOs
" - browse/search (ctrlp/unite)
" - nerdtree + git + svn
" - surround?
" - jumps vs buffers (how to use the lists?) (bufexplorer?)
" - ctrl-i == tab
" - ctrl-s/q?
" - autoindent/format with gw or gq (numbered list) 
" - words delimiters (for ctrl+right/left)
" - move to the end of paste -> done with gp
" - ifdef
" - folding -> outline/tagbar is better
" - https://github.com/jimeh/tmuxifier
" NOTES:
" - build in background (using tmux) (vim dispatch)
" - autocomments -> formatoptions
" - autocomplete
"   - test it on ImagePlus
"   - test neocomplete + snippets
"   - test VimCompletesMe (and ctags/exuberant tags?)
"   - gccsense?
" - line numbers (wn toggles)
" - change colors in insert mode -> InsertEnter InsertLeave autocmds
" - spell
" - surrounds % -> gs / gvs (hi MatchParen)
" - gdb?
" - wildmode -> like a shell
" - align code with Tabular(ize), and use t* as remaps
" - autoclose surroundings (AutoClose)
" - outline: tagbar -> autoclose option?
" - using marks (vim-signature vs gm)
" - refactor
" - ctags, indexer (autocomplte)
" - why after . cursor is moved?
" - VimOrganizer for emcas org files?
" - use lmake and lgrep to have several concurrent list? (ie. use location list instead of quickfix list?
"     - this has sense if we add the "project" concept on vim, and we tie each list to a "project"... 
" - I should use ~/.ctags file?
" - marks are shown at startup?
" - ctags < cscope < gtags 
" - integration with R Vim-R-plugin
" - neovim
" - vimcasts.org
"
"
"
" Vimium
"# Home/End/PageUp/PageDown not working?
"
"# unmaps
"unmap t
"
"# arrow keys
"map <Up> scrollUp
"map <Down> scrollDown
"map <Right> nextTab
"map <Left> previousTab
"map <A-Left> moveTabLeft
"map <A-Right> moveTabRight
"map <A-Up> firstTab
"map <A-Down> lastTab
"map <S-Left> moveTabLeft
"map <S-Right> moveTabRight
"
"map s<Up> scrollToTop
"map s<Down> scrollToBottom
"
"# links selection
"map sa LinkHints.activateMode
"map L LinkHints.activateMode
"map l LinkHints.activateModeToOpenInNewTab
"map <A-l> LinkHints.activateModeWithQueue
"
"# marks
"map sm Marks.activateGotoMode
"map , goBack
"map . goForward
"map s, goPrevious
"map s. goNext
"
"# search
"map <C-p> Vomnibar.activate
"#map sw Vomnibar.activate
"map sw Vomnibar.activateInNewTab
"map st Vomnibar.activateTabSelection
"map ss enterFindMode
"
"map su Vomnibar.activateEditUrl
"map sU Vomnibar.activateEditUrlInNewTab
"
"# tabs
"map q removeTab
"map Q restoreTab
"map tp togglePinTab
"map tr restoreTab
"map u restoreTab
"map tn createTab
