import fs from 'fs';
import { CompilerContext } from '../ast/context';
import { resolveExpressionTypes } from '../types/resolveExpressionType';
import { getAllTypes, resolveTypeDescriptors } from '../types/resolveTypeDescriptors';
import { getAllocations, resolveAllocations } from './resolveAllocation';

const stdlib = fs.readFileSync(__dirname + '/../../stdlib/stdlib.tact', 'utf-8');
const src = `

struct Point3 {
    var a: Point;
    var b: Point2;
}

struct Point {
    var x: Int;
    var y: Int;
}

struct Point2 {
    var z: Point;
}
`;

describe('resolveAllocation', () => {
    it('should write program', () => {
        let ctx = CompilerContext.fromSources([stdlib, src]);
        ctx = resolveTypeDescriptors(ctx);
        ctx = resolveExpressionTypes(ctx);
        ctx = resolveAllocations(ctx);
        expect(getAllocations(ctx)).toMatchSnapshot();
    });
});