
"clean W503 error from flake8
nnoremap <C-q> <C-v>
nmap <F8> :TagbarToggle<CR>
nnoremap <Leader>c :w<CR>:!py %<CR>
" Basic Settings
set number                   " Display line numbers
set wrap                     " Enable line wrapping
set linebreak                " Wrap lines at logical break points
set tabstop=4                " Number of spaces a tab character represents
set shiftwidth=4             " Number of spaces to use for each level of indentation
set expandtab                " Convert tabs to spaces

" Folding Settings
set foldmethod=indent       " Fold based on indentation
set foldlevel=99            " Open all folds by default

" Syntax and File Type Settings
syntax on                   " Enable syntax highlighting
set filetype                " Automatically detect file type
autocmd FileType html setlocal tabstop=4 shiftwidth=4 expandtab " Filetype-specific settings

" Appearance and Color Scheme
colorscheme habanight       " Set color scheme
set t_Co=256                " Enable 256 colors in the terminal

" Plugin Management
call plug#begin()
Plug 'dense-analysis/ale'
Plug 'jbgutierrez/vim-better-comments'
Plug 'preservim/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'alvan/vim-closetag'
Plug 'davidhalter/jedi-vim'
Plug 'preservim/tagbar'
" shift+k - documentation
" ctr+space 
" features - https://github.com/davidhalter/jedi-vim?tab=readme-ov-file#features

call plug#end()

" Highlighting Customizations
highlight ErrorBetterComments ctermfg=green
highlight QuestionBetterComments ctermfg=red
highlight AtSymbolBetterComments ctermfg=blue
highlight TodoBetterComments ctermfg=cyan
highlight DollarSignBetterComments ctermfg=magenta
highlight PercentSignBetterComments ctermfg=brown
highlight CaretSignBetterComments ctermfg=white
highlight AmpersandBetterComments ctermfg=lightyellow

" Autocommands
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=magenta ctermbg=5
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=gray  ctermbg=7
autocmd FileType * syntax match AtSymbolBetterComments /#@.*/
autocmd FileType * syntax match DollarSignBetterComments /#$.*/
autocmd FileType * syntax match PercentSignBetterComments /#%.*/
autocmd FileType * syntax match CaretSignBetterComments /#\^.*/

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size=1
let g:pythonthreedll = $PYTHON3DLL 
let g:tagbar_ctags_bin = $CTAGS_PATH

" Ensure ALE is installed and enabled
let g:ale_linters = {'python': ['flake8']}

" Optional: Specify flake8 as the linter for Python
let g:ale_python_flake8_executable = 'flake8'

let g:ale_python_flake8_executable = $FLAKE8_PATH

let g:ale_python_flake8_options = '--config=~/vimfiles/.flake8'

" Key Mappings
map <C-z> <Nop>              " Disable Ctrl-z
nnoremap <Leader>t :NERDTreeToggle<CR> " Toggle NERDTree


" Custom Commands
command! -range C execute <line1> . "," . <line2> . "s/^/#/" 
command! -range UC execute <line1> . "," . <line2> . "s/^#//" 
