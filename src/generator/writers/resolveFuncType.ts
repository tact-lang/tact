import { getType } from "../../types/resolveTypeDescriptors";
import { TypeDescription, TypeRef } from "../../types/types";
import { WriterContext } from "../Writer";

export function resolveFuncType(descriptor: TypeRef | TypeDescription, ctx: WriterContext): string {

    // TypeRef
    if (descriptor.kind === 'optional') {
        return resolveFuncType(descriptor.inner, ctx);
    } else if (descriptor.kind === 'direct') {
        return resolveFuncType(getType(ctx.ctx, descriptor.name), ctx);
    }

    // TypeDescription
    if (descriptor.kind === 'primitive') {
        if (descriptor.name === 'Int') {
            return 'int';
        } else if (descriptor.name === 'Bool') {
            return 'int';
        } else if (descriptor.name === 'Slice') {
            return 'slice';
        } else if (descriptor.name === 'Cell') {
            return 'cell';
        } else if (descriptor.name === 'Builder') {
            return 'builder';
        } else {
            throw Error('Unknown primitive type: ' + descriptor.name);
        }
    } else if (descriptor.kind === 'struct') {
        return 'tuple';
    } else if (descriptor.kind === 'contract') {
        return 'tuple';
    }

    // Unreachable
    throw Error('Unknown type: ' + descriptor.kind);
}