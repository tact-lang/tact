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
    AstTypeDecl,
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
import { eqValues, printTypeRef, StructValue, TypeRef, Value } from "./types";
import { partiallyEvalExpression } from "../constEval";
import { extractValue } from "../optimizer/util";
import { ensureRepeatInt, evalBinaryOp } from "../interpreter";

export type StatementContext = {
    root: SrcInfo;
    funName: string | null;
    returns: TypeRef;
    vars: Map<string, TypeRef>;
    requiredFields: string[];
    // The compiler will keep track of local assignments to variables for analysis
    varBindings: Map<string, Value | undefined>;
    // The compiler will also track those variables that become "undetermined".
    // A variable is undetermined when it has conflicting values in different branches of the program.
    // Remember that the compiler DOES not execute the program, it only keeps track
    // of variable values for analysis at compile time. So, if the same variable gets assigned
    // two different values in, say, two branches of a conditional, the compiler will mark it
    // as undetermined.
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
): StatementContext {
    checkVariableExists(ctx, sctx, name); // Should happen earlier
    if (isWildcard(name)) {
        return sctx;
    }
    return {
        ...sctx,
        vars: new Map(sctx.vars).set(idText(name), ref),
    };
}

export function lookupVariable(
    name: AstId[],
    sctx: StatementContext,
): Value | undefined {
    const varFullName = name.map(idText).join(".");

    const children: Map<string, Value> = new Map();

    // Get all the bindings having varFullName as prefix
    for (const [key, value] of sctx.varBindings.entries()) {
        if (key.startsWith(varFullName)) {
            // Include the child only if its value is defined
            if (value !== undefined) {
                children.set(key.slice(varFullName.length + 1), value);
            }
        }
    }

    // If the children map is empty, it means that there are no defined bindings
    // having "name" as prefix, which means that "name" is currently
    // undefined

    if (children.size === 0) {
        return undefined;
    }

    return inflateToValue(children);
}

