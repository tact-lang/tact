import { CompilerContext } from "./ast/context";
import fs from 'fs';
import { resolveTypeDescriptors } from "./types/resolveTypeDescriptors";
import { resolveExpressionTypes } from "./types/resolveExpressionType";
import { writeProgram } from "./generator/writeProgram";
import { resolveAllocations } from "./storage/resolveAllocation";
import { createABI } from "./generator/createABI";

const stdlib = fs.readFileSync(__dirname + '/../stdlib/stdlib.tact', 'utf-8');

export function precompile(src: string) {
    let ctx = CompilerContext.fromSources([stdlib, src]);
    ctx = resolveTypeDescriptors(ctx);
    ctx = resolveExpressionTypes(ctx);
    ctx = resolveAllocations(ctx);
    return ctx;
}

export function compile(ctx: CompilerContext) {
    let abi = createABI(ctx);
    let output = writeProgram(ctx, abi);
    let cOutput = output;
    return { output: cOutput, ctx };
}