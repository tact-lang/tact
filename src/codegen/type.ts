import { CompilerContext } from "../context";
import { TypeDescription, TypeRef } from "../types/types";
import { getType } from "../types/resolveDescriptors";
import { FuncAstType } from "../func/grammar";
import { Type, unit } from "../func/syntaxConstructors";
import { ABITypeRef } from "@ton/core";

/**
 * Unpacks string representation of a user-defined Tact type from its type description.
 * The generated string represents an identifier avialable in the current scope.
 */
export function resolveFuncTypeUnpack(
    ctx: CompilerContext,
    descriptor: TypeRef | TypeDescription | string,
    name: string,
    optional: boolean = false,
    usePartialFields: boolean = false,
): string {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncTypeUnpack(
            ctx,
            getType(ctx, descriptor),
            name,
            false,
            usePartialFields,
        );
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncTypeUnpack(
            ctx,
            getType(ctx, descriptor.name),
            name,
            descriptor.optional,
            usePartialFields,
        );
    }
    if (descriptor.kind === "map") {
        return name;
    }
    if (descriptor.kind === "ref_bounced") {
        return resolveFuncTypeUnpack(
            ctx,
            getType(ctx, descriptor.name),
            name,
            false,
            true,
        );
    }
    if (descriptor.kind === "void") {
        throw Error(`Void type is not allowed in function arguments: ${name}`);
    }

    // TypeDescription
    if (descriptor.kind === "primitive_type_decl") {
        return name;
    } else if (descriptor.kind === "struct") {
        const fieldsToUse = usePartialFields
            ? descriptor.fields.slice(0, descriptor.partialFieldCount)
            : descriptor.fields;
        if (optional || fieldsToUse.length === 0) {
            return name;
        } else {
            return (
                "(" +
                fieldsToUse
                    .map((v) =>
                        resolveFuncTypeUnpack(
                            ctx,
                            v.type,
                            name + `'` + v.name,
                            false,
                            usePartialFields,
                        ),
                    )
                    .join(", ") +
                ")"
            );
        }
    } else if (descriptor.kind === "contract") {
        if (optional || descriptor.fields.length === 0) {
            return name;
        } else {
            return (
                "(" +
                descriptor.fields
                    .map((v) =>
                        resolveFuncTypeUnpack(
                            ctx,
                            v.type,
                            name + `'` + v.name,
                            false,
                            usePartialFields,
                        ),
                    )
                    .join(", ") +
                ")"
            );
        }
    }

    // Unreachable
    throw Error(`Unknown type: ${descriptor.kind}`);
}

/**
 * Generates Func type from the Tact type.
 */
export function resolveFuncType(
    ctx: CompilerContext,
    descriptor: TypeRef | TypeDescription | string,
    optional: boolean = false,
    usePartialFields: boolean = false,
): FuncAstType {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncType(
            ctx,
            getType(ctx, descriptor),
            false,
            usePartialFields,
        );
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncType(
            ctx,
            getType(ctx, descriptor.name),
            descriptor.optional,
            usePartialFields,
        );
    }
    if (descriptor.kind === "map") {
        return Type.cell();
    }
    if (descriptor.kind === "ref_bounced") {
        return resolveFuncType(ctx, getType(ctx, descriptor.name), false, true);
    }
    if (descriptor.kind === "void") {
        return unit();
    }

    // TypeDescription
    if (descriptor.kind === "primitive_type_decl") {
        if (descriptor.name === "Int") {
            return Type.int();
        } else if (descriptor.name === "Bool") {
            return Type.int();
        } else if (descriptor.name === "Slice") {
            return Type.slice();
        } else if (descriptor.name === "Cell") {
            return Type.cell();
        } else if (descriptor.name === "Builder") {
            return Type.builder();
        } else if (descriptor.name === "Address") {
            return Type.slice();
        } else if (descriptor.name === "String") {
            return Type.slice();
        } else if (descriptor.name === "StringBuilder") {
            return Type.tuple();
        } else {
            throw Error(`Unknown primitive type: ${descriptor.name}`);
        }
    } else if (descriptor.kind === "struct") {
        const fieldsToUse = usePartialFields
            ? descriptor.fields.slice(0, descriptor.partialFieldCount)
            : descriptor.fields;
        if (optional || fieldsToUse.length === 0) {
            return Type.tuple();
        } else {
            return Type.tensor(
                ...fieldsToUse.map((v) =>
                    resolveFuncType(ctx, v.type, false, usePartialFields),
                ),
            );
        }
    } else if (descriptor.kind === "contract") {
        if (optional || descriptor.fields.length === 0) {
            return Type.tuple();
        } else {
            return Type.tensor(
                ...descriptor.fields.map((v) =>
                    resolveFuncType(ctx, v.type, false, usePartialFields),
                ),
            );
        }
    }

    // Unreachable
    throw Error(`Unknown type: ${descriptor.kind}`);
}

