-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
    build = 'cd app && npm install',
    ft = { 'markdown' },
  },
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gs', function()
        vim.cmd('vertical Git')
        local width = math.floor(vim.o.columns * 0.3)
        vim.cmd('vertical resize ' .. width)
      end)
      vim.keymap.set('n', '<leader>gp', '<cmd>Git pull<CR>')
      vim.keymap.set('n', '<leader>gP', '<cmd>Git push<CR>')
    end,
  },
  {
    'greggh/claude-code.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required for git operations
    },
    -- config = function()
    --   require('claude-code').setup {
    --     window = {
    --       position = 'vertical',
    --     },
    --   }
    -- end,
  },
}
