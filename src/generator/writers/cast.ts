import { getType } from "@/types/resolveDescriptors";
import type { TypeRef } from "@/types/types";
import type { WriterContext } from "@/generator/Writer";
import { ops } from "@/generator/writers/ops";

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
            if (type.kind === "struct" || type.kind === "contract") {
                return `${ops.typeAsOptional(type.name, ctx)}(${expression})`;
            }
        }
    }
    return expression;
}
