-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)

-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
      { '<leader>o', '<cmd>Outline<CR>', desc = 'Toggle Outline' },
    },
    opts = {
      outline_window = {
        width = 20,
        relative_width = false,
        position = 'right',
        show_numbers = true,
        show_relative_numbers = false,
      },
      symbols = {
        icons = {
          -- You can customize icons here if needed
        },
      },
    },
  },
  {
    'SmiteshP/nvim-navic',
    dependencies = { 'neovim/nvim-lspconfig' },
    init = function()
      -- Prevent errors when LSP doesn't support document symbols
      vim.g.navic_silence = true
    end,
    opts = {
      separator = ' > ',
      highlight = true,
      depth_limit = 5,
    },
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'olimorris/neotest-phpunit',
    },
    opts = {
      adapters = {
        'neotest-python',
        'neotest-phpunit',
      },
    },
  },
}
