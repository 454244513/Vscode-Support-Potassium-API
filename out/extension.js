"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deactivate = exports.activate = void 0;
const vscode = require("vscode");
const fs = require("fs");
const path = require("path");
function loadDefinitions(targetPath) {
    if (!fs.existsSync(targetPath)) {
        console.log("File not found: " + targetPath);
        return [];
    }
    const rawData = fs.readFileSync(targetPath, "utf-8");
    const lines = rawData.split("\n");
    const items = [];
    let currentDoc = "";
    for (let i = 0; i < lines.length; i++) {
        const line = lines[i].trim();
        if (line.startsWith("---@meta") || line === "") {
            currentDoc = "";
            continue;
        }
        // Capture documentation comments
        if (line.startsWith("---") && !line.startsWith("---@")) {
            currentDoc = line.substring(3).trim();
            continue;
        }
        // Match function definitions
        const funcMatch = line.match(/function\s+([a-zA-Z0-9_.:]+)/);
        if (funcMatch) {
            const fullName = funcMatch[1];
            let displayName = fullName;
            if (fullName.includes(":") || fullName.includes(".")) {
                const parts = fullName.split(/[.:]/);
                displayName = parts[parts.length - 1];
            }
            items.push({
                name: displayName,
                kind: vscode.CompletionItemKind.Function,
                detail: "Potassium API: " + fullName,
                documentation: currentDoc
            });
            currentDoc = "";
            continue;
        }
        // Match class definitions
        if (line.includes("---@class")) {
            const className = line.split("---@class")[1]?.trim().split(" ")[0];
            if (className) {
                items.push({
                    name: className,
                    kind: vscode.CompletionItemKind.Class,
                    detail: "Potassium Type: " + className
                });
            }
            continue;
        }
        // Match variable assignments
        if (line.includes("=") && !line.startsWith("--")) {
            const varName = line.split("=")[0].trim();
            if (varName && !varName.includes(" ") && !varName.startsWith("---")) {
                items.push({
                    name: varName,
                    kind: vscode.CompletionItemKind.Variable,
                    detail: "Potassium Global"
                });
            }
        }
    }
    return items;
}
function activate(context) {
    const extPath = context.extensionPath;
    const libPaths = [
        path.join(extPath, "api.d.lua"),
        path.join(extPath, "globals.d.lua")
    ];
    const predefinedGlobals = [
        "game", "Game", "workspace", "Workspace", "Players",
        "Camera", "script", "shared", "_G", "getgenv", "getrenv",
        "cache", "crypt", "debug", "Drawing", "WebSocket"
    ];
    // Configure Lua language server
    const luaConfig = vscode.workspace.getConfiguration("Lua");
    luaConfig.update("workspace.library", libPaths, vscode.ConfigurationTarget.Global);
    luaConfig.update("diagnostics.globals", predefinedGlobals, vscode.ConfigurationTarget.Global);
    // Create .luarc.json in workspace if available
    const workspaceFolders = vscode.workspace.workspaceFolders;
    if (workspaceFolders && workspaceFolders.length > 0) {
        const workspacePath = workspaceFolders[0].uri.fsPath;
        const luarcPath = path.join(workspacePath, ".luarc.json");
        const luarcConfig = {
            "diagnostics.globals": predefinedGlobals,
            "workspace.library": libPaths
        };
        try {
            fs.writeFileSync(luarcPath, JSON.stringify(luarcConfig, null, 4), "utf-8");
            console.log("Created .luarc.json at workspace root");
        }
        catch (e) {
            console.log("Could not create .luarc.json: " + e);
        }
    }
    // Load completions
    const completions = [];
    function reloadCompletions() {
        completions.length = 0;
        completions.push(...loadDefinitions(path.join(extPath, "api.d.lua")));
        completions.push(...loadDefinitions(path.join(extPath, "globals.d.lua")));
    }
    reloadCompletions();
    // Register completion provider
    const provider = vscode.languages.registerCompletionItemProvider([{ scheme: "file", language: "lua" }, { scheme: "file", language: "luau" }], {
        provideCompletionItems(document, position) {
            const linePrefix = document.lineAt(position).text.substring(0, position.character);
            return completions.map(m => {
                const item = new vscode.CompletionItem(m.name, m.kind);
                item.detail = m.detail;
                if (m.documentation) {
                    item.documentation = new vscode.MarkdownString(m.documentation);
                }
                return item;
            });
        }
    }, ".", ":");
    context.subscriptions.push(provider);
    // Register hover provider
    const hover = vscode.languages.registerHoverProvider(["lua", "luau"], {
        provideHover(document, position) {
            const range = document.getWordRangeAtPosition(position);
            if (!range)
                return;
            const word = document.getText(range);
            const found = completions.find(c => c.name === word);
            if (!found)
                return;
            const md = new vscode.MarkdownString();
            md.appendMarkdown(`**${found.detail}**\n\n`);
            if (found.documentation) {
                md.appendMarkdown(found.documentation + "\n\n");
            }
            md.appendCodeblock(found.name, "lua");
            return new vscode.Hover(md);
        }
    });
    context.subscriptions.push(hover);
    console.log("Potassium IntelliSense activated!");
}
exports.activate = activate;
function deactivate() {
    console.log("Potassium IntelliSense deactivated.");
}
exports.deactivate = deactivate;
//# sourceMappingURL=extension.js.map