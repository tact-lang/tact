import { CompilerContext } from "./ast/context";
import fs from 'fs';
import { resolveTypeDescriptors } from "./types/resolveTypeDescriptors";
import { resolveExpressionTypes } from "./types/resolveExpressionType";
import { writeProgram } from "./generator/writeProgram";

const stdlib = fs.readFileSync(__dirname + '/../stdlib/stdlib.tact', 'utf-8');
const funcstdlib = fs.readFileSync(__dirname + '/../stdlib/stdlib.fc', 'utf-8');

export function compile(src: string) {
    let ctx = CompilerContext.fromSources([stdlib, src]);
    ctx = resolveTypeDescriptors(ctx);
    ctx = resolveExpressionTypes(ctx);
    let output = writeProgram(ctx);
    let cOutput = funcstdlib + '\n' + output;
    return cOutput;
}