import { CompilerContext } from "../context";
import {
    AstCondition,
    SrcInfo,
    AstStatement,
    tryExtractPath,
    AstId,
    idText,
    isWildcard,
    selfId,
    isSelfId,
    eqNames,
    AstExpression,
    isValue,
    AstValue,
} from "../grammar/ast";
import { isAssignable } from "./subtyping";
import {
    idTextErr,
    TactConstEvalError,
    throwCompilationError,
    throwInternalCompilerError,
} from "../errors";
import {
    getAllStaticFunctions,
    getStaticConstant,
    getType,
    hasStaticConstant,
    resolveTypeRef,
    getAllTypes,
} from "./resolveDescriptors";
import { getExpType, resolveExpression } from "./resolveExpression";
import { CommentValue, eqValues, printTypeRef, TypeRef, Value } from "./types";
import { evalConstantExpression, partiallyEvalExpression } from "../constEval";
import { extractValue, makeBinaryExpression, makeValueExpression } from "../optimizer/util";
import { evalBinaryOp } from "../interpreter";
import { Address, Cell } from "@ton/core";

export type StatementContext = {
    root: SrcInfo;
    funName: string | null;
    returns: TypeRef;
    vars: Map<string, TypeRef>;
    requiredFields: string[];
    // The compiler will keep track of local assignments to variables for analysis
    varBindings: Map<string, Value>;
    // The compiler will also track those variables that become "undetermined".
    // A variable is undetermined when it has conflicting values in different branches of the program.
    // Remember that the compiler DOES not execute the program, it only keeps track
    // of variable values for analysis at compile time. So, if the same variable gets assigned
    // two different values in, say, two branches of a conditional, the compiler will mark it
    // as undetermined.
    undeterminedVars: Set<string>;

};

export function emptyContext(
    root: SrcInfo,
    funName: string | null,
    returns: TypeRef,
): StatementContext {
    return {
        root,
        funName,
        returns,
        vars: new Map(),
        requiredFields: [],
        varBindings: new Map(),
        undeterminedVars: new Set(),
    };
}

function checkVariableExists(
    ctx: CompilerContext,
    sctx: StatementContext,
    name: AstId,
): void {
    if (sctx.vars.has(idText(name))) {
        throwCompilationError(
            `Variable already exists: ${idTextErr(name)}`,
            name.loc,
        );
    }
    // Check if the user tries to shadow the current function name
    if (sctx.funName === idText(name)) {
        throwCompilationError(
            `Variable cannot have the same name as its enclosing function: ${idTextErr(name)}`,
            name.loc,
        );
    }
    if (hasStaticConstant(ctx, idText(name))) {
        if (name.loc.origin === "stdlib") {
            const constLoc = getStaticConstant(ctx, idText(name)).loc;
            throwCompilationError(
                `Constant ${idTextErr(name)} is shadowing an identifier defined in the Tact standard library: pick a different constant name`,
                constLoc,
            );
        } else {
            throwCompilationError(
                `Variable ${idTextErr(name)} is trying to shadow an existing constant with the same name`,
                name.loc,
            );
        }
    }
}

