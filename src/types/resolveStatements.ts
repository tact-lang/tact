import { CompilerContext } from "../context";
import { ASTCondition, ASTRef, ASTStatement, throwError } from "../grammar/ast";
import { isAssignable } from "./isAssignable";
import {
    getAllStaticFunctions,
    getAllTypes,
    resolveTypeRef,
} from "./resolveDescriptors";
import {
    getExpType,
    resolveExpression,
    resolveLValueRef,
} from "./resolveExpression";
import { printTypeRef, TypeRef } from "./types";

export type StatementContext = {
    root: ASTRef;
    returns: TypeRef;
    vars: Map<string, TypeRef>;
    requiredFields: string[];
};

function emptyContext(root: ASTRef, returns: TypeRef): StatementContext {
    return {
        root,
        returns,
        vars: new Map(),
        requiredFields: [],
    };
}

function addRequiredVariables(
    name: string,
    src: StatementContext,
): StatementContext {
    if (src.requiredFields.find((v) => v === name)) {
        throw Error("Variable already exists: " + name); // Should happen earlier
    }
    return {
        ...src,
        requiredFields: [...src.requiredFields, name],
    };
}

function removeRequiredVariable(
    name: string,
    src: StatementContext,
): StatementContext {
    if (!src.requiredFields.find((v) => v === name)) {
        throw Error("Variable is not required: " + name); // Should happen earlier
    }
    const filtered = src.requiredFields.filter((v) => v !== name);
    return {
        ...src,
        requiredFields: filtered,
    };
}

function addVariable(
    name: string,
    ref: TypeRef,
    src: StatementContext,
): StatementContext {
    if (src.vars.has(name)) {
        throw Error("Variable already exists: " + name); // Should happen earlier
    }
    return {
        ...src,
        vars: new Map(src.vars).set(name, ref),
    };
}

function processCondition(
    condition: ASTCondition,
    sctx: StatementContext,
    ctx: CompilerContext,
): {
    ctx: CompilerContext;
    sctx: StatementContext;
    returnAlwaysReachable: boolean;
} {
    // Process expression
    ctx = resolveExpression(condition.expression, sctx, ctx);
    let initialCtx = sctx;

    // Simple if
    if (condition.falseStatements === null && condition.elseif === null) {
        const r = processStatements(condition.trueStatements, initialCtx, ctx);
        ctx = r.ctx;
        return { ctx, sctx: initialCtx, returnAlwaysReachable: false };
    }

    // Simple if-else
    const processedCtx: StatementContext[] = [];
    const returnAlwaysReachableInAllBranches: boolean[] = [];

    // Process true branch
    const r = processStatements(condition.trueStatements, initialCtx, ctx);
    ctx = r.ctx;
    processedCtx.push(r.sctx);
    returnAlwaysReachableInAllBranches.push(r.returnAlwaysReachable);

    // Process else/elseif branch
    if (condition.falseStatements !== null && condition.elseif === null) {
        // if-else
        const r = processStatements(condition.falseStatements, initialCtx, ctx);
        ctx = r.ctx;
        processedCtx.push(r.sctx);
        returnAlwaysReachableInAllBranches.push(r.returnAlwaysReachable);
    } else if (
        condition.falseStatements === null &&
        condition.elseif !== null
    ) {
        // if-else if
        const r = processCondition(condition.elseif, initialCtx, ctx);
        ctx = r.ctx;
        processedCtx.push(r.sctx);
        returnAlwaysReachableInAllBranches.push(r.returnAlwaysReachable);
    } else {
        throw Error("Impossible");
    }

    // Merge statement contexts
    const removed: string[] = [];
    for (const f of initialCtx.requiredFields) {
        let found = false;
        for (const c of processedCtx) {
            if (c.requiredFields.find((v) => v === f)) {
                found = true;
                break;
            }
        }
        if (!found) {
            removed.push(f);
        }
    }
    for (const r of removed) {
        initialCtx = removeRequiredVariable(r, initialCtx);
    }

    return {
        ctx,
        sctx: initialCtx,
        returnAlwaysReachable: returnAlwaysReachableInAllBranches.every(
            (x) => x,
        ),
    };
}

