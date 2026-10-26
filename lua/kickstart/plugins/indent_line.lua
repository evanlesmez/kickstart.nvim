-- Add indentation guides even on blank lines

---@module 'lazy'
---@type LazySpec
return {
  'lukas-reineke/indent-blankline.nvim',
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help ibl`
  main = 'ibl',
  ---@module 'ibl'
  ---@type ibl.config
  config = function()
    -- cyberdream's default guide color is nearly invisible on a dark background
    local hooks = require 'ibl.hooks'
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, 'IblIndent', { fg = '#646a74' })
      vim.api.nvim_set_hl(0, 'IblScope', { fg = '#a8afba' })
    end)
    require('ibl').setup {
      indent = { char = '│' },
      scope = { enabled = true, show_start = false, show_end = false },
    }
  end,
}
