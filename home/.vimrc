" vim: set fdm=marker:

" Compatibility {{{
    set nocompatible
    set encoding=utf8
    set modelines=1
    set nobackup
    set nowrap

    set noerrorbells
    set novisualbell
    set t_vb=

    set tags=./tags;
" }}}
" Indentations, tabs/spaces {{{
    set expandtab
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set shiftround
    set smarttab
    set smartindent
    set autoindent
    set formatoptions=croql
    set backspace=indent,eol,start
    filetype plugin on
    filetype indent on
" }}}
" Scrolling {{{
    set scrolloff=3
    set sidescroll=5
    set sidescrolloff=5
" }}}
" Line numbers {{{
    set number
" }}}
" Command line {{{
    set cmdheight=1
    set completeopt=menu,preview
    if has('nvim')
        cnoremap <C-A> <Home>
        cnoremap <C-F> <Right>
        cnoremap <C-B> <Left>
        cnoremap <Esc>b <S-Left>
        cnoremap <Esc>f <S-Right>
    endif
" }}}
" Status line {{{
    set shortmess=filmnrwxtToOI
    set showcmd
    set laststatus=2
" }}}
" Sign column {{{
    set signcolumn=yes
" }}}
" Mouse {{{
    set ttyfast
    if !has('nvim')
        set ttymouse=sgr
    endif
    set mouse=a
    set mousemodel=popup
    set mousehide
" }}}
" Searching {{{
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    set showmatch
    set nowrapscan

    set grepprg=grep\ -nH\ $*

    if has('nvim')
      set inccommand=split
    endif

    nnoremap <C-\> :nohlsearch<CR>
    vnoremap <C-\> <Esc>:nohlsearch<CR>gv
" }}}
" Buffers {{{
    set hidden
    set nostartofline
    nnoremap <Leader>q :bprevious<bar>split<bar>bnext<bar>bdelete<CR>
    nnoremap <Leader>s :update<CR>
" }}}
" Wildignore {{{
    set wildignore+=*.pyc
    set wildignore+=*.class
    set wildignore+=*.bak
    set wildignore+=*.swp
" }}}
" Clipboard {{{
    if has('nvim')
      set clipboard+=unnamedplus
    endif
" }}}
" Macros {{{
    set lazyredraw
" }}}
" File type autocmds {{{
    augroup md
        autocmd BufNewFile,BufRead *.md set tabstop=2 shiftwidth=2 expandtab tw=72
        autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us
    augroup END
    augroup clj
        autocmd BufNewFile,BufRead *.clj RainbowParentheses
    augroup END
" }}}
" Plugins {{{1
" Coc Extensions {{{2
    let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-tsserver',
    \ 'coc-vetur',
    \ 'coc-explorer',
    \ 'coc-go',
    \ 'coc-java',
    \ 'coc-lists',
    \ 'coc-snippets'
    \ ]
