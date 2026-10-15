# Usage Guide

Learn how to use [Project Name] effectively with these examples and guides.

<!--
  GUIDE: Structure usage docs as:
  1. Basic usage (most common use cases)
  2. Command reference (if CLI tool)
  3. Configuration options
  4. Advanced features
  5. Examples / Recipes
-->

## Basic Usage

### First Run

```bash
# Basic command
[project-name] [command] [options]

# Example:
[project-name] start --config config.yaml
```

<!--
  GUIDE: Show the most basic, common usage first.
  Keep it simple - just 1-2 commands to get started.
-->

### Common Commands

```bash
# Start the application
[project-name] start

# Stop the application
[project-name] stop

# Check status
[project-name] status

# View logs
[project-name] logs --tail 100
```

<!--
  IMAGE PLACEHOLDER:
  Add a screenshot or diagram showing the basic workflow.

  Example:
  ![Basic Workflow](images/basic-workflow.png)

  Or use a Mermaid diagram:
  ```mermaid
  graph LR
      A[Start] → B[Configure]

      B → C[Run]
      C → D[Monitor]
  ```
-->

---

## Command Reference

### `start` - Start the application

```bash
[project-name] start [options]
```

**Options:**

| Flag            | Description            | Default       |
| --------------- | ---------------------- | ------------- |
| `--config, -c`  | Path to config file    | `config.yaml` |
| `--port, -p`    | Port to listen on      | `8080`        |
| `--verbose, -v` | Enable verbose logging | `false`       |
| `--daemon, -d`  | Run in background      | `false`       |

**Examples:**

```bash
# Start with default settings
[project-name] start

# Start on custom port
[project-name] start --port 3000

# Start with custom config
[project-name] start --config /path/to/config.yaml

# Start in background
[project-name] start --daemon
```

### `stop` - Stop the application

```bash
[project-name] stop [options]
```

**Options:**

| Flag             | Description                   | Default |
| ---------------- | ----------------------------- | ------- |
| `--force, -f`    | Force stop (kill process)     | `false` |
| `--graceful, -g` | Wait for connections to close | `true`  |

**Examples:**

```bash
# Graceful stop (default)
[project-name] stop

# Force stop
[project-name] stop --force
```

<!--
  GUIDE: Document each command with:
  - Syntax
  - All available options in a table
  - 2-3 practical examples
  Repeat this pattern for all commands.
-->

---

## Configuration

### Configuration File

[Project Name] uses a YAML configuration file. Default location: `config.yaml`

```yaml
# config.yaml

# Application settings
app:
  name: "[project-name]"
  version: "1.0.0"
  environment: "production" # development | staging | production

# Server settings
server:
  host: "0.0.0.0"
  port: 8080
  timeout: 30s

# Database settings (if applicable)
database:
  host: "localhost"
  port: 5432
  name: "mydb"
  user: "admin"
  password: "${DB_PASSWORD}" # Use environment variables

# Logging
logging:
  level: "info" # debug | info | warn | error
  format: "json" # json | text
  output: "stdout" # stdout | file

# Feature flags
features:
  enable_cache: true
  enable_metrics: true
  enable_tracing: false
```

<!--
  GUIDE: Provide a complete example config file with:
  - All available options
  - Comments explaining each section
  - Sensible defaults
  - Environment variable examples
-->

### Environment Variables

You can override config values with environment variables:

```bash
# Prefix with APP_ and use uppercase
export APP_SERVER_PORT=3000
export APP_DATABASE_HOST=db.example.com
export APP_DATABASE_PASSWORD=secret123

# Or use a .env file
echo "APP_SERVER_PORT=3000" > .env
```

**Variable Mapping:**

| Config Key          | Environment Variable    |
| ------------------- | ----------------------- |
| `server.port`       | `APP_SERVER_PORT`       |
| `database.host`     | `APP_DATABASE_HOST`     |
| `database.password` | `APP_DATABASE_PASSWORD` |
| `logging.level`     | `APP_LOGGING_LEVEL`     |

---

## Advanced Features

### Feature 1: [Name]

<!--
  GUIDE: Document each advanced feature with:
  - What it does
  - When to use it
  - How to enable/configure it
  - Example usage
-->

**What it does:**
[Brief description of the feature]

**When to use it:**
[Explain the use case]

**How to enable:**

```bash
# Enable via flag
[project-name] start --enable-[feature]

# Or via config
# config.yaml
features:
  [feature]: true
```

**Example:**

```bash
# Full example showing the feature in action
[project-name] start --enable-[feature] --config custom.yaml
```

### Feature 2: [Name]

<!-- Repeat the pattern above for each advanced feature -->

---

## Examples & Recipes

### Example 1: [Common Use Case]

**Scenario:** [Describe what the user wants to accomplish]

**Solution:**

```bash
# Step 1: [Action]
[command]

# Step 2: [Action]
[command]

# Step 3: [Action]
[command]
```

**Expected Result:**

```
[Show what the output should look like]
```

<!--
  IMAGE PLACEHOLDER:
  If applicable, add a screenshot showing the result.

  ![Example 1 Result](images/example-1-result.png)
-->

### Example 2: [Another Use Case]

**Scenario:** [Describe the scenario]

**Solution:**

```bash
# Commands here
[command]
```

<!--
  GUIDE: Provide 3-5 practical, real-world examples.
  Each example should solve a specific problem users commonly face.
-->

---

## Tips & Best Practices

### Performance

```bash
# Enable caching for better performance
[project-name] start --enable-cache

# Increase worker threads
[project-name] start --workers 8
```

### Debugging

```bash
# Enable verbose logging
[project-name] start --verbose

# Enable debug mode
[project-name] start --debug

# View detailed logs
[project-name] logs --level debug
```

### Security

```bash
# Use environment variables for secrets
export APP_SECRET_KEY=$(openssl rand -hex 32)
[project-name] start

# Enable TLS
[project-name] start --tls --cert /path/to/cert.pem --key /path/to/key.pem
```

---

## Getting Help

- 📖 Check the [Installation Guide](installation.md) for setup issues
- 🐛 Found a bug? [Open an issue](https://github.com/0xProgress/[project-name]/issues)
- 💡 Have a question? Start a [discussion](https://github.com/0xProgress/[project-name]/discussions)
- 📧 Contact: progressuwhuseba@gmail.com

---

_Last updated: [Date]_
