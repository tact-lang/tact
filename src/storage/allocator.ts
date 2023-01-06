import { CompilerContext } from "../context";
import { throwError } from "../grammar/ast";
import { getType } from "../types/resolveDescriptors";
import { FieldDescription } from "../types/types";
import { AllocationCell, AllocationOperation } from "./operation";

const ALLOCATOR_RESERVE_BIT = 1;
const ALLOCATOR_RESERVE_REF = 1;

export function getOperationSize(src: AllocationOperation): { bits: number, refs: number } {
    if (src.kind === 'int' || src.kind === 'uint') {
        return { bits: src.bits + (src.optional ? 1 : 0), refs: 0 };
    } else if (src.kind === 'coins') {
        return { bits: 124 + (src.optional ? 1 : 0), refs: 0 };
    } else if (src.kind === 'boolean') {
        return { bits: 1 + (src.optional ? 1 : 0), refs: 0 };
    } else if (src.kind === 'address') {
        return { bits: 267, refs: 0 };
    } else if (src.kind === 'cell' || src.kind === 'slice') {
        if (src.format === 'default') {
            if (src.optional) {
                return { bits: 1, refs: 1 };
            } else {
                return { bits: 0, refs: 1 };
            }
        } else if (src.format === 'remainder') {
            if (src.optional) {
                throw new Error('Remainder cell cannot be optional');
            }
            return { bits: 0, refs: 0 };
        } else {
            throw new Error('Unsupported format');
        }
    } else if (src.kind === 'string') {
        if (src.optional) {
            return { bits: 1, refs: 1 };
        } else {
            return { bits: 0, refs: 1 };
        }
    } else if (src.kind === 'map') {
        return { bits: 1, refs: 1 };
    } else if (src.kind === 'struct') {
        if (src.ref) {
            if (src.optional) {
                return { bits: 1, refs: 1 };
            } else {
                return { bits: 0, refs: 1 };
            }
        } else {
            if (src.optional) {
                return { bits: src.size.bits + 1, refs: src.size.refs };
            } else {
                return { bits: src.size.bits, refs: src.size.refs };
            }
        }
    } else if (src.kind === 'fixed-bytes') {
        return { bits: (src.bytes * 8) + (src.optional ? 1 : 0), refs: 0 };
    }
    throw new Error('Unsupported operation');
}

export function getAllocationOperationFromField(src: FieldDescription, structLoader: (name: string) => { bits: number, refs: number }, ctx: CompilerContext): AllocationOperation {
    let type = src.type;

    // Reference types
    if (type.kind === 'ref') {
        let td = getType(ctx, type.name);

        // Handle primitive types
        if (td.kind === 'primitive') {
            if (type.name === 'Int') {
                if (src.as) {
                    if (src.as === 'coins') {
                        return { kind: 'coins', optional: type.optional };
                    } else if (src.as === 'int8') {
                        return { kind: 'int', bits: 8, optional: type.optional };
                    } else if (src.as === 'int32') {
                        return { kind: 'int', bits: 32, optional: type.optional };
                    } else if (src.as === 'int64') {
                        return { kind: 'int', bits: 64, optional: type.optional };
                    } else if (src.as === 'int256') {
                        return { kind: 'int', bits: 256, optional: type.optional };
                    } else if (src.as === 'uint8') {
                        return { kind: 'uint', bits: 8, optional: type.optional };
                    } else if (src.as === 'uint32') {
                        return { kind: 'uint', bits: 32, optional: type.optional };
                    } else if (src.as === 'uint64') {
                        return { kind: 'uint', bits: 64, optional: type.optional };
                    } else if (src.as === 'uint256') {
                        return { kind: 'uint', bits: 256, optional: type.optional };
                    } else {
                        throwError('Unknown serialization type ' + src.as, src.ref);
                    }
                } else {
                    return { kind: 'int', bits: 267, optional: type.optional };
                }
            }
            if (type.name === 'Bool') {
                if (src.as) {
                    throwError('Unknown serialization type ' + src.as, src.ref);
                }
                return { kind: 'boolean', optional: type.optional };
            }
            if (type.name === 'Cell') {
                if (src.as) {
                    if (src.as === 'remaining') {
                        return { kind: 'cell', optional: type.optional, format: 'remainder' };
                    }
                    throwError('Unknown serialization type ' + src.as, src.ref);
                }
                return { kind: 'cell', optional: type.optional, format: 'default' };
            }
            if (type.name === 'Slice') {
                if (src.as) {
                    if (src.as === 'remaining') {
                        return { kind: 'slice', optional: type.optional, format: 'remainder' };
                    } else if (src.as === 'bytes64') {
                        return { kind: 'fixed-bytes', bytes: 64, optional: type.optional };
                    } else if (src.as === 'bytes32') {
                        return { kind: 'fixed-bytes', bytes: 32, optional: type.optional };
                    }
                    throwError('Unknown serialization type ' + src.as, src.ref);
                }
                return { kind: 'slice', optional: type.optional, format: 'default' };
            }
            if (type.name === 'Address') {
                return { kind: 'address', optional: type.optional };
            }
            throw new Error('Unsupported primitive type: ' + type.name);
        }

        // Handle struct types
        if (td.kind === 'struct') {

            // Load referenced struct
            let size = structLoader(td.name);
            if (src.as) {
                if (src.as === 'reference') {
                    return { kind: 'struct', type: td.name, ref: true, optional: type.optional, size };
                } else {
                    throwError('Unknown serialization type ' + src.as, src.ref);
                }
            }
            return { kind: 'struct', type: td.name, ref: false, optional: type.optional, size };
        }

        throw new Error('Not-serializable type: ' + type.name);
    }

    // Map
    if (type.kind === 'map') {
        if (src.as) {
            throwError('Unknown serialization type ' + src.as, src.ref);
        }
        return { kind: 'map' };
    }

    throw new Error('Unsupported operation');
}

function allocateSegment(ops: AllocationOperation[], bits: number, refs: number): AllocationCell {

    let fields: AllocationOperation[] = [];
    let next: AllocationCell | null = null;
    let used: { bits: number, refs: number } = { bits: 0, refs: 0 };

    for (let i = 0; i < ops.length; i++) {
        let op = ops[i];
        let size = getOperationSize(op);

        // Check if we can fit this operation
        if (size.bits > bits || size.refs > refs) {
            next = allocateSegment(ops.slice(i), 1023 - ALLOCATOR_RESERVE_BIT, 4 - ALLOCATOR_RESERVE_REF);
            break;
        }

        // Append operation
        bits -= size.bits;
        refs -= size.refs;
        used.bits += size.bits;
        used.refs += size.refs;
        fields.push(op);
    }

    return {
        ops: fields,
        size: used,
        next
    };
}

export function allocate(type: { reserved: { bits: number, refs: number }, ops: AllocationOperation[] }): AllocationCell {
    return allocateSegment(type.ops, 1023 - type.reserved.bits - ALLOCATOR_RESERVE_BIT, 4 - type.reserved.refs - ALLOCATOR_RESERVE_REF);
}