" }}}
    runtime macros/matchit.vim

    let g:polyglot_disabled = ['go']

    call plug#begin('~/.vim/plugged')
    Plug 'preservim/nerdcommenter'

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    " fzf {{{2
    nnoremap <silent> <Leader>a :Buffers<CR>
    nnoremap <silent> <Leader>A :Files<CR>

    if has('nvim') || has('gui_running')
      let $FZF_DEFAULT_OPTS .= ' --inline-info'
    endif
    " }}}

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " {{{2
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols = {}
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    "let g:airline_symbols.linenr = ''
    let g:airline_theme = 'papercolor'
    " }}}
    Plug 'jreybert/vimagit'
    Plug 'tpope/vim-fugitive'
    " vim-fugitive {{{2
    nnoremap <silent> <Space>g :G<CR>
    nnoremap <silent> <Space>w :Gwrite<CR>
    nnoremap <silent> <Space>r :Gread<CR>
    nnoremap <silent> <Space>cc :Git commit<CR>
    nnoremap <silent> <Space>ca :Git commit -a<CR>
    nnoremap <silent> <Space>c! :Git commit --amend<CR>
    nnoremap <silent> <Space>p :Git push<CR>
    " }}}
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-eunuch'
    Plug 'idanarye/vim-merginal'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/gv.vim'
    Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/vim-github-dashboard'
    Plug 'flazz/vim-colorschemes'
    Plug 'ryanoasis/vim-devicons'
    " vim-devicons {{{2
    let g:webdevicons_enable = 1
    let g:webdevicons_enable_nerdtree = 1
    let g:webdevicons_enable_airline_tabline = 1
    let g:webdevicons_enable_airline_statusline = 1
    let g:webdevicons_enable_ctrlp = 1
    " }}}
    Plug 'mhinz/vim-startify'
    " vim-startify {{{2
    let g:startify_change_to_dir = 0
    Plug 'mg979/vim-visual-multi'
    Plug 'junegunn/vim-peekaboo'

    Plug 'easymotion/vim-easymotion'
    Plug 'haya14busa/incsearch.vim'
    Plug 'haya14busa/incsearch-fuzzy.vim'
    Plug 'haya14busa/incsearch-easymotion.vim'
    " easy-motion {{{2
    nmap s <Plug>(easymotion-overwin-f)
    map <Leader>j <Plug>(easymotion-j)
    map <Leader>k <Plug>(easymotion-k)

    let g:incsearch#auto_nohlsearch = 1
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)

    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

    function! s:config_easyfuzzymotion(...) abort
      return extend(copy({
      \   'converters': [incsearch#config#fuzzy#converter()],
      \   'modules': [incsearch#config#easymotion#module()],
      \   'keymap': {"<C-M>": '<Over>(easymotion)'},
      \   'is_expr': 0,
      \   'is_stay': 1
      \ }), get(a:, 1, {}))
    endfunction

    noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
    " }}}

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " snippets {{{2
    let g:UltiSnipsListSnippets="<F2>"
    nnoremap <F2> :Snippets<cr>
    " }}}

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " vim-go {{{2
    let g:go_version_warning = 0
    " }}}
    Plug 'tpope/vim-fireplace'
    Plug 'guns/vim-clojure-static'
    Plug 'junegunn/rainbow_parentheses.vim'
    """ rainbow_parentheses.vim {{{2
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
    """ }}}
    Plug 'guns/vim-sexp'
    Plug 'tpope/vim-sexp-mappings-for-regular-people'
    Plug 'sheerun/vim-polyglot'
    Plug 'junegunn/vim-easy-align'
    " vim-easy-align {{{2
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
    xmap gA <Plug>(LiveEasyAlign)
    nmap gA <Plug>(LiveEasyAlign)
    " }}}

    Plug 'junegunn/goyo.vim'
    " goyo {{{2
    nmap <F5> :Goyo<CR>
    " }}}
    Plug 'junegunn/limelight.vim'
    " limelight {{{2
    let g:limelight_conceal_ctermfg = '238'
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
    " }}}

    Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': { -> coc#util#install() }}
    " coc {{{2
    " Autocompletion mappings
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    inoremap <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<Tab>" :
                \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<Tab>"

    " Go to mappings
    nmap <silent> Cd <Plug>(coc-definition)
    nmap <silent> Ct <Plug>(coc-type-definition)
    nmap <silent> Cp <Plug>(coc-implementation)
    nmap <silent> Cr <Plug>(coc-references)

    " Diagnostics navigation
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " Refactoring mappings
    nmap CR <Plug>(coc-rename)
    nmap CF <Plug>(coc-format)
    xmap CF <Plug>(coc-format-selected)
    nmap CA <Plug>(coc-codeaction)
    xmap CA <Plug>(coc-codeaction-selected)
    nmap CX <Plug>(coc-fix-current)
    nmap Cx :CocFix<CR>

    " Coc lists mappings
    nnoremap <silent> Cld :<C-u>CocList diagnostics<cr>
    nnoremap <silent> Cle :<C-u>CocList extensions<cr>
    nnoremap <silent> Clc :<C-u>CocList commands<cr>
    nnoremap <silent> Clo :<C-u>CocList outline<cr>
    nnoremap <silent> Cls :<C-u>CocList -I symbols<cr>

    " Show info mappings
    nnoremap <silent> Ci :call CocAction('doHover')<CR>

    " Highlight current identifier usage in current document
    autocmd CursorHold * silent call CocActionAsync('highlight')
    " }}}
    Plug 'mattn/emmet-vim'
    Plug 'nathanaelkane/vim-indent-guides'
    " vim-indent-guides {{{2
    let g:indent_guides_enable_on_vim_startup = 0
    let g:indent_guides_guide_size = 1
    " }}}
    " Text object plugins
    Plug 'michaeljsmith/vim-indent-object'
    " To test them first
    Plug 'DougBeney/vim-reddit'
    Plug 'rhysd/git-messenger.vim'
    call plug#end()
    " vim-startify {{{2
    let g:startify_custom_header_quotes =
        \ startify#fortune#predefined_quotes()
        \ + [['Design is separating into things that can be composed.', '', '- Rich Hickey']]
        \ + [['When you combine two pieces of data you get data.', 'When you combine two machines you get trouble.', '', '- Rich Hickey']]
        \ + [['Nobody wants to program with mutable strings anymore,', 'why do you want to program with mutable collections?', '- Rich Hickey']]
        \ + [['Eventually, with mutable objects you create an intractable mess. And encapsulation does not get rid of that. Encapsulation only means: "well I''m in charge of this mess".', '- Rich Hickey']]
        \ + [['It’s not an idea until you write it down.', '', '- Ivan Sutherland']]
        \ + [['If the technology you do isn’t fun for you, you may wish to seek other employment.', 'Without the fun, none of us would go on.', '', '- Ivan Sutherland']]
    " }}}
    " }}}
