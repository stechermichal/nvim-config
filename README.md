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

# Gitsigns
- :Gitsigns prev_hunk
- :Gitsigns previous_hunk - when at  changes, shows those
- :Gitsigns blame_line - shows blame + message

# Nvim-tree
- leader + e opens nvimtree by calling :nvimtreeToggle
- 'a' to create a file
- 'r' to rename a file
- 'd' and 'y' to delete and confirm
- it WILL change your current working directory when moving to a file in that directory from another directory!
- 'v' when hovering over a file to call :vs on it and split it to the side
- 'l' 'cr' and 'o' all open file
- 'h' will close node/directory, similar to what <cr> would do

# Bufferline
- Shift + l/h moves between buffers, which can be combined with the previous mapping of jumping between windows with ctrl + l/h  
- Alternatively use BufferLinePick to get letter selection for specific buffers
- Note that when making a new window with :vs the new window will have the exact same buffers - and you can select a different buffer inside that window.
- Tabs are a bit different, they are a collections of windows in them. Can be made with tabnew and bound to something, I think tabs are unnecessary.
- :Bdelete as opposed to :bdelete to never close nvim completely when closing buffers
- leader b to bdelete

# null-ls
- This sort of uses what's build into the LSP rather than using their own, which is better to unify things
- If you get asked which server you want to use, it means probably both the orignal lsp one and your added null ls one is added. 
- That can be fixed by finding out which one is it with LsPInfo to show current active language server. And for example tsserver provides both diagnostics and formatting and makes us choose each time. The code below makes it so that it always uses null-ls for that.
`M.on_attach = function(client, bufnr)
	-- vim.notify(client.name .. " starting...")
	-- TODO: refactor this into a method that checks if string in list
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
end`
- Use `:Format` to run 'lua vim.lsp.buf.format{async=true}' from handlers.lua
- leader s to format, as in format on save 

# Lualine

# Toggleterm
- C + \ to open terminal. Do not rebind to a leader key, it doesn't work too well.
- Direction in toggleterm.lua can be changed to horizontal for a more of a vscode experience. Or a tab/vertical
- :lua _NODE_TOGGLE() to toggle node
- :lua _LAZYGIT_TOGGLE() to toggle lazygit --Currently better to use outside of vim as somehow vim motions still work which screws up lazygit commands. 

# Projects
- :Telescope projects

# Impatient
- Improved startup time

# Indent blankline
- Rainbow lines showing indetations

# alpha
- Greeter

# which_key
- Helps with key bindinds
- reacts for space, z, g
- ` or ' for buffer menu

# Copilot
- C+a to accept
- alt + [] to cycle through
- C+] to close suggestion
