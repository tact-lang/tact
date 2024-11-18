import { CompilerContext } from "../context";
import { TactConstEvalError, throwInternalCompilerError } from "../errors";
import {
    AstCondition,
    AstContractDeclaration,
    AstExpression,
    AstStatement,
    AstTraitDeclaration,
    AstTypeDecl,
    AstValue,
    cloneAstNode,
    idText,
    isValue,
    SrcInfo,
} from "../grammar/ast";
import { Interpreter } from "../interpreter";
import {
    getAllStaticConstants,
    getAllStaticFunctions,
    getAllTypes,
    getType,
    replaceStaticConstants,
    replaceStaticFunctions,
    replaceTypes,
} from "../types/resolveDescriptors";
import { getExpType, registerExpType } from "../types/resolveExpression";
import {
    ConstantDescription,
    FieldDescription,
    FunctionDescription,
    InitDescription,
    ReceiverDescription,
    TypeDescription,
    TypeRef,
    Value,
} from "../types/types";
import { makeValueExpression } from "./util";

export function simplify_expressions(ctx: CompilerContext): CompilerContext {
    // The interpreter in charge of simplifying expressions
    const interpreter = new Interpreter(ctx);

    // Traverse the program and attempt to evaluate every expression

    // Process functions
    const newStaticFunctions: Map<string, FunctionDescription> = new Map();

    for (const f of getAllStaticFunctions(ctx)) {
        if (f.ast.kind === "function_def") {
            const statementsResult = process_statements(
                f.ast.statements,
                ctx,
                interpreter,
            );
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;
            const newFunctionCode = cloneAstNode({
                ...f.ast,
                statements: newStatements,
            });
            newStaticFunctions.set(f.name, { ...f, ast: newFunctionCode });
        } else {
            // The rest of kinds do not have explicit Tact expressions, so just copy the current function description
            newStaticFunctions.set(f.name, f);
        }
    }
    ctx = replaceStaticFunctions(ctx, newStaticFunctions);

    // Process all static constants
    const newStaticConstants: Map<string, ConstantDescription> = new Map();

    for (const c of getAllStaticConstants(ctx)) {
        if (c.ast.kind === "constant_def") {
            const expressionResult = process_expression(
                c.ast.initializer,
                ctx,
                interpreter,
            );
            const newInitializer = expressionResult.expr;
            ctx = expressionResult.ctx;
            const newConstantCode = cloneAstNode({
                ...c.ast,
                initializer: newInitializer,
            });
            newStaticConstants.set(c.name, { ...c, ast: newConstantCode });
        } else {
            // The rest of kinds do not have explicit Tact expressions, so just copy the current description
            newStaticConstants.set(c.name, c);
        }
    }
    ctx = replaceStaticConstants(ctx, newStaticConstants);

    // Process all types

    /**
     * By calling the function getAllTypes on the context object "ctx", one gets an array of TypeDescriptions.
     * Each TypeDescription stores the type declarations in two different ways:
     * - Directly in the TypeDescription object there are fields, constants, and method
     *   declarations. However, these declarations are "coalesced" in the following sense:
     *     If the TypeDescription is a contract, it will contain copies of methods, constants and fields of traits that the
     *     contract inherits from. Similarly, each trait will have declarations of other traits
     *     that the trait inherits from.
     *
     *   For example, if we look into the "functions" property of the TypeDescription object of a contract
     *   we will find functions defined in BaseTrait.
     *
     * - Indirectly in the "ast" property of the TypeDescription. Contrary to the previous case,
     *   the fields, constants and methods in the ast property are NOT coalesced. This means, for example,
     *   that the methods in a TypeDescription's ast of a contract will be methods that are actually
     *   declared in the contract and not in some trait that the contract inherits from.
     *
     * The above means that we will need to process the properties in TypeDescription first,
     * and then use those properties to build the AST (carefully ensuring that only fields, constants and methods
     * that were in the original AST, remain in the new AST).
     */
    const newTypes: Map<string, TypeDescription> = new Map();

    for (const t of getAllTypes(ctx)) {
        let newInitializer: InitDescription | null = null;

        // Process init
        if (t.init) {
            const statementsResult = process_statements(
                t.init.ast.statements,
                ctx,
                interpreter,
            );
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;
            const newInitCode = cloneAstNode({
                ...t.init.ast,
                statements: newStatements,
            });
            newInitializer = { ...t.init, ast: newInitCode };
        }

        // Process constants
        const newConstants: ConstantDescription[] = [];

        // This map will be used to quickly recover the new definitions when
        // building the AST later
        const newConstantsMap: Map<string, ConstantDescription> = new Map();

        for (const c of t.constants) {
            if (c.ast.kind === "constant_def") {
                const expressionResult = process_expression(
                    c.ast.initializer,
                    ctx,
                    interpreter,
                );
                const newInitializer = expressionResult.expr;
                ctx = expressionResult.ctx;
                const newConstantCode = cloneAstNode({
                    ...c.ast,
                    initializer: newInitializer,
                });
                const newConstantDescription = { ...c, ast: newConstantCode };
                newConstants.push(newConstantDescription);
                newConstantsMap.set(c.name, newConstantDescription);
            } else {
                // The rest of kinds do not have explicit Tact expressions, so just copy the current description
                newConstants.push(c);
                newConstantsMap.set(c.name, c);
            }
        }

        // Process fields
        const newFields: FieldDescription[] = [];

        // This map will be used to quickly recover the new definitions when
        // building the AST later
        const newFieldsMap: Map<string, FieldDescription> = new Map();

        for (const f of t.fields) {
            if (f.ast.initializer !== null) {
                const expressionResult = process_expression(
                    f.ast.initializer,
                    ctx,
                    interpreter,
                );
                const newInitializer = expressionResult.expr;
                ctx = expressionResult.ctx;
                const newFieldCode = cloneAstNode({
                    ...f.ast,
                    initializer: newInitializer,
                });
                const newFieldDescription = { ...f, ast: newFieldCode };
                newFields.push(newFieldDescription);
                newFieldsMap.set(f.name, newFieldDescription);
            } else {
                // Field without initializer, no expression to simplify inside
                newFields.push(f);
                newFieldsMap.set(f.name, f);
            }
        }

        // Process receivers
        const newReceivers: ReceiverDescription[] = [];

        // This map will be used to quickly recover the new definitions when
        // building the AST later.
        // Since receivers do not have names, I will use their id in their original ast
        // as key.
        const newReceiversMap: Map<number, ReceiverDescription> = new Map();

        for (const r of t.receivers) {
            const statementsResult = process_statements(
                r.ast.statements,
                ctx,
                interpreter,
            );
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;
            const newReceiverCode = cloneAstNode({
                ...r.ast,
                statements: newStatements,
            });
            const newReceiverDescription = { ...r, ast: newReceiverCode };
            newReceivers.push(newReceiverDescription);
            newReceiversMap.set(r.ast.id, newReceiverDescription);
        }

        // Process methods

        // This is already a map in TypeDescription. This is the reason
        // I did not need a separate map, like in the previous cases.
        const newMethods: Map<string, FunctionDescription> = new Map();

        for (const [name, m] of t.functions) {
            if (m.ast.kind === "function_def") {
                const statementsResult = process_statements(
                    m.ast.statements,
                    ctx,
                    interpreter,
                );
                const newStatements = statementsResult.stmts;
                ctx = statementsResult.ctx;
                const newMethodCode = cloneAstNode({
                    ...m.ast,
                    statements: newStatements,
                });
                newMethods.set(name, { ...m, ast: newMethodCode });
            } else {
                // The rest of kinds do not have explicit Tact expressions, so just copy the current function description
                newMethods.set(name, m);
            }
        }

        // Now, we need to create the new AST, depending on its kind.
        let newAst: AstTypeDecl;

        switch (t.ast.kind) {
            case "primitive_type_decl": {
                newAst = t.ast;
                break;
            }
            case "struct_decl":
            case "message_decl": {
                newAst = cloneAstNode({
                    ...t.ast,
                    fields: newFields.map((f) => f.ast),
                });
                break;
            }
            case "trait": {
                const newDeclarations: AstTraitDeclaration[] = [];

                for (const decl of t.ast.declarations) {
                    switch (decl.kind) {
                        case "asm_function_def":
                        case "function_decl":
                        case "function_def": {
                            const newCode = newMethods.get(idText(decl.name))!
                                .ast as AstTraitDeclaration;
                            newDeclarations.push(newCode);
                            break;
                        }
                        case "constant_decl":
                        case "constant_def": {
                            const newCode = newConstantsMap.get(
                                idText(decl.name),
                            )!.ast;
                            newDeclarations.push(newCode);
                            break;
                        }
                        case "field_decl": {
                            const newCode = newFieldsMap.get(
                                idText(decl.name),
                            )!.ast;
                            newDeclarations.push(newCode);
                            break;
                        }
                        case "receiver": {
                            const newCode = newReceiversMap.get(decl.id)!.ast;
                            newDeclarations.push(newCode);
                            break;
                        }
                    }
                }

                newAst = cloneAstNode({
                    ...t.ast,
                    declarations: newDeclarations,
                });

                break;
            }
            case "contract": {
                const newDeclarations: AstContractDeclaration[] = [];

                for (const decl of t.ast.declarations) {
                    switch (decl.kind) {
                        case "asm_function_def":
                        case "function_def": {
                            const newCode = newMethods.get(idText(decl.name))!
                                .ast as AstContractDeclaration;
                            newDeclarations.push(newCode);
                            break;
                        }
                        case "constant_def": {
                            const newCode = newConstantsMap.get(
                                idText(decl.name),
                            )!.ast as AstContractDeclaration;
                            newDeclarations.push(newCode);
                            break;
                        }
                        case "field_decl": {
                            const newCode = newFieldsMap.get(
                                idText(decl.name),
                            )!.ast;
                            newDeclarations.push(newCode);
                            break;
                        }
                        case "receiver": {
                            const newCode = newReceiversMap.get(decl.id)!.ast;
                            newDeclarations.push(newCode);
                            break;
                        }
                        case "contract_init":
                            newDeclarations.push(newInitializer!.ast);
                            break;
                    }
                }

                newAst = cloneAstNode({
                    ...t.ast,
                    declarations: newDeclarations,
                });

                break;
            }
        }

        newTypes.set(t.name, {
            ...t,
            ast: newAst,
            init: newInitializer,
            constants: newConstants,
            fields: newFields,
            functions: newMethods,
            receivers: newReceivers,
        });
    }
    ctx = replaceTypes(ctx, newTypes);

    return ctx;
}

