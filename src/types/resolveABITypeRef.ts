import { ABITypeRef } from "@ton/core";
import {
    ASTField,
    eqNames,
    idText,
    isAddress,
    isBool,
    isBuilder,
    isCell,
    isInt,
    isSlice,
    isString,
    isStringBuilder,
    SrcInfo,
} from "../grammar/ast";
import { idTextErr, throwCompilationError } from "../errors";
import { TypeRef } from "./types";

type FormatDef = { [key: string]: { type: string; format: string | number } };

const intFormats: FormatDef = {
    int8: { type: "int", format: 8 },
    int16: { type: "int", format: 16 },
    int32: { type: "int", format: 32 },
    int64: { type: "int", format: 64 },
    int128: { type: "int", format: 128 },
    int256: { type: "int", format: 256 },

    uint8: { type: "uint", format: 8 },
    uint16: { type: "uint", format: 16 },
    uint32: { type: "uint", format: 32 },
    uint64: { type: "uint", format: 64 },
    uint128: { type: "uint", format: 128 },
    uint256: { type: "uint", format: 256 },

    int257: { type: "int", format: 257 },
    coins: { type: "uint", format: "coins" },
};

const intMapFormats: FormatDef = {
    int8: { type: "int", format: 8 },
    int16: { type: "int", format: 16 },
    int32: { type: "int", format: 32 },
    int64: { type: "int", format: 64 },
    int128: { type: "int", format: 128 },
    int256: { type: "int", format: 256 },

    uint8: { type: "uint", format: 8 },
    uint16: { type: "uint", format: 16 },
    uint32: { type: "uint", format: 32 },
    uint64: { type: "uint", format: 64 },
    uint128: { type: "uint", format: 128 },
    uint256: { type: "uint", format: 256 },

    int257: { type: "int", format: 257 },
    coins: { type: "uint", format: "coins" },
};

const cellFormats: FormatDef = {
    remaining: { type: "cell", format: "remainder" },
};

const sliceFormats: FormatDef = {
    remaining: { type: "slice", format: "remainder" },
    bytes32: { type: "fixed-bytes", format: 32 },
    bytes64: { type: "fixed-bytes", format: 64 },
};

const builderFormats: FormatDef = {
    remaining: { type: "builder", format: "remainder" },
};

