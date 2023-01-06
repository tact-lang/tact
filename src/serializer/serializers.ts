import { ABITypeRef } from "ton-core";
import { Writer } from "../utils/Writer";

export type Serializer<T> = {
    tsType: (v: T) => string,
    tsLoad: (v: T, slice: string, field: string, w: Writer) => void,
    tsStore: (v: T, builder: string, field: string, w: Writer) => void,
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
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeUint(${field}, ${v.bits}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeUint(${field}, ${v.bits});`);
        }
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
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeCoins(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeCoins(${field});`);
        }
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
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeBit(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeBit(${field});`);
        }
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
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeAddress(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeBit(${field});`);
        }
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

let cellSerializer: Serializer<{ optional: boolean }> = {
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
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeRef(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeRef(${field});`);
        }
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'cell' || src.type === 'slice') {
                if (src.format === null || src.format === undefined || src.format === 'ref') {
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

let remainderSerializer: Serializer<{}> = {
    tsType(v) {
        return 'Cell';
    },
    tsLoad(v, slice, field, w) {
        w.append(`let ${field} = ${slice}.asCell();`);
    },
    tsStore(v, builder, field, w) {
        w.append(`let ${builder}.storeBuilder(${field}.asBuilder());`);
    },
    abiMatcher(src) {
        if (src.kind === 'simple') {
            if (src.type === 'cell' || src.type === 'slice') {
                if (src.format === 'remainder') {
                    return {};
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
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeBuffer(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeBuffer(${field});`);
        }
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
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeStringRefTail(${field}); } else { ${builder}.storeBit(false); }`);
        } else {
            w.append(`${builder}.storeStringRefTail(${field});`);
        }
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

export const serializers: Serializer<any>[] = [
    intSerializer,
    uintSerializer,
    coinsSerializer,
    boolSerializer,
    addressSerializer,
    cellSerializer,
    remainderSerializer,
    fixedBytesSerializer,
    stringSerializer
];