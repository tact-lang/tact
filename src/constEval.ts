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
import {
    Interpreter,
    ensureInt,
    evalBinaryOp,
    evalUnaryOp,
    throwNonFatalErrorConstEval,
} from "./interpreter";

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
        return makeValueExpression(ensureInt(-operand.value, source));
    }

    const simplOperand = partiallyEvalExpression(operand, ctx);

    if (isValue(simplOperand)) {
        const valueOperand = extractValue(simplOperand as AstValue);
        const result = evalUnaryOp(op, valueOperand, simplOperand.loc, source);
        // Wrap the value into a Tree to continue simplifications
        return makeValueExpression(result);
    } else {
        const newAst = makeUnaryExpression(op, simplOperand);
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
    const rightOperand = partiallyEvalExpression(right, ctx);

    if (isValue(leftOperand) && isValue(rightOperand)) {
        const valueLeftOperand = extractValue(leftOperand as AstValue);
        const valueRightOperand = extractValue(rightOperand as AstValue);
        const result = evalBinaryOp(
            op,
            valueLeftOperand,
            valueRightOperand,
            leftOperand.loc,
            rightOperand.loc,
            source,
        );
        // Wrap the value into a Tree to continue simplifications
        return makeValueExpression(result);
    } else {
        const newAst = makeBinaryExpression(op, leftOperand, rightOperand);
        return optimizer.applyRules(newAst);
    }
}

export function evalConstantExpression(
    ast: AstExpression,
    ctx: CompilerContext,
): Value {
    const interpreter = new Interpreter(ctx);
    const result = interpreter.interpretExpression(ast);
    return result;
}

export function partiallyEvalExpression(
    ast: AstExpression,
    ctx: CompilerContext,
): AstExpression {
    const interpreter = new Interpreter(ctx);
    switch (ast.kind) {
        case "id":
            try {
                return makeValueExpression(interpreter.interpretName(ast));
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
            return makeValueExpression(interpreter.interpretMethodCall(ast));
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
            return makeValueExpression(interpreter.interpretNumber(ast));
        case "string":
            return makeValueExpression(interpreter.interpretString(ast));
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
            return makeValueExpression(interpreter.interpretConditional(ast));
        case "struct_instance":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(
                interpreter.interpretStructInstance(ast),
            );
        case "field_access":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(interpreter.interpretFieldAccess(ast));
        case "static_call":
            // Does not partially evaluate at the moment. Will attempt to fully evaluate
            return makeValueExpression(interpreter.interpretStaticCall(ast));
    }
}
