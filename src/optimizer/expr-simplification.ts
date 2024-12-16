import { CompilerContext } from "../context";
import { TactConstEvalError, throwInternalCompilerError } from "../errors";
import {
    AstConstantDef,
    AstContractDeclaration,
    AstExpression,
    AstFieldDecl,
    AstStatement,
    AstTraitDeclaration,
    AstValue,
    idText,
    SrcInfo,
} from "../grammar/ast";
import { Interpreter } from "../interpreter";
import { getType } from "../types/resolveDescriptors";
import { getExpType, registerExpType } from "../types/resolveExpression";
import { TypeRef, Value } from "../types/types";
import {
    OptimizationContext,
    registerAstNodeChange,
} from "./optimization-phase";
import { makeValueExpression, UnsupportedOperation } from "./util";

export function simplifyAllExpressions(optCtx: OptimizationContext) {
    // The interpreter in charge of simplifying expressions
    const interpreter = new Interpreter(optCtx.ctx);

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
    let newExpr = expr;
    if (typeof value !== "undefined") {
        try {
            newExpr = makeValueExpression(value, expr.loc);
            // Register the new expression in the context
            registerAstNodeChange(optCtx, expr, newExpr);
            // To maintain consistency with types in the CompilerContext, register the
            // types of all newly created expressions
            optCtx.ctx = registerAllSubExpTypes(
                optCtx.ctx,
                newExpr,
                getExpType(optCtx.ctx, expr),
            );
        } catch (e) {
            if (e instanceof UnsupportedOperation) {
                // This means that transforming the value into an AST node is
                // unsupported. Just use the original expression.
                newExpr = expr;
            } else {
                throw e;
            }
        }
    }

    return newExpr;
}

function tryExpressionSimplification(
    expr: AstExpression,
    interpreter: Interpreter,
): Value | undefined {
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

function registerAllSubExpTypes(
    ctx: CompilerContext,
    expr: AstValue,
    expType: TypeRef,
): CompilerContext {
    switch (expr.kind) {
        case "boolean":
        case "number":
        case "string":
        case "null": {
            ctx = registerExpType(ctx, expr, expType);
            break;
        }
        case "struct_instance": {
            ctx = registerExpType(ctx, expr, expType);

            const structFields = getType(ctx, expr.type).fields;
            const fieldTypes: Map<string, TypeRef> = new Map();

            for (const field of structFields) {
                fieldTypes.set(field.name, field.type);
            }

            for (const fieldValue of expr.args) {
                const fieldType = fieldTypes.get(idText(fieldValue.field));
                if (typeof fieldType === "undefined") {
                    throwInternalCompilerError(
                        `Field ${idText(fieldValue.field)} does not have a declared type in struct ${idText(expr.type)}.`,
                        fieldValue.loc,
                    );
                }
                ctx = registerAllSubExpTypes(
                    ctx,
                    ensureAstValue(fieldValue.initializer, fieldValue.loc),
                    fieldType,
                );
            }
            break;
        }
        default:
            throwInternalCompilerError("Unrecognized AstValue.");
    }
    return ctx;
}

function ensureAstValue(expr: AstExpression, src: SrcInfo): AstValue {
    switch (expr.kind) {
        case "boolean":
        case "null":
        case "number":
        case "string":
        case "struct_instance":
            return expr;
        default:
            throwInternalCompilerError(
                `Expressions of kind ${expr.kind} are not ASTValues.`,
                src,
            );
    }
}
