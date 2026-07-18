# Agent instructions for this repo

Personal fork of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Work happens
on the `my-config` branch, not `master` (which tracks upstream unmodified - don't merge
work into it). Launched via `NVIM_APPNAME="nvim-kickstart" nvim`, not the default
`~/.config/nvim` (see the alias in the `ubuntu-init` dotfiles repo's `home/.profile`).

## Adding or changing plugins

- Custom plugins live in `lua/custom/plugins/*.lua`, one file per plugin, each returning a
  lazy.nvim plugin spec.
- Every new file needs an explicit `require 'custom.plugins.<name>'` added to the plugin
  list near the bottom of `init.lua`, next to the other `require 'custom.plugins.*'` lines.
  Lazy.nvim does not auto-discover this directory here - the `{ import = 'custom.plugins' }`
  line is intentionally commented out.
- Prefer lazy-loading new keybinds with `keys = { { '<leader>x', ..., desc = '...' } }`
  (see `lazygit.lua`, `neogit.lua`) over eagerly loading a plugin at startup.
- `lazy-lock.json` is gitignored here - don't commit it, don't worry about it drifting.

## Validating changes

Before committing, check headlessly rather than assuming it works:

```sh
NVIM_APPNAME="nvim-kickstart" nvim --headless "+Lazy! sync" +qa
```

Confirms new plugins install and nothing errors during setup. Follow up with a targeted
`require('<plugin>')` pcall check if you touched something load-bearing.

## Git gotchas

- `core.autocrlf = true` is set globally (from the `ubuntu-init` dotfiles repo), so the
  local working copy has CRLF line endings, but what's committed/diffed is LF (stylua
  enforces `line_endings = "Unix"` in `.stylua.toml`, and `.github/workflows/stylua.yml`
  checks it on push). Never hand-construct a patch assuming plain LF or by copy-pasting
  diff text - blank context lines and CRLF make it easy to produce a "corrupt patch". Use
  `git diff`/`git apply --check` and edit the real patch file `git diff` produced instead.
- This repo tends to accumulate unrelated local edits between commits (debugger config
  tweaks, plugin experiments). Keep commits scoped to one logical change - stage only the
  hunks that belong (`git diff -- <file>` a specific hunk range, or a temp file plus
  `git apply --cached`) rather than sweeping up everything with `git add -A`.
