-- VSCode Neovim Keymaps
-- Based on kickstart.nvim keybindings, adapted for VSCode
-- https://github.com/nvim-lua/kickstart.nvim

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Helper function to call VSCode commands
local function vscode(cmd)
  return string.format("<cmd>lua require('vscode').action('%s')<CR>", cmd)
end

--------------------------------------------------------------------------------
-- Basic Keymaps (from kickstart.nvim)
--------------------------------------------------------------------------------

-- Clear search highlights on pressing <Esc> in normal mode
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)

-- Diagnostic keymaps
keymap("n", "<leader>q", vscode("workbench.actions.view.problems"), { desc = "Open diagnostic quickfix list" })

--------------------------------------------------------------------------------
-- Window/Editor Navigation (kickstart.nvim style)
--------------------------------------------------------------------------------

-- Move focus between editor groups (VSCode equivalent of vim windows)
keymap("n", "<C-h>", vscode("workbench.action.focusLeftGroup"), { desc = "Move focus to left editor group" })
keymap("n", "<C-l>", vscode("workbench.action.focusRightGroup"), { desc = "Move focus to right editor group" })
keymap("n", "<C-j>", vscode("workbench.action.focusBelowGroup"), { desc = "Move focus to below editor group" })
keymap("n", "<C-k>", vscode("workbench.action.focusAboveGroup"), { desc = "Move focus to above editor group" })

-- Close editor (vim window style)
keymap("n", "<C-w>d", vscode("workbench.action.closeActiveEditor"), { desc = "Close active editor" })
keymap("n", "<C-w>o", vscode("workbench.action.closeOtherEditors"), { desc = "Close other editors" })

-- Split editors (vim window style)
keymap("n", "<C-w>s", vscode("workbench.action.splitEditorDown"), { desc = "Split editor horizontally" })
keymap("n", "<C-w>v", vscode("workbench.action.splitEditorRight"), { desc = "Split editor vertically" })

--------------------------------------------------------------------------------
-- Search Keymaps (kickstart.nvim Telescope -> VSCode equivalents)
--------------------------------------------------------------------------------

-- <leader>s* = Search commands
keymap({ "n", "v" }, "<leader>sh", vscode("workbench.action.openGlobalKeybindings"), { desc = "[S]earch [H]elp/Keybindings" })
keymap({ "n", "v" }, "<leader>sk", vscode("workbench.action.openGlobalKeybindings"), { desc = "[S]earch [K]eymaps" })
keymap({ "n", "v" }, "<leader>sf", vscode("workbench.action.quickOpen"), { desc = "[S]earch [F]iles" })
keymap({ "n", "v" }, "<leader>ss", vscode("workbench.action.showCommands"), { desc = "[S]earch [S]elect Command" })
keymap({ "n", "v" }, "<leader>sw", vscode("editor.action.addSelectionToNextFindMatch"), { desc = "[S]earch current [W]ord" })
keymap({ "n", "v" }, "<leader>sg", vscode("workbench.action.findInFiles"), { desc = "[S]earch by [G]rep" })
keymap({ "n", "v" }, "<leader>sd", vscode("workbench.actions.view.problems"), { desc = "[S]earch [D]iagnostics" })
keymap({ "n", "v" }, "<leader>sr", vscode("search.action.openEditor"), { desc = "[S]earch [R]esume" })
keymap({ "n", "v" }, "<leader>s.", vscode("workbench.action.openRecent"), { desc = "[S]earch Recent Files ('.' for repeat)" })
keymap({ "n", "v" }, "<leader>sc", vscode("workbench.action.showCommands"), { desc = "[S]earch [C]ommands" })

-- Buffer/Editor navigation
keymap({ "n", "v" }, "<leader><leader>", vscode("workbench.action.showAllEditors"), { desc = "Find existing buffers/editors" })
keymap({ "n", "v" }, "<leader>/", vscode("actions.find"), { desc = "Fuzzy search in current buffer" })
keymap({ "n", "v" }, "<leader>s/", vscode("workbench.action.findInFiles"), { desc = "Search in open files" })

vim.keymap.set('i', '<C-j>', function()
  local pos = vim.api.nvim_win_get_cursor(0)
  vim.api.nvim_buf_set_lines(0, pos[1], pos[1], false, {''})
end)

vim.keymap.set('n', '<leader>d', 'mciw*<Cmd>nohl<CR>', { remap = true })

