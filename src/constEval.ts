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
import { StatementContext } from "./types/resolveStatements";

export type CompilerEnvironment = {
    ctx: CompilerContext;
    sctx?: StatementContext;
};

// The optimizer that applies the rewriting rules during partial evaluation.
// For the moment we use an optimizer that respects overflows.
const optimizer: ExpressionTransformer = new StandardOptimizer();

function partiallyEvalUnaryOp(
    op: AstUnaryOperation,
    operand: AstExpression,
    source: SrcInfo,
    compEnv: CompilerEnvironment,
): AstExpression {
    if (operand.kind === "number" && op === "-") {
        // emulating negative integer literals
        return makeValueExpression(
            ensureInt(-operand.value, source),
            operand.loc,
        );
    }

    const simplOperand = partiallyEvalExpression(operand, compEnv);

    if (isValue(simplOperand)) {
        const valueOperand = extractValue(simplOperand as AstValue);
        const result = evalUnaryOp(op, valueOperand, simplOperand.loc, source);
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
    compEnv: CompilerEnvironment,
): AstExpression {
    const leftOperand = partiallyEvalExpression(left, compEnv);
    const rightOperand = partiallyEvalExpression(right, compEnv);

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
        return makeValueExpression(result, source);
    } else {
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
    compEnv: CompilerEnvironment,
): Value {
    const interpreter = new Interpreter(compEnv);
    const result = interpreter.interpretExpression(ast);
    return result;
}

export function partiallyEvalExpression(
    ast: AstExpression,
    compEnv: CompilerEnvironment,
): AstExpression {
    const interpreter = new Interpreter(compEnv);
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
            return partiallyEvalUnaryOp(ast.op, ast.operand, ast.loc, compEnv);
        case "op_binary":
            return partiallyEvalBinaryOp(
                ast.op,
                ast.left,
                ast.right,
                ast.loc,
                compEnv,
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