export function resolveFuncTupleType(
    ctx: CompilerContext,
    descriptor: TypeRef | TypeDescription | string,
): FuncAstType {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncTupleType(ctx, getType(ctx, descriptor));
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncTupleType(ctx, getType(ctx, descriptor.name));
    }
    if (descriptor.kind === "map") {
        return Type.cell();
    }
    if (descriptor.kind === "ref_bounced") {
        throw Error("Unimplemented");
    }
    if (descriptor.kind === "void") {
        return Type.tensor();
    }

    // TypeDescription
    if (descriptor.kind === "primitive_type_decl") {
        if (descriptor.name === "Int") {
            return Type.int();
        } else if (descriptor.name === "Bool") {
            return Type.int();
        } else if (descriptor.name === "Slice") {
            return Type.slice();
        } else if (descriptor.name === "Cell") {
            return Type.cell();
        } else if (descriptor.name === "Builder") {
            return Type.builder();
        } else if (descriptor.name === "Address") {
            return Type.slice();
        } else if (descriptor.name === "String") {
            return Type.slice();
        } else if (descriptor.name === "StringBuilder") {
            return Type.tuple();
        } else {
            throw Error(`Unknown primitive type: ${descriptor.name}`);
        }
    } else if (descriptor.kind === "struct") {
        return Type.tuple();
    }

    // Unreachable
    throw Error(`Unknown type: ${descriptor.kind}`);
}

export function resolveFuncFlatPack(
    ctx: CompilerContext,
    descriptor: TypeRef | TypeDescription | string,
    name: string,
    optional: boolean = false,
): string[] {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncFlatPack(ctx, getType(ctx, descriptor), name);
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncFlatPack(
            ctx,
            getType(ctx, descriptor.name),
            name,
            descriptor.optional,
        );
    }
    if (descriptor.kind === "map") {
        return [name];
    }
    if (descriptor.kind === "ref_bounced") {
        throw Error("Unimplemented");
    }
    if (descriptor.kind === "void") {
        throw Error("Void type is not allowed in function arguments: " + name);
    }

    // TypeDescription
    if (descriptor.kind === "primitive_type_decl") {
        return [name];
    } else if (descriptor.kind === "struct") {
        if (optional || descriptor.fields.length === 0) {
            return [name];
        } else {
            return descriptor.fields.flatMap((v) =>
                resolveFuncFlatPack(ctx, v.type, name + `'` + v.name),
            );
        }
    } else if (descriptor.kind === "contract") {
        if (optional || descriptor.fields.length === 0) {
            return [name];
        } else {
            return descriptor.fields.flatMap((v) =>
                resolveFuncFlatPack(ctx, v.type, name + `'` + v.name),
            );
        }
    }

    // Unreachable
    throw Error("Unknown type: " + descriptor.kind);
}

