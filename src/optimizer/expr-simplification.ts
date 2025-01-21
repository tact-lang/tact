import {
    AstConditional,
    AstConstantDef,
    AstContractDeclaration,
    AstExpression,
    AstFieldAccess,
    AstFieldDecl,
    AstInitOf,
    AstLiteral,
    AstMethodCall,
    AstOpBinary,
    AstOpUnary,
    AstStatement,
    AstStaticCall,
    AstStructInstance,
    AstTraitDeclaration,
    idText,
} from "../ast/ast";
import {
    TactConstEvalError,
    throwInternalCompilerError,
} from "../error/errors";
import { getType } from "../types/resolveDescriptors";
import {
    expHasType,
    getExpType,
    registerExpType,
} from "../types/resolveExpression";
import { TypeRef } from "../types/types";
import { Interpreter } from "./interpreter";
import {
    OptimizationContext,
    registerAstNodeChange,
} from "./optimization-phase";
import { getAstUtil } from "./util";

export function simplifyAllExpressions(optCtx: OptimizationContext) {
    const util = getAstUtil(optCtx.factoryAst);

    // The interpreter in charge of simplifying expressions
    const interpreter = new Interpreter(util, optCtx.ctx);

    // Traverse the program and attempt to evaluate every expression

    for (const moduleItem of optCtx.modifiedAst.items) {
        switch (moduleItem.kind) {
            case "asm_function_def":
            case "native_function_decl":
            case "primitive_type_decl":
                // Nothing to simplify
                break;
            case "struct_decl":
            case "message_decl": {
                moduleItem.fields.forEach((field) => {
                    simplifyFieldDecl(field, optCtx, interpreter);
                });
                break;
            }
            case "constant_def": {
                simplifyConstantDef(moduleItem, optCtx, interpreter);
                break;
            }
            case "function_def": {
                moduleItem.statements.forEach((stmt) => {
                    simplifyStatement(stmt, optCtx, interpreter);
                });
                break;
            }
            case "contract": {
                moduleItem.declarations.forEach((decl) => {
                    simplifyContractDeclaration(decl, optCtx, interpreter);
                });
                break;
            }
            case "trait": {
                moduleItem.declarations.forEach((decl) => {
                    simplifyTraitDeclaration(decl, optCtx, interpreter);
                });
                break;
            }
            default:
                throwInternalCompilerError("Unrecognized module item kind");
        }
    }
}

function simplifyFieldDecl(
    ast: AstFieldDecl,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
) {
    if (ast.initializer !== null) {
        ast.initializer = simplifyExpression(
            ast.initializer,
            optCtx,
            interpreter,
        );
    }
}

function simplifyConstantDef(
    ast: AstConstantDef,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
) {
    ast.initializer = simplifyExpression(ast.initializer, optCtx, interpreter);
}

function simplifyContractDeclaration(
    decl: AstContractDeclaration,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
) {
    switch (decl.kind) {
        case "asm_function_def": {
            // This kind is not changed by the optimizer
            break;
        }
        case "field_decl": {
            simplifyFieldDecl(decl, optCtx, interpreter);
            break;
        }
        case "constant_def": {
            simplifyConstantDef(decl, optCtx, interpreter);
            break;
        }
        case "function_def":
        case "receiver":
        case "contract_init": {
            decl.statements.forEach((stmt) => {
                simplifyStatement(stmt, optCtx, interpreter);
            });
            break;
        }
        default:
            throwInternalCompilerError(
                "Unrecognized contract declaration kind",
            );
    }
}

function simplifyTraitDeclaration(
    decl: AstTraitDeclaration,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
) {
    switch (decl.kind) {
        case "asm_function_def":
        case "constant_decl":
        case "function_decl": {
            // These kinds are not changed by the optimizer
            break;
        }
        case "field_decl": {
            simplifyFieldDecl(decl, optCtx, interpreter);
            break;
        }
        case "constant_def": {
            simplifyConstantDef(decl, optCtx, interpreter);
            break;
        }
        case "function_def":
        case "receiver": {
            decl.statements.forEach((stmt) => {
                simplifyStatement(stmt, optCtx, interpreter);
            });
            break;
        }
        default:
            throwInternalCompilerError("Unrecognized trait declaration kind");
    }
}

