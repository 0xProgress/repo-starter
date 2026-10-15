#!/bin/bash
set -e

# ==============================================================================
# bob.sh - Universal project setup and preparation script
# ==============================================================================

if [ "$1" == "--setup" ]; then
    echo "🛠️  Starting project setup..."

    read -p "Enter project name: " PROJECT_NAME
    read -p "Enter project description: " PROJECT_DESC

    echo ""
    echo "📋 Planned changes:"
    echo "  - Update README.md title to: $PROJECT_NAME"
    echo "  - Update README.md description to: $PROJECT_DESC"
    echo "  - Set 'template': false in bob.config.json"
    echo ""

    read -p "Apply these changes? (y/N): " CONFIRM
    if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
        echo "❌ Setup aborted."
        exit 0
    fi

    # Update README.md (using sed, safe for macOS and Linux)
    if [[ "$OSTYPE" == "darwin"* ]]; then
        sed -i '' "s/# \[Project Name\]/# $PROJECT_NAME/" README.md
        sed -i '' "s/> A short, accurate description.../> $PROJECT_DESC/" README.md
    else
        sed -i "s/# \[Project Name\]/# $PROJECT_NAME/" README.md
        sed -i "s/> A short, accurate description.../> $PROJECT_DESC/" README.md
    fi

    # Update bob.config.json
    cat > bob.config.json << EOF
{
  "template": false,
  "project": "$PROJECT_NAME",
  "status": "in-development"
}
EOF

    echo "✅ Setup complete. You can now start coding in the src/ directory."

elif [ "$1" == "--prep" ]; then
    FORCE=0
    if [ "$2" == "-y" ]; then FORCE=1; fi

    echo "📦 Starting end-user preparation..."

    # Verify we are in the right place
    if [ ! -f "README.md" ] || [ ! -d "src" ]; then
        echo "❌ Error: Must be run from repository root containing README.md and src/"
        exit 1
    fi

    # Check for conflicts
    CONFLICTS=0
    for file in src/* src/.*; do
        base=$(basename "$file")
        if [ "$base" = "." ] || [ "$base" = ".." ] || [ "$base" = ".gitkeep" ]; then continue; fi
        if [ -e "$file" ] && [ -e "$base" ] && [ "$base" != "README.md" ]; then
            echo "⚠️  Conflict: src/$base would overwrite existing root file: $base"
            CONFLICTS=1
        fi
    done

    if [ "$CONFLICTS" -eq 1 ]; then
        echo "❌ Stopping safely due to file conflicts. Resolve manually before running --prep."
        exit 1
    fi

    echo ""
    echo "📋 Planned changes:"
    echo "  - Delete: .github/, docs/, LICENSE, .gitignore, bob.sh, bob.config.json"
    echo "  - Move: All contents of src/ to repository root"
    echo "  - Delete: src/ directory"
    echo ""

    if [ "$FORCE" -eq 0 ]; then
        read -p "Apply these changes? (y/N): " CONFIRM
        if [ "$CONFIRM" != "y" ] && [ "$CONFIRM" != "Y" ]; then
            echo "❌ Preparation aborted."
            exit 0
        fi
    fi

    # Execute preparation
    rm -rf .github docs LICENSE .gitignore bob.sh bob.config.json

    # Move files from src/ to root
    for file in src/* src/.*; do
        base=$(basename "$file")
        if [ "$base" = "." ] || [ "$base" = ".." ] || [ "$base" = ".gitkeep" ]; then continue; fi
        if [ -e "$file" ]; then
            mv "$file" .
        fi
    done

    # Remove empty src directory
    rmdir src

    echo "✅ Preparation complete. Project is flattened and ready for end-users."

else
    echo "Usage:"
    echo "  ./bob.sh --setup       Customize template for a new project (developer)"
    echo "  ./bob.sh --prep [-y]   Strip scaffolding and flatten project (end-user)"
    exit 1
fi
