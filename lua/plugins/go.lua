return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup {
        tag_options = "",
        lsp_cfg = false, -- já configurado no lspconfig
        lsp_gofumpt = false, -- usar conform.nvim para formatação
        lsp_on_attach = false, -- já configurado no lspconfig
        dap_debug = true,
        dap_debug_keymap = false,
        dap_debug_gui = false,
        test_runner = "gotestsum",
        run_in_floaterm = false,
        goimport = "gopls",
        gofmt = "gofumpt",
        max_line_len = 120,
        tag_transform = false,
        test_template = "",
        test_template_dir = "",
        comment_placeholder = "",
        log_path = vim.fn.expand "$HOME" .. "/tmp/golang.log",
        verbose = false,
        lsp_diag_hdlr = true,
        textobjects = true,
        build_tags = "",
        lsp_document_formatting = false, -- usar conform.nvim
        lsp_document_code_action_signs = true,
        lsp_document_code_action_signs_hl = "LspDiagnosticsSignHint",
        lsp_inlay_hints = {
          enable = true,
          style = "inlay",
          only_current_line = false,
          show_variable_name = true,
        },
      }
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
    keys = {
      {
        "<leader>gsj",
        "<cmd> GoAddTag json <CR>",
        desc = "Add json struct tags",
      },
      {
        "<leader>gsy",
        "<cmd> GoAddTag yaml <CR>",
        desc = "Add yaml struct tags",
      },
      {
        "<leader>gfs",
        "<cmd> GoFillStruct <cr>",
        desc = "Go Fill Struct",
      },
      {
        "<leader>gtt",
        "<cmd> GoTestFunc <cr>",
        desc = "Go Test Function",
      },
      {
        "<leader>gtf",
        "<cmd> GoTestFile <cr>",
        desc = "Go Test File",
      },
      {
        "<leader>gtm",
        "<cmd> GoModTidy <cr>",
        desc = "Go Mod Tidy",
      },
    },
  },
}
