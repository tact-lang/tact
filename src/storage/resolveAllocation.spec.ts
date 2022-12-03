import fs from 'fs';
import { CompilerContext } from '../ast/context';
import { resolveExpressionTypes } from '../types/resolveExpressionType';
import { getAllTypes, resolveTypeDescriptors } from '../types/resolveTypeDescriptors';
import { getAllocations, resolveAllocations } from './resolveAllocation';

const stdlib = fs.readFileSync(__dirname + '/../../stdlib/stdlib.tact', 'utf-8');
const src = `

struct Point3 {
    a: Point;
    b: Point2;
}

struct Point {
    x: Int;
    y: Int;
}

struct Point2 {
    z: Point;
}

contract Sample {
    public fun main(a: Int, b: Int) {
    }
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