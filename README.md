 nvim-config
 
 # keymaps, other non-stock behavior

- Use C + <directional key> instead of CR + W + <directional key> to change windows.
- Space as leader
- Leader + e = left hand explore at size 30
- <> in visual mode to indent
- alt + j/k in visual mode to move selected up 
- C + Arrows = resize window
- Shift + L/H to jump between buffers
- typing j k in insert mode puts you into normal mode 
- Hold onto what has been yanked after pasting, instead of whatever was pasted over overwriting the yank

# Plugins
 - Plugins live in .local/share/nvim/site/pack/packer in opt and start. They are simply github repos. 
  - At the beginning all plugins live in start folder.
  - :Packer<tab> to see all packer commands
  - PackerStatus shows installed
  - PackerSync updates and compiles
  - We don't care what happens in packer_compiled, it will just get compiled again if you delete it
    - Blow it away if stuff is broken perhaps, maybe put in gitignore.
  - Extremely important/useful is pinning plugin to a specific commit when we notice that a plugin is broken but used to not be in a previous commit. [via commit, see packer docs]
 

# Colorscheme
- Set termguicolors = true in options to get more color options - This changes a lot of stuff, such as highlight not being just underline but a whole line highlight etc. Most terminals support this and if yours doesn't you should figure that out rather than leaving color off
- vim.cmd "colorscheme darkblue" in init.lua to ma:vske colorscheme persist.
- Add themes easily the same way you would add plugins
- To persist do yhou can use "colorscheme darkblue" but that will break if the theme plugin isn't installed. A bette way is to require colorscheme.lua and define it at the top 
- I put specific scheme config into colorscheme.lua, loading it into init.lua and at the top of the file.

# Completiokn
- via cpm
- close tab menu with Control + E
- Move through menu with C+j or C+k
- Scroll through the open completion window with C+b or f 
- C+Space to open menu anytime
- consider adding cmp git and cmp npm, do that by simply adding it to the cmp plugins section in plugins.lua. Also add to sources in cmp lua. Also add to sources in cmp lua

# LSP
- handlers.lua handles the keymaps
- gl shows line diagnostics
- gd jumps to a function over which we are hovering
- shift + k will hover over something and give us a blurb
- Schema store if we need lsp to work with more files
- If you need to modify a schema to maake it less strict, check nvim lspconfig repo and go to server configurations.
  - add a new if bloc in lsp-installer.lua
  - add a new file in settings, such as pyright.lua

# Telescope
 - :Telescope find_files to search
 - :Telescope live_grep to get content inside files - require ripgrep!
 - :Telescope lsp_definitions is same ad 'gd', it brings us to whatever the definitiion is and then use 'gr' to bring up the whole list of references.
 - :Telescope lsp_references also brings up the references 
 - :Telescope git branches let's us search through branches 
 - :Telescope find_files theme=ivy/dropdown/cursor let's us change the window style 
 - Summary of keymaps to avoid typing out those commands:
  - <leader> f find_files - preview can be disabled with get_dropdown({ previewer = false })
  - C + t gives us live_grep
telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },

# Treesitter
- Set up for all languages right now, added rainbow brackets and playground

# Autopairs
- Fast wrap - do opening parentheses into alt + e to get options of where to put brackets

# Commenting
- gcc to comment out one line
- gc on selected to comment out a selected bloc

