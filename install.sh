#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.claude/skills

ln -sf "$SCRIPT_DIR/claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$SCRIPT_DIR/claude/settings.json" ~/.claude/settings.json
ln -sf "$SCRIPT_DIR/claude/rules" ~/.claude/rules

# Symlink each skill individually (not the whole directory).
# This lets multiple repos (personal, company) contribute skills to ~/.claude/skills/.
for skill_dir in "$SCRIPT_DIR"/claude/skills/*/; do
    skill_name=$(basename "$skill_dir")
    ln -sf "$skill_dir" ~/.claude/skills/"$skill_name"
done

echo "Done. Symlinks created in ~/.claude/"
echo ""
echo "  ~/.claude/CLAUDE.md     -> claude/CLAUDE.md"
echo "  ~/.claude/settings.json -> claude/settings.json"
echo "  ~/.claude/rules/        -> claude/rules/"
for skill_dir in "$SCRIPT_DIR"/claude/skills/*/; do
    skill_name=$(basename "$skill_dir")
    echo "  ~/.claude/skills/$skill_name/ -> claude/skills/$skill_name/"
done
echo ""
echo "Start a new Claude Code session to pick up the changes."
