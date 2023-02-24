import fs from 'fs';
import path from 'path';
import { CompilerContext } from "../context";
import { resolveDescriptors } from "../types/resolveDescriptors";
import { resolveAllocations } from "../storage/resolveAllocation";
import { openContext } from "../grammar/store";
import { resolveStatements } from "../types/resolveStatements";
import { parseImports } from "../grammar/grammar";
import { resolveStrings } from "../types/resolveStrings";
import { resolveSignatures } from '../types/resolveSignatures';

function resolveLibraryPath(filePath: string, name: string): string {

    // Checked collection
    let checked: string[] = [];

    // Check stdlib
    if (name.startsWith('@stdlib/')) {
        let p = name.substring('@stdlib/'.length);
        let pp = path.resolve(__dirname, '..', 'stdlib', 'libs', p + '.tact')
        checked.push(pp);
        if (fs.existsSync(pp)) {
            return pp;
        } else {
            throw Error('Unable to process import ' + name + ' from ' + filePath + ', checked: ' + checked.join(', '));
        }
    }

    // Check relative path
    let t = name;
    if (!t.endsWith('.tact') && !t.endsWith('.fc')) {
        t = t + '.tact';
    }
    let targetPath = path.resolve(filePath, '..', t);
    checked.push(targetPath);
    if (fs.existsSync(targetPath)) {
        return targetPath;
    }

    throw Error('Unable to process import ' + name + ' from ' + filePath + ', checked: ' + checked.join(', '));
}

export function precompile(ctx: CompilerContext, root: string, sourceFile: string) {

    // Load stdlib
    const stdlibPath = path.resolve(__dirname, '../stdlib/stdlib.tact');
    const stdlib = fs.readFileSync(stdlibPath, 'utf-8');
    const codePath = path.resolve(root, sourceFile);
    const code = fs.readFileSync(codePath, 'utf8');

    //
    // Process imports
    // 

    const imported: { code: string, path: string }[] = [];
    const processed = new Set<string>();
    const funcImports: string[] = [];
    const pending: string[] = [];
    function processImports(path: string, source: string) {
        let imp = parseImports(source, path);
        for (let i of imp) {
            let resolved = resolveLibraryPath(path, i);
            if (resolved.endsWith('.fc')) {
                if (funcImports.find((v) => v === resolved)) {
                    continue;
                }
                funcImports.push(resolved);
            } else {
                if (!processed.has(resolved)) {
                    processed.add(resolved);
                    pending.push(resolved);
                }
            }
        }
    }
    processImports(path.resolve(__dirname, '..', 'stdlib', 'stdlib.tact'), stdlib);
    processImports(codePath, code);
    while (pending.length > 0) {
        let p = pending.shift()!;
        let librarySource = fs.readFileSync(p, 'utf8');
        imported.push({ code: librarySource, path: p });
        processImports(p, librarySource);
    }

    // Load func
    let fc: string[] = [];
    for (let i of funcImports) {
        fc.push(fs.readFileSync(i, 'utf8'));
    }

    // Perform initial compiler steps
    ctx = openContext(ctx, [{ code: stdlib, path: stdlibPath }, ...imported, { code, path: codePath }], fc);
    ctx = resolveDescriptors(ctx);
    ctx = resolveSignatures(ctx);
    ctx = resolveAllocations(ctx);
    ctx = resolveStrings(ctx);
    ctx = resolveStatements(ctx);

    // Prepared context
    return ctx;
}