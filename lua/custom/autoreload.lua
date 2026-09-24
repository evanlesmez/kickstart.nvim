vim.o.autoread = true

local group = vim.api.nvim_create_augroup('custom-autoreload', { clear = true })

vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  group = group,
  callback = function()
    if vim.fn.mode() ~= 'c' and vim.fn.getcmdwintype() == '' then
      vim.cmd 'checktime'
    end
  end,
})

vim.api.nvim_create_autocmd('FileChangedShellPost', {
  group = group,
  callback = function(a)
    vim.notify('Reloaded ' .. vim.fn.fnamemodify(a.file, ':~:.'), vim.log.levels.INFO)
  end,
})
