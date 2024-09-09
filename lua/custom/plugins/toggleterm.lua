return {
  'akinsho/toggleterm.nvim',
  version = '*',
  opts = {},
  config = function()
    require('toggleterm').setup {
      open_mapping = [[<C-t>]],
      direction = "float"
    }
  end,
}
