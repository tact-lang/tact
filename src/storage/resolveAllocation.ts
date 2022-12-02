import { CompilerContext, createContextStore } from "../ast/context";
import { getAllTypes, getType } from "../types/resolveTypeDescriptors";
import { FieldDescription, TypeDescription, TypeRef } from "../types/types";
import { topologicalSort } from "../utils";
import { crc32 } from "../utils/crc32";
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
        let res: TypeDescription[] = []
        let t = new Set<string>();
        for (let f of src.fields) {
            let r = f.type;
            while (r.kind !== 'direct') {
                r = r.inner;
            }

            let tp = getType(ctx, r.name);
            if (tp.kind === 'struct') {
                if (!t.has(tp.name)) {
                    t.add(r.name);
                    res.push(tp);
                }
            }
        }
        return res;
    }
    structs = topologicalSort(structs, refs);
    structs = [...structs, ...types.filter((v) => v.kind === 'contract')];
    return structs;
}

function resolveFieldSize(ctx: CompilerContext, src: FieldDescription, type: TypeRef = src.type): { bits: number, refs: number } {

    // Optional type
    if (src.type.kind === 'optional') {
        let r = resolveFieldSize(ctx, src, src.type);
        return { bits: r.bits + 1, refs: r.refs };
    }

    // Direct type
    let td = getType(ctx, src.type.name);
    if (td.kind === 'primitive') {
        if (td.name === 'Int') {
            return { bits: 257, refs: 0 };
        } else if (td.name === 'Bool') {
            return { bits: 1, refs: 0 };
        } else if (td.name === 'Cell') {
            return { bits: 0, refs: 1 }
        } else {
            throw Error('Unknown primitive type: ' + td.name);
        }
    } else if (td.kind === 'struct') {
        let allocation = getAllocation(ctx, src.type.name);
        return allocation.root.size;
    } else if (td.kind === 'contract') {
        throw Error('Contract type not supported for storage');
    }

    // Unknown type
    throw Error('Unknown field type: ' + src.type.kind);
}

function allocateField(ctx: CompilerContext, src: FieldDescription, type: TypeRef, optional: boolean = false): StorageField {
    if (src.type.kind === 'optional') {
        return allocateField(ctx, src, src.type.inner, true);
    }

    let td = getType(ctx, src.type.name);
    if (td.kind === 'primitive') {
        if (td.name === 'Int') {
            return { index: src.index, size: { bits: 257, refs: 0 }, name: src.name, kind: optional ? 'int-optional' : 'int', type: td };
        } else if (src.type.name === 'Bool') {
            return { index: src.index, size: { bits: 1, refs: 0 }, name: src.name, kind: optional ? 'int-optional' : 'int', type: td };
        } else {
            throw Error('Unknown primitive type: ' + src.type.name);
        }
    } else if (td.kind === 'struct') {
        let allocation = getAllocation(ctx, src.type.name);
        return { index: src.index, size: allocation.root.size, name: src.name, kind: optional ? 'struct-optional' : 'struct', type: td };
    } else if (td.kind === 'contract') {
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
            fields.push(allocateField(ctx, f, f.type));
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

    // Generate function allocations
    for (let t of types) {
        if (t.kind === 'contract') {
            for (let f of t.functions) {
                if (f.isPublic) {
                    let fields = f.args.map((v, i) => ({ index: i, name: v.name, type: v.type }));
                    let prefix = crc32(Buffer.from(f.name));
                    let root = allocateFields(ctx, fields, 1023 - 8 * 4, 3);
                    let allocation: StorageAllocation = { prefix, root };
                    ctx = store.set(ctx, t.name + '$$' + f.name, allocation);
                }
            }
        }
    }

    return ctx;
}