function processStatements(
    statements: ASTStatement[],
    sctx: StatementContext,
    ctx: CompilerContext,
): {
    ctx: CompilerContext;
    sctx: StatementContext;
    returnAlwaysReachable: boolean;
} {
    // Process statements

    let returnAlwaysReachable = false;
    for (const s of statements) {
        // Check for unreachable
        if (returnAlwaysReachable) {
            throwError("Unreachable statement", s.ref);
        }

        // Process statement
        if (s.kind === "statement_let") {
            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

            // Check type
            const expressionType = getExpType(ctx, s.expression);
            const variableType = resolveTypeRef(ctx, s.type);
            if (!isAssignable(expressionType, variableType)) {
                throwError(
                    `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "${printTypeRef(variableType)}"`,
                    s.ref,
                );
            }

            // Add variable to statement context
            if (sctx.vars.has(s.name)) {
                throwError(`Variable "${s.name}" already exists`, s.ref);
            }
            sctx = addVariable(s.name, variableType, sctx);
        } else if (s.kind === "statement_assign") {
            // Process lvalue
            ctx = resolveLValueRef(s.path, sctx, ctx);

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

            // Check type
            const expressionType = getExpType(ctx, s.expression);
            const tailType = getExpType(ctx, s.path[s.path.length - 1]);
            if (!isAssignable(expressionType, tailType)) {
                throwError(
                    `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "${printTypeRef(tailType)}"`,
                    s.ref,
                );
            }

            // Mark as assigned
            if (s.path.length === 2 && s.path[0].name === "self") {
                const field = s.path[1].name;
                if (sctx.requiredFields.findIndex((v) => v === field) >= 0) {
                    sctx = removeRequiredVariable(field, sctx);
                }
            }
        } else if (s.kind == "statement_augmentedassign") {
            // Process lvalue
            ctx = resolveLValueRef(s.path, sctx, ctx);

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

            // Check type
            const expressionType = getExpType(ctx, s.expression);
            const tailType = getExpType(ctx, s.path[s.path.length - 1]);
            // Check if types are Int
            if (
                expressionType.kind !== "ref" ||
                expressionType.name !== "Int" ||
                expressionType.optional ||
                tailType.kind !== "ref" ||
                tailType.name !== "Int" ||
                tailType.optional
            ) {
                throwError(
                    `Type error: Augmented assignment is only allowed for Int type`,
                    s.ref,
                );
            }

            // Mark as assigned
            if (s.path.length === 2 && s.path[0].name === "self") {
                const field = s.path[1].name;
                if (sctx.requiredFields.findIndex((v) => v === field) >= 0) {
                    sctx = removeRequiredVariable(field, sctx);
                }
            }
        } else if (s.kind === "statement_expression") {
            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);
        } else if (s.kind === "statement_condition") {
            // Process condition (expression resolved inside)
            const r = processCondition(s, sctx, ctx);
            ctx = r.ctx;
            sctx = r.sctx;
            returnAlwaysReachable ||= r.returnAlwaysReachable;

            // Check type
            const expressionType = getExpType(ctx, s.expression);
            if (
                expressionType.kind !== "ref" ||
                expressionType.name !== "Bool" ||
                expressionType.optional
            ) {
                throwError(
                    `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "Bool"`,
                    s.ref,
                );
            }
        } else if (s.kind === "statement_return") {
            if (s.expression) {
                // Process expression
                ctx = resolveExpression(s.expression, sctx, ctx);

                // Check type
                const expressionType = getExpType(ctx, s.expression);
                if (!isAssignable(expressionType, sctx.returns)) {
                    throwError(
                        `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "${printTypeRef(sctx.returns)}"`,
                        s.ref,
                    );
                }
            } else {
                if (sctx.returns.kind !== "void") {
                    throwError(
                        `Type mismatch: "void" is not assignable to "${printTypeRef(sctx.returns)}"`,
                        s.ref,
                    );
                }
            }

            // Check if all required variables are assigned
            if (sctx.requiredFields.length > 0) {
                if (sctx.requiredFields.length === 1) {
                    throwError(
                        `Field "${sctx.requiredFields[0]}" is not set`,
                        sctx.root,
                    );
                } else {
                    throwError(
                        `Fields ${sctx.requiredFields.map((x) => '"' + x + '"').join(", ")} are not set`,
                        sctx.root,
                    );
                }
            }

            returnAlwaysReachable = true;
        } else if (s.kind === "statement_repeat") {
            // Process expression
            ctx = resolveExpression(s.iterations, sctx, ctx);

            // Process statements
            const r = processStatements(s.statements, sctx, ctx);
            ctx = r.ctx;

            // Check type
            const expressionType = getExpType(ctx, s.iterations);
            if (
                expressionType.kind !== "ref" ||
                expressionType.name !== "Int" ||
                expressionType.optional
            ) {
                throwError(
                    `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "Int"`,
                    s.ref,
                );
            }
        } else if (s.kind === "statement_until") {
            // Process expression
            ctx = resolveExpression(s.condition, sctx, ctx);

            // Process statements
            const r = processStatements(s.statements, sctx, ctx);
            ctx = r.ctx;
            // XXX a do-until loop is a weird place to always return from a function
            // so we might want to issue a warning here
            returnAlwaysReachable ||= r.returnAlwaysReachable;

            // Check type
            const expressionType = getExpType(ctx, s.condition);
            if (
                expressionType.kind !== "ref" ||
                expressionType.name !== "Bool" ||
                expressionType.optional
            ) {
                throwError(
                    `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "Bool"`,
                    s.ref,
                );
            }
        } else if (s.kind === "statement_while") {
            // Process expression
            ctx = resolveExpression(s.condition, sctx, ctx);

            // Process statements
            const r = processStatements(s.statements, sctx, ctx);
            ctx = r.ctx;
            // a while loop might be executed zero times, so
            // even if its body always returns from a function
            // we don't care

            // Check type
            const expressionType = getExpType(ctx, s.condition);
            if (
                expressionType.kind !== "ref" ||
                expressionType.name !== "Bool" ||
                expressionType.optional
            ) {
                throwError(
                    `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "Bool"`,
                    s.ref,
                );
            }
        } else if (s.kind === "statement_try") {
            // Process inner statements
            const r = processStatements(s.statements, sctx, ctx);
            ctx = r.ctx;
            sctx = r.sctx;
            // try-statement might not return from the current function
            // because the control flow can go to the empty catch block
        } else if (s.kind === "statement_try_catch") {
            let initialCtx = sctx;

            // Process inner statements
            const r = processStatements(s.statements, sctx, ctx);
            ctx = r.ctx;

            // Process catchName variable for exit code
            if (initialCtx.vars.has(s.catchName)) {
                throwError(`Variable already exists: "${s.catchName}"`, s.ref);
            }
            let catchCtx = addVariable(
                s.catchName,
                { kind: "ref", name: "Int", optional: false },
                initialCtx,
            );

            // Process catch statements
            const rCatch = processStatements(s.catchStatements, catchCtx, ctx);
            ctx = rCatch.ctx;
            catchCtx = rCatch.sctx;
            // if both catch- and try- blocks always return from the current function
            // we mark the whole try-catch statement as always returning
            returnAlwaysReachable ||=
                r.returnAlwaysReachable && rCatch.returnAlwaysReachable;

            // Merge statement contexts
            const removed: string[] = [];
            for (const f of initialCtx.requiredFields) {
                if (!catchCtx.requiredFields.find((v) => v === f)) {
                    removed.push(f);
                }
            }
            for (const r of removed) {
                initialCtx = removeRequiredVariable(r, initialCtx);
            }
        } else if (s.kind === "statement_foreach") {
            let initialCtx = sctx; // Preserve initial context to use later for merging

            // Resolve map expression
            ctx = resolveLValueRef(s.map, sctx, ctx);

            // Check if map is valid
            const mapType = getExpType(ctx, s.map[s.map.length - 1]);
            if (mapType.kind !== "map") {
                throwError(
                    `LValue "${s.map.map((x) => x.name).join(".")}" is not a map`,
                    s.ref,
                );
            }

            // Add key and value to statement context
            if (initialCtx.vars.has(s.keyName)) {
                throwError(`Variable already exists: "${s.keyName}"`, s.ref);
            }
            let foreachCtx = addVariable(
                s.keyName,
                { kind: "ref", name: mapType.key, optional: false },
                initialCtx,
            );
            if (foreachCtx.vars.has(s.valueName)) {
                throwError(`Variable already exists: "${s.valueName}"`, s.ref);
            }
            foreachCtx = addVariable(
                s.valueName,
                { kind: "ref", name: mapType.value, optional: false },
                foreachCtx,
            );

            // Process inner statements
            const r = processStatements(s.statements, foreachCtx, ctx);
            ctx = r.ctx;
            foreachCtx = r.sctx;

            // Merge statement contexts (similar to catch block merging)
            const removed: string[] = [];
            for (const f of initialCtx.requiredFields) {
                if (!foreachCtx.requiredFields.find((v) => v === f)) {
                    removed.push(f);
                }
            }
            for (const r of removed) {
                initialCtx = removeRequiredVariable(r, initialCtx);
            }

            sctx = initialCtx; // Re-assign the modified initial context back to sctx after merging
        } else {
            throw Error("Unknown statement");
        }
    }

    return { ctx, sctx, returnAlwaysReachable };
}

