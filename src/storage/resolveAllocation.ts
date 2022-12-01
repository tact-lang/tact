import { CompilerContext, createContextStore } from "../ast/context";
import { getAllTypes } from "../types/resolveTypeDescriptors";
import { FieldDescription, TypeDescription } from "../types/TypeDescription";
import { topologicalSort } from "../utils";
import { StorageAllocation, StorageCell, StorageField } from "./StorageAllocation";

let store = createContextStore<StorageAllocation>();

export function getAllocation(ctx: CompilerContext, name: string) {
    let t = store.get(ctx, name);
    if (!t) {
        throw Error('Allocation for ' + name + ' not found');
    }
    return t;
}

export function getAllocations(ctx: CompilerContext) {
    return getSortedTypes(ctx).map((v) => ({ allocation: getAllocation(ctx, v.name), type: v }));
}

function getSortedTypes(ctx: CompilerContext) {
    let types = Object.values(getAllTypes(ctx)).filter((v) => v.kind === 'struct' || v.kind === 'contract');
    let structs = types.filter(t => t.kind === 'struct');
    let refs = (src: TypeDescription) => {
        return src.fields.filter((v) => v.type.kind === 'struct').map((v) => v.type);
    }
    structs = topologicalSort(structs, refs);
    structs = [...structs, ...types.filter((v) => v.kind === 'contract')];
    return structs;
}

function resolveFieldSize(ctx: CompilerContext, src: FieldDescription): { bits: number, refs: number } {
    if (src.type.kind === 'primitive') {
        if (src.type.name === 'Int') {
            return { bits: 257, refs: 0 };
        } else if (src.type.name === 'Bool') {
            return { bits: 1, refs: 0 };
        } else if (src.type.name === 'Cell') {
            return { bits: 0, refs: 1 }
        } else {
            throw Error('Unknown primitive type: ' + src.type.name);
        }
    } else if (src.type.kind === 'struct') {
        let allocation = getAllocation(ctx, src.type.name);
        return allocation.root.size;
    } else if (src.type.kind === 'contract') {
        throw Error('Contract type not supported for storage');
    }
    throw Error('Unknown field type: ' + src.type.kind);
}

function allocateField(ctx: CompilerContext, src: FieldDescription): StorageField {
    if (src.type.kind === 'primitive') {
        if (src.type.name === 'Int') {
            return { index: src.index, size: { bits: 257, refs: 0 }, name: src.name, kind: 'int', type: src.type };
        } else if (src.type.name === 'Bool') {
            return { index: src.index, size: { bits: 1, refs: 0 }, name: src.name, kind: 'int', type: src.type };
        } else {
            throw Error('Unknown primitive type: ' + src.type.name);
        }
    } else if (src.type.kind === 'struct') {
        let allocation = getAllocation(ctx, src.type.name);
        return { index: src.index, size: allocation.root.size, name: src.name, kind: 'struct', type: src.type };
    } else if (src.type.kind === 'contract') {
        throw Error('Contract type not supported for storage');
    }
    throw Error('Unknown field type: ' + src.type.kind);
}

function allocateFields(ctx: CompilerContext, src: FieldDescription[], bits: number, refs: number): StorageCell {

    let fields: StorageField[] = [];
    let next: StorageCell | null = null;
    let used: { bits: number, refs: number } = { bits: 0, refs: 0 };

    while (src.length > 0) {
        let f = src.shift()!;
        let d = resolveFieldSize(ctx, f);
        if (d.bits > bits || d.refs > refs) {
            used.refs += 1;
            next = allocateFields(ctx, [f, ...src], 1023, 3);
            break;
        } else {
            bits -= d.bits;
            refs -= d.refs;
            used.bits += d.bits;
            used.refs += d.refs;
            fields.push(allocateField(ctx, f));
        }
    }

    return { fields, next, size: used };
}

export function resolveAllocations(ctx: CompilerContext) {

    // Load topological order of structs and contracts
    let types = getSortedTypes(ctx);

    // Generate allocations
    for (let s of types) {
        let root = allocateFields(ctx, [...s.fields], 1023, 3);
        let allocation: StorageAllocation = { prefix: null, root };
        ctx = store.set(ctx, s.name, allocation);
    }

    return ctx;
}