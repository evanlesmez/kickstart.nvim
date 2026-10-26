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
        width = 25,
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
  { -- https://github.com/nvim-neotest/neotest
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-python', -- https://github.com/nvim-neotest/neotest-python
      'olimorris/neotest-phpunit', -- https://github.com/olimorris/neotest-phpunit
    },
    -- <leader>t is the Toggle group, so tests use <leader>T.
    keys = {
      { '<leader>Tn', function() require('neotest').run.run() end, desc = '[T]est [n]earest' },
      { '<leader>Td', function() require('neotest').run.run { strategy = 'dap' } end, desc = '[T]est [d]ebug nearest' },
      { '<leader>Tf', function() require('neotest').run.run(vim.fn.expand '%') end, desc = '[T]est [f]ile' },
      { '<leader>Ts', function() require('neotest').summary.toggle() end, desc = '[T]est [s]ummary' },
      { '<leader>To', function() require('neotest').output.open { enter = true } end, desc = '[T]est [o]utput' },
    },
    config = function()
      require('neotest').setup {
        -- Adapters must be adapter objects; plain name strings are not resolved by neotest.
        adapters = {
          -- Finds the project venv via $VIRTUAL_ENV or any */pyvenv.cfg under the cwd.
          -- Debugging uses the `python` dap adapter registered by mason-nvim-dap (debugpy).
          require 'neotest-python' { runner = 'pytest', dap = { justMyCode = false } },
          require 'neotest-phpunit',
        },
      }
    end,
  },
}
