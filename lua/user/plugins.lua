local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself - reload packer each time this file is saved
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim - not optional, required by most other plugins
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins - not optional, required by most other plugins
  use {"tpope/vim-dispatch", opt = true, cmd = {"Dispatch", "Make", "Focus", "Start"}} -- This goes into the opt directory and doesn't run on its own, it will run once called with one of the specified comments. This is called lazy loading
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'} -- This run a post install/update hook needed because the plugin uses some JS. It provides MD preview

  -- Colorschemes
  use "lunarvim/colorschemes" -- Several lunarvim themes
  use "folke/tokyonight.nvim" -- Tokyo
  use "catppuccin/nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)