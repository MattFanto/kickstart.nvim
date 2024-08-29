return {
  'nvimtools/none-ls.nvim',
  ft = { 'python' },
  opts = function()
    local null_ls = require 'null-ls'
    return {
      sources = {
        null_ls.builtins.diagnostics.ruff,
      },
    }
  end,
}
