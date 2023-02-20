return {
  -- add prisma, typescript, javascript, and svelte to treesitter
  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "prisma", "javascript", "typescript", "svelte" })
    end,
  },

  -- correctly setup mason lsp / dap extensions
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "prisma-language-server", "svelte-language-server" })
    end,
  },
}
