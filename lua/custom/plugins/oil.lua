return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional, for file icons
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  keys = {
    { '<leader>e', '<cmd>Oil<cr>', desc = 'Open parent directory (Oil)' },
  },
}
