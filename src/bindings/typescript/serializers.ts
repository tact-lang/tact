import { ABITypeRef } from "@ton/core";
import { Writer } from "../../utils/Writer";

const primitiveTypes = [
    "int",
    "uint",
    "address",
    "bool",
    "string",
    "cell",
    "slice",
    "builder",
    "fixed-bytes",
];

export type Serializer<T> = {
    // Typescript
    tsType: (v: T) => string;
    tsLoad: (v: T, slice: string, field: string, w: Writer) => void;
    tsLoadTuple: (
        v: T,
        reader: string,
        field: string,
        w: Writer,
        fromGet: boolean,
    ) => void;
    tsStore: (v: T, builder: string, field: string, w: Writer) => void;
    tsStoreTuple: (v: T, to: string, field: string, w: Writer) => void;

    // Matcher
    abiMatcher: (src: ABITypeRef) => T | null;
};

const intSerializer: Serializer<{ bits: number; optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return "bigint | null";
        } else {
            return "bigint";
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(
                `let ${field} = ${slice}.loadBit() ? ${slice}.loadIntBig(${v.bits}) : null;`,
            );
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
            w.append(
                `if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeInt(${field}, ${v.bits}); } else { ${builder}.storeBit(false); }`,
            );
        } else {
            w.append(`${builder}.storeInt(${field}, ${v.bits});`);
        }
    },
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (src.type === "int") {
                if (typeof src.format === "number") {
                    return {
                        bits: src.format,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === null || src.format === undefined) {
                    return {
                        bits: 257,
                        optional: src.optional ? src.optional : false,
                    };
                }
            }
        }
        return null;
    },
};

