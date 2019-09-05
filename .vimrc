""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @original: Enrique Paredes
" tweaked: PRDeving
" @licensing:
    "    <MIT License>http://www.opensource.org/licenses/mit-license.php
    "
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    set nocompatible

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Custom Bundles""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    filetype off " Bundle conf
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'

    Bundle 'scrooloose/nerdtree'
    nmap tt :NERDTreeToggle<CR>
    map tt :NERDTreeToggle<CR>
    nmap tf :NERDTreeFocus<CR>
    map tf :NERDTreeFocus<CR>

    Bundle 'rking/ag.vim'

    Bundle 'majutsushi/tagbar'
    map tag :TagbarToggle<CR>

    Bundle 'mattn/emmet-vim'
    " <C-Y>

    Bundle 'joeytwiddle/vim-multiple-cursors'
    " <C-n>

    " Git
    Bundle 'tpope/vim-fugitive'
    "Gdiff, Gstatus, Gcommit, Gmove...

    Bundle 'sheerun/vim-polyglot'
    Bundle 'tomtom/tcomment_vim'

    " Bundle 'Shougo/neocomplete.vim'
    " compilar con lua en algun momento...



    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-unimpaired'

    Bundle 'bling/vim-airline'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts=1
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:bufferline_echo=0
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:syntastic_python_checkers = ['flake8']

    Bundle 'godlygeek/tabular'
    inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
    function! s:align()
      let p = '^\s*|\s.*\s|\s*$'
      if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
        let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
        let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
        Tabularize/|/l1
        normal! 0
        call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
      endif
    endfunction

    Bundle 'scrooloose/syntastic'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_error_symbol = '▸'
    let g:syntastic_warning_symbol='⚠'
    let g:syntastic_style_error_symbol = '§'
    let g:syntastic_style_warning_symbol='~'

    Bundle 'Shougo/unite.vim'
    map open :Unite file<cr>

    Bundle 'Shougo/vimfiler.vim'
    let g:vimfiler_as_defaut_explorer = 1
    map - :VimFiler<cr>

    " https://github.com/junegunn/fzf#installation
    " git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    " ~/.fzf/install
    set rtp+=~/.fzf
    Bundle 'junegunn/fzf.vim'
    nmap ; :Files .<cr>


    Bundle 'MattesGroeger/vim-bookmarks'
    highlight BookmarkSign ctermbg=NONE ctermfg=160
    highlight BookmarkLine ctermbg=194 ctermfg=NONE
    let g:bookmark_sign = '♥'
    let g:bookmark_highlight_lines = 1

    Bundle 'francoiscabrol/ranger.vim'

    filetype plugin indent on         " EOF Bundle conf
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ""GENERAL OPTIONS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    syntax enable
    set shortmess+=I

    set autoread                      " Update when changed from outside
    set autowriteall                  " Writes on file change
    set autoindent                    " Indenting options
    set smartindent
    set ruler                         " show the cursor position all the time
    set ts=4 sts=4 sw=4 expandtab     " Default tab flavour
    set smarttab
    set laststatus=2                  " Allways show status in bar
    set nowrap

    set backspace=indent,eol,start    " Normalize backspacing between os.

    " set mouse=a                       " Mouse Configuration
    " set mousefocus

    colorscheme Tomorrow-Night-Eighties
    set colorcolumn=119
    " set colorcolumn=79
    match ErrorMsg '\%<131v.\%>130v'

    set t_Co=256                        " Coloring Options
    set background=dark 

    hi Normal ctermbg=None
    hi NonText ctermbg=None

    set encoding=utf-8
    set scrolloff=5
    set sidescrolloff=5
    set showmode
    set showcmd
    set hidden
    set wildmenu
    set wildmode=list:longest
    set nocursorline
    set ttyfast
    set number
    set relativenumber
    " set nomodeline                      " disable commands inside files
    " set modelines=0

    set ttimeout                        " Set time to check commands
    set ttimeoutlen=100

    set incsearch                       " SEARCH OPTIONS
    set smartcase

    set display+=lastline               " 

    set foldmethod=indent
    set foldnestmax=10
    set nofoldenable
    set foldlevel=1

    " set ofu=syntaxcomplete#Complete     " Onmi Completion options
    " set complete-=i                     " disable onmi to search in current path
    set completeopt=longest,menuone
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
          \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

    inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
          \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

    set hlsearch                        " Highlight search things
    set wildignore=*.obj,*.exe,*.pyc,*.pyo,*.pyx,*.*~,*.sw*,node_modules,bower_components,coverage,__pycache__

    set list
    set listchars=tab:▸\ ,eol:¬,nbsp:⍽  " Use the nice symbols for tabstops and EOL

    set visualbell                      " Error managing
    set errorbells
    set undofile                        " Persistent undo
    set undodir=$HOME/.vim/undo         " folder to store changes
    set undolevels=1000                 " changes that can be undone
    set undoreload=10000                " lines to save on a buffer reload

    set nobackup                        " no backups at all. It should be in CVS.
    set noswapfile
    set nowritebackup

    if has("autocmd")
        " When vimrc is edited, reload it
        autocmd! bufwritepost .vimrc source ~/.vim/.vimrc

        " help last-position-jump
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") |
            \    exe "normal! g`\"" | endif
        
        " start in a scratch buffer
        au VimEnter * if empty(expand('%')) | set buftype=nofile | endif
        
        " Treat .rss files as XML
        autocmd BufNewFile,BufRead *.rss setfiletype xml

        " Syntax of these languages is fuzzy over tabs Vs spaces
        autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
        autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
        autocmd FileType cucumber setlocal ts=4 sw=4 sts=4 expandtab

        " Customizations 
        autocmd FileType html setlocal nowrap

        " Nice commands output.
        autocmd VimEnter * :set t_ti= t_te=
        " review the below line with the info in :help restorescreen
        autocmd VimLeave * :set t_ti=7[r[?47h t_te=[?47l8

        autocmd FileType netrw setl bufhidden=delete
        autocmd FileType netrw setl bufhidden=wipe
    endif


    if has("gui_running") " Graphical editor running
        set guioptions-=T
        set guioptions-=m
        set guioptions-=r
        if has("gui_gtk2")
            set guifont=Source\ Code\ Pro\ Semibold\ 10,Droid\ Sans\ Mono\ 10
        else
            set guifont=Source\ Code\ Pro\ Semibold:h13,Monaco:h14
        end
        set linespace=-1
    endif

    runtime! macros/matchit.vim

    ""KEYBOARD MAPS"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " enhance sometimes dumb fingers overriding ex commands
    " nnoremap ; :

    " Ex mode hurts more times that it's useful
    nnoremap Q <nop>

    " Treat long lines as break lines (breaks relativenumber count)
    " nmap j gj
    " nmap k gk

    " Custom map
    nmap <leader>r :
    nmap econf :e ~/.vimrc<CR>
    nmap vconf :vsplit ~/.vimrc<CR>

    nmap ct :!ctags -R --options=/home/prdeving/.vim/.ctags --totals=yes .<CR>

    " Git
    nmap gs :! git status<CR>
    " nmap ga :! git add .<CR>

    "Leader configuration
    let mapleader = ","
    let g:mapleader = ","

    " window management
    nmap <leader>s <C-w>s<C-w>j
    nmap <leader>v <C-w>v<C-w>l
    nmap <leader>w <C-w>
    nmap <leader>c :close<CR>

    " buffer cycling
    nmap <C-j> :bn<cr>
    nmap <C-k> :bp<cr>
    nmap <leader>bf :bn<cr>
    nmap <leader>bb :bp<cr>
    nmap <leader>bl :ls<cr>
    nmap <leader>bd :bd<cr>

    "Shortcut to paste from outside vim
    nmap <leader>p "+p<CR>

    "rapid .vimrc edit
    nmap <leader>V :edit ~/.vim/.vimrc<CR>

    " Normalized escape
    imap <C-c> <esc>
    imap <C-\> <esc>:w<CR>
    map <C-\> <esc>:w<CR>

    "delayed super cow powers
    cmap w!! %!sudo tee > /dev/null %

    " Close the current buffer
    nmap <leader>d :bdelete!<CR>
    nmap <leader>q :qall!<CR>

    " Close all the buffers
    nmap <leader>ba :1,300 bd!<cr>
    nnoremap <leader><leader> <c-^>

    function! RenameFile()
        let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

