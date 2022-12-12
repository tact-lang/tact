import { CompilerContext, createContextStore } from "../context";
import { throwError } from "../grammar/ast";
import { getAllTypes, getType } from "../types/resolveDescriptors";
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
            if (r.kind === 'ref') {
                let tp = getType(ctx, r.name);
                if (tp.kind === 'struct') {
                    if (!t.has(tp.name)) {
                        t.add(r.name);
                        res.push(tp);
                    }
                }
            }
        }
        return res;
    }
    structs = topologicalSort(structs, refs);
    structs = [...structs, ...types.filter((v) => v.kind === 'contract')];
    return structs;
}

function allocateField(ctx: CompilerContext, src: FieldDescription, type: TypeRef): StorageField {

    if (type.kind === 'ref') {

        // Resolve Optional
        if (type.optional) {
            let inner = allocateField(ctx, src, { ...type, optional: false });
            return { name: src.name, kind: 'optional', inner, size: { bits: inner.size.bits + 1, refs: inner.size.refs }, index: src.index };
        }

        // Resolve Direct
        let td = getType(ctx, type.name);

        // Primitive types
        if (td.kind === 'primitive') {
            if (td.name === 'Int') {
                if (src.as) {
                    if (src.as === 'coins') {
                        return { index: src.index, size: { bits: 124, refs: 0 }, name: src.name, kind: 'coins' };
                    } else if (src.as === 'int8') {
                        return { index: src.index, size: { bits: 8, refs: 0 }, bits: 8, name: src.name, kind: 'int' };
                    } else if (src.as === 'int32') {
                        return { index: src.index, size: { bits: 32, refs: 0 }, bits: 32, name: src.name, kind: 'int' };
                    } else if (src.as === 'int64') {
                        return { index: src.index, size: { bits: 64, refs: 0 }, bits: 64, name: src.name, kind: 'int' };
                    } else if (src.as === 'int256') {
                        return { index: src.index, size: { bits: 256, refs: 0 }, bits: 256, name: src.name, kind: 'int' };
                    } else if (src.as === 'uint8') {
                        return { index: src.index, size: { bits: 8, refs: 0 }, bits: 8, name: src.name, kind: 'uint' };
                    } else if (src.as === 'uint32') {
                        return { index: src.index, size: { bits: 32, refs: 0 }, bits: 32, name: src.name, kind: 'uint' };
                    } else if (src.as === 'uint64') {
                        return { index: src.index, size: { bits: 64, refs: 0 }, bits: 64, name: src.name, kind: 'uint' };
                    } else if (src.as === 'uint256') {
                        return { index: src.index, size: { bits: 256, refs: 0 }, bits: 256, name: src.name, kind: 'uint' };
                    } else {
                        throwError('Unknown serialization type ' + src.as, src.ref);
                    }
                }
                return { index: src.index, size: { bits: 257, refs: 0 }, bits: 257, name: src.name, kind: 'int' };
            } else if (type.name === 'Bool') {
                if (src.as) {
                    throwError('Unknown serialization type ' + src.as, src.ref);
                }
                return { index: src.index, size: { bits: 1, refs: 0 }, name: src.name, kind: 'int', bits: 1 };
            } else if (type.name === 'Slice') {
                if (src.as) {
                    if (src.as === 'remaining') {
                        return { index: src.index, size: { bits: 0, refs: 0 }, name: src.name, kind: 'remaining' };
                    } else if (src.as === 'bytes64') {
                        return { index: src.index, size: { bits: 512, refs: 0 }, name: src.name, kind: 'bytes', bytes: 64 };
                    } else if (src.as === 'bytes32') {
                        return { index: src.index, size: { bits: 256, refs: 0 }, name: src.name, kind: 'bytes', bytes: 32 };
                    }
                    throwError('Unknown serialization type ' + src.as, src.ref);
                }
                return { index: src.index, size: { bits: 0, refs: 1 }, name: src.name, kind: 'slice' };
            } else if (type.name === 'Cell') {
                if (src.as) {
                    throwError('Unknown serialization type ' + src.as, src.ref);
                }
                return { index: src.index, size: { bits: 0, refs: 1 }, name: src.name, kind: 'cell' };
            } else if (type.name === 'Address') {
                if (src.as) {
                    throwError('Unknown serialization type ' + src.as, src.ref);
                }
                return { index: src.index, size: { bits: 2 + 1 + 8 + 256, refs: 0 }, name: src.name, kind: 'address' };
            }
            throw Error('Unknown primitive type: ' + type.name);
        }

        // Struct types
        if (td.kind === 'struct') {
            if (src.as) {
                throwError('Unknown serialization type ' + src.as, src.ref);
            }
            let allocation = getAllocation(ctx, type.name);
            return { index: src.index, size: allocation.size, name: src.name, kind: 'struct', type: td };
        }

        // Contract types
        if (td.kind === 'contract') {
            throw Error('Contract references are not supported for storage');
        }

        throw Error('Unknown field type: ' + src.type.kind);
    }

    // Map
    if (type.kind === 'map') {
        return { index: src.index, size: { bits: 1, refs: 1 }, name: src.name, kind: 'map' };
    }

    throw Error('Unknown field type');
}

function allocateFields(ctx: CompilerContext, src: FieldDescription[], bits: number, refs: number): StorageCell {

    let fields: StorageField[] = [];
    let next: StorageCell | null = null;
    let used: { bits: number, refs: number } = { bits: 0, refs: 0 };
    let ended = false;

    while (src.length > 0) {
        let f = src.shift()!;
        if (ended) {
            throwError('Not enough space for field ' + f.name, f.ref);
        }
        let d = allocateField(ctx, f, f.type).size;
        if (f.as === 'remaining') {
            ended = true;
        }
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

        // Resolve prefix
        let prefix: number | null = null;
        if (s.ast.kind === 'def_struct' && s.ast.message) {
            if (s.ast.prefix !== null) {
                prefix = s.ast.prefix;
            } else {
                prefix = crc32(Buffer.from(s.name)); // TODO: Better allocation
            }
        }

        // Reserve bits
        let reserveBits = 0;
        if (prefix !== null) {
            reserveBits += 32; // Header size
        }

        // Reserver refs
        let reserveRefs = 1; // Next cell
        if (s.kind === 'contract') {
            reserveRefs += 1; // Internal state
        }

        let root = allocateFields(ctx, [...s.fields], 1023 - reserveBits, 4 - reserveRefs);
        let allocation: StorageAllocation = {
            isContract: (s.kind === 'contract'),
            prefix, root,
            fields: s.fields,
            size: {
                bits: root.size.bits + reserveBits, // Bits are part of serialization
                refs: root.size.refs
            }
        };
        ctx = store.set(ctx, s.name, allocation);
    }

    return ctx;
}