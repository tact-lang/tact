import type { ABITypeRef } from "@ton/core";
import type * as A from "../ast/ast";
import {
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
} from "../ast/ast-helpers";
import {
    idTextErr,
    throwCompilationError,
    throwInternalCompilerError,
} from "../error/errors";
import type { TypeRef } from "./types";
import type { CompilerContext } from "../context/context";
import { getType } from "./resolveDescriptors";
import type { SrcInfo } from "../grammar";

type FormatDef = Record<
    string,
    { type: string; format: string | number } | undefined
>;

const uintOptions: FormatDef = Object.fromEntries(
    [...Array(256).keys()].map((key) => [
        `uint${key + 1}`,
        { type: "uint", format: key + 1 },
    ]),
);

const intOptions: FormatDef = Object.fromEntries(
    [...Array(256).keys()].map((key) => [
        `int${key + 1}`,
        { type: "int", format: key + 1 },
    ]),
);

const intFormats: FormatDef = {
    ...uintOptions,
    ...intOptions,
    int257: { type: "int", format: 257 },
    coins: { type: "uint", format: "coins" },
    varint16: { type: "int", format: "varint16" },
    varint32: { type: "int", format: "varint32" },
    varuint16: { type: "uint", format: "varuint16" },
    varuint32: { type: "uint", format: "varuint32" },
};

// only fixed-width integer map keys are supported
export const intMapKeyFormats: FormatDef = {
    ...uintOptions,
    ...intOptions,
    int257: { type: "int", format: 257 },
};

export const intMapValFormats: FormatDef = { ...intFormats };

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

type ResolveTypeOptions = {
    readonly type: A.AstType;
    readonly as: A.AstId | undefined;
    readonly loc: SrcInfo;
};