--------------------------------------------------------------------------------
-- LSP Keymaps (kickstart.nvim style)
--------------------------------------------------------------------------------
-- Go to keymaps (gr* pattern from kickstart.nvim)
keymap("n", "grr", vscode("editor.action.goToReferences"), { desc = "[G]oto [R]eferences" })
keymap("n", "gri", vscode("editor.action.goToImplementation"), { desc = "[G]oto [I]mplementation" })
keymap("n", "grd", vscode("editor.action.revealDefinition"), { desc = "[G]oto [D]efinition" })
keymap("n", "gd", vscode("editor.action.revealDefinition"), { desc = "[G]oto [D]efinition" })
keymap("n", "gO", vscode("workbench.action.gotoSymbol"), { desc = "Open document symbols" })
keymap("n", "gW", vscode("workbench.action.showAllSymbols"), { desc = "Open workspace symbols" })
keymap("n", "grt", vscode("editor.action.goToTypeDefinition"), { desc = "[G]oto [T]ype Definition" })
keymap("n", "grn", vscode("editor.action.rename"), { desc = "[R]e[n]ame" })
keymap({ "n", "v" }, "gra", vscode("editor.action.quickFix"), { desc = "Code [A]ction" })
keymap("n", "grD", vscode("editor.action.revealDeclaration"), { desc = "[G]oto [D]eclaration" })

-- Hover
keymap({ "n", "v" }, "K", vscode("editor.action.showHover"), { desc = "Show hover information" })

-- Toggle inlay hints
keymap("n", "<leader>th", vscode("editor.action.toggleInlayHints"), { desc = "[T]oggle Inlay [H]ints" })

--------------------------------------------------------------------------------
-- Formatting (kickstart.nvim style)
--------------------------------------------------------------------------------

keymap({ "n", "v" }, "<leader>f", vscode("editor.action.formatDocument"), { desc = "[F]ormat buffer" })

--------------------------------------------------------------------------------
-- Additional VSCode-specific keymaps (from the article)
--------------------------------------------------------------------------------

-- Terminal
keymap({ "n", "v" }, "<leader>t", vscode("workbench.action.terminal.toggleTerminal"), { desc = "[T]oggle Terminal" })

-- Debugging
keymap({ "n", "v" }, "<leader>b", vscode("editor.debug.action.toggleBreakpoint"), { desc = "Toggle [B]reakpoint" })
keymap({ "n", "v" }, "<leader>dc", vscode("workbench.action.debug.continue"), { desc = "[D]ebug [C]ontinue" })
keymap({ "n", "v" }, "<leader>ds", vscode("workbench.action.debug.start"), { desc = "[D]ebug [S]tart" })

-- Quick actions
keymap({ "n", "v" }, "<leader>a", vscode("editor.action.quickFix"), { desc = "Quick Fix [A]ction" })
keymap({ "n", "v" }, "<leader>cn", vscode("notifications.clearAll"), { desc = "[C]lear [N]otifications" })
keymap({ "n", "v" }, "<leader>cp", vscode("workbench.action.showCommands"), { desc = "[C]ommand [P]alette" })

-- File explorer
keymap({ "n", "v" }, "<leader>e", vscode("workbench.view.explorer"), { desc = "Focus [E]xplorer" })

-- Source control
keymap({ "n", "v" }, "<leader>gg", vscode("workbench.view.scm"), { desc = "Open [G]it view" })
keymap({ "n", "v" }, "<leader>gc", vscode("git.commit"), { desc = "[G]it [C]ommit" })

--------------------------------------------------------------------------------
-- Better editing experience
--------------------------------------------------------------------------------

-- Yank to system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)

-- Paste from system clipboard
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- Better indent handling (stay in visual mode)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- Paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

--------------------------------------------------------------------------------
-- Harpoon keymaps (optional - requires vscode-harpoon extension)
--------------------------------------------------------------------------------

keymap({ "n", "v" }, "<leader>ha", vscode("vscode-harpoon.addEditor"), { desc = "[H]arpoon [A]dd editor" })
keymap({ "n", "v" }, "<leader>ho", vscode("vscode-harpoon.editorQuickPick"), { desc = "[H]arpoon [O]pen list" })
keymap({ "n", "v" }, "<leader>he", vscode("vscode-harpoon.editEditors"), { desc = "[H]arpoon [E]dit editors" })
keymap({ "n", "v" }, "<leader>h1", vscode("vscode-harpoon.gotoEditor1"), { desc = "[H]arpoon goto [1]" })
keymap({ "n", "v" }, "<leader>h2", vscode("vscode-harpoon.gotoEditor2"), { desc = "[H]arpoon goto [2]" })
keymap({ "n", "v" }, "<leader>h3", vscode("vscode-harpoon.gotoEditor3"), { desc = "[H]arpoon goto [3]" })
keymap({ "n", "v" }, "<leader>h4", vscode("vscode-harpoon.gotoEditor4"), { desc = "[H]arpoon goto [4]" })
keymap({ "n", "v" }, "<leader>h5", vscode("vscode-harpoon.gotoEditor5"), { desc = "[H]arpoon goto [5]" })

--------------------------------------------------------------------------------
-- Project Manager keymaps (optional - requires Project Manager extension)
--------------------------------------------------------------------------------

keymap({ "n", "v" }, "<leader>pa", vscode("projectManager.saveProject"), { desc = "[P]roject [A]dd/save" })
keymap({ "n", "v" }, "<leader>po", vscode("projectManager.listProjectsNewWindow"), { desc = "[P]roject [O]pen" })
keymap({ "n", "v" }, "<leader>pe", vscode("projectManager.editProjects"), { desc = "[P]roject [E]dit" })
