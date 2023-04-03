import { getType } from "../../types/resolveDescriptors";
import { TypeDescription, TypeRef } from "../../types/types";
import { WriterContext } from "../Writer";

export function resolveFuncTypeUnpack(descriptor: TypeRef | TypeDescription | string, name: string, ctx: WriterContext, optional: boolean = false): string {

    // String
    if (typeof descriptor === 'string') {
        return resolveFuncTypeUnpack(getType(ctx.ctx, descriptor), name, ctx);
    }

    // TypeRef
    if (descriptor.kind === 'ref') {
        return resolveFuncTypeUnpack(getType(ctx.ctx, descriptor.name), name, ctx, descriptor.optional);
    }
    if (descriptor.kind === 'map') {
        return name;
    }
    if (descriptor.kind === 'void') {
        throw Error('Void type is not allowed in function arguments: ' + name);
    }

    // TypeDescription
    if (descriptor.kind === 'primitive') {
        return name;
    } else if (descriptor.kind === 'struct' || descriptor.kind === 'partial_struct') {
        if (optional || descriptor.fields.length === 0) {
            return name;
        } else {
            return '(' + descriptor.fields.map((v) => resolveFuncTypeUnpack(v.type, name + `'` + v.name, ctx)).join(', ') + ')';
        }
    } else if (descriptor.kind === 'contract') {
        if (optional || descriptor.fields.length === 0) {
            return name;
        } else {
            return '(' + descriptor.fields.map((v) => resolveFuncTypeUnpack(v.type, name + `'` + v.name, ctx)).join(', ') + ')';
        }
    }

    // Unreachable
    throw Error('Unknown type: ' + descriptor.kind);
}