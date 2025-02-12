import { getType } from "../../types/resolveDescriptors";
import { TypeRef } from "../../types/types";
import { WriterContext } from "../Writer";
import { ops } from "./ops";
import { throwInternalCompilerError } from "../../error/errors";

export function cast(
    from: TypeRef,
    to: TypeRef,
    expression: string,
    ctx: WriterContext,
) {
    if (from.kind === "ref" && to.kind === "ref") {
        if (from.name !== to.name) {
            throwInternalCompilerError("Impossible");
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