export function resolveABIType(src: ASTField): ABITypeRef {
    if (src.type.kind === "type_ref_simple") {
        //
        // Primitive types
        //

        if (isInt(src.type.name)) {
            if (src.as) {
                const fmt = intFormats[idText(src.as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(src.as)}`,
                        src.ref,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: src.type.optional,
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "int",
                optional: src.type.optional,
                format: 257,
            }; // Default is maximum size int
        }
        if (isBool(src.type.name)) {
            if (src.as) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.as)}`,
                    src.ref,
                );
            }
            return {
                kind: "simple",
                type: "bool",
                optional: src.type.optional,
            };
        }
        if (isCell(src.type.name)) {
            if (src.as) {
                const fmt = cellFormats[idText(src.as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(src.as)}`,
                        src.ref,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: src.type.optional,
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "cell",
                optional: src.type.optional,
            };
        }
        if (isSlice(src.type.name)) {
            if (src.as) {
                if (src.as) {
                    const fmt = sliceFormats[idText(src.as)];
                    if (!fmt) {
                        throwCompilationError(
                            `Unsupported format ${idTextErr(src.as)}`,
                            src.ref,
                        );
                    }
                    return {
                        kind: "simple",
                        type: fmt.type,
                        optional: src.type.optional,
                        format: fmt.format,
                    };
                }
            }
            return {
                kind: "simple",
                type: "slice",
                optional: src.type.optional,
            };
        }
        if (isBuilder(src.type.name)) {
            if (src.as) {
                if (src.as) {
                    const fmt = builderFormats[idText(src.as)];
                    if (!fmt) {
                        throwCompilationError(
                            `Unsupported format ${idTextErr(src.as)}`,
                            src.ref,
                        );
                    }
                    return {
                        kind: "simple",
                        type: fmt.type,
                        optional: src.type.optional,
                        format: fmt.format,
                    };
                }
            }
            return {
                kind: "simple",
                type: "builder",
                optional: src.type.optional,
            };
        }
        if (isAddress(src.type.name)) {
            if (src.as) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.as)}`,
                    src.ref,
                );
            }
            return {
                kind: "simple",
                type: "address",
                optional: src.type.optional,
            };
        }
        if (isString(src.type.name)) {
            if (src.as) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.as)}`,
                    src.ref,
                );
            }
            return {
                kind: "simple",
                type: "string",
                optional: src.type.optional,
            };
        }
        if (isStringBuilder(src.type.name)) {
            throwCompilationError(
                `Unsupported type ${idTextErr(src.type.name)}`,
                src.ref,
            );
        }

        //
        // Structs
        //

        if (src.as) {
            if (eqNames(src.as, "reference")) {
                return {
                    kind: "simple",
                    type: idText(src.type.name),
                    optional: src.type.optional,
                    format: "ref",
                };
            } else {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.as)}`,
                    src.ref,
                );
            }
        }
        return {
            kind: "simple",
            type: idText(src.type.name),
            optional: src.type.optional,
        };
    }

    //
    // Map
    //

    if (src.type.kind === "type_ref_map") {
        let key: string;
        let keyFormat: string | number | undefined = undefined;
        let value: string;
        let valueFormat: string | number | undefined = undefined;

        // Resolve key type
        if (isInt(src.type.key)) {
            key = "int";
            if (src.type.keyAs) {
                const format = intMapFormats[idText(src.type.keyAs)];
                if (!format) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(src.type.keyAs)} for map key`,
                        src.ref,
                    );
                }
                key = format.type;
                keyFormat = format.format;
            }
        } else if (isAddress(src.type.key)) {
            key = "address";
            if (src.type.keyAs) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.keyAs)} for map key`,
                    src.ref,
                );
            }
        } else {
            throwCompilationError(
                `Unsupported map key type ${idTextErr(src.type.key)}`,
                src.ref,
            );
        }

        // Resolve value type
        if (isInt(src.type.value)) {
            value = "int";
            if (src.type.valueAs) {
                const format = intMapFormats[idText(src.type.valueAs)];
                if (!format) {
                    throwCompilationError(
                        `Unsupported format ${idText(src.type.valueAs)} for map value`,
                        src.ref,
                    );
                }
                value = format.type;
                valueFormat = format.format;
            }
        } else if (isBool(src.type.value)) {
            value = "bool";
            if (src.type.valueAs) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.valueAs)} for map value`,
                    src.ref,
                );
            }
        } else if (isCell(src.type.value)) {
            value = "cell";
            valueFormat = "ref";
            if (src.type.valueAs && eqNames(src.type.valueAs, "reference")) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.valueAs)} for map value`,
                    src.ref,
                );
            }
        } else if (isSlice(src.type.value)) {
            throwCompilationError(
                `Unsupported map value type ${idTextErr(src.type.value)}`,
                src.ref,
            );
        } else if (isAddress(src.type.value)) {
            value = "address";
            if (src.type.valueAs) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.valueAs)} for map value`,
                    src.ref,
                );
            }
        } else if (isString(src.type.value)) {
            throwCompilationError(
                `Unsupported map value type ${idTextErr(src.type.value)}`,
                src.ref,
            );
        } else if (
            isStringBuilder(src.type.value) ||
            isBuilder(src.type.value)
        ) {
            throwCompilationError(
                `Unsupported map value type ${idTextErr(src.type.value)}`,
                src.ref,
            );
        } else {
            value = idText(src.type.value);
            valueFormat = "ref";
            if (src.type.valueAs && eqNames(src.type.valueAs, "reference")) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.valueAs)} for map value`,
                    src.ref,
                );
            }
        }

        return { kind: "dict", key, keyFormat, value, valueFormat };
    }

    throwCompilationError(`Unsupported type`, src.ref);
}

