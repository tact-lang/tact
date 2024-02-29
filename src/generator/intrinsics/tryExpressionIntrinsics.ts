import { ASTExpression } from "../../grammar/ast";
import { resolveConstantValue } from "../../types/resolveConstantValue";
import { getExpType } from "../../types/resolveExpression";
import { WriterContext } from "../Writer";
import { writeComment } from "../writers/writeConstant";

export function tryExpressionIntrinsics(exp: ASTExpression, ctx: WriterContext): string | null {

    // Calls instrinsics
    if (exp.kind === 'op_call') {
        const sourceType = getExpType(ctx.ctx, exp.src);
        if (sourceType.kind === 'ref' && sourceType.name === 'String' && !sourceType.optional) {

            //
            // Handle String.asComment()
            //

            if (exp.args.length === 0 && exp.name === 'asComment') {
                let constString: string | null = null;

                // Try to resolve constant value
                try {
                    const res = resolveConstantValue(sourceType, exp.src, ctx.ctx);
                    if (typeof res !== 'string') {
                        throw new Error('Expected string');
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

    return null;
}