function addRequiredVariables(
    name: string,
    src: StatementContext,
): StatementContext {
    if (src.requiredFields.find((v) => v === name)) {
        throwInternalCompilerError(`Variable already exists: ${name}`); // Should happen earlier
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
        throwInternalCompilerError(`Variable is not required: ${name}`); // Should happen earlier
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
    ctx: CompilerContext,
    sctx: StatementContext,
    varValue?: Value
): StatementContext {
    checkVariableExists(ctx, sctx, name); // Should happen earlier
    if (isWildcard(name)) {
        return sctx;
    }
    return {
        ...sctx,
        vars: new Map(sctx.vars).set(idText(name), ref),
        varBindings: varValue !== undefined ? new Map(sctx.varBindings).set(idText(name), varValue) : sctx.varBindings,
    };
}

export function lookupVariable(name: AstId, sctx: StatementContext): Value | undefined {
    if (isWildcard(name)) {
        return undefined;
    }
    // We should return a variable only if it is NOT marked as undetermined.
    if (!sctx.undeterminedVars.has(idText(name))) {
        return sctx.varBindings.get(idText(name));
    }

    return undefined;
}

export function assignVariable(name: AstId, value: Value, sctx: StatementContext): StatementContext {
    if (isWildcard(name)) {
        return sctx;
    }
    // Whenever we assign a variable with a value, it becomes determined.
    // So, remove it from the set of undetermined variables.
    const r = new Set(sctx.undeterminedVars);
    r.delete(idText(name));
    return {
        ...sctx,
        varBindings: new Map(sctx.varBindings).set(idText(name), value),
        undeterminedVars: r,
    };
}

function processCondition(
    condition: AstCondition,
    sctx: StatementContext,
    ctx: CompilerContext,
): {
    ctx: CompilerContext;
    sctx: StatementContext;
    returnAlwaysReachable: boolean;
} {
    // Process expression
    ctx = resolveExpression(condition.condition, sctx, ctx);

    // Evaluate the condition in the current context
    const rawConditionValue = callExpressionEvaluation(condition.condition, ctx, sctx);
    let conditionValue: boolean | undefined = undefined;

    if (rawConditionValue !== undefined && typeof rawConditionValue === 'boolean') {
        conditionValue = rawConditionValue;
    }

    let initialCtx = sctx;

    // Simple if
    if (condition.falseStatements === null && condition.elseif === null) {
        const r = processStatements(condition.trueStatements, initialCtx, ctx);
        ctx = r.ctx;

        // Since there is no alternative branch, we only need to check if the condition
        // can be determined 
        if (conditionValue !== undefined) {
            if (conditionValue) {
                // Copy the latest updates to all variables in initialCtx as found in r.sctx
                initialCtx = synchronizeVariableContexts(initialCtx, r.sctx);
            } 
            // If the condition does not hold, then we ignore any updates to variables
            // in r.sctx, and leave initialCtx as is.
        } else {
            // The condition cannot be determined. We need to mark variables in initialCtx as
            // undetermined only if they have conflicting values in r.sctx.
            // Note we need to add initialCtx in the updatedCtxs because it is the implicit 
            // "else" branch.
            initialCtx = markConflictingVariables(initialCtx, r.sctx, initialCtx);
        }
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
        throwInternalCompilerError("Impossible");
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

    // Now merge the assignments in the different contexts according to the condition value 
        if (conditionValue !== undefined) {
            if (conditionValue) {
                // Copy the latest updates to all variables in initialCtx as found in 
                // processedCtx[0] (i.e., the context from the true branch)
                initialCtx = synchronizeVariableContexts(initialCtx, processedCtx[0]!);
            } else {
                // If the condition does not hold, take the updates from processedCtx[1]
                // i.e., whatever branch executed as else or elseif
                initialCtx = synchronizeVariableContexts(initialCtx, processedCtx[1]!);
            }
        } else {
            // The condition cannot be determined. We need to mark variables in initialCtx as
            // undetermined only if they have conflicting values in the updated contexts.
            initialCtx = markConflictingVariables(initialCtx, ...processedCtx);
        }

    return {
        ctx,
        sctx: initialCtx,
        returnAlwaysReachable: returnAlwaysReachableInAllBranches.every(
            (x) => x,
        ),
    };
}

// Precondition: `self` here means a contract or a trait,
// and not a `self` parameter of a mutating method
export function isLvalue(path: AstId[], ctx: CompilerContext): boolean {
    const headId = path[0]!;
    if (isSelfId(headId) && path.length > 1) {
        // we can be dealing with a contract/trait constant `self.constFoo`
        const selfTypeRef = getExpType(ctx, headId);
        if (selfTypeRef.kind == "ref") {
            const contractTypeDescription = getType(ctx, selfTypeRef.name);
            return (
                contractTypeDescription.constants.findIndex((constDescr) =>
                    eqNames(path[1]!, constDescr.name),
                ) === -1
            );
        } else {
            return true;
        }
    } else {
        // if the head path symbol is a global constant, then the whole path expression is a constant
        return !hasStaticConstant(ctx, idText(headId));
    }
}

function callExpressionEvaluation(ast: AstExpression, ctx: CompilerContext, sctx: StatementContext): Value | undefined {
    try {
        const expr = partiallyEvalExpression(ast, {ctx: ctx, sctx: sctx});
        if (isValue(expr)) {
            return extractValue(expr as AstValue);
        }
        return undefined;
    } catch (e) {
        if (e instanceof TactConstEvalError) {
            if (!e.fatal) {
                // If a non-fatal error occurs during expression evaluation
                // return the original expression.
                return undefined;
            }
        }
        throw e;
    }
}

function processStatements(
    statements: AstStatement[],
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
            throwCompilationError("Unreachable statement", s.loc);
        }

        // Process statement
        switch (s.kind) {
            case "statement_let":
                {
                    // Process expression
                    ctx = resolveExpression(s.expression, sctx, ctx);

                    // Check variable name
                    checkVariableExists(ctx, sctx, s.name);

                    // Check type
                    const expressionType = getExpType(ctx, s.expression);
                    if (s.type !== null) {
                        const variableType = resolveTypeRef(ctx, s.type);
                        if (!isAssignable(expressionType, variableType)) {
                            throwCompilationError(
                                `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "${printTypeRef(variableType)}"`,
                                s.loc,
                            );
                        }

                        const varDef = callExpressionEvaluation(s.expression, ctx, sctx);
                        sctx = addVariable(s.name, variableType, ctx, sctx, varDef);
                    } else {
                        if (expressionType.kind === "null") {
                            throwCompilationError(
                                `Cannot infer type for ${idTextErr(s.name)}`,
                                s.loc,
                            );
                        }
                        if (expressionType.kind === "void") {
                            throwCompilationError(
                                `The inferred type of variable ${idTextErr(s.name)} is "void", which is not allowed`,
                                s.loc,
                            );
                        }

                        const varDef = callExpressionEvaluation(s.expression, ctx, sctx);
                        sctx = addVariable(s.name, expressionType, ctx, sctx, varDef);
                        
                    }
                }
                break;
            case "statement_assign":
                {
                    const tempSctx = { ...sctx, requiredFields: [] };
                    // Process lvalue
                    ctx = resolveExpression(s.path, tempSctx, ctx);
                    const path = tryExtractPath(s.path);
                    if (path === null) {
                        throwCompilationError(
                            `Assignments are allowed only into path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                            s.path.loc,
                        );
                    }
                    if (!isLvalue(path, ctx)) {
                        throwCompilationError(
                            "Modifications of constant expressions are not allowed",
                            s.path.loc,
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
                            s.loc,
                        );
                    }

                    // Mark as assigned
                    if (path.length === 2 && path[0]!.text === "self") {
                        const field = path[1]!.text;
                        if (
                            sctx.requiredFields.findIndex((v) => v === field) >=
                            0
                        ) {
                            sctx = removeRequiredVariable(field, sctx);
                        }
                    }

                    const exprVal = callExpressionEvaluation(s.expression, ctx, sctx);

                    if (path.length === 1 && exprVal !== undefined) {
                        sctx = assignVariable(path[0]!, exprVal, sctx);
                    }
                }
                break;
            case "statement_augmentedassign":
                {
                    // Process lvalue
                    const tempSctx = { ...sctx, requiredFields: [] };
                    ctx = resolveExpression(s.path, tempSctx, ctx);
                    const path = tryExtractPath(s.path);
                    if (path === null) {
                        throwCompilationError(
                            `Assignments are allowed only into path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                            s.path.loc,
                        );
                    }
                    if (!isLvalue(path, ctx)) {
                        throwCompilationError(
                            "Modifications of constant expressions are not allowed",
                            s.path.loc,
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
                            s.loc,
                        );
                    }

                    const exprVal = callExpressionEvaluation(s.expression, ctx, sctx);

                    if (path.length === 1 && exprVal !== undefined) {
                        const currVal = lookupVariable(path[0]!, sctx);
                        if (currVal !== undefined) {
                            const finalVal = evalBinaryOp(
                                s.op, 
                                currVal, 
                                exprVal);
                            sctx = assignVariable(path[0]!, finalVal, sctx);    
                        }
                    }
                }
                break;
            case "statement_expression":
                {
                    // Process expression
                    ctx = resolveExpression(s.expression, sctx, ctx);
                    // take `throw` and `throwNative` into account when doing
                    // return-reachability analysis
                    if (
                        s.expression.kind === "static_call" &&
                        ["throw", "nativeThrow"].includes(
                            idText(s.expression.function),
                        )
                    ) {
                        returnAlwaysReachable = true;
                    }

                    // Evaluate the expression just in case there are errors
                    callExpressionEvaluation(s.expression, ctx, sctx);
                }
                break;
            case "statement_condition":
                {
                    // Process condition (expression resolved inside)
                    const r = processCondition(s, sctx, ctx);
                    ctx = r.ctx;
                    sctx = r.sctx;
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
                            s.loc,
                        );
                    }
                }
                break;
            case "statement_return":
                {
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
                                s.loc,
                            );
                        }
                        if (!isAssignable(expressionType, sctx.returns)) {
                            throwCompilationError(
                                `Type mismatch: "${printTypeRef(expressionType)}" is not assignable to "${printTypeRef(sctx.returns)}"`,
                                s.loc,
                            );
                        }
                    } else {
                        if (sctx.returns.kind !== "void") {
                            throwCompilationError(
                                `The function fails to return a result of type "${printTypeRef(sctx.returns)}"`,
                                s.loc,
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
                }
                break;
            case "statement_repeat":
                {
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
                            s.loc,
                        );
                    }
                }
                break;
            case "statement_until":
                {
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
                            s.loc,
                        );
                    }
                }
                break;
            case "statement_while":
                {
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
                            s.loc,
                        );
                    }
                }
                break;
            case "statement_try":
                {
                    // Process inner statements
                    const r = processStatements(s.statements, sctx, ctx);
                    ctx = r.ctx;
                    sctx = r.sctx;
                    // try-statement might not return from the current function
                    // because the control flow can go to the empty catch block
                }
                break;
            case "statement_try_catch":
                {
                    let initialSctx = sctx;

                    // Process inner statements
                    const r = processStatements(s.statements, sctx, ctx);
                    ctx = r.ctx;

                    let catchCtx = sctx;

                    // Process catchName variable for exit code
                    checkVariableExists(ctx, initialSctx, s.catchName);
                    catchCtx = addVariable(
                        s.catchName,
                        { kind: "ref", name: "Int", optional: false },
                        ctx,
                        initialSctx,
                    );

                    // Process catch statements
                    const rCatch = processStatements(
                        s.catchStatements,
                        catchCtx,
                        ctx,
                    );
                    ctx = rCatch.ctx;
                    catchCtx = rCatch.sctx;
                    // if both catch- and try- blocks always return from the current function
                    // we mark the whole try-catch statement as always returning
                    returnAlwaysReachable ||=
                        r.returnAlwaysReachable && rCatch.returnAlwaysReachable;

                    // Merge statement contexts
                    const removed: string[] = [];
                    for (const f of initialSctx.requiredFields) {
                        if (!catchCtx.requiredFields.find((v) => v === f)) {
                            removed.push(f);
                        }
                    }
                    for (const r of removed) {
                        initialSctx = removeRequiredVariable(r, initialSctx);
                    }
                }
                break;
            case "statement_foreach": {
                let initialSctx = sctx; // Preserve initial context to use later for merging

                // Resolve map expression
                ctx = resolveExpression(s.map, sctx, ctx);
                const mapPath = tryExtractPath(s.map);
                if (mapPath === null) {
                    throwCompilationError(
                        `foreach is only allowed over maps that are path expressions, i.e. identifiers, or sequences of direct contract/struct/message accesses, like "self.foo" or "self.structure.field"`,
                        s.map.loc,
                    );
                }

                // Check if map is valid
                const mapType = getExpType(ctx, s.map);
                if (mapType.kind !== "map") {
                    throwCompilationError(
                        `foreach can only be used on maps, but "${mapPath.map((id) => id.text).join(".")}" has type "${printTypeRef(mapType)}"`,
                        s.map.loc,
                    );
                }

                let foreachSctx = sctx;

                // Add key and value to statement context
                if (!isWildcard(s.keyName)) {
                    checkVariableExists(ctx, initialSctx, s.keyName);
                    foreachSctx = addVariable(
                        s.keyName,
                        { kind: "ref", name: mapType.key, optional: false },
                        ctx,
                        initialSctx,
                    );
                }
                if (!isWildcard(s.valueName)) {
                    checkVariableExists(ctx, foreachSctx, s.valueName);
                    foreachSctx = addVariable(
                        s.valueName,
                        { kind: "ref", name: mapType.value, optional: false },
                        ctx,
                        foreachSctx,
                    );
                }

                // Process inner statements
                const r = processStatements(s.statements, foreachSctx, ctx);
                ctx = r.ctx;
                foreachSctx = r.sctx;

                // Merge statement contexts (similar to catch block merging)
                const removed: string[] = [];
                for (const f of initialSctx.requiredFields) {
                    if (!foreachSctx.requiredFields.find((v) => v === f)) {
                        removed.push(f);
                    }
                }
                for (const r of removed) {
                    initialSctx = removeRequiredVariable(r, initialSctx);
                }

                sctx = initialSctx; // Re-assign the modified initial context back to sctx after merging
            }
        }
    }

    return { ctx, sctx, returnAlwaysReachable };
}

