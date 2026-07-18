# Decisions

Log of notable decisions about this fork that aren't obvious from the git history alone.

## 2026-07-18: Not rebasing onto upstream/master for now

Upstream (`nvim-lua/kickstart.nvim`) is 127 commits ahead of the `master` branch tracked in
this fork's `origin`. The bulk of that gap is not incremental - upstream migrated its entire
plugin management from lazy.nvim to Neovim's built-in `vim.pack` (see upstream commit
`c460542 Migrate to vim.pack` and follow-ups), rewriting most of `init.lua` in the process.

This fork's custom plugins (`lua/custom/plugins/*.lua` - Neogit, lazygit, toggleterm,
auto-session, oil.nvim, etc.) are all written as lazy.nvim plugin specs wired in via
`require 'custom.plugins.<name>'`. A rebase onto current upstream would conflict heavily on
`init.lua` and would require rewriting every custom plugin file for `vim.pack.add {...}`
instead of lazy.nvim, on top of resolving the rest of the diff (mini.icons swap, conform
format-on-save whitelist change, treesitter attach refactor, etc.).

Decision: skip the rebase for now. The risk/effort of migrating plugin managers doesn't
have clear payoff at this point - nothing in the upstream diff is something this config is
currently missing. Revisit if:

- lazy.nvim becomes unmaintained or breaks on a newer Neovim,
- there's a specific upstream feature/fix worth cherry-picking on its own, or
- there's spare time to do the `vim.pack` migration as a deliberate project rather than a
  side effect of a routine rebase.