function simplifyStatement(
    stmt: AstStatement,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
) {
    switch (stmt.kind) {
        case "statement_assign":
        case "statement_expression":
        case "statement_let":
        case "statement_destruct":
        case "statement_augmentedassign": {
            stmt.expression = simplifyExpression(
                stmt.expression,
                optCtx,
                interpreter,
            );
            break;
        }
        case "statement_return": {
            if (stmt.expression !== null) {
                stmt.expression = simplifyExpression(
                    stmt.expression,
                    optCtx,
                    interpreter,
                );
            }
            break;
        }
        case "statement_condition": {
            stmt.condition = simplifyExpression(
                stmt.condition,
                optCtx,
                interpreter,
            );
            stmt.trueStatements.forEach((trueStmt) => {
                simplifyStatement(trueStmt, optCtx, interpreter);
            });

            if (stmt.falseStatements !== null) {
                stmt.falseStatements.forEach((falseStmt) => {
                    simplifyStatement(falseStmt, optCtx, interpreter);
                });
            }

            if (stmt.elseif !== null) {
                simplifyStatement(stmt.elseif, optCtx, interpreter);
            }
            break;
        }
        case "statement_foreach": {
            stmt.map = simplifyExpression(stmt.map, optCtx, interpreter);
            stmt.statements.forEach((loopStmt) => {
                simplifyStatement(loopStmt, optCtx, interpreter);
            });
            break;
        }
        case "statement_until":
        case "statement_while": {
            stmt.condition = simplifyExpression(
                stmt.condition,
                optCtx,
                interpreter,
            );
            stmt.statements.forEach((loopStmt) => {
                simplifyStatement(loopStmt, optCtx, interpreter);
            });
            break;
        }
        case "statement_repeat": {
            stmt.iterations = simplifyExpression(
                stmt.iterations,
                optCtx,
                interpreter,
            );
            stmt.statements.forEach((loopStmt) => {
                simplifyStatement(loopStmt, optCtx, interpreter);
            });
            break;
        }
        case "statement_try": {
            stmt.statements.forEach((tryStmt) => {
                simplifyStatement(tryStmt, optCtx, interpreter);
            });
            break;
        }
        case "statement_try_catch": {
            stmt.statements.forEach((tryStmt) => {
                simplifyStatement(tryStmt, optCtx, interpreter);
            });
            stmt.catchStatements.forEach((catchStmt) => {
                simplifyStatement(catchStmt, optCtx, interpreter);
            });
            break;
        }
        case "statement_block": {
            stmt.statements.forEach((blockStmt) => {
                simplifyStatement(blockStmt, optCtx, interpreter);
            });
            break;
        }
        default:
            throwInternalCompilerError("Unrecognized statement kind");
    }
}

function simplifyExpression(
    expr: AstExpression,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    const value = tryExpressionSimplification(expr, interpreter);
    if (typeof value !== "undefined") {
        if (value.id !== expr.id) {
            registerAstNodeChange(optCtx, expr, value);

            // The above registers the type of the value into the CompilerContext.
            // but the value may have sub-values. Hence, to maintain consistency with
            // CompilerContext, register the
            // types of all sub-values in the value.
            registerAllSubValueTypes(
                optCtx,
                value,
                getExpType(optCtx.ctx, expr),
            );
        }

        return value;
    } else {
        // The expression could not be simplified to a value.
        // Attempt to simplify its subexpressions: this is necessary, because
        // writeExpression during FunC generation implicitly did this!
        // Note this is essentially the partial evaluator.
        // TODO: Replace this call with the partial evaluator,
        // but I do not do it right now because the partial evaluator is still not active in production.
        return traverseAndSimplifyExpression(expr, optCtx, interpreter);
    }
}

function tryExpressionSimplification(
    expr: AstExpression,
    interpreter: Interpreter,
): AstLiteral | undefined {
    try {
        // Eventually, this will be replaced by the partial evaluator.
        return interpreter.interpretExpression(expr);
    } catch (e) {
        if (e instanceof TactConstEvalError) {
            if (!e.fatal) {
                return undefined;
            }
        }
        throw e;
    }
}

