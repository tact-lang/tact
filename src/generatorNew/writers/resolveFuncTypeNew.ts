import { WriterContext } from "../Writer";
import { TypeDescription, TypeRef } from "../../types/types";
import { getType } from "../../types/resolveDescriptors";
import { FuncAstType } from "../../func/grammar";
import { Type, unit } from "../../func/syntaxConstructors";

/**
 * Generates Func type from the Tact type.
 */
export function resolveFuncType(
    descriptor: TypeRef | TypeDescription | string,
    optional: boolean = false,
    usePartialFields: boolean = false,
    ctx: WriterContext,
): FuncAstType {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncType(
            getType(ctx.ctx, descriptor),
            false,
            usePartialFields,
            ctx,
        );
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncType(
            getType(ctx.ctx, descriptor.name),
            descriptor.optional,
            usePartialFields,
            ctx,
        );
    }
    if (descriptor.kind === "map") {
        return Type.cell();
    }
    if (descriptor.kind === "ref_bounced") {
        return resolveFuncType(getType(ctx.ctx, descriptor.name), false, true, ctx);
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
                    resolveFuncType(v.type, false, usePartialFields, ctx),
                ),
            );
        }
    } else if (descriptor.kind === "contract") {
        if (optional || descriptor.fields.length === 0) {
            return Type.tuple();
        } else {
            return Type.tensor(
                ...descriptor.fields.map((v) =>
                    resolveFuncType(v.type, false, usePartialFields, ctx),
                ),
            );
        }
    }

    // Unreachable
    throw Error(`Unknown type: ${descriptor.kind}`);
}
