import { CompilerContext } from "../../ast/context";
import { resolveTypeDescriptors } from "../../types/resolveTypeDescriptors";
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
        expect(resolveFuncType(ctx, { kind: 'direct', name: 'Int' })).toBe('int');
        expect(resolveFuncType(ctx, { kind: 'direct', name: 'Bool' })).toBe('int');
        expect(resolveFuncType(ctx, { kind: 'direct', name: 'Cell' })).toBe('cell');
        expect(resolveFuncType(ctx, { kind: 'direct', name: 'Slice' })).toBe('slice');
        expect(resolveFuncType(ctx, { kind: 'direct', name: 'Builder' })).toBe('builder');
        expect(resolveFuncType(ctx, { kind: 'optional', inner: { kind: 'direct', name: 'Int' } })).toBe('int');
        expect(resolveFuncType(ctx, { kind: 'optional', inner: { kind: 'direct', name: 'Bool' } })).toBe('int');
        expect(resolveFuncType(ctx, { kind: 'optional', inner: { kind: 'direct', name: 'Cell' } })).toBe('cell');
        expect(resolveFuncType(ctx, { kind: 'optional', inner: { kind: 'direct', name: 'Slice' } })).toBe('slice');
        expect(resolveFuncType(ctx, { kind: 'optional', inner: { kind: 'direct', name: 'Builder' } })).toBe('builder');
    });

    it('should process contract and struct types', () => {
        let ctx = CompilerContext.fromSources([primitiveCode]);
        ctx = resolveTypeDescriptors(ctx);
        expect(resolveFuncType(ctx, { kind: 'direct', name: 'Struct1' })).toBe('tuple');
        expect(resolveFuncType(ctx, { kind: 'direct', name: 'Struct2' })).toBe('tuple');
        expect(resolveFuncType(ctx, { kind: 'direct', name: 'Contract1' })).toBe('tuple');
        expect(resolveFuncType(ctx, { kind: 'direct', name: 'Contract2' })).toBe('tuple');
        expect(resolveFuncType(ctx, { kind: 'optional', inner: { kind: 'direct', name: 'Struct1' } })).toBe('tuple');
        expect(resolveFuncType(ctx, { kind: 'optional', inner: { kind: 'direct', name: 'Struct2' } })).toBe('tuple');
        expect(resolveFuncType(ctx, { kind: 'optional', inner: { kind: 'direct', name: 'Contract1' } })).toBe('tuple');
        expect(resolveFuncType(ctx, { kind: 'optional', inner: { kind: 'direct', name: 'Contract2' } })).toBe('tuple');
    });
});