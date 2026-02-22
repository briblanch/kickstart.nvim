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
    'kdheepak/lazygit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
    config = function()
      vim.api.nvim_create_user_command('CloseFloats', function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_config(win).relative ~= '' then
            vim.api.nvim_win_close(win, true)
          end
        end
      end, {})
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
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    cmd = 'Octo',
    keys = {
      { '<leader>op', '<cmd>Octo pr list<cr>', desc = '[O]cto [P]R list' },
      { '<leader>oi', '<cmd>Octo issue list<cr>', desc = '[O]cto [I]ssue list' },
      { '<leader>or', '<cmd>Octo review start<cr>', desc = '[O]cto [R]eview start' },
    },
    opts = {
      suppress_missing_scope = {
        projects_v2 = true,
      },
    },
  },
}
