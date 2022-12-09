import { __DANGER_resetNodeId } from "../../grammar/ast";
import { openContext } from "../../grammar/store";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { WriterContext } from "../Writer";
import { resolveFuncTensor } from "./resolveFuncTensor";

const code = `
primitive Int;
primitive Bool;
primitive Builder;
primitive Cell;
primitive Slice;

struct Struct1 {
    f1: Int;
    f2: Int;
}

struct Struct2 {

}

contract Contract1 {

}

contract Contract2 {

}
`;

describe('resolveFuncTensor', () => {
    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    it('should resolve tensor from primitive types', () => {
        let ctx = openContext([code]);
        ctx = resolveDescriptors(ctx);
        let wctx = new WriterContext(ctx);
        expect(resolveFuncTensor([{
            name: 'a',
            type: {
                kind: 'ref',
                name: 'Int',
                optional: false
            }
        }, {
            name: 'b',
            type: {
                kind: 'ref',
                name: 'Bool',
                optional: true
            }
        }, {
            name: 'cde',
            type: {
                kind: 'ref',
                name: 'Slice',
                optional: true
            }
        }, {
            name: 'cde2',
            type: {
                kind: 'ref',
                name: 'Builder',
                optional: false
            }
        }], wctx)).toEqual([{
            name: 'a',
            type: 'int'
        }, {
            name: 'b',
            type: 'int'
        }, {
            name: 'cde',
            type: 'slice'
        }, {
            name: 'cde2',
            type: 'builder'
        }]);
    });

    it('should resolve tensor with struct types', () => {
        let ctx = openContext([code]);
        ctx = resolveDescriptors(ctx);
        let wctx = new WriterContext(ctx);
        expect(resolveFuncTensor([{
            name: 'a',
            type: {
                kind: 'ref',
                name: 'Int',
                optional: false
            }
        }, {
            name: 'b',
            type: {
                kind: 'ref',
                name: 'Struct1',
                optional: true
            }
        }], wctx)).toEqual([{
            name: 'a',
            type: 'int'
        }, {
            name: `b'f1`,
            type: 'int'
        }, {
            name: `b'f2`,
            type: 'int'
        }]);
    });
});