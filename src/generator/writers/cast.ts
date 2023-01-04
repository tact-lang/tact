import { getType } from "../../types/resolveDescriptors";
import { TypeRef } from "../../types/types";
import { WriterContext } from "../Writer";

export function cast(from: TypeRef, to: TypeRef, expression: string, ctx: WriterContext) {
    if (from.kind === 'ref' && to.kind === 'ref') {
        if (from.name !== to.name) {
            throw Error('Impossible');
        }
        if (!from.optional && to.optional) {
            let type = getType(ctx.ctx, from.name);
            if (type.kind === 'struct') {
                ctx.used(`__gen_${type.name}_as_optional`);
                return `__gen_${type.name}_as_optional(${expression})`;
            }
        }
    }
    return expression;
}