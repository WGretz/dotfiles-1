"""" Copied from Janus core settings
""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

if exists("g:enable_mvim_shift_arrow")
  let macvim_hig_shift_movement = 1 " mvim shift-arrow-keys
endif

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files." Setup Powerline

"""" Thanks Janus :)



" UltiSnip Config
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsListSnippets        = "<s-tab>"
let g:UltiSnipsSnippetsDir         = "~/.vim/UltiSnips"

" Power Line Config
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" ZenCoding
let g:user_zen_mode='i'
let g:use_zen_complete_tag = 1

"Load Pathogen and plugins
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" Setup Solarized
set background=dark
colorscheme solarized
let g:solarized_visibility = 'low'
call togglebg#map("<F5>")


" Enable Mouse for when I'm feeling lazy
if has("mouse")
  set mouse=a
  "set mousehide
endif

" tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
" http://sourceforge.net/mailarchive/forum.php?thread_name=AANLkTinkbdoZ8eNR1X2UobLTeww1jFrvfJxTMfKSq-L%2B%40mail.gmail.com&forum_name=tmux-users

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set laststatus=2   " Always show the statusline
set nocompatible   " Disable vi-compatibility
set encoding=utf-8 " Necessary to show unicode glyphs

set ttymouse=xterm2

set laststatus=2 " display status line in all windows
set noshowmode " Hide the default mode text, powerline already does

"""" MAPPINGS

" Fugitive
nmap <leader>gs :Gstatus<CR>

" Text Bubbling
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" NerdTree
map <leader>n :NERDTreeToggle<CR>

" Toggle hl search
nmap <leader>hs :set hlsearch! hlsearch?<CR>

" set default clipboard to system
set clipboard=unnamed
let g:turbux_command_rspec  = 'zeus rspec'
map <leader>rz :let g:turbux_command_rspec = 'zeus rspec'<cr>
map <leader>rnz :let g:turbux_command_rspec = 'rspec'<cr>

"when using a dev bulid of zeus
map <leader>rlz :let g:turbux_command_rspec = '~/.go/src/github.com/burke/zeus/build/zeus rspec'<cr>

map <leader>R :w<cr>:VimuxPromptCommand<cr>
map <leader>r :w<cr>:VimuxRunLastCommand<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
