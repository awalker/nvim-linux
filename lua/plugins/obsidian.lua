-- TODO: Only load this in windows or adjust the path based on OS
return {
  {
    "epwalsh/obsidian.nvim",
    enabled = true,
    cmd = "ObsidianQuickSwitch",
    config = function()
      require("obsidian").setup({
        -- TODO: Location would Ideally be based on env var
        dir = "~/Documents/Obsidian Vault/",
        completion = { nvim_cmp = true },
      })
    end,
  },

  { "arakkkkk/kanban.nvim" },
}
