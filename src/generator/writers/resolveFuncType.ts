import { CompilerContext } from "../../ast/context";
import { getType } from "../../types/resolveTypeDescriptors";
import { TypeDescription, TypeRef } from "../../types/types";

export function resolveFuncType(ctx: CompilerContext, descriptor: TypeRef | TypeDescription): string {

    // TypeRef
    if (descriptor.kind === 'optional') {
        return resolveFuncType(ctx, descriptor.inner);
    } else if (descriptor.kind === 'direct') {
        return resolveFuncType(ctx, getType(ctx, descriptor.name));
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