import { ABITypeRef } from "ton-core";
import { Writer } from "../../utils/Writer";

const primitiveTypes = ['int', 'uint', 'address', 'bool', 'string', 'cell', 'slice', 'builder', 'fixed-bytes'];

export type Serializer<T> = {

    // Typescript
    tsType: (v: T) => string,
    tsLoad: (v: T, slice: string, field: string, w: Writer) => void,
    tsLoadTuple: (v: T, reader: string, field: string, w: Writer, fromGet: boolean) => void,
    tsStore: (v: T, builder: string, field: string, w: Writer) => void,
    tsStoreTuple: (v: T, to: string, field: string, w: Writer) => void,

    // Matcher and measurer
    abiMatcher: (src: ABITypeRef) => T | null,
    size: (v: T) => { bits: number, refs: number } | 'terminal'
};

let intSerializer: Serializer<{ bits: number, optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return 'bigint | null';
        } else {
            return 'bigint';
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadBit() ? ${slice}.loadIntBig(${v.bits}) : null;`);
        } else {
            w.append(`let ${field} = ${slice}.loadIntBig(${v.bits});`);
        }
    },
    tsLoadTuple(v, reader, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${reader}.readBigNumberOpt();`);
        } else {
            w.append(`let ${field} = ${reader}.readBigNumber();`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeNumber(${field});`);
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeInt(${field}, ${v.bits}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeInt(${field}, ${v.bits});`);
        }
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'int') {
                if (typeof src.format === 'number') {
                    return { bits: src.format, optional: src.optional ? src.optional : false };
                } else if (src.format === null || src.format === undefined) {
                    return { bits: 257, optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
    size(v) {
        return { bits: v.bits + (v.optional ? 1 : 0), refs: 0 };
    },
};

let uintSerializer: Serializer<{ bits: number, optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return 'bigint | null';
        } else {
            return 'bigint';
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadBit() ? ${slice}.loadUintBig(${v.bits}) : null;`);
        } else {
            w.append(`let ${field} = ${slice}.loadUintBig(${v.bits});`);
        }
    },
    tsLoadTuple(v, reader, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${reader}.readBigNumberOpt();`);
        } else {
            w.append(`let ${field} = ${reader}.readBigNumber();`);
        }
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeUint(${field}, ${v.bits}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeUint(${field}, ${v.bits});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeNumber(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'uint') {
                if (typeof src.format === 'number') {
                    return { bits: src.format, optional: src.optional ? src.optional : false };
                } else if (src.format === null || src.format === undefined) {
                    return { bits: 256, optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
    size(v) {
        return { bits: v.bits + (v.optional ? 1 : 0), refs: 0 };
    },
};

let coinsSerializer: Serializer<{ optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return 'bigint | null';
        } else {
            return 'bigint';
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadBit() ? ${slice}.loadCoins() : null;`);
        } else {
            w.append(`let ${field} = ${slice}.loadCoins();`);
        }
    },
    tsLoadTuple(v, reader, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${reader}.readBigNumberOpt();`);
        } else {
            w.append(`let ${field} = ${reader}.readBigNumber();`);
        }
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeCoins(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeCoins(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeNumber(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'uint') {
                if (src.format === 'coins') {
                    return { optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
    size(v) {
        return { bits: 124 + (v.optional ? 1 : 0), refs: 0 };
    },
};

let boolSerializer: Serializer<{ optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return 'boolean | null';
        } else {
            return 'boolean';
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadBit() ? ${slice}.loadBit() : null;`);
        } else {
            w.append(`let ${field} = ${slice}.loadBit();`);
        }
    },
    tsLoadTuple(v, reader, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${reader}.readBooleanOpt();`);
        } else {
            w.append(`let ${field} = ${reader}.readBoolean();`);
        }
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeBit(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeBit(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeBoolean(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'bool') {
                if (src.format === null || src.format === undefined) {
                    return { optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
    size(v) {
        return { bits: 1 + (v.optional ? 1 : 0), refs: 0 };
    },
};

let addressSerializer: Serializer<{ optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return 'Address | null';
        } else {
            return 'Address';
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadBit() ? ${slice}.loadAddress() : null;`);
        } else {
            w.append(`let ${field} = ${slice}.loadAddress();`);
        }
    },
    tsLoadTuple(v, reader, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${reader}.readAddressOpt();`);
        } else {
            w.append(`let ${field} = ${reader}.readAddress();`);
        }
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeAddress(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeAddress(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeAddress(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'address') {
                if (src.format === null || src.format === undefined) {
                    return { optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
    size(v) {
        return { bits: 267 + (v.optional ? 1 : 0), refs: 0 };
    },
};

let cellSerializer: Serializer<{ kind: 'cell' | 'slice', optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return 'Cell | null';
        } else {
            return 'Cell';
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadBit() ? ${slice}.loadRef() : null;`);
        } else {
            w.append(`let ${field} = ${slice}.loadRef();`);
        }
    },
    tsLoadTuple(v, reader, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${reader}.readCellOpt();`);
        } else {
            w.append(`let ${field} = ${reader}.readCell();`);
        }
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeRef(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeRef(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        if (v.kind === 'cell') {
            w.append(`${to}.writeCell(${field});`);
        } else {
            w.append(`${to}.writeSlice(${field});`);
        }
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'cell' || src.type === 'slice') {
                if (src.format === null || src.format === undefined || src.format === 'ref') {
                    return { optional: src.optional ? src.optional : false, kind: src.type };
                }
            }
        }
        return null;
    },
    size(v) {
        return { bits: (v.optional ? 1 : 0), refs: 1 };
    },
}

let remainderSerializer: Serializer<{ kind: 'cell' | 'slice' }> = {
    tsType(v) {
        return 'Cell';
    },
    tsLoad(v, slice, field, w) {
        w.append(`let ${field} = ${slice}.asCell();`);
    },
    tsLoadTuple(v, reader, field, w) {
        w.append(`let ${field} = ${reader}.readCell();`);
    },
    tsStore(v, builder, field, w) {
        w.append(`${builder}.storeBuilder(${field}.asBuilder());`);
    },
    tsStoreTuple(v, to, field, w) {
        if (v.kind === 'cell') {
            w.append(`${to}.writeCell(${field});`);
        } else {
            w.append(`${to}.writeSlice(${field});`);
        }
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'cell' || src.type === 'slice') {
                if (src.format === 'remainder') {
                    return { kind: src.type };
                }
            }
        }
        return null;
    },
    size(v) {
        return 'terminal';
    },
}

let fixedBytesSerializer: Serializer<{ bytes: number, optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return 'Buffer | null';
        } else {
            return 'Buffer';
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadBit() ? ${slice}.loadBuffer(${v.bytes}) : null;`);
        } else {
            w.append(`let ${field} = ${slice}.loadBuffer(${v.bytes});`);
        }
    },
    tsLoadTuple(v, reader, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${reader}.readBufferOpt();`);
        } else {
            w.append(`let ${field} = ${reader}.readBuffer();`);
        }
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeBuffer(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeBuffer(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeBuffer(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'fixed-bytes') {
                if (typeof src.format === 'number') {
                    return { bytes: src.format, optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
    size(v) {
        return { bits: v.bytes * 8 + (v.optional ? 1 : 0), refs: 0 };
    },
};

let stringSerializer: Serializer<{ optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return 'string | null';
        } else {
            return 'string';
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadBit() ? ${slice}.loadStringRefTail() : null;`);
        } else {
            w.append(`let ${field} = ${slice}.loadStringRefTail();`);
        }
    },
    tsLoadTuple(v, reader, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${reader}.readStringOpt();`);
        } else {
            w.append(`let ${field} = ${reader}.readString();`);
        }
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeStringRefTail(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeStringRefTail(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeString(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'string') {
                if (src.format === null || src.format === undefined) {
                    return { optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
    size(v) {
        return { bits: (v.optional ? 1 : 0), refs: 1 };
    },
}

let guard: Serializer<{}> = {
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (primitiveTypes.includes(src.type)) {
                throw Error(`Unable to resolve serializer for ${src.type} with ${src.format ? src.format : null} format`);
            }
        }
        return null;
    },
    tsType(v) {
        throw Error('Unreachable');
    },
    tsLoad(v, slice, field, w) {
        throw Error('Unreachable');
    },
    tsLoadTuple(v, reader, field, w) {
        throw Error('Unreachable');
    },
    tsStore(v, builder, field, w) {
        throw Error('Unreachable');
    },
    tsStoreTuple(v, to, field, w) {
        throw Error('Unreachable');
    },
    size(v) {
        throw Error('Unreachable');
    },
}

let struct: Serializer<{ name: string, optional: boolean }> = {
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.format !== null && src.format !== undefined) {
                return null;
            }
            return { name: src.type, optional: src.optional ? src.optional : false };
        }
        return null;
    },
    tsType(v) {
        if (v.optional) {
            return v.name + ' | null';
        } else {
            return v.name;
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadBit() ? load${v.name}(${slice}) : null;`);
        } else {
            w.append(`let ${field} = load${v.name}(${slice});`);
        }
    },
    tsLoadTuple(v, reader, field, w, fromGet: boolean) {
        if (v.optional) {
            w.append(`const ${field}_p = ${reader}.readTupleOpt();`);
            w.append(`const ${field} = ${field}_p ? loadTuple${v.name}(${field}_p) : null;`);
        } else {
            if (fromGet) {
                w.append(`const ${field} = loadTuple${v.name}(${reader});`);
            } else {
                w.append(`const ${field} = loadTuple${v.name}(${reader}.readTuple());`);
            }
        }
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true); ${builder}.store(store${v.name}(${field})); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.store(store${v.name}(${field}));`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) {`);
            w.inIndent(() => {
                w.append(`builder.writeTuple(storeTuple${v.name}(${field}));`);
            });
            w.append(`} else {`);
            w.inIndent(() => {
                w.append(`builder.writeTuple(null);`);
            });
            w.append(`}`);
        } else {
            w.append(`builder.writeTuple(storeTuple${v.name}(${field}));`);
        }
    },
    size(v) {
        throw Error('Unreachable');
    },
}

export const serializers: Serializer<any>[] = [

    // Primitive types
    intSerializer,
    uintSerializer,
    coinsSerializer,
    boolSerializer,
    addressSerializer,
    cellSerializer,
    remainderSerializer,
    fixedBytesSerializer,
    stringSerializer,

    // Guard to catch all primitve types that wasn't handled
    guard,

    // Structs as fallback
    struct,
];