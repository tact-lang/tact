import { CompilerContext } from "../context";
import { TactConstEvalError } from "../errors";
import { resolveFuncType } from "../generator/writers/resolveFuncType";
import { AstCondition, AstExpression, AstFunctionDef, AstReceiver, AstStatement, AstValue, createAstNode } from "../grammar/ast";
import { Interpreter } from "../interpreter";
import { getAllStaticFunctions, getAllTypes, getStaticFunction, replaceStaticFunctions } from "../types/resolveDescriptors";
import { getExpType, registerExpType } from "../types/resolveExpression";
import { FunctionDescription, ReceiverDescription, Value } from "../types/types";
import { makeValueExpression } from "./util";

export function simplify_expressions(ctx: CompilerContext): CompilerContext {

    // The interpreter in charge of simplifiying expressions
    const interpreter = new Interpreter(ctx);

    // Traverse the program and attempt to evaluate every expression

    // Process functions
    const newFunctions: Map<string, FunctionDescription> = new Map();

    for (const f of getAllStaticFunctions(ctx)) {
        if (f.ast.kind === "function_def") {
            const statementsResult = process_statements(f.ast.statements, ctx, interpreter);
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;
            const newFunctionCode = createAstNode({...f.ast, statements: newStatements}) as AstFunctionDef;
            newFunctions.set(f.name, {...f, ast: newFunctionCode});
        }
        // The rest of kinds do not have explicit Tact expressions.
    }
    ctx = replaceStaticFunctions(ctx, newFunctions);

    // Process all types
    for (const t of getAllTypes(ctx)) {

        // Process init
        if (t.init) {
            process_statements(t.init.ast.statements, ctx, interpreter);
        }

        // TODO: Need to replace initializer function

        // Process receivers

        const newReceivers: ReceiverDescription[] = [];

        for (const r of t.receivers) {
            const statementsResult = process_statements(r.ast.statements, ctx, interpreter);
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;
            const newReceiverCode = createAstNode({...r.ast, statements: newStatements}) as AstReceiver;
            newReceivers.push({...r, ast: newReceiverCode});
        }

        // TODO: Need to replace the receivers in the type

        // Process methods
        for (const m of t.functions.values()) {
            if (m.ast.kind === "function_def") {
                process_statements(m.ast.statements, ctx, interpreter);
            }
            // The rest of kinds do not have explicit Tact expressions.
        }
        
        // TODO: Need to replace methods

    }
    return ctx;

}

function process_statements(statements: AstStatement[], ctx: CompilerContext, interpreter: Interpreter): { stmts: AstStatement[], ctx: CompilerContext } {
    const newStatements: AstStatement[] = [];

    for (const stmt of statements) {
        const result = process_statement(stmt, ctx, interpreter);
        newStatements.push(result.stmt);
        ctx = result.ctx;
    }

    return { stmts: newStatements, ctx: ctx };
}

