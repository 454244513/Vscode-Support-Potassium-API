# Potassium API

A Visual Studio Code extension that provides IntelliSense support for the Potassium executor API in Lua/Luau development.

## Features

- **Auto-completion** for Potassium API functions and classes
- **Hover documentation** with detailed function descriptions
- **Type definitions** for better code analysis
- **Global variables** recognition for Roblox and Potassium environments

## Build Requirements

- **Node.js** (v16 or higher)
- **npm** (comes with Node.js)
- **TypeScript** (installed as dev dependency)
- **Visual Studio Code** (for testing)

## Building the Extension

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd potassium-api
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Compile TypeScript**
   ```bash
   npm run compile
   ```

4. **Package the extension** (optional)
   ```bash
   npx vsce package
   ```
   This creates a `.vsix` file that can be installed in VS Code.

## Development

- **Watch mode**: `npm run watch` - Automatically recompiles on file changes
- **Test in VS Code**: Press `F5` to launch a new Extension Development Host window

## Installation

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Click "Install from VSIX..." 
4. Select the generated `.vsix` file

The extension will automatically activate when you open Lua/Luau files and provide IntelliSense for Potassium API functions.