import { CompilerContext } from "../../ast/context";
import { resolveTypeDescriptors } from "../../types/resolveTypeDescriptors";
import { WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";

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

    it('should process primitive types', () => {
        let ctx = CompilerContext.fromSources([primitiveCode]);
        ctx = resolveTypeDescriptors(ctx);
        let wctx = new WriterContext(ctx);
        expect(resolveFuncType({ kind: 'direct', name: 'Int' }, wctx)).toBe('int');
        expect(resolveFuncType({ kind: 'direct', name: 'Bool' }, wctx)).toBe('int');
        expect(resolveFuncType({ kind: 'direct', name: 'Cell' }, wctx)).toBe('cell');
        expect(resolveFuncType({ kind: 'direct', name: 'Slice' }, wctx)).toBe('slice');
        expect(resolveFuncType({ kind: 'direct', name: 'Builder' }, wctx)).toBe('builder');
        expect(resolveFuncType({ kind: 'optional', inner: { kind: 'direct', name: 'Int' } }, wctx)).toBe('int');
        expect(resolveFuncType({ kind: 'optional', inner: { kind: 'direct', name: 'Bool' } }, wctx)).toBe('int');
        expect(resolveFuncType({ kind: 'optional', inner: { kind: 'direct', name: 'Cell' } }, wctx)).toBe('cell');
        expect(resolveFuncType({ kind: 'optional', inner: { kind: 'direct', name: 'Slice' } }, wctx)).toBe('slice');
        expect(resolveFuncType({ kind: 'optional', inner: { kind: 'direct', name: 'Builder' } }, wctx)).toBe('builder');
    });

    it('should process contract and struct types', () => {
        let ctx = CompilerContext.fromSources([primitiveCode]);
        ctx = resolveTypeDescriptors(ctx);
        let wctx = new WriterContext(ctx);
        expect(resolveFuncType({ kind: 'direct', name: 'Struct1' }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'direct', name: 'Struct2' }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'direct', name: 'Contract1' }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'direct', name: 'Contract2' }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'optional', inner: { kind: 'direct', name: 'Struct1' } }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'optional', inner: { kind: 'direct', name: 'Struct2' } }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'optional', inner: { kind: 'direct', name: 'Contract1' } }, wctx)).toBe('tuple');
        expect(resolveFuncType({ kind: 'optional', inner: { kind: 'direct', name: 'Contract2' } }, wctx)).toBe('tuple');
    });
});