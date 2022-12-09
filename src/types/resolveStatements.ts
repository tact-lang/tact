import { CompilerContext } from "../context";
import { ASTCondition, ASTStatement, throwError } from "../grammar/ast";
import { getAllStaticFunctions, getAllTypes, resolveTypeRef } from "./resolveDescriptors";
import { resolveExpression, resolveLValueRef } from "./resolveExpression";
import { TypeRef } from "./types";

export type StatementContext = {
    returns: TypeRef | null,
    vars: { [name: string]: TypeRef };
};

function emptyContext(returns: TypeRef | null): StatementContext {
    return {
        returns,
        vars: {}
    };
}

function addVariable(name: string, ref: TypeRef, src: StatementContext): StatementContext {
    if (src.vars[name]) {
        throw Error('Variable already exists: ' + name); // Should happen earlier
    }
    return {
        ...src,
        vars: {
            ...src.vars,
            [name]: ref
        }
    };
}

function processCondition(condition: ASTCondition, sctx: StatementContext, ctx: CompilerContext): CompilerContext {

    // Process expression
    ctx = resolveExpression(condition.expression, sctx, ctx);

    // Process branches
    if (condition.trueStatements.length > 0) {
        ctx = processStatements(condition.trueStatements, sctx, ctx);
    }
    if (condition.falseStatements.length > 0) {
        ctx = processStatements(condition.falseStatements, sctx, ctx);
    }
    if (condition.elseif) {
        ctx = processCondition(condition.elseif, sctx, ctx);
    }

    return ctx;
}

function processStatements(statements: ASTStatement[], sctx: StatementContext, ctx: CompilerContext): CompilerContext {

    // Process statements

    let exited = false;
    for (let s of statements) {

        // Check for unreachable
        if (exited) {
            throwError('Unreachable statement', s.ref);
        }

        // Process statement
        if (s.kind === 'statement_let') {

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

            // Add variable to statement context
            if (sctx.vars[s.name]) {
                throwError(`Variable already exists: ${s.name}`, s.ref);
            }
            sctx = addVariable(s.name, resolveTypeRef(ctx, s.type), sctx);

        } else if (s.kind === 'statement_assign') {

            // Process lvalue
            ctx = resolveLValueRef(s.path, sctx, ctx);

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

        } else if (s.kind === 'statement_expression') {

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

        } else if (s.kind === 'statement_condition') {

            // Process condition (expression resolved inside)
            ctx = processCondition(s, sctx, ctx);

        } else if (s.kind === 'statement_return') {

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

            // Mark as ended
            exited = true;

        } else if (s.kind === 'statement_repeat') {

            // Process expression
            ctx = resolveExpression(s.condition, sctx, ctx);

            // Process inner statements
            ctx = processStatements(s.statements, sctx, ctx);

        } else if (s.kind === 'statement_until') {

            // Process expression
            ctx = resolveExpression(s.condition, sctx, ctx);

            // Process inner statements
            ctx = processStatements(s.statements, sctx, ctx);

        } else if (s.kind === 'statement_while') {

            // Process expression
            ctx = resolveExpression(s.condition, sctx, ctx);

            // Process inner statements
            ctx = processStatements(s.statements, sctx, ctx);

        } else {
            throw Error('Unknown statement');
        }
    }

    return ctx;
}

export function resolveStatements(ctx: CompilerContext) {

    // Process all static functions
    for (let f of Object.values(getAllStaticFunctions(ctx))) {
        if (f.ast.kind === 'def_function') {

            // Build statement context
            let sctx = emptyContext(f.returns);
            for (let p of f.args) {
                sctx = addVariable(p.name, p.type, sctx);
            }

            // Process
            ctx = processStatements(f.ast.statements, sctx, ctx);
        }
    }

    // Process all types
    for (let t of Object.values(getAllTypes(ctx))) {

        // Process init
        if (t.init) {

            // Build statement context
            let sctx = emptyContext(null);
            sctx = addVariable('self', { kind: 'ref', name: t.name, optional: false }, sctx);
            for (let p of t.init.args) {
                sctx = addVariable(p.name, p.type, sctx);
            }

            // Process
            ctx = processStatements(t.init.ast.statements, sctx, ctx);
        }

        // Process receivers
        for (let f of Object.values(t.receivers)) {

            // Build statement context
            let sctx = emptyContext(null);
            sctx = addVariable('self', { kind: 'ref', name: t.name, optional: false }, sctx);
            sctx = addVariable(f.name, { kind: 'ref', name: f.type, optional: false }, sctx);

            // Process
            ctx = processStatements(f.ast.statements, sctx, ctx);
        }

        // Process functions
        for (let f of Object.values(t.functions)) {
            if (f.ast.kind !== 'def_native_function') {

                // Build statement context
                let sctx = emptyContext(f.returns);
                sctx = addVariable('self', { kind: 'ref', name: t.name, optional: false }, sctx);
                for (let a of f.args) {
                    sctx = addVariable(a.name, a.type, sctx);
                }

                // Process
                ctx = processStatements(f.ast.statements, sctx, ctx);
            }
        }
    }

    return ctx;
}