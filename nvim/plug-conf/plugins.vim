call plug#begin('~/.config/nvim/autoload/plugged')

" Completion, file browsing, snippets, surround, etc.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Coc extensions
let g:coc_global_extensions = [ "coc-clangd", "coc-css", "coc-explorer", "coc-html", "coc-java", "coc-json", "coc-python", "coc-snippets", "coc-tsserver", "coc-vimlsp", "coc-xml" ]

" Surround text object
Plug 'tpope/vim-surround'

" Comment out text
Plug 'tpope/vim-commentary'

" Replace with register example: gr iw replaces the inner word, gr replaces
" the curent selection
Plug 'vim-scripts/ReplaceWithRegister'

" Highlight color codes
Plug 'ap/vim-css-color'

" Better search with f and t
Plug 'unblevable/quick-scope'

" Better vertical motion
Plug 'justinmk/vim-sneak'

" Editor config
Plug 'editorconfig/editorconfig-vim'

" Custom status/tabline
Plug 'vim-airline/vim-airline'
" Themes for airline
Plug 'vim-airline/vim-airline-themes'

" Vim git integration
Plug 'tpope/vim-fugitive'
" Indicate changed, removed or added lines
Plug 'mhinz/vim-signify'

" Icons in nerd tree
Plug 'ryanoasis/vim-devicons'
" I think this changes the color of the icons and stuff in nerdtree 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Color Schemes
Plug 'b3nj5m1n/dotfiles'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif