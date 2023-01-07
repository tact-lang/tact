import { ABITypeRef } from "ton-core";
import { CompilerContext } from "../context";
import { ASTField, throwError } from "../grammar/ast";
import { TypeRef } from "./types";

type FormatDef = { [key: string]: { type: string, format: string | number } };

const intFormats: FormatDef = {
    'int8': { type: 'int', format: 8 },
    'int16': { type: 'int', format: 16 },
    'int32': { type: 'int', format: 32 },
    'int64': { type: 'int', format: 64 },
    'int128': { type: 'int', format: 128 },
    'int256': { type: 'int', format: 256 },

    'uint8': { type: 'uint', format: 8 },
    'uint16': { type: 'uint', format: 16 },
    'uint32': { type: 'uint', format: 32 },
    'uint64': { type: 'uint', format: 64 },
    'uint128': { type: 'uint', format: 128 },
    'uint256': { type: 'uint', format: 256 },

    'int257': { type: 'int', format: 257 },
    'coins': { type: 'uint', format: 'coins' }
};

const cellFormats: FormatDef = {
    'remaining': { type: 'cell', format: 'remainder' }
}

const sliceFormats: FormatDef = {
    'remaining': { type: 'slice', format: 'remainder' },
    'bytes32': { type: 'fixed-bytes', format: 32 },
    'bytes64': { type: 'fixed-bytes', format: 64 }
}

export function resolveABIType(src: ASTField): ABITypeRef {
    if (src.type.kind === 'type_ref_simple') {

        //
        // Primitive types
        //

        if (src.type.name === 'Int') {
            if (src.as) {
                let fmt = intFormats[src.as];
                if (!fmt) {
                    throwError(`Unsupported format ${src.as}`, src.ref);
                }
                return { kind: 'simple', type: fmt.type, optional: src.type.optional, format: fmt.format };
            }
            return { kind: 'simple', type: 'int', optional: src.type.optional, format: 257 }; // Default is maximumx size int
        }
        if (src.type.name === 'Bool') {
            if (src.as) {
                throwError(`Unsupported format ${src.as}`, src.ref);
            }
            return { kind: 'simple', type: 'bool', optional: src.type.optional };
        }
        if (src.type.name === 'Cell') {
            if (src.as) {
                let fmt = cellFormats[src.as];
                if (!fmt) {
                    throwError(`Unsupported format ${src.as}`, src.ref);
                }
                return { kind: 'simple', type: fmt.type, optional: src.type.optional, format: fmt.format };
            }
            return { kind: 'simple', type: 'cell', optional: src.type.optional };
        }
        if (src.type.name === 'Slice') {
            if (src.as) {
                if (src.as) {
                    let fmt = sliceFormats[src.as];
                    if (!fmt) {
                        throwError(`Unsupported format ${src.as}`, src.ref);
                    }
                    return { kind: 'simple', type: fmt.type, optional: src.type.optional, format: fmt.format };
                }
            }
            return { kind: 'simple', type: 'slice', optional: src.type.optional };
        }
        if (src.type.name === 'Address') {
            if (src.as) {
                throwError(`Unsupported format ${src.as}`, src.ref);
            }
            return { kind: 'simple', type: 'address', optional: src.type.optional };
        }
        if (src.type.name === 'String') {
            if (src.as) {
                throwError(`Unsupported format ${src.as}`, src.ref);
            }
            return { kind: 'simple', type: 'string', optional: src.type.optional };
        }
        if (src.type.name === 'StringBuilder' || src.type.name === 'Builder') {
            throwError(`Unsupported type ${src.type.name}`, src.ref);
        }

        //
        // Structs
        //

        if (src.as) {
            if (src.as === 'reference') {
                return { kind: 'simple', type: src.type.name, optional: src.type.optional, format: 'ref' };
            } else {
                throwError(`Unsupported format ${src.as}`, src.ref);
            }
        }
        return { kind: 'simple', type: src.type.name, optional: src.type.optional };
    }

    //
    // Map
    //

    if (src.type.kind === 'type_ref_map') {
        let key: string;
        let keyFormat: string | undefined = undefined;
        let value: string;
        let valueFormat: string | undefined = undefined;

        // Resolve key type
        if (src.type.key === 'Int') {
            key = 'int';
        } else if (src.type.key === 'Address') {
            key = 'address';
        } else {
            throwError(`Unsupported map key type ${src.type.key}`, src.ref);
        }

        // Resolve value type
        if (src.type.value === 'Int') {
            value = 'int';
        } else if (src.type.value === 'Bool') {
            value = 'bool';
        } else if (src.type.value === 'Cell') {
            value = 'cell';
            valueFormat = 'ref';
        } else if (src.type.value === 'Slice') {
            throwError(`Unsupported map value type ${src.type.value}`, src.ref);
        } else if (src.type.value === 'Address') {
            value = 'address';
        } else if (src.type.value === 'String') {
            throwError(`Unsupported map value type ${src.type.value}`, src.ref);
        } else if (src.type.value === 'StringBuilder' || src.type.value === 'Builder') {
            throwError(`Unsupported map value type ${src.type.value}`, src.ref);
        } else {
            value = src.type.value;
            valueFormat = 'ref';
        }

        return { kind: 'dict', key, keyFormat, value, valueFormat };
    }

    throwError(`Unsupported type`, src.ref);
}

export function createABITypeRefFromTypeRef(src: TypeRef): ABITypeRef {

    if (src.kind === 'ref') {

        // Primitives
        if (src.name === 'Int') {
            return { kind: 'simple', type: 'int', optional: src.optional, format: 257 }; // Default is maximumx size int
        }
        if (src.name === 'Bool') {
            return { kind: 'simple', type: 'bool', optional: src.optional };
        }
        if (src.name === 'Cell') {
            return { kind: 'simple', type: 'cell', optional: src.optional };
        }
        if (src.name === 'Slice') {
            return { kind: 'simple', type: 'slice', optional: src.optional };
        }
        if (src.name === 'Address') {
            return { kind: 'simple', type: 'address', optional: src.optional };
        }
        if (src.name === 'String') {
            return { kind: 'simple', type: 'string', optional: src.optional };
        }
        if (src.name === 'StringBuilder' || src.name === 'Builder') {
            throw Error(`Unsupported type ${src.name}`);
        }

        // Structs
        return { kind: 'simple', type: src.name, optional: src.optional };
    }

    if (src.kind === 'map') {
        let key: string;
        let keyFormat: string | undefined = undefined;
        let value: string;
        let valueFormat: string | undefined = undefined;

        // Resolve key type
        if (src.key === 'Int') {
            key = 'int';
        } else if (src.key === 'Address') {
            key = 'address';
        } else {
            throw Error(`Unsupported map key type ${src.key}`);
        }

        // Resolve value type
        if (src.value === 'Int') {
            value = 'int';
        } else if (src.value === 'Bool') {
            value = 'bool';
        } else if (src.value === 'Cell') {
            value = 'cell';
            valueFormat = 'ref';
        } else if (src.value === 'Slice') {
            throw Error(`Unsupported map value type ${src.value}`);
        } else if (src.value === 'Address') {
            value = 'address';
        } else if (src.value === 'String') {
            throw Error(`Unsupported map value type ${src.value}`);
        } else if (src.value === 'StringBuilder' || src.value === 'Builder') {
            throw Error(`Unsupported map value type ${src.value}`);
        } else {
            value = src.value;
            valueFormat = 'ref';
        }

        return { kind: 'dict', key, keyFormat, value, valueFormat };
    }

    throw Error(`Unsupported type`);
}