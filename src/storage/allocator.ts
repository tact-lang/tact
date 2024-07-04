import { ABITypeRef } from "@ton/core";
import {
    AllocationCell,
    AllocationOperation,
    AllocationOperationType,
} from "./operation";

const ALLOCATOR_RESERVE_BIT = 1;
const ALLOCATOR_RESERVE_REF = 1;

export function getOperationSize(src: AllocationOperationType): {
    bits: number;
    refs: number;
} {
    switch (src.kind) {
        case "int":
        case "uint": {
            return { bits: src.bits + (src.optional ? 1 : 0), refs: 0 };
        }
        case "coins": {
            return { bits: 124 + (src.optional ? 1 : 0), refs: 0 };
        }
        case "boolean": {
            return { bits: 1 + (src.optional ? 1 : 0), refs: 0 };
        }
        case "address": {
            return { bits: 267, refs: 0 };
        }
        case "cell":
        case "slice":
        case "builder":
            {
                switch (src.format) {
                    case "default": {
                        return { bits: src.optional ? 1 : 0, refs: 1 };
                    }
                    case "remainder": {
                        if (src.optional) {
                            throw new Error(
                                "Remainder cell cannot be optional",
                            );
                        }
                        return { bits: 0, refs: 0 };
                    }
                }
            }
            break;
        case "string": {
            return { bits: src.optional ? 1 : 0, refs: 1 };
        }
        case "map": {
            return { bits: 1, refs: 1 };
        }
        case "struct": {
            if (src.ref) {
                return { bits: src.optional ? 1 : 0, refs: 1 };
            } else {
                return {
                    bits: src.size.bits + (src.optional ? 1 : 0),
                    refs: src.size.refs,
                };
            }
        }
        case "fixed-bytes": {
            return { bits: src.bytes * 8 + (src.optional ? 1 : 0), refs: 0 };
        }
    }
}

export function getAllocationOperationFromField(
    src: ABITypeRef,
    structLoader: (name: string) => { bits: number; refs: number },
): AllocationOperationType {
    // Reference types
    switch (src.kind) {
        case "simple": {
            if (src.type === "int") {
                if (src.format === 8) {
                    return {
                        kind: "int",
                        bits: 8,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 16) {
                    return {
                        kind: "int",
                        bits: 16,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 32) {
                    return {
                        kind: "int",
                        bits: 32,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 64) {
                    return {
                        kind: "int",
                        bits: 64,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 128) {
                    return {
                        kind: "int",
                        bits: 128,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 256) {
                    return {
                        kind: "int",
                        bits: 256,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 257) {
                    return {
                        kind: "int",
                        bits: 257,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format !== null && src.format !== undefined) {
                    throw Error("Unsupported int format " + src.format);
                }
                return {
                    kind: "int",
                    bits: 257,
                    optional: src.optional ? src.optional : false,
                };
            }
            if (src.type === "uint") {
                if (src.format === 8) {
                    return {
                        kind: "uint",
                        bits: 8,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 16) {
                    return {
                        kind: "uint",
                        bits: 16,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 32) {
                    return {
                        kind: "uint",
                        bits: 32,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 64) {
                    return {
                        kind: "uint",
                        bits: 64,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 128) {
                    return {
                        kind: "uint",
                        bits: 128,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === 256) {
                    return {
                        kind: "uint",
                        bits: 256,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === "coins") {
                    return {
                        kind: "coins",
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format !== null && src.format !== undefined) {
                    throw Error("Unsupported int format " + src.format);
                }
                return {
                    kind: "uint",
                    bits: 256,
                    optional: src.optional ? src.optional : false,
                };
            }
            if (src.type === "bool") {
                if (src.format !== null && src.format !== undefined) {
                    throw Error("Unsupported bool format " + src.format);
                }
                return {
                    kind: "boolean",
                    optional: src.optional ? src.optional : false,
                };
            }
            if (src.type === "cell") {
                if (src.format === "remainder") {
                    return {
                        kind: "cell",
                        optional: src.optional ? src.optional : false,
                        format: "remainder",
                    };
                } else if (src.format !== null && src.format !== undefined) {
                    throw Error("Unsupported cell format " + src.format);
                }
                return {
                    kind: "cell",
                    optional: src.optional ? src.optional : false,
                    format: "default",
                };
            }
            if (src.type === "slice") {
                if (src.format === "remainder") {
                    return {
                        kind: "slice",
                        optional: src.optional ? src.optional : false,
                        format: "remainder",
                    };
                } else if (src.format !== null && src.format !== undefined) {
                    throw Error("Unsupported slice format " + src.format);
                }
                return {
                    kind: "slice",
                    optional: src.optional ? src.optional : false,
                    format: "default",
                };
            }
            if (src.type === "builder") {
                if (src.format === "remainder") {
                    return {
                        kind: "builder",
                        optional: src.optional ? src.optional : false,
                        format: "remainder",
                    };
                } else if (src.format !== null && src.format !== undefined) {
                    throw Error("Unsupported slice format " + src.format);
                }
                return {
                    kind: "builder",
                    optional: src.optional ? src.optional : false,
                    format: "default",
                };
            }
            if (src.type === "address") {
                return {
                    kind: "address",
                    optional: src.optional ? src.optional : false,
                };
            }
            if (src.type === "fixed-bytes") {
                if (src.format === 32 || src.format === 64) {
                    return {
                        kind: "fixed-bytes",
                        bytes: src.format,
                        optional: src.optional ? src.optional : false,
                    };
                } else {
                    throw Error("Unsupported fixed-bytes format " + src.format);
                }
            }
            if (src.type === "string") {
                if (src.format !== null && src.format !== undefined) {
                    throw Error("Unsupported string format " + src.format);
                }
                return {
                    kind: "string",
                    optional: src.optional ? src.optional : false,
                };
            }

            // Struct types
            const size = structLoader(src.type);
            if (src.format === "ref") {
                return {
                    kind: "struct",
                    type: src.type,
                    ref: true,
                    optional: src.optional ? src.optional : false,
                    size,
                };
            } else if (src.format !== undefined && src.format !== null) {
                throw Error("Unsupported struct format " + src.format);
            } else {
                return {
                    kind: "struct",
                    type: src.type,
                    ref: false,
                    optional: src.optional ? src.optional : false,
                    size,
                };
            }
        }
        case "dict": {
            if (src.format !== null && src.format !== undefined) {
                throw Error("Unsupported map format " + src.format);
            }
            return { kind: "map" };
        }
    }
}

function allocateSegment(
    ops: AllocationOperation[],
    bits: number,
    refs: number,
): AllocationCell {
    const fields: AllocationOperation[] = [];
    let next: AllocationCell | null = null;
    const used: { bits: number; refs: number } = { bits: 0, refs: 0 };

    for (const [i, op] of ops.entries()) {
        const size = getOperationSize(op.op);

        // Check if we can fit this operation
        if (size.bits > bits || size.refs > refs) {
            next = allocateSegment(
                ops.slice(i),
                1023 - ALLOCATOR_RESERVE_BIT,
                4 - ALLOCATOR_RESERVE_REF,
            );
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
        next,
    };
}

export function allocate(type: {
    reserved: { bits: number; refs: number };
    ops: AllocationOperation[];
}): AllocationCell {
    return allocateSegment(
        type.ops,
        1023 - type.reserved.bits - ALLOCATOR_RESERVE_BIT,
        4 - type.reserved.refs - ALLOCATOR_RESERVE_REF,
    );
}
