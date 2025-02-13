import { getType } from "../../types/resolveDescriptors";
import { TypeDescription, TypeRef } from "../../types/types";
import { WriterContext } from "../Writer";
import { throwInternalCompilerError } from "../../error/errors";

export function resolveFuncFlatPack(
    descriptor: TypeRef | TypeDescription | string,
    name: string,
    ctx: WriterContext,
    optional: boolean = false,
): string[] {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncFlatPack(getType(ctx.ctx, descriptor), name, ctx);
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncFlatPack(
            getType(ctx.ctx, descriptor.name),
            name,
            ctx,
            descriptor.optional,
        );
    }
    if (descriptor.kind === "map") {
        return [name];
    }
    if (descriptor.kind === "ref_bounced") {
        throwInternalCompilerError("Unimplemented");
    }
    if (descriptor.kind === "void") {
        throwInternalCompilerError(
            "Void type is not allowed in function arguments: " + name,
        );
    }

    // TypeDescription
    if (descriptor.kind === "primitive_type_decl") {
        return [name];
    } else if (descriptor.kind === "struct") {
        if (optional || descriptor.fields.length === 0) {
            return [name];
        } else {
            return descriptor.fields.flatMap((v) =>
                resolveFuncFlatPack(v.type, name + `'` + v.name, ctx),
            );
        }
    } else if (descriptor.kind === "contract") {
        if (optional || descriptor.fields.length === 0) {
            return [name];
        } else {
            return descriptor.fields.flatMap((v) =>
                resolveFuncFlatPack(v.type, name + `'` + v.name, ctx),
            );
        }
    }

    throwInternalCompilerError("Unknown type: " + descriptor.kind);
}
