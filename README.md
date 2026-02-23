# Ralph Wiggum

A feature-driven coding agent using Test-Driven Development (TDD).

## Overview

Ralph Wiggum automates software development by implementing features one at a time using TDD methodology. It reads feature requirements from `specs/features.md`, creates separate git worktrees for each feature, and follows the RED/GREEN/REFACTOR cycle.

## How It Works

1. **Feature Discovery** - Reads features dynamically from `specs/features.md`
2. **Worktree Management** - Creates separate git worktrees for each feature
3. **TDD Cycle** - Implements features using test-first approach:
   - RED: Write tests that fail
   - GREEN: Make tests pass
   - REFACTOR: Improve code quality
4. **Feature Completion** - Merges completed features back to main branch

## Project Structure

```
.
├── ralph-wiggum          # Main CLI script
├── ralph-wiggum.md       # Agent specification
├── run-ralph-wiggum.sh   # Docker runner script
└── install.sh           # Installation script
```

## Usage

### Initialization

```bash
./ralph-wiggum init
```

Converts the current repository to a bare repo with worktrees, creating a `main/` worktree.

### Running the Agent

```bash
./ralph-wiggum 5                 # Run 5 iterations (default: Claude)
./ralph-wiggum --rebuild         # Rebuild Claude Docker image
./ralph-wiggum --opencode        # Use Opencode instead of Claude
./ralph-wiggum --build-opencode  # Build Opencode Docker image
```

### Feature Workflow

1. Agent reads `specs/features.md` to discover features
2. Creates feature branch and worktree
3. Implements feature using TDD
4. On completion, merges to main and cleans up worktree

## Installation

```bash
./install.sh
```

This installs:
- `$HOME/.config/ralph-wiggum/` - Configuration files and Docker config
- `$HOME/.local/bin/ralph-wiggum` - CLI script

**Credentials:**
- Claude: Place your Claude credentials in `$HOME/.config/ralph-wiggum/.claude-for-linux/`
- Opencode: Place your opencode `config.json` in `$HOME/.config/ralph-wiggum/.opencode/`

Make sure `$HOME/.local/bin` is in your PATH:
```bash
export PATH="$HOME/.local/bin:$PATH"
```

## Requirements

- Docker
- Git
- A repository with `specs/features.md` file

## Agent Behavior

The agent executes one task per session, always commits changes, then exits. Tasks are tracked in `.ralph-wiggum/progress.md`.

### Task Types

- `*-test-*.md` - RED: Write failing tests
- `*-implement-*.md` - GREEN: Make tests pass
- `*-review-*.md` - REFACTOR: Improve code quality
- `*-feature-perfection-review.md` - Feature completion check
