import { CompilerContext } from "../010-pipeline/context";
import {
    AstBinaryOperation,
    AstExpression,
    AstUnaryOperation,
    AstValue,
    isValue,
} from "../050-grammar/ast";
import { TactConstEvalError } from "../030-error/errors";
import { Value } from "../060-types/types";
import { AstUtil, extractValue } from "./util";
import { ExpressionTransformer } from "./types";
import { StandardOptimizer } from "./standardOptimizer";
import {
    Interpreter,
    InterpreterConfig,
    ensureInt,
    evalBinaryOp,
    evalUnaryOp,
    throwNonFatalErrorConstEval,
} from "./interpreter";
import { SrcInfo } from "../050-grammar";

// Utility Exception class to interrupt the execution
// of functions that cannot evaluate a tree fully into a value.
class PartiallyEvaluatedTree extends Error {
    public tree: AstExpression;

    constructor(tree: AstExpression) {
        super();
        this.tree = tree;
    }
}

export const getOptimizer = (util: AstUtil) => {
    // The optimizer that applies the rewriting rules during partial evaluation.
    // For the moment we use an optimizer that respects overflows.
    const optimizer: ExpressionTransformer = new StandardOptimizer(util);

    function partiallyEvalUnaryOp(
        op: AstUnaryOperation,
        operand: AstExpression,
        source: SrcInfo,
        ctx: CompilerContext,
    ): AstExpression {
        if (operand.kind === "number" && op === "-") {
            // emulating negative integer literals
            return util.makeValueExpression(ensureInt(-operand.value, source));
        }

        const simplOperand = partiallyEvalExpression(operand, ctx);

        if (isValue(simplOperand)) {
            const valueOperand = extractValue(simplOperand as AstValue);
            const result = evalUnaryOp(
                op,
                valueOperand,
                simplOperand.loc,
                source,
            );
            // Wrap the value into a Tree to continue simplifications
            return util.makeValueExpression(result);
        } else {
            const newAst = util.makeUnaryExpression(op, simplOperand);
            return optimizer.applyRules(newAst);
        }
    }

    function partiallyEvalBinaryOp(
        op: AstBinaryOperation,
        left: AstExpression,
        right: AstExpression,
        source: SrcInfo,
        ctx: CompilerContext,
    ): AstExpression {
        const leftOperand = partiallyEvalExpression(left, ctx);

        if (isValue(leftOperand)) {
            // Because of short-circuiting, we must delay evaluation of the right operand
            const valueLeftOperand = extractValue(leftOperand as AstValue);

            try {
                const result = evalBinaryOp(
                    op,
                    valueLeftOperand,
                    // We delay the evaluation of the right operand inside a continuation
                    () => {
                        const rightOperand = partiallyEvalExpression(
                            right,
                            ctx,
                        );
                        if (isValue(rightOperand)) {
                            // If the right operand reduces to a value, then we can let the function
                            // evalBinaryOp finish its normal execution by returning the value
                            // in the right operand.
                            return extractValue(rightOperand as AstValue);
                        } else {
                            // If the right operand does not reduce to a value,
                            // we interrupt the execution of the evalBinaryOp function
                            // by returning an exception with the partially evaluated right operand.
                            // The simplification rules will handle the partially evaluated tree in the catch
                            // of the try surrounding the evalBinaryOp function.
                            throw new PartiallyEvaluatedTree(rightOperand);
                        }
                    },
                    leftOperand.loc,
                    right.loc,
                    source,
                );

                return util.makeValueExpression(result);
            } catch (e) {
                if (e instanceof PartiallyEvaluatedTree) {
                    // The right operand did not evaluate to a value. Hence,
                    // time to symbolically simplify the full tree.
                    const newAst = util.makeBinaryExpression(
                        op,
                        leftOperand,
                        e.tree,
                    );
                    return optimizer.applyRules(newAst);
                } else {
                    throw e;
                }
            }
        } else {
            // Since the left operand does not reduce to a value, no immediate short-circuiting will occur.
            // Hence, we can partially evaluate the right operand and let the rules
            // simplify the tree.
            const rightOperand = partiallyEvalExpression(right, ctx);
            const newAst = util.makeBinaryExpression(
                op,
                leftOperand,
                rightOperand,
            );
            return optimizer.applyRules(newAst);
        }
    }

    function partiallyEvalExpression(
        ast: AstExpression,
        ctx: CompilerContext,
        interpreterConfig?: InterpreterConfig,
    ): AstExpression {
        const interpreter = new Interpreter(ctx, interpreterConfig);
        switch (ast.kind) {
            case "id":
                try {
                    return util.makeValueExpression(
                        interpreter.interpretName(ast),
                    );
                } catch (e) {
                    if (e instanceof TactConstEvalError) {
                        if (!e.fatal) {
                            // If a non-fatal error occurs during lookup, just return the symbol
                            return ast;
                        }
                    }
                    throw e;
                }
            case "method_call":
                // Does not partially evaluate at the moment. Will attempt to fully evaluate
                return util.makeValueExpression(
                    interpreter.interpretMethodCall(ast),
                );
            case "init_of":
                throwNonFatalErrorConstEval(
                    "initOf is not supported at this moment",
                    ast.loc,
                );
                break;
            case "null":
                return ast;
            case "boolean":
                return ast;
            case "number":
                return util.makeValueExpression(
                    interpreter.interpretNumber(ast),
                );
            case "string":
                return util.makeValueExpression(
                    interpreter.interpretString(ast),
                );
            case "op_unary":
                return partiallyEvalUnaryOp(ast.op, ast.operand, ast.loc, ctx);
            case "op_binary":
                return partiallyEvalBinaryOp(
                    ast.op,
                    ast.left,
                    ast.right,
                    ast.loc,
                    ctx,
                );
            case "conditional":
                // Does not partially evaluate at the moment. Will attempt to fully evaluate
                return util.makeValueExpression(
                    interpreter.interpretConditional(ast),
                );
            case "struct_instance":
                // Does not partially evaluate at the moment. Will attempt to fully evaluate
                return util.makeValueExpression(
                    interpreter.interpretStructInstance(ast),
                );
            case "field_access":
                // Does not partially evaluate at the moment. Will attempt to fully evaluate
                return util.makeValueExpression(
                    interpreter.interpretFieldAccess(ast),
                );
            case "static_call":
                // Does not partially evaluate at the moment. Will attempt to fully evaluate
                return util.makeValueExpression(
                    interpreter.interpretStaticCall(ast),
                );
        }
    }

    return {
        partiallyEvalUnaryOp,
        partiallyEvalBinaryOp,
        partiallyEvalExpression,
    };
};

export function evalConstantExpression(
    ast: AstExpression,
    ctx: CompilerContext,
    interpreterConfig?: InterpreterConfig,
): Value {
    const interpreter = new Interpreter(ctx, interpreterConfig);
    const result = interpreter.interpretExpression(ast);
    return result;
}
