import { CompilerContext } from "./context";
import {
    AstBinaryOperation,
    AstExpression,
    SrcInfo,
    AstUnaryOperation,
    AstValue,
    isValue,
} from "./grammar/ast";
import { TactConstEvalError } from "./errors";
import { Value } from "./types/types";
import {
    extractValue,
    makeValueExpression,
    makeUnaryExpression,
    makeBinaryExpression,
} from "./optimizer/util";
import { ExpressionTransformer } from "./optimizer/types";
import { StandardOptimizer } from "./optimizer/standardOptimizer";
import { Interpreter } from "./interpreter";
import {
    ensureInt,
    evalBinaryOp,
    evalUnaryOp,
    StandardSemanticsConfig,
    StandardSemantics,
} from "./interpreterSemantics/standardSemantics";
import { throwNonFatalErrorConstEval } from "./interpreterSemantics/util";

// Utility Exception class to interrupt the execution
// of functions that cannot evaluate a tree fully into a value.
class PartiallyEvaluatedTree extends Error {
    public tree: AstExpression;

    constructor(tree: AstExpression) {
        super();
        this.tree = tree;
    }
}

// The optimizer that applies the rewriting rules during partial evaluation.
// For the moment we use an optimizer that respects overflows.
const optimizer: ExpressionTransformer = new StandardOptimizer();

function partiallyEvalUnaryOp(
    op: AstUnaryOperation,
    operand: AstExpression,
    source: SrcInfo,
    ctx: CompilerContext,
): AstExpression {
    if (operand.kind === "number" && op === "-") {
        // emulating negative integer literals
        return makeValueExpression(
            ensureInt(-operand.value, source),
            operand.loc,
        );
    }

    const simplOperand = partiallyEvalExpression(operand, ctx);

    if (isValue(simplOperand)) {
        const valueOperand = extractValue(simplOperand as AstValue);
        const result = evalUnaryOp(
            op,
            () => valueOperand,
            simplOperand.loc,
            source,
        );
        // Wrap the value into a Tree to continue simplifications
        return makeValueExpression(result, source);
    } else {
        const newAst = makeUnaryExpression(op, simplOperand, source);
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
                    const rightOperand = partiallyEvalExpression(right, ctx);
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

            return makeValueExpression(result, source);
        } catch (e) {
            if (e instanceof PartiallyEvaluatedTree) {
                // The right operand did not evaluate to a value. Hence,
                // time to symbolically simplify the full tree.
                const newAst = makeBinaryExpression(
                    op,
                    leftOperand,
                    e.tree,
                    source,
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
        const newAst = makeBinaryExpression(
            op,
            leftOperand,
            rightOperand,
            source,
        );
        return optimizer.applyRules(newAst);
    }
}

export function evalConstantExpression(
    ast: AstExpression,
    ctx: CompilerContext,
    interpreterConfig?: StandardSemanticsConfig,
): Value {
    const interpreter = new StandardSemantics(ctx, interpreterConfig);
    const result = interpreter.interpretExpression(ast);
    return result;
}

export function partiallyEvalExpression(
    ast: AstExpression,
    ctx: CompilerContext,
    interpreterConfig?: StandardSemanticsConfig,
): AstExpression {
    const interpreter = new StandardSemantics(ctx, interpreterConfig);
    switch (ast.kind) {
        case "id":
            try {
                return makeValueExpression(
                    interpreter.interpretName(ast),
                    ast.loc,
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
            return makeValueExpression(
                interpreter.interpretMethodCall(ast),
                ast.loc,
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
            return makeValueExpression(
                interpreter.interpretNumber(ast),
                ast.loc,
            );
        case "string":
            return makeValueExpression(
                interpreter.interpretString(ast),
                ast.loc,
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
            return makeValueExpression(
                interpreter.interpretConditional(ast),
                ast.loc,
            );
        case "struct_instance":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(
                interpreter.interpretStructInstance(ast),
                ast.loc,
            );
        case "field_access":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(
                interpreter.interpretFieldAccess(ast),
                ast.loc,
            );
        case "static_call":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(
                interpreter.interpretStaticCall(ast),
                ast.loc,
            );
    }
}
