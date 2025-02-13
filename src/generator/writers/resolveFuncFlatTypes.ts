import { getType } from "../../types/resolveDescriptors";
import { TypeDescription, TypeRef } from "../../types/types";
import { WriterContext } from "../Writer";
import { resolveFuncType } from "./resolveFuncType";
import { throwInternalCompilerError } from "../../error/errors";

export function resolveFuncFlatTypes(
    descriptor: TypeRef | TypeDescription | string,
    ctx: WriterContext,
    optional: boolean = false,
): string[] {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncFlatTypes(getType(ctx.ctx, descriptor), ctx);
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncFlatTypes(
            getType(ctx.ctx, descriptor.name),
            ctx,
            descriptor.optional,
        );
    }
    if (descriptor.kind === "map") {
        return ["cell"];
    }
    if (descriptor.kind === "ref_bounced") {
        throwInternalCompilerError("Unimplemented");
    }
    if (descriptor.kind === "void") {
        throwInternalCompilerError(
            "Void type is not allowed in function arguments",
        );
    }

    // TypeDescription
    if (descriptor.kind === "primitive_type_decl") {
        return [resolveFuncType(descriptor, ctx)];
    } else if (descriptor.kind === "struct") {
        if (optional || descriptor.fields.length === 0) {
            return ["tuple"];
        } else {
            return descriptor.fields.flatMap((v) =>
                resolveFuncFlatTypes(v.type, ctx),
            );
        }
    } else if (descriptor.kind === "contract") {
        if (optional || descriptor.fields.length === 0) {
            return ["tuple"];
        } else {
            return descriptor.fields.flatMap((v) =>
                resolveFuncFlatTypes(v.type, ctx),
            );
        }
    }

    // Unreachable
    throwInternalCompilerError("Unknown type: " + descriptor.kind);
}
