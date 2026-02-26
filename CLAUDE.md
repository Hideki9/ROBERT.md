# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal AI assistant configuration for Claude Code. Contains personality, coding philosophy, language-specific rules, and tool permissions — all symlinked into `~/.claude/` so every Claude Code session picks them up.

This is a dotfiles repo, not a software project. There is no build, test, or lint step.

## Install

```bash
./install.sh
```

Creates symlinks: `~/.claude/CLAUDE.md`, `~/.claude/settings.json`, `~/.claude/rules/` all point back here.

## Structure

- **`SOUL.md`** — Personality and communication style. Tool-agnostic (lives at root so any AI tool can find it). Also referenced as a global instruction by Claude Code via the user's `~/.claude/` setup.
- **`claude/CLAUDE.md`** — Global coding philosophy (symlinked to `~/.claude/CLAUDE.md`). Applies to all projects.
- **`claude/settings.json`** — Pre-approved permissions and env vars (symlinked to `~/.claude/settings.json`).
- **`claude/rules/`** — Language-specific coding standards, scoped via `paths:` frontmatter. Currently only `salesforce/coding-standards.md`. Each language gets its own subfolder.
- **`claude/skills/`** — Personal skills, symlinked individually into `~/.claude/skills/`. Company-wide skills live in the separate AQUIVA.md repo and are symlinked the same way.

## Layering Model

Claude Code merges context from three layers (all stack, nothing overrides):

1. **Personal** (this repo) — Who I am, how I code, language standards
2. **Company** (separate private repo) — Shared team skills and workflows
3. **Project** (each repo's own CLAUDE.md) — Domain model, project-specific context

When editing files here, remember: these instructions apply globally to every project. Keep them general. Project-specific rules belong in each project's own CLAUDE.md.

## Adding a New Language Rule

1. Create `claude/rules/<language>/` subfolder
2. Add a markdown file with `paths:` frontmatter scoping it to relevant file extensions
3. Follow the pattern in `claude/rules/salesforce/coding-standards.md`