export function resolveABIType({
    type,
    as,
    loc,
}: ResolveTypeOptions): ABITypeRef {
    if (
        type.kind === "type_id" ||
        (type.kind === "optional_type" && type.typeArg.kind == "type_id")
    ) {
        //
        // Primitive types
        //

        const typeId: A.AstTypeId =
            type.kind === "type_id"
                ? type
                : type.typeArg.kind === "type_id"
                  ? type.typeArg
                  : throwInternalCompilerError(
                        "Only optional type identifiers are supported now",
                        type.typeArg.loc,
                    );

        if (isInt(typeId)) {
            if (as) {
                const fmt = intFormats[idText(as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(as)}`,
                        loc,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: type.kind === "optional_type",
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "int",
                optional: type.kind === "optional_type",
                format: 257,
            }; // Default is maximum size int
        }
        if (isBool(typeId)) {
            if (as) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(as)}`,
                    loc,
                );
            }
            return {
                kind: "simple",
                type: "bool",
                optional: type.kind === "optional_type",
            };
        }
        if (isCell(typeId)) {
            if (as) {
                const fmt = cellFormats[idText(as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(as)}`,
                        loc,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: type.kind === "optional_type",
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "cell",
                optional: type.kind === "optional_type",
            };
        }
        if (isSlice(typeId)) {
            if (as) {
                const fmt = sliceFormats[idText(as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(as)}`,
                        loc,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: type.kind === "optional_type",
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "slice",
                optional: type.kind === "optional_type",
            };
        }
        if (isBuilder(typeId)) {
            if (as) {
                const fmt = builderFormats[idText(as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(as)}`,
                        loc,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: type.kind === "optional_type",
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "builder",
                optional: type.kind === "optional_type",
            };
        }
        if (isAddress(typeId)) {
            if (as) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(as)}`,
                    loc,
                );
            }
            return {
                kind: "simple",
                type: "address",
                optional: type.kind === "optional_type",
            };
        }
        if (isString(typeId)) {
            if (as) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(as)}`,
                    loc,
                );
            }
            return {
                kind: "simple",
                type: "string",
                optional: type.kind === "optional_type",
            };
        }
        if (isStringBuilder(typeId)) {
            throwCompilationError(`Unsupported type StringBuilder`, loc);
        }

        //
        // Structs
        //

        if (as) {
            if (eqNames(as, "reference")) {
                return {
                    kind: "simple",
                    type: idText(typeId),
                    optional: type.kind === "optional_type",
                    format: "ref",
                };
            } else {
                throwCompilationError(
                    `Unsupported format ${idTextErr(as)}`,
                    loc,
                );
            }
        }
        return {
            kind: "simple",
            type: idText(typeId),
            optional: type.kind === "optional_type",
        };
    }

    //
    // Map
    //

    if (type.kind === "map_type") {
        let key: string;
        let keyFormat: string | number | undefined = undefined;
        let value: string;
        let valueFormat: string | number | undefined = undefined;

        // Resolve key type
        if (isInt(type.keyType)) {
            key = "int";
            if (type.keyStorageType) {
                const format = intMapKeyFormats[idText(type.keyStorageType)];
                if (!format) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(type.keyStorageType)} for map key`,
                        loc,
                    );
                }
                key = format.type;
                keyFormat = format.format;
            }
        } else if (isAddress(type.keyType)) {
            key = "address";
            if (type.keyStorageType) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(type.keyStorageType)} for map key`,
                    loc,
                );
            }
        } else {
            throwCompilationError(
                `Unsupported map key type ${idTextErr(type.keyType)}`,
                loc,
            );
        }

        // Resolve value type
        if (isInt(type.valueType)) {
            value = "int";
            if (type.valueStorageType) {
                const format = intMapValFormats[idText(type.valueStorageType)];
                if (!format) {
                    throwCompilationError(
                        `Unsupported format ${idText(type.valueStorageType)} for map value`,
                        loc,
                    );
                }
                value = format.type;
                valueFormat = format.format;
            }
        } else if (isBool(type.valueType)) {
            value = "bool";
            if (type.valueStorageType) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(type.valueStorageType)} for map value`,
                    loc,
                );
            }
        } else if (isCell(type.valueType)) {
            value = "cell";
            valueFormat = "ref";
            if (
                type.valueStorageType &&
                eqNames(type.valueStorageType, "reference")
            ) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(type.valueStorageType)} for map value`,
                    loc,
                );
            }
        } else if (isSlice(type.valueType)) {
            throwCompilationError(
                `Unsupported map value type ${idTextErr(type.valueType)}`,
                loc,
            );
        } else if (isAddress(type.valueType)) {
            value = "address";
            if (type.valueStorageType) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(type.valueStorageType)} for map value`,
                    loc,
                );
            }
        } else if (isString(type.valueType)) {
            throwCompilationError(
                `Unsupported map value type ${idTextErr(type.valueType)}`,
                loc,
            );
        } else if (
            isStringBuilder(type.valueType) ||
            isBuilder(type.valueType)
        ) {
            throwCompilationError(
                `Unsupported map value type ${idTextErr(type.valueType)}`,
                loc,
            );
        } else {
            value = idText(type.valueType);
            valueFormat = "ref";
            if (
                type.valueStorageType &&
                eqNames(type.valueStorageType, "reference")
            ) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(type.valueStorageType)} for map value`,
                    loc,
                );
            }
        }

        return { kind: "dict", key, keyFormat, value, valueFormat };
    }

    throwCompilationError(`Unsupported type`, loc);
}

export function createABITypeRefFromTypeRef(
    ctx: CompilerContext,
    src: TypeRef,
    loc: SrcInfo,
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
            throwInternalCompilerError(`Unsupported type "${src.name}"`);
        }

        // Structs
        const type = getType(ctx, src.name);
        if (type.kind === "contract") {
            return {
                kind: "simple",
                type: src.name + "$Data",
                optional: src.optional,
            };
        } else {
            return { kind: "simple", type: src.name, optional: src.optional };
        }
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
                const format = intMapKeyFormats[src.keyAs];
                if (!format) {
                    throwCompilationError(
                        `Unsupported format ${src.keyAs} for map key`,
                        loc,
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
                    loc,
                );
            }
        } else {
            throwInternalCompilerError(`Unsupported map key type "${src.key}"`);
        }

        // Resolve value type
        if (src.value === "Int") {
            value = "int";
            if (src.valueAs) {
                const format = intMapValFormats[src.valueAs];
                if (!format) {
                    throwCompilationError(
                        `Unsupported format ${src.valueAs} for map value`,
                        loc,
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
                    loc,
                );
            }
        } else if (src.value === "Cell") {
            value = "cell";
            valueFormat = "ref";
            if (src.valueAs && src.valueAs !== "reference") {
                throwCompilationError(
                    `Unsupported format ${src.valueAs} for map value`,
                    loc,
                );
            }
        } else if (src.value === "Slice") {
            throwInternalCompilerError(
                `Unsupported map value type "${src.value}"`,
            );
        } else if (src.value === "Address") {
            value = "address";
            if (src.valueAs) {
                throwCompilationError(
                    `Unsupported format ${src.valueAs} for map value`,
                    loc,
                );
            }
        } else if (src.value === "String") {
            throwInternalCompilerError(
                `Unsupported map value type "${src.value}"`,
            );
        } else if (src.value === "StringBuilder" || src.value === "Builder") {
            throwInternalCompilerError(
                `Unsupported map value type "${src.value}"`,
            );
        } else {
            value = src.value;
            valueFormat = "ref";
            if (src.valueAs && src.valueAs !== "reference") {
                throwCompilationError(
                    `Unsupported format ${src.valueAs} for map value`,
                    loc,
                );
            }
        }

        return { kind: "dict", key, keyFormat, value, valueFormat };
    }

    if (src.kind === "ref_bounced") {
        throwInternalCompilerError("Unexpected bounced reference");
    }

    throwInternalCompilerError(`Unsupported type`);
}