function processFunctionBody(
    statements: AstStatement[],
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
    for (const f of getAllStaticFunctions(ctx)) {
        if (f.ast.kind === "function_def") {
            // Build statement context
            let sctx = emptyContext(f.ast.loc, f.name, f.returns);
            for (const p of f.params) {
                sctx = addVariable(p.name, p.type, ctx, sctx);
            }

            ctx = processFunctionBody(f.ast.statements, sctx, ctx);
        }
    }

    // Process all types
    for (const t of getAllTypes(ctx)) {
        // Process init
        if (t.init) {
            // Build statement context
            let sctx = emptyContext(t.init.ast.loc, null, { kind: "void" });

            // Self
            sctx = addVariable(
                selfId,
                { kind: "ref", name: t.name, optional: false },
                ctx,
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
                sctx = addVariable(p.name, p.type, ctx, sctx);
            }

            // Process
            ctx = processFunctionBody(t.init.ast.statements, sctx, ctx);
        }

        // Process receivers
        for (const f of t.receivers) {
            // Build statement context
            let sctx = emptyContext(f.ast.loc, null, { kind: "void" });
            sctx = addVariable(
                selfId,
                { kind: "ref", name: t.name, optional: false },
                ctx,
                sctx,
            );
            switch (f.selector.kind) {
                case "internal-binary":
                case "external-binary":
                    {
                        sctx = addVariable(
                            f.selector.name,
                            {
                                kind: "ref",
                                name: f.selector.type,
                                optional: false,
                            },
                            ctx,
                            sctx,
                        );
                    }
                    break;
                case "internal-empty":
                case "external-empty":
                case "external-comment":
                case "internal-comment":
                    // Nothing to add to context
                    break;
                case "internal-comment-fallback":
                case "external-comment-fallback":
                    {
                        sctx = addVariable(
                            f.selector.name,
                            { kind: "ref", name: "String", optional: false },
                            ctx,
                            sctx,
                        );
                    }
                    break;
                case "internal-fallback":
                case "external-fallback":
                    {
                        sctx = addVariable(
                            f.selector.name,
                            { kind: "ref", name: "Slice", optional: false },
                            ctx,
                            sctx,
                        );
                    }
                    break;
                case "bounce-fallback":
                    {
                        sctx = addVariable(
                            f.selector.name,
                            { kind: "ref", name: "Slice", optional: false },
                            ctx,
                            sctx,
                        );
                    }
                    break;
                case "bounce-binary":
                    {
                        sctx = addVariable(
                            f.selector.name,
                            f.selector.bounced
                                ? { kind: "ref_bounced", name: f.selector.type }
                                : {
                                      kind: "ref",
                                      name: f.selector.type,
                                      optional: false,
                                  },
                            ctx,
                            sctx,
                        );
                    }
                    break;
            }
            // Process
            ctx = processFunctionBody(f.ast.statements, sctx, ctx);
        }

        // Process functions
        for (const f of t.functions.values()) {
            if (
                f.ast.kind !== "native_function_decl" &&
                f.ast.kind !== "function_decl"
            ) {
                // Build statement context
                let sctx = emptyContext(f.ast.loc, f.name, f.returns);
                sctx = addVariable(
                    selfId,
                    { kind: "ref", name: t.name, optional: false },
                    ctx,
                    sctx,
                );
                for (const a of f.params) {
                    sctx = addVariable(a.name, a.type, ctx, sctx);
                }

                ctx = processFunctionBody(f.ast.statements, sctx, ctx);
            }
        }
    }

    return ctx;
}

