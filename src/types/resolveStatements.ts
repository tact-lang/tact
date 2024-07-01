import { CompilerContext } from "../context";
import {
    ASTCondition,
    SrcInfo,
    ASTStatement,
    tryExtractPath,
    AstId,
    idText,
    isWildcard,
    selfId,
} from "../grammar/ast";
import { isAssignable } from "./subtyping";
import { idTextErr, throwCompilationError } from "../errors";
import {
    getAllStaticFunctions,
    getAllTypes,
    resolveTypeRef,
} from "./resolveDescriptors";
import { getExpType, resolveExpression } from "./resolveExpression";
import { printTypeRef, TypeRef } from "./types";

export type StatementContext = {
    root: SrcInfo;
    returns: TypeRef;
    vars: Map<string, TypeRef>;
    requiredFields: string[];
};

function emptyContext(root: SrcInfo, returns: TypeRef): StatementContext {
    return {
        root,
        returns,
        vars: new Map(),
        requiredFields: [],
    };
}

function checkVariableExists(ctx: StatementContext, name: AstId): void {
    if (ctx.vars.has(idText(name))) {
        throwCompilationError(
            `Variable already exists: ${idTextErr(name)}`,
            name.ref,
        );
    }
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
    name: AstId,
    ref: TypeRef,
    src: StatementContext,
): StatementContext {
    checkVariableExists(src, name); // Should happen earlier
    if (isWildcard(name)) {
        return src;
    }
    return {
        ...src,
        vars: new Map(src.vars).set(idText(name), ref),
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
            throwCompilationError("Unreachable statement", s.ref);
        }

        // Process statement
        if (s.kind === "statement_let") {
            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

            // Check variable name
            checkVariableExists(sctx, s.name);

            // Check type
            const expressionType = getExpType(ctx, s.expression);
            if (s.type !== null) {
                const variableType = resolveTypeRef(ctx, s.type);
                if (!isAssignable(expressionType, variableType)) {
                    throwCompilationError(
                        `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "${printTypeRef(variableType)}"`,
                        s.ref,
                    );
                }
                sctx = addVariable(s.name, variableType, sctx);
            } else {
                if (expressionType.kind === "null") {
                    throwCompilationError(
                        `Cannot infer type for ${idTextErr(s.name)}`,
                        s.ref,
                    );
                }
                if (expressionType.kind === "void") {
                    throwCompilationError(
                        `The inferred type of variable ${idTextErr(s.name)} is "void", which is not allowed`,
                        s.ref,
                    );
                }
                sctx = addVariable(s.name, expressionType, sctx);
            }
        } else if (s.kind === "statement_assign") {
            const tempSctx = { ...sctx, requiredFields: [] };
            // Process lvalue
            ctx = resolveExpression(s.path, tempSctx, ctx);
            const path = tryExtractPath(s.path);
            if (path === null) {
                throwCompilationError(
                    `Assignments are allowed only into path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                    s.path.ref,
                );
            }

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

            // Check type
            const expressionType = getExpType(ctx, s.expression);
            const tailType = getExpType(ctx, s.path);
            if (!isAssignable(expressionType, tailType)) {
                throwCompilationError(
                    `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "${printTypeRef(tailType)}"`,
                    s.ref,
                );
            }

            // Mark as assigned
            if (path.length === 2 && path[0].text === "self") {
                const field = path[1].text;
                if (sctx.requiredFields.findIndex((v) => v === field) >= 0) {
                    sctx = removeRequiredVariable(field, sctx);
                }
            }
        } else if (s.kind == "statement_augmentedassign") {
            // Process lvalue
            const tempSctx = { ...sctx, requiredFields: [] };
            ctx = resolveExpression(s.path, tempSctx, ctx);
            const path = tryExtractPath(s.path);
            if (path === null) {
                throwCompilationError(
                    `Assignments are allowed only into path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                    s.path.ref,
                );
            }

            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);

            // Check type
            const expressionType = getExpType(ctx, s.expression);
            const tailType = getExpType(ctx, s.path);
            // Check if types are Int
            if (
                expressionType.kind !== "ref" ||
                expressionType.name !== "Int" ||
                expressionType.optional ||
                tailType.kind !== "ref" ||
                tailType.name !== "Int" ||
                tailType.optional
            ) {
                throwCompilationError(
                    `Type error: Augmented assignment is only allowed for Int type`,
                    s.ref,
                );
            }

            // Mark as assigned
            if (path.length === 2 && path[0].text === "self") {
                const field = path[1].text;
                if (sctx.requiredFields.findIndex((v) => v === field) >= 0) {
                    sctx = removeRequiredVariable(field, sctx);
                }
            }
        } else if (s.kind === "statement_expression") {
            // Process expression
            ctx = resolveExpression(s.expression, sctx, ctx);
            // take `throw` and `throwNative` into account when doing
            // return-reachability analysis
            if (
                s.expression.kind === "op_static_call" &&
                ["throw", "nativeThrow"].includes(idText(s.expression.name))
            ) {
                returnAlwaysReachable = true;
            }
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
                throwCompilationError(
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

                // Actually, we might relax the following restriction in the future
                // Because `return foo()` means `foo(); return` for a void-returning function
                // And `return foo()` looks nicer when the user needs early exit from a function
                // right after executing `foo()`
                if (expressionType.kind == "void") {
                    throwCompilationError(
                        `'return' statement can only be used with non-void types`,
                        s.ref,
                    );
                }
                if (!isAssignable(expressionType, sctx.returns)) {
                    throwCompilationError(
                        `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "${printTypeRef(sctx.returns)}"`,
                        s.ref,
                    );
                }
            } else {
                if (sctx.returns.kind !== "void") {
                    throwCompilationError(
                        `The function fails to return a result of type "${printTypeRef(sctx.returns)}"`,
                        s.ref,
                    );
                }
            }

            // Check if all required variables are assigned
            if (sctx.requiredFields.length > 0) {
                if (sctx.requiredFields.length === 1) {
                    throwCompilationError(
                        `Field "${sctx.requiredFields[0]}" is not set`,
                        sctx.root,
                    );
                } else {
                    throwCompilationError(
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
                throwCompilationError(
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
                throwCompilationError(
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
                throwCompilationError(
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

            let catchCtx = sctx;

            // Process catchName variable for exit code
            checkVariableExists(initialCtx, s.catchName);
            catchCtx = addVariable(
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
            ctx = resolveExpression(s.map, sctx, ctx);
            const mapPath = tryExtractPath(s.map);
            if (mapPath === null) {
                throwCompilationError(
                    `foreach is only allowed over maps that are path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                    s.map.ref,
                );
            }

            // Check if map is valid
            const mapType = getExpType(ctx, s.map);
            if (mapType.kind !== "map") {
                throwCompilationError(
                    `foreach can only be used on maps, but "${mapPath.map((id) => id.text).join(".")}" has type "${printTypeRef(mapType)}"`,
                    s.map.ref,
                );
            }

            let foreachCtx = sctx;

            // Add key and value to statement context
            if (!isWildcard(s.keyName)) {
                checkVariableExists(initialCtx, s.keyName);
                foreachCtx = addVariable(
                    s.keyName,
                    { kind: "ref", name: mapType.key, optional: false },
                    initialCtx,
                );
            }
            if (!isWildcard(s.valueName)) {
                checkVariableExists(foreachCtx, s.valueName);
                foreachCtx = addVariable(
                    s.valueName,
                    { kind: "ref", name: mapType.value, optional: false },
                    foreachCtx,
                );
            }

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
        throwCompilationError(
            `Function does not always return a result. Adding 'return' statement(s) should fix the issue.`,
            res.sctx.root,
        );
    }

    // Check if all required variables are assigned
    if (res.sctx.requiredFields.length > 0) {
        if (res.sctx.requiredFields.length === 1) {
            throwCompilationError(
                `Field "${res.sctx.requiredFields[0]}" is not set`,
                res.sctx.root,
            );
        } else {
            throwCompilationError(
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
        if (f.ast.kind === "function_def") {
            // Build statement context
            let sctx = emptyContext(f.ast.ref, f.returns);
            for (const p of f.params) {
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
                selfId,
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
            for (const p of t.init.params) {
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
                selfId,
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
            if (f.ast.kind !== "native_function_decl") {
                // Build statement context
                let sctx = emptyContext(f.ast.ref, f.returns);
                sctx = addVariable(
                    selfId,
                    { kind: "ref", name: t.name, optional: false },
                    sctx,
                );
                for (const a of f.params) {
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