function traverseAndSimplifyExpression(
    expr: AstExpression,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    switch (expr.kind) {
        // All these cases return the expression because there is no sub-expression to traverse.
        // The case for StructValue is special, because it already a literal, so, there is nothing to traverse and simplify.
        case "address":
        case "boolean":
        case "cell":
        case "comment_value":
        case "id":
        case "null":
        case "number":
        case "slice":
        case "string":
        case "simplified_string":
        case "struct_value":
            return expr;
        case "field_access":
            return traverseAndSimplifyFieldAccess(expr, optCtx, interpreter);
        case "conditional":
            return traverseAndSimplifyConditional(expr, optCtx, interpreter);
        case "init_of":
            return traverseAndSimplifyInitOf(expr, optCtx, interpreter);
        case "method_call":
            return traverseAndSimplifyMethodCall(expr, optCtx, interpreter);
        case "op_binary":
            return traverseAndSimplifyBinaryOp(expr, optCtx, interpreter);
        case "op_unary":
            return traverseAndSimplifyUnaryOp(expr, optCtx, interpreter);
        case "static_call":
            return traverseAndSimplifyStaticCall(expr, optCtx, interpreter);
        case "struct_instance":
            return traverseAndSimplifyStructInstance(expr, optCtx, interpreter);
        default:
            throwInternalCompilerError("Unrecognized expression kind");
    }
}

function registerAllSubValueTypes(
    optCtx: OptimizationContext,
    value: AstLiteral,
    valueType: TypeRef,
) {
    switch (value.kind) {
        case "boolean":
        case "number":
        case "null":
        case "address":
        case "cell":
        case "slice":
        case "simplified_string":
        case "comment_value": {
            if (!expHasType(optCtx.ctx, value)) {
                optCtx.ctx = registerExpType(optCtx.ctx, value, valueType);
            }
            break;
        }
        case "struct_value": {
            if (!expHasType(optCtx.ctx, value)) {
                optCtx.ctx = registerExpType(optCtx.ctx, value, valueType);
            }
            const structFields = getType(optCtx.ctx, value.type).fields;
            const fieldTypes: Map<string, TypeRef> = new Map();

            for (const field of structFields) {
                fieldTypes.set(field.name, field.type);
            }

            for (const fieldValue of value.args) {
                const fieldType = fieldTypes.get(idText(fieldValue.field));
                if (typeof fieldType === "undefined") {
                    throwInternalCompilerError(
                        `Field ${idText(fieldValue.field)} does not have a declared type in struct ${idText(value.type)}.`,
                        fieldValue.loc,
                    );
                }
                registerAllSubValueTypes(
                    optCtx,
                    fieldValue.initializer,
                    fieldType,
                );
            }
            break;
        }
        default:
            throwInternalCompilerError("Unrecognized ast literal kind.");
    }
}

function traverseAndSimplifyFieldAccess(
    expr: AstFieldAccess,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    expr.aggregate = simplifyExpression(expr.aggregate, optCtx, interpreter);
    return expr;
}

function traverseAndSimplifyConditional(
    expr: AstConditional,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    expr.condition = simplifyExpression(expr.condition, optCtx, interpreter);
    expr.thenBranch = simplifyExpression(expr.thenBranch, optCtx, interpreter);
    expr.elseBranch = simplifyExpression(expr.elseBranch, optCtx, interpreter);
    return expr;
}

function traverseAndSimplifyInitOf(
    expr: AstInitOf,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    expr.args = expr.args.map((arg) =>
        simplifyExpression(arg, optCtx, interpreter),
    );
    return expr;
}

function traverseAndSimplifyMethodCall(
    expr: AstMethodCall,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    expr.args = expr.args.map((arg) =>
        simplifyExpression(arg, optCtx, interpreter),
    );
    expr.self = simplifyExpression(expr.self, optCtx, interpreter);
    return expr;
}

function traverseAndSimplifyBinaryOp(
    expr: AstOpBinary,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    expr.left = simplifyExpression(expr.left, optCtx, interpreter);
    expr.right = simplifyExpression(expr.right, optCtx, interpreter);
    return expr;
}

function traverseAndSimplifyUnaryOp(
    expr: AstOpUnary,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    expr.operand = simplifyExpression(expr.operand, optCtx, interpreter);
    return expr;
}

function traverseAndSimplifyStaticCall(
    expr: AstStaticCall,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    expr.args = expr.args.map((arg) =>
        simplifyExpression(arg, optCtx, interpreter),
    );
    return expr;
}

function traverseAndSimplifyStructInstance(
    expr: AstStructInstance,
    optCtx: OptimizationContext,
    interpreter: Interpreter,
): AstExpression {
    expr.args = expr.args.map((arg) => {
        arg.initializer = simplifyExpression(
            arg.initializer,
            optCtx,
            interpreter,
        );
        return arg;
    });
    return expr;
}