function process_statements(
    statements: AstStatement[],
    ctx: CompilerContext,
    interpreter: Interpreter,
): { stmts: AstStatement[]; ctx: CompilerContext } {
    const newStatements: AstStatement[] = [];

    for (const stmt of statements) {
        const result = process_statement(stmt, ctx, interpreter);
        newStatements.push(result.stmt);
        ctx = result.ctx;
    }

    return { stmts: newStatements, ctx: ctx };
}

function process_statement(
    stmt: AstStatement,
    ctx: CompilerContext,
    interpreter: Interpreter,
): { stmt: AstStatement; ctx: CompilerContext } {
    switch (stmt.kind) {
        case "statement_assign":
        case "statement_expression":
        case "statement_let":
        case "statement_destruct":
        case "statement_augmentedassign": {
            const expressionResult = process_expression(
                stmt.expression,
                ctx,
                interpreter,
            );
            const new_expr = expressionResult.expr;
            ctx = expressionResult.ctx;

            // Create the replacement node
            return {
                stmt: cloneAstNode({
                    ...stmt,
                    expression: new_expr,
                }),
                ctx: ctx,
            };
        }
        case "statement_return": {
            if (stmt.expression !== null) {
                const expressionResult = process_expression(
                    stmt.expression,
                    ctx,
                    interpreter,
                );
                const new_expr = expressionResult.expr;
                ctx = expressionResult.ctx;

                // Create the replacement node
                return {
                    stmt: cloneAstNode({
                        ...stmt,
                        expression: new_expr,
                    }),
                    ctx: ctx,
                };
            }
            return {
                stmt: stmt,
                ctx: ctx,
            };
        }
        case "statement_condition": {
            const expressionResult = process_expression(
                stmt.condition,
                ctx,
                interpreter,
            );
            const newCondition = expressionResult.expr;
            ctx = expressionResult.ctx;

            const trueStatementsResult = process_statements(
                stmt.trueStatements,
                ctx,
                interpreter,
            );
            const newTrueStatements = trueStatementsResult.stmts;
            ctx = trueStatementsResult.ctx;

            let newFalseStatements: AstStatement[] | null = null;
            if (stmt.falseStatements !== null) {
                const falseStatementsResult = process_statements(
                    stmt.falseStatements,
                    ctx,
                    interpreter,
                );
                newFalseStatements = falseStatementsResult.stmts;
                ctx = falseStatementsResult.ctx;
            }

            let newElseIf: AstCondition | null = null;
            if (stmt.elseif !== null) {
                const elseIfResult = process_statement(
                    stmt.elseif,
                    ctx,
                    interpreter,
                );
                newElseIf = elseIfResult.stmt as AstCondition;
                ctx = elseIfResult.ctx;
            }

            // Create the replacement node
            return {
                stmt: cloneAstNode({
                    ...stmt,
                    condition: newCondition,
                    trueStatements: newTrueStatements,
                    falseStatements: newFalseStatements,
                    elseif: newElseIf,
                }),
                ctx: ctx,
            };
        }
        case "statement_foreach": {
            const expressionResult = process_expression(
                stmt.map,
                ctx,
                interpreter,
            );
            const newMap = expressionResult.expr;
            ctx = expressionResult.ctx;

            const statementsResult = process_statements(
                stmt.statements,
                ctx,
                interpreter,
            );
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            // Create the replacement node
            return {
                stmt: cloneAstNode({
                    ...stmt,
                    map: newMap,
                    statements: newStatements,
                }),
                ctx: ctx,
            };
        }
        case "statement_until":
        case "statement_while": {
            const expressionResult = process_expression(
                stmt.condition,
                ctx,
                interpreter,
            );
            const newCondition = expressionResult.expr;
            ctx = expressionResult.ctx;

            const statementsResult = process_statements(
                stmt.statements,
                ctx,
                interpreter,
            );
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            // Create the replacement node
            return {
                stmt: cloneAstNode({
                    ...stmt,
                    condition: newCondition,
                    statements: newStatements,
                }),
                ctx: ctx,
            };
        }
        case "statement_repeat": {
            const expressionResult = process_expression(
                stmt.iterations,
                ctx,
                interpreter,
            );
            const newIterations = expressionResult.expr;
            ctx = expressionResult.ctx;

            const statementsResult = process_statements(
                stmt.statements,
                ctx,
                interpreter,
            );
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            // Create the replacement node
            return {
                stmt: cloneAstNode({
                    ...stmt,
                    iterations: newIterations,
                    statements: newStatements,
                }),
                ctx: ctx,
            };
        }
        case "statement_try": {
            const statementsResult = process_statements(
                stmt.statements,
                ctx,
                interpreter,
            );
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            // Create the replacement node
            return {
                stmt: cloneAstNode({
                    ...stmt,
                    statements: newStatements,
                }),
                ctx: ctx,
            };
        }
        case "statement_try_catch": {
            const statementsResult = process_statements(
                stmt.statements,
                ctx,
                interpreter,
            );
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            const catchStatementsResult = process_statements(
                stmt.catchStatements,
                ctx,
                interpreter,
            );
            const newCatchStatements = catchStatementsResult.stmts;
            ctx = catchStatementsResult.ctx;

            // Create the replacement node
            return {
                stmt: cloneAstNode({
                    ...stmt,
                    statements: newStatements,
                    catchStatements: newCatchStatements,
                }),
                ctx: ctx,
            };
        }
    }
}

