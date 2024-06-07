import { TactSyntaxError } from "../../errors";
import { ASTExpression } from "../../grammar/ast";
import { resolveConstantValue } from "../../types/resolveConstantValue";
import { getExpType } from "../../types/resolveExpression";
import { WriterContext } from "../Writer";
import { writeComment } from "../writers/writeConstant";

export function tryExpressionIntrinsics(
    exp: ASTExpression,
    ctx: WriterContext,
): string | null {
    // Calls intrinsics
    if (exp.kind === "op_call") {
        const sourceType = getExpType(ctx.ctx, exp.src);
        if (
            sourceType.kind === "ref" &&
            sourceType.name === "String" &&
            !sourceType.optional
        ) {
            //
            // Handle String.asComment()
            //

            if (exp.args.length === 0 && exp.name === "asComment") {
                let constString: string | null = null;

                // Try to resolve constant value
                try {
                    const res = resolveConstantValue(
                        sourceType,
                        exp.src,
                        ctx.ctx,
                    );
                    if (typeof res !== "string") {
                        throw new Error("Expected string");
                    }
                    constString = res;
                } catch (e) {
                    // Ignore
                }

                // Render if constant
                if (constString !== null) {
                    const id = writeComment(constString, ctx);
                    ctx.used(id);
                    return `${id}()`;
                }
            }
        }
    }

    try {
        const t = getExpType(ctx.ctx, exp);

        if (t.kind === "null") {
            const r = resolveConstantValue(t, exp, ctx.ctx);
            if (r !== null) {
                throw new Error("Expected null");
            }
            return "null()";
        }
        if (t.kind === "ref") {
            if (t.name === "Int") {
                const r = resolveConstantValue(t, exp, ctx.ctx);
                if (typeof r !== "bigint") {
                    throw new Error("Expected bigint");
                }
                return r.toString(10);
            }
            if (t.name === "Bool") {
                const r = resolveConstantValue(t, exp, ctx.ctx);
                if (typeof r !== "boolean") {
                    throw new Error("Expected boolean");
                }
                return r ? "true" : "false";
            }
        }
    } catch (e) {
        if (e instanceof TactSyntaxError) {
            if (
                !e.message.includes("Cannot reduce expression to a constant") &&
                !e.message.includes("Expected constant value")
            ) {
                throw e;
            }
        }
    }

    return null;
}