function process_statement(stmt: AstStatement, ctx: CompilerContext, interpreter: Interpreter): { stmt: AstStatement, ctx: CompilerContext } {
    switch (stmt.kind) {
        case "statement_assign":
        case "statement_expression":
        case "statement_let":
        case "statement_destruct":
        case "statement_augmentedassign": {
            const value = tryExpression(stmt.expression, interpreter);
            if (value !== undefined) {
                const new_expr = makeValueExpression(value);
                // Register the new expression in the context
                ctx = registerExpType(ctx, new_expr, getExpType(ctx, stmt.expression));

                // Create the replacement node
                return {
                    stmt: createAstNode({
                        ...stmt,
                        expression: new_expr,
                    }) as AstStatement,
                    ctx: ctx
                };
            }
            return {
                stmt: stmt,
                ctx: ctx
            };
        }
        case "statement_return": {
            if (stmt.expression !== null) {
                const value = tryExpression(stmt.expression, interpreter);
                if (value !== undefined) {
                    const new_expr = makeValueExpression(value);
                    // Register the new expression in the context
                    ctx = registerExpType(ctx, new_expr, getExpType(ctx, stmt.expression));

                    // Create the replacement node
                    return {
                        stmt: createAstNode({
                            ...stmt,
                            expression: new_expr,
                        }) as AstStatement,
                        ctx: ctx
                    };
                }
            }
            return {
                stmt: stmt,
                ctx: ctx
            };
        }
        case "statement_condition": {
            const value = tryExpression(stmt.condition, interpreter);
            let newCondition = stmt.condition;
            if (value !== undefined) {
                newCondition = makeValueExpression(value);
                // Register the new expression in the context
                ctx = registerExpType(ctx, newCondition, getExpType(ctx, stmt.condition));
            }

            const trueStatementsResult = process_statements(stmt.trueStatements, ctx, interpreter);
            const newTrueStatements = trueStatementsResult.stmts;
            ctx = trueStatementsResult.ctx;

            let newFalseStatements: AstStatement[] | null = null;
            if (stmt.falseStatements !== null) {
                const falseStatementsResult = process_statements(stmt.falseStatements, ctx, interpreter);
                newFalseStatements = falseStatementsResult.stmts;
                ctx = falseStatementsResult.ctx;
            }

            let newElseIf: AstCondition | null = null;
            if (stmt.elseif !== null) {
                const elseIfResult = process_statement(stmt.elseif, ctx, interpreter);
                newElseIf = elseIfResult.stmt as AstCondition;
                ctx = elseIfResult.ctx;
            }

            // Create the replacement node
            return {
                stmt: createAstNode({
                    ...stmt,
                    condition: newCondition,
                    trueStatements: newTrueStatements,
                    falseStatements: newFalseStatements,
                    elseif: newElseIf
                }) as AstStatement,
                ctx: ctx
            };
        }
        case "statement_foreach": {
            const value = tryExpression(stmt.map, interpreter);
            let newMap = stmt.map;
            if (value !== undefined) {
                newMap = makeValueExpression(value);
                // Register the new expression in the context
                ctx = registerExpType(ctx, newMap, getExpType(ctx, stmt.map));
            }
            const statementsResult = process_statements(stmt.statements, ctx, interpreter);
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            // Create the replacement node
            return {
                stmt: createAstNode({
                    ...stmt,
                    map: newMap,
                    statements: newStatements,
                }) as AstStatement,
                ctx: ctx
            };
        }
        case "statement_until":
        case "statement_while": {
            const value = tryExpression(stmt.condition, interpreter);
            let newCondition = stmt.condition;
            if (value !== undefined) {
                newCondition = makeValueExpression(value);
                // Register the new expression in the context
                ctx = registerExpType(ctx, newCondition, getExpType(ctx, stmt.condition));
            }
            const statementsResult = process_statements(stmt.statements, ctx, interpreter);
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            // Create the replacement node
            return {
                stmt: createAstNode({
                    ...stmt,
                    condition: newCondition,
                    statements: newStatements,
                }) as AstStatement,
                ctx: ctx
            };
        }
        case "statement_repeat": {
            const value = tryExpression(stmt.iterations, interpreter);
            let newIterations = stmt.iterations;
            if (value !== undefined) {
                newIterations = makeValueExpression(value);
                // Register the new expression in the context
                ctx = registerExpType(ctx, newIterations, getExpType(ctx, stmt.iterations));
            }
            const statementsResult = process_statements(stmt.statements, ctx, interpreter);
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            // Create the replacement node
            return {
                stmt: createAstNode({
                    ...stmt,
                    iterations: newIterations,
                    statements: newStatements,
                }) as AstStatement,
                ctx: ctx
            };
        }
        case "statement_try": {
            const statementsResult = process_statements(stmt.statements, ctx, interpreter);
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            // Create the replacement node
            return {
                stmt: createAstNode({
                    ...stmt,
                    statements: newStatements,
                }) as AstStatement,
                ctx: ctx
            };
        }
        case "statement_try_catch": {
            const statementsResult = process_statements(stmt.statements, ctx, interpreter);
            const newStatements = statementsResult.stmts;
            ctx = statementsResult.ctx;

            const catchStatementsResult = process_statements(stmt.catchStatements, ctx, interpreter);
            const newCatchStatements = catchStatementsResult.stmts;
            ctx = catchStatementsResult.ctx;

            // Create the replacement node
            return {
                stmt: createAstNode({
                    ...stmt,
                    statements: newStatements,
                    catchStatements: newCatchStatements
                }) as AstStatement,
                ctx: ctx
            };
        }
    }
}

function tryExpression(expr: AstExpression, interpreter: Interpreter): Value | undefined {
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