export function createABITypeRefFromTypeRef(
    src: TypeRef,
    ref: SrcInfo,
): ABITypeRef {
    if (src.kind === "ref") {
        // Primitives
        if (src.name === "Int") {
            return {
                kind: "simple",
                type: "int",
                optional: src.optional,
                format: 257,
            }; // Default is maximum size int
        }
        if (src.name === "Bool") {
            return { kind: "simple", type: "bool", optional: src.optional };
        }
        if (src.name === "Cell") {
            return { kind: "simple", type: "cell", optional: src.optional };
        }
        if (src.name === "Slice") {
            return { kind: "simple", type: "slice", optional: src.optional };
        }
        if (src.name === "Builder") {
            return { kind: "simple", type: "builder", optional: src.optional };
        }
        if (src.name === "Address") {
            return { kind: "simple", type: "address", optional: src.optional };
        }
        if (src.name === "String") {
            return { kind: "simple", type: "string", optional: src.optional };
        }
        if (src.name === "StringBuilder") {
            throw Error(`Unsupported type "${src.name}"`);
        }

        // Structs
        return { kind: "simple", type: src.name, optional: src.optional };
    }

    if (src.kind === "map") {
        let key: string;
        let keyFormat: string | number | undefined = undefined;
        let value: string;
        let valueFormat: string | number | undefined = undefined;

        // Resolve key type
        if (src.key === "Int") {
            key = "int";
            if (src.keyAs) {
                const format = intMapFormats[src.keyAs];
                if (!format) {
                    throwCompilationError(
                        `Unsupported format ${src.keyAs} for map key`,
                        ref,
                    );
                }
                key = format.type;
                keyFormat = format.format;
            }
        } else if (src.key === "Address") {
            key = "address";
            if (src.keyAs) {
                throwCompilationError(
                    `Unsupported format ${src.keyAs} for map key`,
                    ref,
                );
            }
        } else {
            throw Error(`Unsupported map key type "${src.key}"`);
        }

        // Resolve value type
        if (src.value === "Int") {
            value = "int";
            if (src.valueAs) {
                const format = intMapFormats[src.valueAs];
                if (!format) {
                    throwCompilationError(
                        `Unsupported format ${src.valueAs} for map value`,
                        ref,
                    );
                }
                value = format.type;
                valueFormat = format.format;
            }
        } else if (src.value === "Bool") {
            value = "bool";
            if (src.valueAs) {
                throwCompilationError(
                    `Unsupported format ${src.valueAs} for map value`,
                    ref,
                );
            }
        } else if (src.value === "Cell") {
            value = "cell";
            valueFormat = "ref";
            if (src.valueAs && src.valueAs !== "reference") {
                throwCompilationError(
                    `Unsupported format ${src.valueAs} for map value`,
                    ref,
                );
            }
        } else if (src.value === "Slice") {
            throw Error(`Unsupported map value type "${src.value}"`);
        } else if (src.value === "Address") {
            value = "address";
            if (src.valueAs) {
                throwCompilationError(
                    `Unsupported format ${src.valueAs} for map value`,
                    ref,
                );
            }
        } else if (src.value === "String") {
            throw Error(`Unsupported map value type "${src.value}"`);
        } else if (src.value === "StringBuilder" || src.value === "Builder") {
            throw Error(`Unsupported map value type "${src.value}"`);
        } else {
            value = src.value;
            valueFormat = "ref";
            if (src.valueAs && src.valueAs !== "reference") {
                throwCompilationError(
                    `Unsupported format ${src.valueAs} for map value`,
                    ref,
                );
            }
        }

        return { kind: "dict", key, keyFormat, value, valueFormat };
    }

    if (src.kind === "ref_bounced") {
        throw Error("Unexpected bounced reference");
    }

    throw Error(`Unsupported type`);
}
