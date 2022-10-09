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

# Completion
- via cpm
- close tab menu with Control + E
- Move through menu with C+j or C+k
- Scroll through the open completion window with C+b or f 
- C+Space to open menu anytime
- consider adding cmp git and cmp npm, do that by simply adding it to the cmp plugins section in plugins.lua. Also add to sources in cmp lua. Also add to sources in cmp lua

