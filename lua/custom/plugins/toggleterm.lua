return {
  'akinsho/toggleterm.nvim',
  version = '*',
  enabled = false,
  opts = {},
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<c-t>]],
    }
  end,
}
