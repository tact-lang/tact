
import fs from 'fs';
import { CompilerContext } from '../ast/context';
import { resolveExpressionTypes } from '../types/resolveExpressionType';
import { resolveTypeDescriptors } from '../types/resolveTypeDescriptors';
import { writeProgram } from './writeProgram';

const stdlib = fs.readFileSync(__dirname + '/../../stdlib/stdlib.tact', 'utf-8');
const src = `
struct Point {
    var x: Int;
    var y: Int;
}
fun hello_world(a: Int, b: Int, p: Point): Int {
    return a + b;
}
`;

describe('writeProgram', () => {
    it('should write program', () => {
        let ctx = CompilerContext.fromSources([stdlib, src]);
        ctx = resolveTypeDescriptors(ctx);
        ctx = resolveExpressionTypes(ctx);
        let output = writeProgram(ctx);
        console.warn(output);
    });
});