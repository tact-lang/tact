import { CompilerContext } from "../context/context";
import {
    AstBinaryOperation,
    AstExpression,
    AstUnaryOperation,
    isLiteral,
    AstLiteral,
} from "../ast/ast";
import {
    TactConstEvalError,
    throwInternalCompilerError,
} from "../error/errors";
import { AstUtil } from "./util";
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
import { SrcInfo } from "../grammar";

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
            return ensureInt(util.makeNumberLiteral(-operand.value, source));
        }

        const simplOperand = partiallyEvalExpression(operand, ctx);

        if (isLiteral(simplOperand)) {
            const result = evalUnaryOp(op, simplOperand, source, util);
            return result;
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

        if (isLiteral(leftOperand)) {
            // Because of short-circuiting, we must delay evaluation of the right operand
            try {
                const result = evalBinaryOp(
                    op,
                    leftOperand,
                    // We delay the evaluation of the right operand inside a continuation
                    () => {
                        const rightOperand = partiallyEvalExpression(
                            right,
                            ctx,
                        );
                        if (isLiteral(rightOperand)) {
                            // If the right operand reduced to a value, then we can let the function
                            // evalBinaryOp finish its normal execution by returning the
                            // right operand.
                            return rightOperand;
                        } else {
                            // If the right operand does not reduce to a value,<
                            // we interrupt the execution of the evalBinaryOp function
                            // by returning an exception with the partially evaluated right operand.
                            // The simplification rules will handle the partially evaluated tree in the catch
                            // of the try surrounding the evalBinaryOp function.
                            throw new PartiallyEvaluatedTree(rightOperand);
                        }
                    },
                    source,
                    util,
                );

                return result;
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
        const interpreter = new Interpreter(util, ctx, interpreterConfig);
        switch (ast.kind) {
            case "id":
                try {
                    return interpreter.interpretName(ast);
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
                return interpreter.interpretMethodCall(ast);
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
                return interpreter.interpretNumber(ast);
            case "string":
                return interpreter.interpretString(ast);
            case "comment_value":
                return ast;
            case "simplified_string":
                return ast;
            case "struct_value":
                return ast;
            case "address":
                return ast;
            case "cell":
                return ast;
            case "slice":
                return ast;
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
                return interpreter.interpretConditional(ast);
            case "struct_instance":
                // Does not partially evaluate at the moment. Will attempt to fully evaluate
                return interpreter.interpretStructInstance(ast);
            case "field_access":
                // Does not partially evaluate at the moment. Will attempt to fully evaluate
                return interpreter.interpretFieldAccess(ast);
            case "static_call":
                // Does not partially evaluate at the moment. Will attempt to fully evaluate
                return interpreter.interpretStaticCall(ast);
            default:
                throwInternalCompilerError("Unrecognized expression kind");
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
    util: AstUtil,
    interpreterConfig?: InterpreterConfig,
): AstLiteral {
    const interpreter = new Interpreter(util, ctx, interpreterConfig);
    const result = interpreter.interpretExpression(ast);
    return result;
}
