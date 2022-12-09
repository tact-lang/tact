import { __DANGER_resetNodeId } from "../../grammar/ast";
import { resolveDescriptors } from "../../types/resolveDescriptors";
import { WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";
import { openContext } from "../../grammar/store";

const primitiveCode = `
primitive Int;
primitive Bool;
primitive Builder;
primitive Cell;
primitive Slice;

struct Struct1 {

}

struct Struct2 {

}

contract Contract1 {

}

contract Contract2 {

}
`;

describe('resolveFuncType', () => {

    beforeEach(() => {
        __DANGER_resetNodeId();
    });

    it('should process primitive types', () => {
        let ctx = openContext([primitiveCode]);
        ctx = resolveDescriptors(ctx);
        let wctx = new WriterContext(ctx);
        expect(resolveFuncType({ kind: 'ref', name: 'Int', optional: false }, wctx)).toBe('int');
        expect(resolveFuncType({ kind: 'ref', name: 'Bool', optional: false }, wctx)).toBe('int');
        expect(resolveFuncType({ kind: 'ref', name: 'Cell', optional: false }, wctx)).toBe('cell');
        expect(resolveFuncType({ kind: 'ref', name: 'Slice', optional: false }, wctx)).toBe('slice');
        expect(resolveFuncType({ kind: 'ref', name: 'Builder', optional: false }, wctx)).toBe('builder');
        expect(resolveFuncType({ kind: 'ref', name: 'Int', optional: true }, wctx)).toBe('int');
        expect(resolveFuncType({ kind: 'ref', name: 'Bool', optional: true }, wctx)).toBe('int');
        expect(resolveFuncType({ kind: 'ref', name: 'Cell', optional: true }, wctx)).toBe('cell');
        expect(resolveFuncType({ kind: 'ref', name: 'Slice', optional: true }, wctx)).toBe('slice');
        expect(resolveFuncType({ kind: 'ref', name: 'Builder', optional: true }, wctx)).toBe('builder');
    });

    it('should process contract and struct types', () => {
        let ctx = openContext([primitiveCode]);
        ctx = resolveDescriptors(ctx);
        let wctx = new WriterContext(ctx);
        expect(resolveFuncType({ kind: 'ref', name: 'Struct1', optional: false }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'ref', name: 'Struct2', optional: false }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'ref', name: 'Contract1', optional: false }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'ref', name: 'Contract2', optional: false }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'ref', name: 'Struct1', optional: true }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'ref', name: 'Struct2', optional: true }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'ref', name: 'Contract1', optional: true }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'ref', name: 'Contract2', optional: true }, wctx)).toBe('tuple');
    });
});