" }}}
" Colors {{{
    syntax on
    match ExtraWhitespace /\s\+$/    
    augroup colors
        autocmd!
        autocmd ColorScheme nord
            \   highlight Visual ctermbg=8
            \ | highlight VisualNOS ctermbg=8
            \ | highlight CursorLine ctermfg=0 ctermbg=12
            \ | highlight CursorColumn ctermfg=0 ctermbg=12
            \ | highlight PMenu ctermbg=4
    augroup END
    colorscheme nord
" }}}
" Russian keyboard {{{
    set keymap=russian-jcukenwin
    set iskeyword=@,48-57,_,192-255
    set iminsert=0
    set imsearch=0
    map ё `
    map й q
    map ц w
    map у e
    map к r
    map е t
    map н y
    map г u
    map ш i
    map щ o
    map з p
    map х [
    map ъ ]
    map ф a
    map ы s
    map в d
    map а f
    map п g
    map р h
    map о j
    map л k
    map д l
    map ж ;
    map э '
    map я z
    map ч x
    map с c
    map м v
    map и b
    map т n
    map ь m
    map б ,
    map ю .
    map Ё ~
    map Й Q
    map Ц W
    map У E
    map К R
    map Е T
    map Н Y
    map Г U
    map Ш I
    map Щ O
    map З P
    map Х {
    map Ъ }
    map Ф A
    map Ы S
    map В D
    map А F
    map П G
    map Р H
    map О J
    map Л K
    map Д L
    map Ж :
    map Э "
    map Я Z
    map Ч X
    map С C
    map М V
    map И B
    map Т N
    map Ь M
    map Б <
    map Ю >
" }}}
" Some fun stuff {{{

" Morse operator
nnoremap <silent> gm :set opfunc=Morse<cr>g@
vnoremap <silent> gm :<c-u>call Morse(visualmode(), 1)<cr>
function! Morse(vt, ...)
    let [sl, sc] = getpos(a:0 ? "'<" : "'[")[1:2]
    let [el, ec] = getpos(a:0 ? "'>" : "']")[1:2]
    if a:vt == 'line'
    elseif a:vt == 'char'
        exe sl.','.el.'s/\%'.sc.'c.\+\%<'.(ec + 1).'c/\=MorseMap(submatch(0))/g'
    elseif a:vt == 'block'
    endif
endfunction

function MorseMap(ch)
python3 << EOF
import vim
morse_map = {
    '"': '\\"',
    '\n': '\\n',
    '\r': '\\r',
    's': ' ... ',
    'o': ' --- ',
}

text = vim.eval('a:ch')
new_text = ''.join(map(lambda c: morse_map.get(c, c), text))
vim.command('let result="' + new_text + '"')
EOF
    return result
endfunction
" }}}