function setVariableBinding(
    path: AstId[],
    value: Value | undefined,
    varType: TypeRef,
    ctx: CompilerContext,
    sctx: StatementContext,
    parentType: string[],
): StatementContext {
    const varFullName = path.map(idText).join(".");

    const result = new Map(sctx.varBindings);

    // For the analyzer, it is enough to treat contracts, traits and struct uniformly as structs
    // so, register the type of the variable's parent, so that expressions can reconstruct
    // the struct later.
    for (let i = 1; i < path.length; i++) {
        const parentName = path.slice(0, i).map(idText).join(".");
        result.set(`${parentName}.$tactStruct`, parentType[i - 1]);
    }

    // First, attach to the result all fields declared in the type of the value, in case the value is a struct.
    let flattenedType: Map<string, string | undefined> = new Map();
    if (varType.kind === "ref") {
        flattenedType = new Map(
            flattenType(getType(ctx, varType.name).ast, ctx),
        );
        for (const [key, val] of flattenedType) {
            result.set(`${varFullName}.${key}`, val);
        }
    }

    // Now assign the actual value. In case the value is a struct, flatten the struct.
    if (value !== undefined) {
        const flattened = flattenValue(value);
        if (flattened instanceof Map) {
            for (const [key, val] of flattened.entries()) {
                result.set(`${varFullName}.${key}`, val);
            }
        } else {
            result.set(varFullName, flattened);
        }
    } else {
        // In case the type of the value is a struct (i.e., map flattenedType is not empty),
        // do not add the variable to the map, since the flattened tree is already in the bindings.
        if (flattenedType.size === 0) {
            result.set(varFullName, undefined);
        }
    }

    return {
        ...sctx,
        varBindings: result,
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
    const rawConditionValue = callExpressionEvaluation(
        condition.condition,
        ctx,
        sctx,
    );
    let conditionValue: boolean | undefined = undefined;

    if (
        rawConditionValue !== undefined &&
        typeof rawConditionValue === "boolean"
    ) {
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
            initialCtx = markConflictingVariables(initialCtx, [
                r.sctx,
                initialCtx,
            ]);
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
            initialCtx = synchronizeVariableContexts(
                initialCtx,
                processedCtx[0]!,
            );
        } else {
            // If the condition does not hold, take the updates from processedCtx[1]
            // i.e., whatever branch executed as else or elseif
            initialCtx = synchronizeVariableContexts(
                initialCtx,
                processedCtx[1]!,
            );
        }
    } else {
        // The condition cannot be determined. We need to mark variables in initialCtx as
        // undetermined only if they have conflicting values in the updated contexts.
        initialCtx = markConflictingVariables(initialCtx, processedCtx);
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

function callExpressionEvaluation(
    ast: AstExpression,
    ctx: CompilerContext,
    sctx: StatementContext,
): Value | undefined {
    try {
        const expr = partiallyEvalExpression(ast, { ctx: ctx, sctx: sctx });
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

                        const varDef = callExpressionEvaluation(
                            s.expression,
                            ctx,
                            sctx,
                        );
                        sctx = addVariable(s.name, variableType, ctx, sctx);
                        sctx = setVariableBinding(
                            [s.name],
                            varDef,
                            variableType,
                            ctx,
                            sctx,
                            [],
                        );
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

                        const varDef = callExpressionEvaluation(
                            s.expression,
                            ctx,
                            sctx,
                        );
                        sctx = addVariable(s.name, expressionType, ctx, sctx);
                        sctx = setVariableBinding(
                            [s.name],
                            varDef,
                            expressionType,
                            ctx,
                            sctx,
                            [],
                        );
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

                    const exprVal = callExpressionEvaluation(
                        s.expression,
                        ctx,
                        sctx,
                    );
                    sctx = setVariableBinding(
                        path,
                        exprVal,
                        tailType,
                        ctx,
                        sctx,
                        extractAncestorTypes(s.path, ctx),
                    );
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

                    const ancestorTypes = extractAncestorTypes(s.path, ctx);
                    const exprVal = callExpressionEvaluation(
                        s.expression,
                        ctx,
                        sctx,
                    );
                    if (exprVal !== undefined) {
                        const currVal = lookupVariable(path, sctx);
                        if (currVal !== undefined) {
                            const finalVal = evalBinaryOp(
                                s.op,
                                currVal,
                                exprVal,
                            );
                            sctx = setVariableBinding(
                                path,
                                finalVal,
                                tailType,
                                ctx,
                                sctx,
                                ancestorTypes,
                            );
                        } else {
                            sctx = setVariableBinding(
                                path,
                                undefined,
                                tailType,
                                ctx,
                                sctx,
                                ancestorTypes,
                            );
                        }
                    } else {
                        sctx = setVariableBinding(
                            path,
                            undefined,
                            tailType,
                            ctx,
                            sctx,
                            ancestorTypes,
                        );
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

                        // Evaluate the return argument, just to check for errors.
                        callExpressionEvaluation(s.expression, ctx, sctx);
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

                    // Evaluate the iterations expressions to determine how many iterations
                    const rawIterationsValue = callExpressionEvaluation(
                        s.iterations,
                        ctx,
                        sctx,
                    );

                    let iterationsValue: bigint | undefined = undefined;

                    if (rawIterationsValue !== undefined) {
                        iterationsValue = ensureRepeatInt(
                            rawIterationsValue,
                            s.iterations.loc,
                        );
                    }

                    const initialSctx = sctx;

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

                    // Repeat the analysis of the loop body, but this time simulating an arbitrary
                    // iteration of the loop. To simulate such thing, it is enough to make all
                    // assigned variables in the loop undetermined in initialSctx, and then
                    // execute processStatements in such statement context.
                    const loopSctx = processStatements(
                        s.statements,
                        makeAssignedVariablesUndetermined(
                            s.statements,
                            initialSctx,
                        ),
                        ctx,
                    ).sctx;

                    // Now merge the assignments in the different contexts according to the iterations value
                    if (iterationsValue !== undefined) {
                        if (iterationsValue <= 0n) {
                            // The loop does not execute.
                            // The final statement context is simply the initial context.
                            sctx = initialSctx;
                        } else {
                            // The loop iterates at least once, take the updates from loopSctx
                            // i.e., whatever branch executed as else or elseif
                            sctx = synchronizeVariableContexts(
                                initialSctx,
                                loopSctx,
                            );
                        }
                    } else {
                        // The number of iterations cannot be determined. We need to mark variables in initial context as
                        // undetermined only if they have conflicting values in the updated contexts.
                        // We need to include initialSctx in the updated context, because it represents
                        // the context when the loop does not execute.
                        sctx = markConflictingVariables(initialSctx, [
                            initialSctx,
                            loopSctx,
                        ]);
                    }
                }
                break;
            case "statement_until":
                {
                    // Process expression
                    ctx = resolveExpression(s.condition, sctx, ctx);

                    const initialSctx = sctx;

                    // Process statements
                    const r = processStatements(s.statements, sctx, ctx);
                    ctx = r.ctx;
                    const oneIterSctx = r.sctx;

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

                    // Repeat the analysis of the loop body, but this time simulating an arbitrary
                    // iteration of the loop. To simulate such thing, it is enough to make all
                    // assigned variables in the loop undetermined in initialSctx, and then
                    // execute processStatements in such statement context.
                    const loopSctx = processStatements(
                        s.statements,
                        makeAssignedVariablesUndetermined(
                            s.statements,
                            initialSctx,
                        ),
                        ctx,
                    ).sctx;

                    // Evaluate the condition in the context after executing one iteration
                    const conditionValue = callExpressionEvaluation(
                        s.condition,
                        ctx,
                        oneIterSctx,
                    );

                    if (
                        conditionValue !== undefined &&
                        typeof conditionValue === "boolean"
                    ) {
                        if (conditionValue) {
                            // The loop does not execute again.
                            // The final statement context is simply the context after one iteration.
                            sctx = synchronizeVariableContexts(
                                initialSctx,
                                oneIterSctx,
                            );
                        } else {
                            // The loop iterates at least twice, take the updates from loopSctx
                            sctx = synchronizeVariableContexts(
                                initialSctx,
                                loopSctx,
                            );
                        }
                    } else {
                        // The loop condition cannot be determined. We need to mark variables in initial context as
                        // undetermined only if they have conflicting values in the updated contexts.
                        // We need to include oneIterSctx in the updated contexts, because it represents
                        // the context when the loop executes exactly once.
                        sctx = markConflictingVariables(initialSctx, [
                            oneIterSctx,
                            loopSctx,
                        ]);
                    }
                }
                break;
            case "statement_while":
                {
                    // Process expression
                    ctx = resolveExpression(s.condition, sctx, ctx);

                    const initialSctx = sctx;

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

                    // Repeat the analysis of the loop body, but this time simulating an arbitrary
                    // iteration of the loop. To simulate such thing, it is enough to make all
                    // assigned variables in the loop undetermined in initialSctx, and then
                    // execute processStatements in such statement context.
                    const loopSctx = processStatements(
                        s.statements,
                        makeAssignedVariablesUndetermined(
                            s.statements,
                            initialSctx,
                        ),
                        ctx,
                    ).sctx;

                    // Evaluate the condition in the initial context
                    const conditionValue = callExpressionEvaluation(
                        s.condition,
                        ctx,
                        initialSctx,
                    );

                    if (
                        conditionValue !== undefined &&
                        typeof conditionValue === "boolean"
                    ) {
                        if (conditionValue) {
                            // The loop iterates at least once, take the updates from loopSctx
                            sctx = synchronizeVariableContexts(
                                initialSctx,
                                loopSctx,
                            );
                        } else {
                            // The loop does not execute.
                            // The final statement context is simply the initial context
                            sctx = initialSctx;
                        }
                    } else {
                        // The loop condition cannot be determined. We need to mark variables in initial context as
                        // undetermined only if they have conflicting values in the updated contexts.
                        // We need to include initialSctx in the updated contexts, because it represents
                        // the context when the loop does not execute.
                        sctx = markConflictingVariables(initialSctx, [
                            initialSctx,
                            loopSctx,
                        ]);
                    }
                }
                break;
            case "statement_try":
                {
                    const initialSctx = sctx;

                    // Process inner statements
                    const r = processStatements(s.statements, sctx, ctx);
                    ctx = r.ctx;
                    sctx = r.sctx;
                    // try-statement might not return from the current function
                    // because the control flow can go to the empty catch block

                    // Mark variables that would have conflicting values if the try block
                    // were to be executed or not.
                    sctx = markConflictingVariables(initialSctx, [
                        initialSctx,
                        sctx,
                    ]);
                }
                break;
            case "statement_try_catch":
                {
                    let initialSctx = sctx;

                    // Process inner statements
                    const r = processStatements(s.statements, sctx, ctx);
                    ctx = r.ctx;
                    const trySctx = r.sctx;

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

                    // Mark variables that would have conflicting values if the try block
                    // were to be executed or the catch block were to be executed.
                    sctx = markConflictingVariables(initialSctx, [
                        trySctx,
                        catchCtx,
                    ]);
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

                // Repeat the analysis of the loop body, but this time simulating an arbitrary
                // iteration of the loop. To simulate such thing, it is enough to make all
                // assigned variables in the loop undetermined in foreachSctx, and then
                // execute processStatements.
                const loopSctx = processStatements(
                    s.statements,
                    makeAssignedVariablesUndetermined(
                        s.statements,
                        foreachSctx,
                    ),
                    ctx,
                ).sctx;

                /*
                    At the moment it is not possible to check if a foreach will execute or not
                    because there is no tracking of mutation of maps. 
                    In other words, there is no tracking of assignments of key-value pairs in the map
                    using the set function.

                    In an assignment statement like,

                    a = exp

                    it is always possible to know the identifier ("a" in this case).
                    Instead, in a map assignment,

                    map.set(k, val)

                    the key k could come from calling a function that cannot be determined at compile-time.
                    Moreover, the interpreter does not support producing maps as values at the moment.

                    So, for the analysis, treat foreach loops as if the number of iterations is always 
                    undetermined.
                    
                    For this, mark variables in the initial context as
                    undetermined only if they have conflicting values in the updated contexts.
                    We need to include initialSctx in the updated contexts, because it represents
                    the context when the loop does not execute.
                    */
                initialSctx = markConflictingVariables(initialSctx, [
                    initialSctx,
                    loopSctx,
                ]);

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

            // Initialize variable bindings for the statement context.
            // It should include all fields in the contract.
            for (const f of t.fields) {
                if (f.default !== undefined) {
                    sctx = setVariableBinding(
                        [selfId, f.ast.name],
                        f.default,
                        f.type,
                        ctx,
                        sctx,
                        [t.name],
                    );
                }
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

function synchronizeVariableContexts(
    initialCtx: StatementContext,
    updatedCtx: StatementContext,
): StatementContext {
    // The updated context must contain the variables in the initial context
    for (const key of initialCtx.varBindings.keys()) {
        if (!updatedCtx.varBindings.has(key)) {
            throwInternalCompilerError(
                "The updated StatementContext must contain the variables in the initial context.",
            );
        }
    }

    const newBindings = new Map(initialCtx.varBindings);

    for (const key of initialCtx.varBindings.keys()) {
        newBindings.set(key, updatedCtx.varBindings.get(key));
    }

    return {
        ...initialCtx,
        varBindings: newBindings,
    };
}

function markConflictingVariables(
    initialCtx: StatementContext,
    updatedCtxs: StatementContext[],
): StatementContext {
    // There must be at least one updatedCtx in the list.
    if (updatedCtxs.length === 0) {
        throwInternalCompilerError(
            "One updated StatementContext must be provided.",
        );
    }

    // Each updated context must contain the variables in the initial context
    updatedCtxs.forEach((sctx) => {
        for (const key of initialCtx.varBindings.keys()) {
            if (!sctx.varBindings.has(key)) {
                throwInternalCompilerError(
                    "Each updated StatementContext must contain the variables in the initial context.",
                );
            }
        }
    });

    const newBindings = new Map(initialCtx.varBindings);

    // A conflicting variable is one that does not have the same value in all the updated contexts.
    // Conflicting variables become undefined in the variable bindings map.

    // Pick the first augmented context as pivot for comparison.
    const firstCtx = updatedCtxs[0]!;

    for (const key of initialCtx.varBindings.keys()) {
        const val1 = firstCtx.varBindings.get(key);

        const allEqual = updatedCtxs.every((statementCtx) => {
            const val2 = statementCtx.varBindings.get(key);
            if (val1 === undefined && val2 === undefined) {
                return true;
            }
            if (val1 !== undefined && val2 !== undefined) {
                return eqValues(val1, val2);
            }
            return false;
        });

        if (allEqual) {
            // The variable has the same value in all the updated contexts.
            // Set its new value to be the common value.
            newBindings.set(key, firstCtx.varBindings.get(key));
        } else {
            // The variable has conflicting values in the updated contexts.
            // Mark it as undefined.
            newBindings.set(key, undefined);
        }
    }

    return {
        ...initialCtx,
        varBindings: newBindings,
    };
}

function makeAssignedVariablesUndetermined(
    statements: AstStatement[],
    initialSctx: StatementContext,
): StatementContext {
    const newBindings = new Map(initialSctx.varBindings);

    // Now, undefine each of the found variables
    // This means that their values are undetermined.

    for (const varName of extractAssignedVariables(statements, initialSctx)) {
        newBindings.set(varName, undefined);
    }

    return {
        ...initialSctx,
        varBindings: newBindings,
    };
}

function extractAssignedVariables(
    statements: AstStatement[],
    initialSctx: StatementContext,
): Set<string> {
    let varNames: Set<string> = new Set();

    // Fist, extract all variables assigned inside the statements,
    // as long as those variables occur in the initial context.
    for (const stmt of statements) {
        switch (stmt.kind) {
            case "statement_assign":
            case "statement_augmentedassign": {
                const path = tryExtractPath(stmt.path)?.map(idText).join(".");
                if (path !== undefined) {
                    // Include all children of the path as found in the initial context
                    for (const key of initialSctx.varBindings.keys()) {
                        if (key.startsWith(path)) {
                            varNames.add(key);
                        }
                    }
                }
                break;
            }
            case "statement_condition": {
                varNames = new Set([
                    ...varNames,
                    ...extractAssignedVariables(
                        stmt.trueStatements,
                        initialSctx,
                    ),
                ]);
                if (stmt.falseStatements !== null) {
                    varNames = new Set([
                        ...varNames,
                        ...extractAssignedVariables(
                            stmt.falseStatements,
                            initialSctx,
                        ),
                    ]);
                }
                if (stmt.elseif !== null) {
                    varNames = new Set([
                        ...varNames,
                        ...extractAssignedVariables([stmt.elseif], initialSctx),
                    ]);
                }
                break;
            }
            case "statement_foreach":
            case "statement_repeat":
            case "statement_until":
            case "statement_while":
            case "statement_try": {
                varNames = new Set([
                    ...varNames,
                    ...extractAssignedVariables(stmt.statements, initialSctx),
                ]);
                break;
            }
            case "statement_try_catch": {
                varNames = new Set([
                    ...varNames,
                    ...extractAssignedVariables(stmt.statements, initialSctx),
                ]);
                varNames = new Set([
                    ...varNames,
                    ...extractAssignedVariables(
                        stmt.catchStatements,
                        initialSctx,
                    ),
                ]);
                break;
            }
            default:
                break;
        }
    }

    return varNames;
}

function flattenValue(varValue: Value): Value | Map<string, Value> {
    if (
        varValue !== null &&
        typeof varValue === "object" &&
        "$tactStruct" in varValue
    ) {
        const result: Map<string, Value> = new Map();

        for (const [parent, parentVal] of Object.entries(varValue)) {
            const children = flattenValue(parentVal);
            if (children instanceof Map) {
                for (const [child, childVal] of children) {
                    result.set(`${parent}.${child}`, childVal);
                }
            } else {
                result.set(parent, parentVal);
            }
        }

        return result;
    } else {
        return varValue;
    }
}

function inflateToValue(entries: Map<string, Value>): Value {
    // If there is a single entry in the map, with the empty string as key, it means
    // that there are no children. In other words, there is no structure to inflate
    // into a StructValue.
    if (entries.size === 1 && entries.has("")) {
        return entries.get("")!;
    }

    const result: StructValue = {};
    const parents: Set<string> = new Set();

    for (const [key, value] of entries) {
        const parentIndex = key.indexOf(".");
        if (parentIndex === -1) {
            // Top level variable without children, add to results.
            result[key] = value;
        } else {
            // Top level variable with children, remember it for later computation
            parents.add(key.substring(0, parentIndex));
        }
    }

    // Now, compute the children of each parent
    for (const parent of parents) {
        const children: Map<string, Value> = new Map();

        for (const [child, childVal] of entries) {
            if (child.startsWith(parent)) {
                children.set(child.slice(parent.length + 1), childVal);
            }
        }

        result[parent] = inflateToValue(children);
    }

    return result;
}

function flattenType(
    typeDecl: AstTypeDecl,
    ctx: CompilerContext,
): Map<string, string | undefined> {
    const result: Map<string, string | undefined> = new Map();

    if (typeDecl.kind === "struct_decl") {
        for (const field of typeDecl.fields) {
            if (field.type.kind === "type_id") {
                const children = flattenType(getType(ctx, field.type).ast, ctx);
                if (children.size === 0) {
                    result.set(idText(field.name), undefined);
                } else {
                    for (const [child, val] of children) {
                        result.set(`${idText(field.name)}.${child}`, val);
                    }
                }
            }
        }
        result.set("$tactStruct", idText(typeDecl.name));
    }

    // From the point of view of the analyzer, treat contracts and traits as if they were structs
    if (typeDecl.kind === "contract") {
        for (const field of typeDecl.declarations) {
            if (field.kind === "field_decl" && field.type.kind === "type_id") {
                const children = flattenType(getType(ctx, field.type).ast, ctx);
                if (children.size === 0) {
                    result.set(idText(field.name), undefined);
                } else {
                    for (const [child, val] of children) {
                        result.set(`${idText(field.name)}.${child}`, val);
                    }
                }
            }
        }
        result.set("$tactStruct", idText(typeDecl.name));
    }

    return result;
}

function extractAncestorTypes(
    path: AstExpression,
    ctx: CompilerContext,
): string[] {
    if (path.kind === "field_access") {
        const parentType = getExpType(ctx, path.aggregate);
        if (parentType.kind === "ref") {
            return [
                ...extractAncestorTypes(path.aggregate, ctx),
                parentType.name,
            ];
        }
    }
    return [];
}