const uintSerializer: Serializer<{ bits: number; optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return "bigint | null";
        } else {
            return "bigint";
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(
                `let ${field} = ${slice}.loadBit() ? ${slice}.loadUintBig(${v.bits}) : null;`,
            );
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
            w.append(
                `if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeUint(${field}, ${v.bits}); } else { ${builder}.storeBit(false); }`,
            );
        } else {
            w.append(`${builder}.storeUint(${field}, ${v.bits});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeNumber(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (src.type === "uint") {
                if (typeof src.format === "number") {
                    return {
                        bits: src.format,
                        optional: src.optional ? src.optional : false,
                    };
                } else if (src.format === null || src.format === undefined) {
                    return {
                        bits: 256,
                        optional: src.optional ? src.optional : false,
                    };
                }
            }
        }
        return null;
    },
};

const coinsSerializer: Serializer<{ optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return "bigint | null";
        } else {
            return "bigint";
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(
                `let ${field} = ${slice}.loadBit() ? ${slice}.loadCoins() : null;`,
            );
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
            w.append(
                `if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeCoins(${field}); } else { ${builder}.storeBit(false); }`,
            );
        } else {
            w.append(`${builder}.storeCoins(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeNumber(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (src.type === "uint") {
                if (src.format === "coins") {
                    return { optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
};

const boolSerializer: Serializer<{ optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return "boolean | null";
        } else {
            return "boolean";
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(
                `let ${field} = ${slice}.loadBit() ? ${slice}.loadBit() : null;`,
            );
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
            w.append(
                `if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeBit(${field}); } else { ${builder}.storeBit(false); }`,
            );
        } else {
            w.append(`${builder}.storeBit(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeBoolean(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (src.type === "bool") {
                if (src.format === null || src.format === undefined) {
                    return { optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
};

const addressSerializer: Serializer<{ optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return "Address | null";
        } else {
            return "Address";
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(`let ${field} = ${slice}.loadMaybeAddress();`);
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
        w.append(`${builder}.storeAddress(${field});`);
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeAddress(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (src.type === "address") {
                if (src.format === null || src.format === undefined) {
                    return { optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
};

const cellSerializer: Serializer<{
    kind: "cell" | "slice" | "builder";
    optional: boolean;
}> = {
    tsType(v) {
        if (v.optional) {
            return "Cell | null";
        } else {
            return "Cell";
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(
                `let ${field} = ${slice}.loadBit() ? ${slice}.loadRef() : null;`,
            );
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
            w.append(
                `if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeRef(${field}); } else { ${builder}.storeBit(false); }`,
            );
        } else {
            w.append(`${builder}.storeRef(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        if (v.kind === "cell") {
            w.append(`${to}.writeCell(${field});`);
        } else if (v.kind === "slice") {
            w.append(`${to}.writeSlice(${field});`);
        } else {
            w.append(`${to}.writeBuilder(${field});`);
        }
    },
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (
                src.type === "cell" ||
                src.type === "slice" ||
                src.type === "builder"
            ) {
                if (
                    src.format === null ||
                    src.format === undefined ||
                    src.format === "ref"
                ) {
                    return {
                        optional: src.optional ? src.optional : false,
                        kind: src.type,
                    };
                }
            }
        }
        return null;
    },
};

const remainderSerializer: Serializer<{ kind: "cell" | "slice" | "builder" }> =
    {
        tsType(_v) {
            return "Cell";
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
            if (v.kind === "cell") {
                w.append(`${to}.writeCell(${field});`);
            } else if (v.kind === "slice") {
                w.append(`${to}.writeSlice(${field});`);
            } else {
                w.append(`${to}.writeBuilder(${field});`);
            }
        },
        abiMatcher(src) {
            if (src.kind === "simple") {
                if (
                    src.type === "cell" ||
                    src.type === "slice" ||
                    src.type === "builder"
                ) {
                    if (src.format === "remainder") {
                        return { kind: src.type };
                    }
                }
            }
            return null;
        },
    };

const fixedBytesSerializer: Serializer<{ bytes: number; optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return "Buffer | null";
        } else {
            return "Buffer";
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(
                `let ${field} = ${slice}.loadBit() ? ${slice}.loadBuffer(${v.bytes}) : null;`,
            );
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
            w.append(
                `if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeBuffer(${field}); } else { ${builder}.storeBit(false); }`,
            );
        } else {
            w.append(`${builder}.storeBuffer(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeBuffer(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (src.type === "fixed-bytes") {
                if (typeof src.format === "number") {
                    return {
                        bytes: src.format,
                        optional: src.optional ? src.optional : false,
                    };
                }
            }
        }
        return null;
    },
};

const stringSerializer: Serializer<{ optional: boolean }> = {
    tsType(v) {
        if (v.optional) {
            return "string | null";
        } else {
            return "string";
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(
                `let ${field} = ${slice}.loadBit() ? ${slice}.loadStringRefTail() : null;`,
            );
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
            w.append(
                `if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true).storeStringRefTail(${field}); } else { ${builder}.storeBit(false); }`,
            );
        } else {
            w.append(`${builder}.storeStringRefTail(${field});`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        w.append(`${to}.writeString(${field});`);
    },
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (src.type === "string") {
                if (src.format === null || src.format === undefined) {
                    return { optional: src.optional ? src.optional : false };
                }
            }
        }
        return null;
    },
};

const guard: Serializer<unknown> = {
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (primitiveTypes.includes(src.type)) {
                throw Error(
                    `Unable to resolve serializer for ${src.type} with ${src.format ? src.format : null} format`,
                );
            }
        }
        return null;
    },
    tsType(_v) {
        throw Error("Unreachable");
    },
    tsLoad(_v, _slice, _field, _w) {
        throw Error("Unreachable");
    },
    tsLoadTuple(_v, _reader, _field, _w) {
        throw Error("Unreachable");
    },
    tsStore(_v, _builder, _field, _w) {
        throw Error("Unreachable");
    },
    tsStoreTuple(_v, _to, _field, _w) {
        throw Error("Unreachable");
    },
};

const struct: Serializer<{ name: string; optional: boolean }> = {
    abiMatcher(src) {
        if (src.kind === "simple") {
            if (src.format !== null && src.format !== undefined) {
                return null;
            }
            return {
                name: src.type,
                optional: src.optional ? src.optional : false,
            };
        }
        return null;
    },
    tsType(v) {
        if (v.optional) {
            return v.name + " | null";
        } else {
            return v.name;
        }
    },
    tsLoad(v, slice, field, w) {
        if (v.optional) {
            w.append(
                `let ${field} = ${slice}.loadBit() ? load${v.name}(${slice}) : null;`,
            );
        } else {
            w.append(`let ${field} = load${v.name}(${slice});`);
        }
    },
    tsLoadTuple(v, reader, field, w, fromGet: boolean) {
        if (v.optional) {
            w.append(`const ${field}_p = ${reader}.readTupleOpt();`);
            w.append(
                `const ${field} = ${field}_p ? loadTuple${v.name}(${field}_p) : null;`,
            );
        } else {
            if (fromGet) {
                w.append(`const ${field} = loadTuple${v.name}(${reader});`);
            } else {
                w.append(
                    `const ${field} = loadTuple${v.name}(${reader}.readTuple());`,
                );
            }
        }
    },
    tsStore(v, builder, field, w) {
        if (v.optional) {
            w.append(
                `if (${field} !== null && ${field} !== undefined) { ${builder}.storeBit(true); ${builder}.store(store${v.name}(${field})); } else { ${builder}.storeBit(false); }`,
            );
        } else {
            w.append(`${builder}.store(store${v.name}(${field}));`);
        }
    },
    tsStoreTuple(v, to, field, w) {
        if (v.optional) {
            w.append(`if (${field} !== null && ${field} !== undefined) {`);
            w.inIndent(() => {
                w.append(`${to}.writeTuple(storeTuple${v.name}(${field}));`);
            });
            w.append(`} else {`);
            w.inIndent(() => {
                w.append(`${to}.writeTuple(null);`);
            });
            w.append(`}`);
        } else {
            w.append(`${to}.writeTuple(storeTuple${v.name}(${field}));`);
        }
    },
};

type MapSerializerDescrKey =
    | { kind: "int" | "uint"; bits: number }
    | { kind: "address" };
type MapSerializerDescrValue =
    | { kind: "int" | "uint"; bits: number }
    | { kind: "boolean" }
    | { kind: "address" }
    | { kind: "cell" }
    | { kind: "struct"; type: string };
type MapSerializerDescr = {
    key: MapSerializerDescrKey;
    value: MapSerializerDescrValue;
};
function getKeyParser(src: MapSerializerDescrKey) {
    if (src.kind === "int") {
        if (src.bits <= 32) {
            return `Dictionary.Keys.Int(${src.bits})`;
        } else {
            return `Dictionary.Keys.BigInt(${src.bits})`;
        }
    } else if (src.kind === "uint") {
        if (src.bits <= 32) {
            return `Dictionary.Keys.Uint(${src.bits})`;
        } else {
            return `Dictionary.Keys.BigUint(${src.bits})`;
        }
    } else if (src.kind === "address") {
        return "Dictionary.Keys.Address()";
    } else {
        throw Error("Unreachable");
    }
}
function getValueParser(src: MapSerializerDescrValue) {
    if (src.kind === "int") {
        if (src.bits <= 32) {
            return `Dictionary.Values.Int(${src.bits})`;
        } else {
            return `Dictionary.Values.BigInt(${src.bits})`;
        }
    } else if (src.kind === "uint") {
        if (src.bits <= 32) {
            return `Dictionary.Values.Uint(${src.bits})`;
        } else {
            return `Dictionary.Values.BigUint(${src.bits})`;
        }
    } else if (src.kind === "address") {
        return "Dictionary.Values.Address()";
    } else if (src.kind === "cell") {
        return "Dictionary.Values.Cell()";
    } else if (src.kind === "boolean") {
        return "Dictionary.Values.Bool()";
    } else if (src.kind === "struct") {
        return `dictValueParser${src.type}()`;
    } else {
        throw Error("Unreachable");
    }
}

const map: Serializer<MapSerializerDescr> = {
    abiMatcher(src) {
        if (src.kind === "dict") {
            if (src.format !== null && src.format !== undefined) {
                return null;
            }

            // Resolve key
            let key:
                | { kind: "int" | "uint"; bits: number }
                | { kind: "address" }
                | null = null;
            if (src.key === "int") {
                if (typeof src.keyFormat === "number") {
                    key = { kind: "int", bits: src.keyFormat };
                } else if (
                    src.keyFormat === null ||
                    src.keyFormat === undefined
                ) {
                    key = { kind: "int", bits: 257 };
                }
            }
            if (src.key === "uint") {
                if (typeof src.keyFormat === "number") {
                    key = { kind: "uint", bits: src.keyFormat };
                } else if (
                    src.keyFormat === null ||
                    src.keyFormat === undefined
                ) {
                    key = { kind: "uint", bits: 256 };
                }
            }
            if (src.key === "address") {
                if (src.keyFormat === null || src.keyFormat === undefined) {
                    key = { kind: "address" };
                }
            }

            // Resolve value
            let value: MapSerializerDescrValue | null = null;
            if (src.value === "int") {
                if (typeof src.valueFormat === "number") {
                    value = { kind: "int", bits: src.valueFormat };
                } else if (
                    src.valueFormat === null ||
                    src.valueFormat === undefined
                ) {
                    value = { kind: "int", bits: 257 };
                }
            }
            if (src.value === "uint") {
                if (typeof src.valueFormat === "number") {
                    value = { kind: "uint", bits: src.valueFormat };
                } else if (
                    src.valueFormat === null ||
                    src.valueFormat === undefined
                ) {
                    value = { kind: "uint", bits: 256 };
                }
            }
            if (src.value === "address") {
                if (src.valueFormat === null || src.valueFormat === undefined) {
                    value = { kind: "address" };
                }
            }
            if (src.value === "cell") {
                if (
                    src.valueFormat === null ||
                    src.valueFormat === undefined ||
                    src.valueFormat === "ref"
                ) {
                    value = { kind: "cell" };
                }
            }
            if (primitiveTypes.indexOf(src.value) === -1) {
                if (
                    src.valueFormat === null ||
                    src.valueFormat === undefined ||
                    src.valueFormat === "ref"
                ) {
                    value = { kind: "struct", type: src.value };
                }
            }
            if (src.value === "bool") {
                if (src.valueFormat === null || src.valueFormat === undefined) {
                    value = { kind: "boolean" };
                }
            }

            if (key && value) {
                return { key, value };
            }
        }
        return null;
    },
    tsType(v) {
        // Resolve key type
        let keyT: string;
        if (v.key.kind === "int" || v.key.kind === "uint") {
            if (v.key.bits <= 32) {
                keyT = `number`;
            } else {
                keyT = `bigint`;
            }
        } else if (v.key.kind === "address") {
            keyT = `Address`;
        } else {
            throw Error("Unexpected key type");
        }

        // Resolve value type
        let valueT: string;
        if (v.value.kind === "int" || v.value.kind === "uint") {
            if (v.value.bits <= 32) {
                valueT = `number`;
            } else {
                valueT = `bigint`;
            }
        } else if (v.value.kind === "boolean") {
            valueT = `boolean`;
        } else if (v.value.kind === "address") {
            valueT = `Address`;
        } else if (v.value.kind === "cell") {
            valueT = `Cell`;
        } else if (v.value.kind === "struct") {
            valueT = v.value.type;
        } else {
            throw Error("Unexpected key type");
        }

        return `Dictionary<${keyT}, ${valueT}>`;
    },
    tsLoad(v, slice, field, w) {
        w.append(
            `let ${field} = Dictionary.load(${getKeyParser(v.key)}, ${getValueParser(v.value)}, ${slice});`,
        );
    },
    tsLoadTuple(v, reader, field, w) {
        w.append(
            `let ${field} = Dictionary.loadDirect(${getKeyParser(v.key)}, ${getValueParser(v.value)}, ${reader}.readCellOpt());`,
        );
    },
    tsStore(v, builder, field, w) {
        w.append(
            `${builder}.storeDict(${field}, ${getKeyParser(v.key)}, ${getValueParser(v.value)});`,
        );
    },
    tsStoreTuple(v, to, field, w) {
        w.append(
            `${to}.writeCell(${field}.size > 0 ? beginCell().storeDictDirect(${field}, ${getKeyParser(v.key)}, ${getValueParser(v.value)}).endCell() : null);`,
        );
    },
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
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

    // Guard to catch all primitive types that wasn't handled
    guard,

    // Structs as fallback
    struct,
    map,
];
