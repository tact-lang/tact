import { CompilerContext } from "./context";
import fs from 'fs';
import { resolveDescriptors } from "./types/resolveDescriptors";
import { writeProgram } from "./generator/writeProgram";
import { resolveAllocations } from "./storage/resolveAllocation";
import { createABI } from "./generator/createABI";
import { openContext } from "./grammar/store";
import { resolveStatements } from "./types/resolveStatements";
import { resolvePackaging } from "./types/resolvePackaging";
import { parseImports } from "./grammar/grammar";

function loadLibrary(path: string, name: string) {

    // Check stdlib
    if (name.startsWith('@stdlib/')) {
        let p = name.substring('@stdlib/'.length);
        if (fs.existsSync(__dirname + '/../stdlib/' + p + '.tact')) {
            return fs.readFileSync(__dirname + '/../stdlib/' + p + '.tact', 'utf-8');
        } else {
            console.warn(__dirname + '/../stdlib/' + p + '.tact');
            throw new Error('Cannot find stdlib module ' + name);
        }
    }

    throw new Error('Cannot find module ' + name);
}

export function precompile(path: string) {

    // Load stdlib
    const stdlib = fs.readFileSync(__dirname + '/../stdlib/stdlib.tact', 'utf-8');
    const code = fs.readFileSync(path, 'utf8');
    const imported: string[] = [];
    let processed = new Set<string>();
    let pending: string[] = parseImports(code);
    while (pending.length > 0) {

        // Pick next
        let p = pending.shift()!;
        if (processed.has(p)) {
            continue;
        }

        // Load library
        let loaded = loadLibrary(path, p);
        imported.push(loaded);
        processed.add(p);

        // Add imports
        pending = [...pending, ...parseImports(loaded)];
    }

    // Perform initial compiler steps
    let ctx = openContext([stdlib, ...imported, code]);
    ctx = resolveDescriptors(ctx);
    ctx = resolveAllocations(ctx);
    ctx = resolveStatements(ctx);
    ctx = resolvePackaging(ctx);

    // Prepared context
    return ctx;
}

export function compile(ctx: CompilerContext) {
    let abi = createABI(ctx);
    let output = writeProgram(ctx, abi);
    let cOutput = output;
    return { output: cOutput, ctx };
}