export function resolveFuncFlatTypes(
    ctx: CompilerContext,
    descriptor: TypeRef | TypeDescription | string,
    optional: boolean = false,
): FuncAstType[] {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncFlatTypes(ctx, getType(ctx, descriptor));
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncFlatTypes(
            ctx,
            getType(ctx, descriptor.name),
            descriptor.optional,
        );
    }
    if (descriptor.kind === "map") {
        return [Type.cell()];
    }
    if (descriptor.kind === "ref_bounced") {
        throw Error("Unimplemented");
    }
    if (descriptor.kind === "void") {
        throw Error("Void type is not allowed in function arguments");
    }

    // TypeDescription
    if (descriptor.kind === "primitive_type_decl") {
        return [resolveFuncType(ctx, descriptor)];
    } else if (descriptor.kind === "struct") {
        if (optional || descriptor.fields.length === 0) {
            return [Type.tuple()];
        } else {
            return descriptor.fields.flatMap((v) =>
                resolveFuncFlatTypes(ctx, v.type),
            );
        }
    } else if (descriptor.kind === "contract") {
        if (optional || descriptor.fields.length === 0) {
            return [Type.tuple()];
        } else {
            return descriptor.fields.flatMap((v) =>
                resolveFuncFlatTypes(ctx, v.type),
            );
        }
    }

    // Unreachable
    throw Error("Unknown type: " + descriptor.kind);
}

export function resolveFuncTypeFromAbi(
    ctx: CompilerContext,
    fields: ABITypeRef[],
): string {
    if (fields.length === 0) {
        return "tuple";
    }
    const res: string[] = [];
    for (const f of fields) {
        switch (f.kind) {
            case "dict":
                {
                    res.push("cell");
                }
                break;
            case "simple": {
                if (
                    f.type === "int" ||
                    f.type === "uint" ||
                    f.type === "bool"
                ) {
                    res.push("int");
                } else if (f.type === "cell") {
                    res.push("cell");
                } else if (f.type === "slice") {
                    res.push("slice");
                } else if (f.type === "builder") {
                    res.push("builder");
                } else if (f.type === "address") {
                    res.push("slice");
                } else if (f.type === "fixed-bytes") {
                    res.push("slice");
                } else if (f.type === "string") {
                    res.push("slice");
                } else {
                    const t = getType(ctx, f.type);
                    if (t.kind !== "struct") {
                        throw Error("Unsupported type: " + t.kind);
                    }
                    if (f.optional ?? t.fields.length === 0) {
                        res.push("tuple");
                    } else {
                        const loaded = t.fields.map((v) => v.abi.type);
                        res.push(resolveFuncTypeFromAbi(ctx, loaded));
                    }
                }
            }
        }
    }
    return `(${res.join(", ")})`;
}

export function resolveFuncTypeFromAbiUnpack(
    ctx: CompilerContext,
    name: string,
    fields: { name: string; type: ABITypeRef }[],
): string {
    if (fields.length === 0) {
        return name;
    }
    const res: string[] = [];
    for (const f of fields) {
        switch (f.type.kind) {
            case "dict":
                {
                    res.push(`${name}'${f.name}`);
                }
                break;
            case "simple":
                {
                    if (
                        f.type.type === "int" ||
                        f.type.type === "uint" ||
                        f.type.type === "bool"
                    ) {
                        res.push(`${name}'${f.name}`);
                    } else if (f.type.type === "cell") {
                        res.push(`${name}'${f.name}`);
                    } else if (f.type.type === "slice") {
                        res.push(`${name}'${f.name}`);
                    } else if (f.type.type === "builder") {
                        res.push(`${name}'${f.name}`);
                    } else if (f.type.type === "address") {
                        res.push(`${name}'${f.name}`);
                    } else if (f.type.type === "fixed-bytes") {
                        res.push(`${name}'${f.name}`);
                    } else if (f.type.type === "string") {
                        res.push(`${name}'${f.name}`);
                    } else {
                        const t = getType(ctx, f.type.type);
                        if (f.type.optional ?? t.fields.length === 0) {
                            res.push(`${name}'${f.name}`);
                        } else {
                            const loaded = t.fields.map((v) => v.abi);
                            res.push(
                                resolveFuncTypeFromAbiUnpack(
                                    ctx,
                                    `${name}'${f.name}`,
                                    loaded,
                                ),
                            );
                        }
                    }
                }
                break;
        }
    }
    return `(${res.join(", ")})`;
}
