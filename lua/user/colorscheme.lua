local colorscheme = "tokyonight-night"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme) -- Protected call into which we pass a string to basically reconstruct vim.cmd "colorscheme []"
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