function process_expression(
    expr: AstExpression,
    ctx: CompilerContext,
    interpreter: Interpreter,
): { expr: AstExpression; ctx: CompilerContext } {
    const value = tryExpressionSimplification(expr, interpreter);
    let newExpr = expr;
    if (value !== undefined) {
        try {
            newExpr = makeValueExpression(value, expr.loc);
            // Register the new expression in the context
            ctx = registerAllSubExpTypes(ctx, newExpr, getExpType(ctx, expr));
        } catch (_) {
            // This means that transforming the value into an AST node is
            // unsupported or it failed to register the type of the expression.
            // Just use the original expression.
            newExpr = expr;
        }
    }
    return { expr: newExpr, ctx: ctx };
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

function registerAllSubExpTypes(ctx: CompilerContext, expr: AstValue, expType: TypeRef): CompilerContext {
    switch(expr.kind) {
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
                // Typechecking ensures that each field in the struct instance has a type
                const fieldType = fieldTypes.get(idText(fieldValue.field));
                if (fieldType === undefined) {
                    throwInternalCompilerError(`Field ${idText(fieldValue.field)} does not have a declared type in struct ${idText(expr.type)}.`, fieldValue.loc);
                }
                ctx = registerAllSubExpTypes(ctx, ensureAstValue(fieldValue.initializer, fieldValue.loc), fieldType);
            }
        }
    }
    return ctx;
}

function ensureAstValue(expr: AstExpression, src: SrcInfo): AstValue {
    switch(expr.kind) {
        case "boolean":
        case "null":
        case "number":
        case "string":
        case "struct_instance":
            return expr;
        default:
            throwInternalCompilerError(`Expressions of kind ${expr.kind} are not ASTValues.`, src);
    }
}
