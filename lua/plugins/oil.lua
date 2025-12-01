return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  config = function()
    -- Carregar e configurar nvim-web-devicons primeiro
    local has_devicons, devicons = pcall(require, "nvim-web-devicons")
    if has_devicons then
      devicons.setup()
    end
    
    require("oil").setup {
      default_file_explorer = true,
      -- Ícones habilitados (Nerd Font instalada)
      columns = { "icon", "permissions", "size", "mtime" },
      view_options = {
        show_hidden = false,
        is_always_hidden = function(name, _)
          return name == ".." or vim.startswith(name, ".")
        end,
      },
      use_default_keymaps = true,
    }
  end,
  -- Optional dependencies - garantir que seja carregado antes
  dependencies = { 
    {
      "nvim-tree/nvim-web-devicons",
      lazy = false,
      config = function()
        require("nvim-web-devicons").setup()
      end,
    }
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
