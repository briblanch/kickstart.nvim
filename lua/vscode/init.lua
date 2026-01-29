-- VSCode Neovim Configuration
-- Lightweight setup for VSCode integration

-- Set leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Reduce timeout for key sequences
vim.opt.timeoutlen = 300

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with VSCode-specific plugins
require("lazy").setup({
  {
    "vscode-neovim/vscode-multi-cursor.nvim",
    event = "VeryLazy",
    cond = not not vim.g.vscode,
    opts = {},
  },
}, {
  -- Disable UI elements not needed in VSCode
  ui = { backdrop = 0 },
  checker = { enabled = false },
  change_detection = { enabled = false },
})

-- Load VSCode keymaps
require("vscode.keymaps")
