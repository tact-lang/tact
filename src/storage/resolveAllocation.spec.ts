import fs from 'fs';
import { __DANGER_resetNodeId } from '../grammar/ast';
import { resolveDescriptors } from '../types/resolveDescriptors';
import { getAllocations, resolveAllocations } from './resolveAllocation';
import { openContext } from '../grammar/store';
import { resolveStatements } from '../types/resolveStatements';

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
    beforeEach(() => {
        __DANGER_resetNodeId();
    });
    it('should write program', () => {
        let ctx = openContext([stdlib, src]);
        ctx = resolveDescriptors(ctx);
        ctx = resolveStatements(ctx);
        ctx = resolveAllocations(ctx);
        expect(getAllocations(ctx)).toMatchSnapshot();
    });
});