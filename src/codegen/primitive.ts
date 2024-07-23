import { CompilerContext } from "../context";
import { getType } from "../types/resolveDescriptors";
import { TypeDescription, TypeRef } from "../types/types";

export function resolveFuncPrimitive(
    ctx: CompilerContext,
    descriptor: TypeRef | TypeDescription | string,
): boolean {
    // String
    if (typeof descriptor === "string") {
        return resolveFuncPrimitive(ctx, getType(ctx, descriptor));
    }

    // TypeRef
    if (descriptor.kind === "ref") {
        return resolveFuncPrimitive(ctx, getType(ctx, descriptor.name));
    }
    if (descriptor.kind === "map") {
        return true;
    }
    if (descriptor.kind === "ref_bounced") {
        throw Error("Unimplemented");
    }
    if (descriptor.kind === "void") {
        return true;
    }

    // TypeDescription
    if (descriptor.kind === "primitive_type_decl") {
        if (descriptor.name === "Int") {
            return true;
        } else if (descriptor.name === "Bool") {
            return true;
        } else if (descriptor.name === "Slice") {
            return true;
        } else if (descriptor.name === "Cell") {
            return true;
        } else if (descriptor.name === "Builder") {
            return true;
        } else if (descriptor.name === "Address") {
            return true;
        } else if (descriptor.name === "String") {
            return true;
        } else if (descriptor.name === "StringBuilder") {
            return true;
        } else {
            throw Error(`Unknown primitive type: ${descriptor.name}`);
        }
    } else if (descriptor.kind === "struct") {
        return false;
    } else if (descriptor.kind === "contract") {
        return false;
    }

    // Unreachable
    throw Error(`Unknown type: ${descriptor.kind}`);
}
