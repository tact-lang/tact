import { CompilerContext } from "../context";
import { ASTCondition, ASTStatement, throwError } from "../grammar/ast";
import { isAssignable } from "./isAssignable";
import { getAllStaticFunctions, getAllTypes, resolveTypeRef } from "./resolveDescriptors";
import { getExpType, resolveExpression, resolveLValueRef } from "./resolveExpression";
import { printTypeRef, TypeRef } from "./types";

export type StatementContext = {
    returns: TypeRef,
    vars: { [name: string]: TypeRef };
};

function emptyContext(returns: TypeRef): StatementContext {
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

            // Check type
            let expressionType = getExpType(ctx, s.expression);
            let variableType = resolveTypeRef(ctx, s.type);
            if (!isAssignable(variableType, resolveTypeRef(ctx, s.type))) {
                throwError(`Type mismatch: ${printTypeRef(expressionType)} is not assignable to ${printTypeRef(variableType)}`, s.ref);
            }

            // Add variable to statement context
            if (sctx.vars[s.name]) {
                throwError(`Variable already exists: ${s.name}`, s.ref);
            }
            sctx = addVariable(s.name, variableType, sctx);

        } else if (s.kind === 'statement_assign') {

            // Process lvalue
            ctx = resolveLValueRef(s.path, sctx, ctx);

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

            // Check type
            let expressionType = getExpType(ctx, s.expression);
            let tailType = getExpType(ctx, s.path[s.path.length - 1]);
            if (!isAssignable(expressionType, tailType)) {
                throwError(`Type mismatch: ${printTypeRef(expressionType)} is not assignable to ${printTypeRef(tailType)}`, s.ref);
            }

        } else if (s.kind === 'statement_expression') {

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

        } else if (s.kind === 'statement_condition') {

            // Process condition (expression resolved inside)
            ctx = processCondition(s, sctx, ctx);

            // Check type
            let expressionType = getExpType(ctx, s.expression);
            if (expressionType.kind !== 'ref' || expressionType.name !== 'Bool' || expressionType.optional) {
                throwError(`Type mismatch: ${printTypeRef(expressionType)} is not assignable to Bool`, s.ref);
            }

        } else if (s.kind === 'statement_return') {

            if (s.expression) {

                // Process expression
                ctx = resolveExpression(s.expression, sctx, ctx);

                // Check type
                let expressionType = getExpType(ctx, s.expression);
                if (!isAssignable(expressionType, sctx.returns)) {
                    throwError(`Type mismatch: ${printTypeRef(expressionType)} is not assignable to ${printTypeRef(sctx.returns)}`, s.ref);
                }
            } else {
                if (sctx.returns.kind !== 'void') {
                    throwError(`Type mismatch: void is not assignable to ${printTypeRef(sctx.returns)}`, s.ref);
                }
            }

            // Mark as ended
            exited = true;

        } else if (s.kind === 'statement_repeat') {

            // Process expression
            ctx = resolveExpression(s.condition, sctx, ctx);

            // Check type
            let expressionType = getExpType(ctx, s.condition);
            if (expressionType.kind !== 'ref' || expressionType.name !== 'Int' || expressionType.optional) {
                throwError(`Type mismatch: ${printTypeRef(expressionType)} is not assignable to Int`, s.ref);
            }

            // Process inner statements
            ctx = processStatements(s.statements, sctx, ctx);

        } else if (s.kind === 'statement_until') {

            // Process expression
            ctx = resolveExpression(s.condition, sctx, ctx);

            // Check type
            let expressionType = getExpType(ctx, s.condition);
            if (expressionType.kind !== 'ref' || expressionType.name !== 'Bool' || expressionType.optional) {
                throwError(`Type mismatch: ${printTypeRef(expressionType)} is not assignable to bool`, s.ref);
            }

            // Process inner statements
            ctx = processStatements(s.statements, sctx, ctx);

        } else if (s.kind === 'statement_while') {

            // Process expression
            ctx = resolveExpression(s.condition, sctx, ctx);

            // Check type
            let expressionType = getExpType(ctx, s.condition);
            if (expressionType.kind !== 'ref' || expressionType.name !== 'Bool' || expressionType.optional) {
                throwError(`Type mismatch: ${printTypeRef(expressionType)} is not assignable to bool`, s.ref);
            }

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
            let sctx = emptyContext({ kind: 'void' });
            sctx = addVariable('self', { kind: 'ref', name: t.name, optional: false }, sctx);
            for (let p of t.init.args) {
                sctx = addVariable(p.name, p.type, sctx);
            }

            // Process
            ctx = processStatements(t.init.ast.statements, sctx, ctx);
        }

        // Process receivers
        for (const f of Object.values(t.receivers)) {

            // Build statement context
            let sctx = emptyContext({ kind: 'void' });
            sctx = addVariable('self', { kind: 'ref', name: t.name, optional: false }, sctx);
            if (f.selector.kind === 'internal-binary') {
                sctx = addVariable(f.selector.name, { kind: 'ref', name: f.selector.type, optional: false }, sctx);
            } else if (f.selector.kind === 'internal-empty') {
                // Nothing to add to context
            } else if (f.selector.kind === 'internal-comment-fallback') {
                sctx = addVariable(f.selector.name, { kind: 'ref', name: 'String', optional: false }, sctx);
            } else if (f.selector.kind === 'internal-fallback') {
                sctx = addVariable(f.selector.name, { kind: 'ref', name: 'Slice', optional: false }, sctx);
            } else if (f.selector.kind === 'internal-bounce') {
                sctx = addVariable(f.selector.name, { kind: 'ref', name: 'Slice', optional: false }, sctx);
            }

            // Process
            ctx = processStatements(f.ast.statements, sctx, ctx);
        }

        // Process functions
        for (let f of t.functions.values()) {
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