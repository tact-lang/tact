import { getType } from "../../types/resolveDescriptors";
import { TypeRef } from "../../types/types";
import { WriterContext } from "../Writer";
import { ops } from "./ops";

export function cast(
    from: TypeRef,
    to: TypeRef,
    expression: string,
    ctx: WriterContext,
) {
    if (from.kind === "ref" && to.kind === "ref") {
        if (from.name !== to.name) {
            throw Error("Impossible");
        }
        if (!from.optional && to.optional) {
            const type = getType(ctx.ctx, from.name);
            if (type.kind === "struct") {
                return `${ops.typeAsOptional(type.name, ctx)}(${expression})`;
            }
        }
    }
    return expression;
}
