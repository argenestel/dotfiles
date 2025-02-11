return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "azure",
      auto_suggestions_provider = "azure",
      azure = {
        endpoint = "",
        deployment = "",
        model = "gpt-4o",
        timeout = 30000,
        temperature = 0,
        max_tokens = 16384,
      },
      behaviour = {
        auto_suggestions = true,
        auto_set_highlight_group = true,
        auto_set_keymaps = true ,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = true,
        minimize_diff = true,
        enable_token_counting = true,
        suggestion_delay = 5,  -- No delay for suggestions
      },
      windows = {
        position = "right",
        wrap = true,
        width = 30,
        sidebar_header = {
          enabled = true,
          align = "center",
          rounded = true,
        },
        input = {
          prefix = "> ",
          height = 8,
        },
        edit = {
          border = "rounded",
          start_insert = true,
        },
        ask = {
          floating = false,
          start_insert = true,
          border = "rounded",
          focus_on_apply = "ours",
        },
      },
      mappings = {
        suggestion = {
          accept = "<C-Tab>",      -- Keep original Ctrl-Tab
          next = "<C-j>a",         -- Ctrl-j a for avante next
          prev = "<C-k>a",         -- Ctrl-k a for avante prev
          dismiss = "<C-q>a",      -- Ctrl-q a for avante dismiss
        },
        jump = {
          next = "]]",
          prev = "[[",
        },
        submit = {
          normal = "<CR>",
          insert = "<C-s>",
        },
        sidebar = {
          apply_all = "A",
          apply_cursor = "a",
          switch_windows = "<Tab>",
          reverse_switch_windows = "<S-Tab>",
        },
      },
      highlights = {
        suggestion = {
          fg = "#7aa2f7",  -- Same blue as others
          bg = "NONE",
          bold = true,
        },
        selected = {
          fg = "#bb9af7",  -- Same purple as others
          bg = "NONE",
          bold = true,
        },
      },
      -- Better suggestion visibility
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 0,  -- No delay
        highlight = true,
        virtual_text = true,
        priority = 65535,
      },
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
}
