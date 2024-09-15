import { ABITypeRef } from "@ton/core";
import {
    AstFieldDecl,
    AstTypeId,
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
import {
    idTextErr,
    throwCompilationError,
    throwInternalCompilerError,
} from "../errors";
import { TypeRef } from "./types";
import { CompilerContext } from "../context";
import { getType } from "./resolveDescriptors";

type FormatDef = Record<
    string,
    { type: string; format: string | number } | undefined
>;

const uintOptions: FormatDef = Object.fromEntries(
    [...Array(257).keys()]
        .slice(1)
        .map((key) => [`uint${key}`, { type: "uint", format: key }]),
);

const intOptions: FormatDef = Object.fromEntries(
    [...Array(257).keys()]
        .slice(1)
        .map((key) => [`int${key}`, { type: "int", format: key }]),
);

const intFormats: FormatDef = {
    ...uintOptions,
    ...intOptions,
    int257: { type: "int", format: 257 },
    coins: { type: "uint", format: "coins" },
};

export const intMapFormats: FormatDef = { ...intFormats };

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

export function resolveABIType(src: AstFieldDecl): ABITypeRef {
    if (
        src.type.kind === "type_id" ||
        (src.type.kind === "optional_type" &&
            src.type.typeArg.kind == "type_id")
    ) {
        //
        // Primitive types
        //

        const typeId: AstTypeId =
            src.type.kind === "type_id"
                ? src.type
                : src.type.typeArg.kind === "type_id"
                  ? src.type.typeArg
                  : throwInternalCompilerError(
                        "Only optional type identifiers are supported now",
                        src.type.typeArg.loc,
                    );

        if (isInt(typeId)) {
            if (src.as) {
                const fmt = intFormats[idText(src.as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(src.as)}`,
                        src.loc,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: src.type.kind === "optional_type",
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "int",
                optional: src.type.kind === "optional_type",
                format: 257,
            }; // Default is maximum size int
        }
        if (isBool(typeId)) {
            if (src.as) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.as)}`,
                    src.loc,
                );
            }
            return {
                kind: "simple",
                type: "bool",
                optional: src.type.kind === "optional_type",
            };
        }
        if (isCell(typeId)) {
            if (src.as) {
                const fmt = cellFormats[idText(src.as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(src.as)}`,
                        src.loc,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: src.type.kind === "optional_type",
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "cell",
                optional: src.type.kind === "optional_type",
            };
        }
        if (isSlice(typeId)) {
            if (src.as) {
                const fmt = sliceFormats[idText(src.as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(src.as)}`,
                        src.loc,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: src.type.kind === "optional_type",
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "slice",
                optional: src.type.kind === "optional_type",
            };
        }
        if (isBuilder(typeId)) {
            if (src.as) {
                const fmt = builderFormats[idText(src.as)];
                if (!fmt) {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(src.as)}`,
                        src.loc,
                    );
                }
                return {
                    kind: "simple",
                    type: fmt.type,
                    optional: src.type.kind === "optional_type",
                    format: fmt.format,
                };
            }
            return {
                kind: "simple",
                type: "builder",
                optional: src.type.kind === "optional_type",
            };
        }
        if (isAddress(typeId)) {
            if (src.as) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.as)}`,
                    src.loc,
                );
            }
            return {
                kind: "simple",
                type: "address",
                optional: src.type.kind === "optional_type",
            };
        }
        if (isString(typeId)) {
            if (src.as) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.as)}`,
                    src.loc,
                );
            }
            return {
                kind: "simple",
                type: "string",
                optional: src.type.kind === "optional_type",
            };
        }
        if (isStringBuilder(typeId)) {
            throwCompilationError(`Unsupported type StringBuilder`, src.loc);
        }

        //
        // Structs
        //

        if (src.as) {
            if (eqNames(src.as, "reference")) {
                return {
                    kind: "simple",
                    type: idText(typeId),
                    optional: src.type.kind === "optional_type",
                    format: "ref",
                };
            } else {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.as)}`,
                    src.loc,
                );
            }
        }
        return {
            kind: "simple",
            type: idText(typeId),
            optional: src.type.kind === "optional_type",
        };
    }

    //
    // Map
    //

    if (src.type.kind === "map_type") {
        let key: string;
        let keyFormat: string | number | undefined = undefined;
        let value: string;
        let valueFormat: string | number | undefined = undefined;

        // Resolve key type
        if (isInt(src.type.keyType)) {
            key = "int";
            if (src.type.keyStorageType) {
                const format = intMapFormats[idText(src.type.keyStorageType)];
                if (!format || format.format === "coins") {
                    throwCompilationError(
                        `Unsupported format ${idTextErr(src.type.keyStorageType)} for map key`,
                        src.loc,
                    );
                }
                key = format.type;
                keyFormat = format.format;
            }
        } else if (isAddress(src.type.keyType)) {
            key = "address";
            if (src.type.keyStorageType) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.keyStorageType)} for map key`,
                    src.loc,
                );
            }
        } else {
            throwCompilationError(
                `Unsupported map key type ${idTextErr(src.type.keyType)}`,
                src.loc,
            );
        }

        // Resolve value type
        if (isInt(src.type.valueType)) {
            value = "int";
            if (src.type.valueStorageType) {
                const format = intMapFormats[idText(src.type.valueStorageType)];
                if (!format) {
                    throwCompilationError(
                        `Unsupported format ${idText(src.type.valueStorageType)} for map value`,
                        src.loc,
                    );
                }
                value = format.type;
                valueFormat = format.format;
            }
        } else if (isBool(src.type.valueType)) {
            value = "bool";
            if (src.type.valueStorageType) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.valueStorageType)} for map value`,
                    src.loc,
                );
            }
        } else if (isCell(src.type.valueType)) {
            value = "cell";
            valueFormat = "ref";
            if (
                src.type.valueStorageType &&
                eqNames(src.type.valueStorageType, "reference")
            ) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.valueStorageType)} for map value`,
                    src.loc,
                );
            }
        } else if (isSlice(src.type.valueType)) {
            throwCompilationError(
                `Unsupported map value type ${idTextErr(src.type.valueType)}`,
                src.loc,
            );
        } else if (isAddress(src.type.valueType)) {
            value = "address";
            if (src.type.valueStorageType) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.valueStorageType)} for map value`,
                    src.loc,
                );
            }
        } else if (isString(src.type.valueType)) {
            throwCompilationError(
                `Unsupported map value type ${idTextErr(src.type.valueType)}`,
                src.loc,
            );
        } else if (
            isStringBuilder(src.type.valueType) ||
            isBuilder(src.type.valueType)
        ) {
            throwCompilationError(
                `Unsupported map value type ${idTextErr(src.type.valueType)}`,
                src.loc,
            );
        } else {
            value = idText(src.type.valueType);
            valueFormat = "ref";
            if (
                src.type.valueStorageType &&
                eqNames(src.type.valueStorageType, "reference")
            ) {
                throwCompilationError(
                    `Unsupported format ${idTextErr(src.type.valueStorageType)} for map value`,
                    src.loc,
                );
            }
        }

        return { kind: "dict", key, keyFormat, value, valueFormat };
    }

    throwCompilationError(`Unsupported type`, src.loc);
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
                const format = intMapFormats[src.keyAs];
                if (!format || src.keyAs === "coins") {
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
                const format = intMapFormats[src.valueAs];
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