function processFunctionBody(
    statements: ASTStatement[],
    sctx: StatementContext,
    ctx: CompilerContext,
): CompilerContext {
    const res = processStatements(statements, sctx, ctx);

    // Check if a non-void function always returns a value
    if (sctx.returns.kind !== "void" && !res.returnAlwaysReachable) {
        throwError(
            `Function does not always return a result. Adding 'return' statement(s) should fix the issue.`,
            res.sctx.root,
        );
    }

    // Check if all required variables are assigned
    if (res.sctx.requiredFields.length > 0) {
        if (res.sctx.requiredFields.length === 1) {
            throwError(
                `Field "${res.sctx.requiredFields[0]}" is not set`,
                res.sctx.root,
            );
        } else {
            throwError(
                `Fields ${res.sctx.requiredFields.map((x) => '"' + x + '"').join(", ")} are not set`,
                res.sctx.root,
            );
        }
    }

    return res.ctx;
}

export function resolveStatements(ctx: CompilerContext) {
    // Process all static functions
    for (const f of Object.values(getAllStaticFunctions(ctx))) {
        if (f.ast.kind === "def_function") {
            // Build statement context
            let sctx = emptyContext(f.ast.ref, f.returns);
            for (const p of f.args) {
                sctx = addVariable(p.name, p.type, sctx);
            }

            // Process
            if (f.ast.statements) {
                ctx = processFunctionBody(f.ast.statements, sctx, ctx);
            }
        }
    }

    // Process all types
    for (const t of Object.values(getAllTypes(ctx))) {
        // Process init
        if (t.init) {
            // Build statement context
            let sctx = emptyContext(t.init.ast.ref, { kind: "void" });

            // Self
            sctx = addVariable(
                "self",
                { kind: "ref", name: t.name, optional: false },
                sctx,
            );

            // Required variables
            for (const f of t.fields) {
                if (f.default !== undefined) {
                    // NOTE: undefined is important here
                    continue;
                }
                if (isAssignable({ kind: "null" }, f.type)) {
                    continue;
                }
                sctx = addRequiredVariables(f.name, sctx);
            }

            // Args
            for (const p of t.init.args) {
                sctx = addVariable(p.name, p.type, sctx);
            }

            // Process
            ctx = processFunctionBody(t.init.ast.statements, sctx, ctx);
        }

        // Process receivers
        for (const f of Object.values(t.receivers)) {
            // Build statement context
            let sctx = emptyContext(f.ast.ref, { kind: "void" });
            sctx = addVariable(
                "self",
                { kind: "ref", name: t.name, optional: false },
                sctx,
            );
            if (
                f.selector.kind === "internal-binary" ||
                f.selector.kind === "external-binary"
            ) {
                sctx = addVariable(
                    f.selector.name,
                    { kind: "ref", name: f.selector.type, optional: false },
                    sctx,
                );
            } else if (
                f.selector.kind === "internal-empty" ||
                f.selector.kind === "external-empty" ||
                f.selector.kind === "external-comment" ||
                f.selector.kind === "internal-comment"
            ) {
                // Nothing to add to context
            } else if (
                f.selector.kind === "internal-comment-fallback" ||
                f.selector.kind === "external-comment-fallback"
            ) {
                sctx = addVariable(
                    f.selector.name,
                    { kind: "ref", name: "String", optional: false },
                    sctx,
                );
            } else if (
                f.selector.kind === "internal-fallback" ||
                f.selector.kind === "external-fallback"
            ) {
                sctx = addVariable(
                    f.selector.name,
                    { kind: "ref", name: "Slice", optional: false },
                    sctx,
                );
            } else if (f.selector.kind === "bounce-fallback") {
                sctx = addVariable(
                    f.selector.name,
                    { kind: "ref", name: "Slice", optional: false },
                    sctx,
                );
            } else if (f.selector.kind === "bounce-binary") {
                sctx = addVariable(
                    f.selector.name,
                    f.selector.bounced
                        ? { kind: "ref_bounced", name: f.selector.type }
                        : {
                              kind: "ref",
                              name: f.selector.type,
                              optional: false,
                          },
                    sctx,
                );
            } else {
                throw Error("Unknown selector");
            }

            // Process
            ctx = processFunctionBody(f.ast.statements, sctx, ctx);
        }

        // Process functions
        for (const f of t.functions.values()) {
            if (f.ast.kind !== "def_native_function") {
                // Build statement context
                let sctx = emptyContext(f.ast.ref, f.returns);
                sctx = addVariable(
                    "self",
                    { kind: "ref", name: t.name, optional: false },
                    sctx,
                );
                for (const a of f.args) {
                    sctx = addVariable(a.name, a.type, sctx);
                }

                // Process
                if (f.ast.statements) {
                    ctx = processFunctionBody(f.ast.statements, sctx, ctx);
                }
            }
        }
    }

    return ctx;
}
