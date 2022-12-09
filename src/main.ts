import { CompilerContext } from "./context";
import fs from 'fs';
import { resolveDescriptors } from "./types/resolveDescriptors";
import { writeProgram } from "./generator/writeProgram";
import { resolveAllocations } from "./storage/resolveAllocation";
import { createABI } from "./generator/createABI";
import { openContext } from "./grammar/store";
import { resolveStatements } from "./types/resolveStatements";

const stdlib = fs.readFileSync(__dirname + '/../stdlib/stdlib.tact', 'utf-8');

export function precompile(src: string) {
    let ctx = openContext([stdlib, src]);
    ctx = resolveDescriptors(ctx);
    ctx = resolveStatements(ctx);
    ctx = resolveAllocations(ctx);
    return ctx;
}

export function compile(ctx: CompilerContext) {
    let abi = createABI(ctx);
    let output = writeProgram(ctx, abi);
    let cOutput = output;
    return { output: cOutput, ctx };
}