function synchronizeVariableContexts(initialCtx: StatementContext, updatedCtx: StatementContext): StatementContext {
    // The updated context must contain the variables in the initial context
    for (let key of initialCtx.varBindings.keys()) {
        if (!updatedCtx.varBindings.has(key)) {
            throwInternalCompilerError("One updated StatementContext must contain the variables in the initial context.");
        }
    }

    const newBindings = new Map(initialCtx.varBindings);
    const newUndetermined = new Set<string>();

    for (let key of initialCtx.varBindings.keys()) {
        newBindings.set(key, updatedCtx.varBindings.get(key)!);
    }

    // Now, mark those variables in initialCtx that became undetermined 
    // in updatedCtx
    
    for (let key of initialCtx.varBindings.keys()) {
        if (updatedCtx.undeterminedVars.has(key)) {
            newUndetermined.add(key);
        }
    }

    return {...initialCtx,
        varBindings: newBindings,
        undeterminedVars: newUndetermined
    };
}

function markConflictingVariables(initialCtx: StatementContext, ...updatedCtxs: StatementContext[]): StatementContext {
    
    // There must be at least one updatedCtx in the list.
    if (updatedCtxs.length === 0) {
        throwInternalCompilerError("One updated StatementContext must be provided.");
    }

    // Each updated context must contain the variables in the initial context
    updatedCtxs.forEach(sctx => {
        for (let key of initialCtx.varBindings.keys()) {
            if (!sctx.varBindings.has(key)) {
                throwInternalCompilerError("Each updated StatementContext must contain the variables in the initial context.");
            }
        }
    });

    const newBindings = new Map(initialCtx.varBindings);
    const newUndetermined = new Set<string>();

    // A conflicting variable is one that does not have the same value in all the updated contexts.

    // Iinitially, the undetermined vars are those that became undetermined in at least one of 
    // the updated contexts.

    for (let key of initialCtx.varBindings.keys()) {
        if (updatedCtxs.some(sctx => sctx.undeterminedVars.has(key))) {
            newUndetermined.add(key);
        }
    }

    // From the initial undetermined vars, we need to add those that have different values in 
    // the updated contexts.

    // Pick the first augmented context as pivot for comparison.
    const firstCtx = updatedCtxs[0]!;

    for (let key of initialCtx.varBindings.keys()) {
        // Only check variables not marked as undetermined already
        if (!newUndetermined.has(key)) {
            const allEqual = updatedCtxs.every(stcx => 
                eqValues(stcx.varBindings.get(key)!, firstCtx.varBindings.get(key)!)
            );
    
            if (allEqual) {
                // The variable has the same value in all the updated contexts. 
                // Set its new value to be the common value.
                newBindings.set(key, firstCtx.varBindings.get(key)!);
            } else {
                // The variable has conflicting values in the updated contexts.
                // Mark it as undetermined.
                newUndetermined.add(key);
            }
        }
    }

    return {...initialCtx,
        varBindings: newBindings,
        undeterminedVars: newUndetermined
    };
}


