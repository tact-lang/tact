import { CompilerContext } from "./ast/context";
import fs from 'fs';
import { resolveTypeDescriptors } from "./types/resolveTypeDescriptors";
import { resolveExpressionTypes } from "./types/resolveExpressionType";
import { writeProgram } from "./generator/writeProgram";
import { resolveAllocations } from "./storage/resolveAllocation";

const stdlib = fs.readFileSync(__dirname + '/../stdlib/stdlib.tact', 'utf-8');

export function compile(src: string) {
    let ctx = CompilerContext.fromSources([stdlib, src]);
    ctx = resolveTypeDescriptors(ctx);
    ctx = resolveExpressionTypes(ctx);
    ctx = resolveAllocations(ctx);
    let output = writeProgram(ctx);
    let cOutput = output;
    return cOutput;
}