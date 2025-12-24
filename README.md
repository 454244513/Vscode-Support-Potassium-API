# Potassium API

A Visual Studio Code extension that provides IntelliSense support for the Potassium executor API in Lua/Luau development.

## Features

- Auto-completion for Potassium API functions and classes
- Hover documentation for API methods
- Type definitions for better code intelligence
- Support for both `.lua` and `.luau` files

## Build Requirements

- Node.js (v16 or higher)
- npm or yarn
- TypeScript

## Building

1. Install dependencies:
```bash
npm install
```

2. Compile TypeScript:
```bash
npm run compile
```

3. Package the extension:
```bash
npx vsce package
```

This will generate a `.vsix` file that can be installed in VS Code.

## Installation

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Click the "..." menu and select "Install from VSIX..."
4. Select the generated `.vsix` file

## Development

For development with auto-compilation:
```bash
npm run watch
```

## License

MIT
