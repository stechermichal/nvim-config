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
    - Blow it away if shit is broken perhaps, maybe put in gitignore.
  - Extremely important/useful is pinning plugin to a specific commit when we notice that a plugin is broken but used to not be in a previous commit. [via commit, see packer docs]
 
