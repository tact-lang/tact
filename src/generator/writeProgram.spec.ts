import fs from 'fs';
import { CompilerContext } from '../ast/context';
import { resolveExpressionTypes } from '../types/resolveExpressionType';
import { getAllTypes, resolveTypeDescriptors } from '../types/resolveTypeDescriptors';
import { writeProgram } from './writeProgram';

const stdlib = fs.readFileSync(__dirname + '/../../stdlib/stdlib.tact', 'utf-8');
const src = `
struct Point {
    var x: Int;
    var y: Int;
}

fun improve(p: Point): Int {
    return p.x + p.y;
}

fun hello_world(a: Int, b: Int, p: Point): Int {
    let c: Int = a + 1;
    c = c + 1;
    return a + b + improve(p);
}
`;

describe('writeProgram', () => {
    it('should write program', () => {
        let ctx = CompilerContext.fromSources([stdlib, src]);
        ctx = resolveTypeDescriptors(ctx);
        ctx = resolveExpressionTypes(ctx);
        console.warn(getAllTypes(ctx));
        let output = writeProgram(ctx);
        console.warn(output);
    });
});