import { getType } from "../../types/resolveDescriptors";
import { TypeDescription, TypeRef } from "../../types/types";
import { WriterContext } from "../Writer";
import { throwInternalCompilerError } from "../../error/errors";

export function resolveFuncTupleType(
    descriptor: TypeRef | TypeDescription | string,
    ctx: WriterContext,
): string {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncTupleType(getType(ctx.ctx, descriptor), ctx);
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncTupleType(getType(ctx.ctx, descriptor.name), ctx);
    }
    if (descriptor.kind === "map") {
        return "cell";
    }
    if (descriptor.kind === "ref_bounced") {
        throwInternalCompilerError("Unimplemented");
    }
    if (descriptor.kind === "void") {
        return "()";
    }

    // TypeDescription
    if (descriptor.kind === "primitive_type_decl") {
        if (descriptor.name === "Int") {
            return "int";
        } else if (descriptor.name === "Bool") {
            return "int";
        } else if (descriptor.name === "Slice") {
            return "slice";
        } else if (descriptor.name === "Cell") {
            return "cell";
        } else if (descriptor.name === "Builder") {
            return "builder";
        } else if (descriptor.name === "Address") {
            return "slice";
        } else if (descriptor.name === "String") {
            return "slice";
        } else if (descriptor.name === "StringBuilder") {
            return "tuple";
        } else {
            throwInternalCompilerError(
                "Unknown primitive type: " + descriptor.name,
            );
        }
    } else if (descriptor.kind === "struct" || descriptor.kind === "contract") {
        return "tuple";
    }

    throwInternalCompilerError("Unknown type: " + descriptor.kind);
}
