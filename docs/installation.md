# Installation Guide

This guide covers everything you need to get [Project Name] running on your system.

<!--
  GUIDE: Structure installation docs in this order:
  1. Prerequisites (what they need before installing)
  2. Installation methods (multiple options if applicable)
  3. Verification (how to confirm it worked)
  4. Troubleshooting (common issues)
-->

## Prerequisites

Before installing, ensure you have:

- **[Requirement 1]** - Version X.X or higher
  <!-- EXAMPLE: **Node.js** - Version 18.0 or higher -->
- **[Requirement 2]** - Version X.X or higher
  <!-- EXAMPLE: **Git** - Any recent version -->
- **[Requirement 3]** - (Optional, if needed)
  <!-- EXAMPLE: **Docker** - Only if using containerized setup -->

### Check Your Versions

```bash
# Example version checks
node --version    # Should be v18.0.0 or higher
git --version     # Should be 2.30.0 or higher
```

---

## Installation Methods

### Method 1: From Source (Recommended)

Best for developers who want the latest features or plan to contribute.

```bash
# Clone the repository
git clone https://github.com/0xProgress/[project-name].git
cd [project-name]

# Install dependencies
npm install
# or: pip install -r requirements.txt
# or: go build -o bin/[project-name]

# Verify installation
npm run test
# or: pytest
# or: go test ./...
```

<!--
  GUIDE: Provide the exact commands for your project.
  Include verification steps so users know it worked.
-->

### Method 2: Package Manager

If available via a package manager:

```bash
# npm (Node.js projects)
npm install -g [project-name]

# pip (Python projects)
pip install [project-name]

# Homebrew (macOS)
brew install [project-name]

# APT (Debian/Ubuntu)
sudo apt install [project-name]
```

<!--
  GUIDE: Remove methods that don't apply to your project.
  Only include this section if you actually publish to package managers.
-->

### Method 3: Pre-built Binaries

For users who just want to run it without building:

1. Go to the [Releases page](https://github.com/0xProgress/[project-name]/releases)
2. Download the appropriate binary for your system:
   - `linux-amd64` - Linux 64-bit
   - `darwin-amd64` - macOS Intel
   - `darwin-arm64` - macOS Apple Silicon
   - `windows-amd64.exe` - Windows 64-bit

3. Make it executable (Linux/macOS):

   ```bash
   chmod +x [project-name]
   sudo mv [project-name] /usr/local/bin/
   ```

4. Verify it works:
   ```bash
   [project-name] --version
   ```

<!--
  GUIDE: Only include this if you actually build and publish binaries.
  Update the platform list to match your actual releases.
-->

### Method 4: Docker

For containerized environments:

```bash
# Pull the image
docker pull 0xprogress/[project-name]:latest

# Run it
docker run -it 0xprogress/[project-name]:latest

# Or with volume mounts
docker run -it -v $(pwd)/data:/app/data 0xprogress/[project-name]:latest
```

<!--
  GUIDE: Only include if you publish Docker images.
  Update the image name and add any necessary volume/environment configs.
-->

---

## Verification

After installation, verify everything is working:

```bash
# Run the version check
[project-name] --version

# Expected output:
# [project-name] v1.0.0

# Run a simple test
[project-name] hello

# Expected output:
# Hello, World!
```

<!--
  GUIDE: Provide 2-3 quick commands that prove the installation worked.
  Show the expected output so users can compare.
-->

### Visual Verification

<!--
  IMAGE PLACEHOLDER:
  Add a screenshot showing the expected output or UI after successful installation.

  Example:
  ![Installation Success](images/installation-success.png)

  Guidelines for images:
  - Save images in docs/images folder
  - Use descriptive filenames: installation-success.png, ui-overview.png
  - Keep images under 500KB when possible
  - Add alt text for accessibility
-->

---

## Troubleshooting

### Issue: Command not found

**Symptom:**

```bash
bash: [project-name]: command not found
```

**Solution:**

1. Ensure the binary is in your PATH:
   ```bash
   echo $PATH
   ```
2. If installed via source, add to PATH:
   ```bash
   export PATH="$PATH:/path/to/[project-name]/bin"
   ```
3. Or create a symlink:
   ```bash
   sudo ln -s /path/to/[project-name] /usr/local/bin/[project-name]
   ```

### Issue: Permission denied

**Symptom:**

```bash
Permission denied: '[project-name]'
```

**Solution:**

```bash
# Make the binary executable
chmod +x [project-name]

# Or run with sudo (not recommended for regular use)
sudo ./[project-name]
```

### Issue: Dependency conflicts

**Symptom:**

```bash
Error: Cannot find module 'xyz'
```

**Solution:**

```bash
# Clear cache and reinstall
rm -rf node_modules package-lock.json
npm install

# Or for Python
rm -rf venv
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

<!--
  GUIDE: Add 3-5 common issues users might encounter.
  For each issue, provide:
  - The exact error message
  - The most likely cause
  - Step-by-step solution
-->

---

## Next Steps

Now that you have [Project Name] installed:

1. 📖 Read the [Usage Guide](usage.md) to learn how to use it
2. 🏗️ Check the [Architecture](architecture.md) to understand how it works
3. 🎯 Try the [Quick Start examples](index.md#quick-start)

---

_Still having issues? [Open a support ticket](https://github.com/0xProgress/[project-name]/issues)_
