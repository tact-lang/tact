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
    AstFieldDecl,
    AstOptionalType,
    AstTypeId,
    AstMapType,
    AstBouncedMessageType,
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
import { StructFunctions } from "../abi/struct";
import { MapFunctions } from "../abi/map";

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
    // Remember that the compiler does NOT execute the program, it only keeps track
    // of variable values for analysis at compile time. So, if the same variable gets assigned
    // two different values in, say, two branches of a conditional, the compiler will mark it
    // as undetermined.

    // A variable is undetermined if it does not exist in the varBindings map or it exists but maps to "undefined".
    // Why not simply say that a variable is undetermined if does not exist in the map (so that we can remove
    // the "undefined" value from the map)? The reason is that the algorithm keeps an invariant: variable bindings
    // should only increase or remain the same in different branches of the program. So for example:
    /*  
        let a = 5;       // At this point, varBindings contains a --> 5
        if (cond) {
           a = 7;        
           let b = 10;   // In this branch, varBindings contains a --> 7, b --> 10
        } else {
           a = someFun();  // If someFun() cannot be evaluated at compile time, a will become undetermined
        }                  // Since varBindings can only grow or remain the same, in this branch, 
                           // varBindings will have a --> undefined.
    */
    // Maintaining such invariant makes easier merging the different branches. For example, in the above program, after the if:
    // since "a" has value 7 in one branch, and undefined in another, the final value of "a" is also "undefined" after the if, i.e.,
    // varBindings will contain: a --> undefined. Variable b can be dropped after the if, because it only exists
    // in one of the branches.

    /*
    The merging algorithm is actually quite simple:
    Suppose initSctx is your initial statement context and that all the possible branches in your program produced a list
    of modified statement contexts: [sctx1, sctx2, sctx3], each of which augments the variable bindings in initSctx in
    different ways.

    Then, the statement context after all the different branches should be:
    
    newSctx: Map;

    foreach var in initSctx:
        if var maps to the same value v in all [sctx1, sctx2, sctx3] then
            newSctx.set(var, v);
        else 
            // var differs in at least one of the contexts, hence, var is now undetermined.
            newSctx.set(var, undefined);
    */
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

/*
Decided to keep this function separate from addVariable in order to keep the old code unchanged.

The merging algorithm assumes that one is working with simple variables (no path expressions,
no structs, and no contracts).
In fact, if one tries to treat path expressions as a single variable, problems occur when structs make
their appearance. For example, consider this program:

struct B {
   b: Int;
}

fun test(v: Int) {
   let a = B {b: 7, c: 10};
   if (v < 5) {
      a = B {b: 42, c: 10};
   } else {
      a = B {b: 42, c: 10};
      a.b = 41;
   }
}

Let us treat path expressions as a single variable name.
Before entering the conditional, the bindings are: a --> B {b: 7, c: 10}.
In the then-branch, the bindings are: a --> B {b: 42, c: 10}. 
In the else-branch, the bindings are: a --> B {b: 42, c: 10}, a.b --> 41.
So, after merging, the bindings are: a --> B {b: 42, c: 10}, which is incorrect, because 
after the conditional, "a" is actually undetermined, because in one branch,
"a" is the struct B {b: 42, c: 10}, but in another is the struct B {b: 41, c: 10}.

The problem is that the merging algorithm is unaware that "a" has more structure inside.
So, how can we keep using the merging algorithm in the presence of structs and contracts?

One idea that works is to flatten the structs whenever an assignment happens. For example, the above code
would "logically" correspond to:

fun test(v: Int) {
   let a.b = 7;
   let a.c = 10;
   if (v < 5) {
      a.b = 42;
      a.c = 10;
   } else {
      a.b = 42;
      a.c = 10;
      a.b = 41;
   }
}

Hence, after merging, now we see that a.b is undetermined, while a.c = 10. 

Flattening works because structs and contracts are always assigned by value. For example, in this snippet:

let a = A {f: 7};
let b = a;
b.f = 8;

After modifying field f in b, the struct "a" remains unaffected. In other words, the above snippet is equivalent to its flattened
counterpart:

let a.f = 7;
let b.f = a.f;
b.f = 8;

Here, clearly, modifying variable b.f, does not affect variable a.f.

However, flattening structs (and contracts) introduces another problem: What to do if an expression reads the full struct? 
For example, 

fun test(v: Int) {
   let a = B {b: 7, c: 10};
   if (v < 5) {
      a = B {b: 42, c: 10};
   } else {
      a = B {b: 42, c: 10};
      a.b = 41;
   }
   let w:Int = someFun(a);    // The expression is reading all the struct a
}

So, "logically" is this program:

fun test(v: Int) {
   let a.b = 7;
   let a.c = 10;
   if (v < 5) {
      a.b = 42;
      a.c = 10;
   } else {
      a.b = 42;
      a.c = 10;
      a.b = 41;
   }
   let w:Int = someFun(a);   // What should we do here?
}

We need a way to "inflate" the flattened struct back into a full struct value, so that 
the interpreter can attempt to evaluate the expression "someFun(a)".

Since we need to recover the type of structs when we inflate them back, we take the following convention
when flattening structs (this is similar to how structs are represented as maps from strings to values in type StructValue):

Attach a special field "$tactStruct" that stores the struct type. For example, the following assignment:

a = A {f1: 4, f2: B {g1: 10, g2: 6}, f3: true}

would be flattened as:

a.$tactStruct = "A";
a.f1 = 4;
a.f2.$tactStruct = "B";
a.f2.g1 = 10;
a.f2.g2 = 6;
a.f3 = true;

In this way, the above keeps all the information to be able to inflate back into a struct.

For example, let us suppose that some expression makes use of a.f2. In order to inflate the above bindings,
first search in the bindings, all bindings starting with a.f2. This will give you the following set of children bindings:

a.f2.$tactStruct = "B";
a.f2.g1 = 10;
a.f2.g2 = 6;

And now, inflate into the struct:

a.f2 = B {g1: 10, g2: 6}

Note that the process of inflating could produce partial structs. For example, consider this program:

fun test(v: Int) {
   let a = B {b: 7, c: 0};
   if (v < 5) {
      a = B {b: 42, c: 0};
   } else {
      a = B {b: 42, c: 0};
      a.b = 41;
   }              // Label A
   let w = a;     // Label B
   1 / w.c;      // Flushing the toilet through a black hole because of division by zero
}

After the conditional at label A, the set of bindings will be: 
a.$tactStruct ---> "B", 
a.b ---> undefined, 
a.c ---> 0.

But then, at label B, we need to inflate "a" into a struct and then flattened it back into w.
When inflating, we only take the children that are not undefined. For example, our set of bindings is:

a.$tactStruct = "B"
a.b = undefined
a.c = 0

Therefore, the inflated struct will be (we do not include field b):

a = B {c: 0}

Even though this is an invalid struct (because it lacks field b), this is OK from the point of view of the analyzer,
which always works with partial information. In fact, we actually NEED the partial struct. For suppose we take the approach 
in which "a" is undefined if at least one of its children bindings is undefined. Then, in the above example we would get that "a"
is undefined, and hence, "w" would be undefined. This in turn would not detect the division by zero in the expression (1 / w.c),
which incidentally, FunC is able to detect when the above program is translated into FunC.

Instead, if we allow the partial struct 

a = B {c: 0}

Then "w.c = 0" is added as a binding in the assignment "w = a", which in turn detects the division by zero in 1 / w.c.

All right, after this bird view of the procedure. We can now go into the specifics of the implementation.

The setVariableBinding will store a variable with the given value. This function carries out the flattening procedure 
described above. 

It receives a path (i.e., a path expression represented as an array of Ids). The value that the binding will store
(it could be undefined). The type of the path expression. The compiler and statement contexts, and 
an array with the names of the types of all the ancestors in the path expression. 

For example, if the path expression is (which has "a" and "f2" as ancestors)

a.f2.g1

where "a" has type:

A {f1: Int; f2: B {g1: Int; g2: Int}; f3: Bool}

Then, the array ancestorTypes would be:

["A", "B"]

corresponding to the types of ancestors "a" and "f2" respectively.

*/
export function setVariableBinding(
    path: AstId[],
    value: Value | undefined,
    varType: TypeRef,
    ctx: CompilerContext,
    sctx: StatementContext,
    ancestorTypes: string[],
): StatementContext {
    const varFullName = path.map(idText).join(".");

    const result = new Map(sctx.varBindings);

    // For the analyzer, it is enough to treat contracts and structs uniformly as structs.
    // So, register the type of the variable's ancestors, so that expressions can reconstruct
    // the struct later.

    // For example, if the path is

    // a.f2.g1

    // and our ancestor's array is ["A", "B"]

    // This will add the following bindings to result map:

    // a.$tactStruct = "A"
    // a.f2.$tactStruct = "B"

    for (let i = 1; i < path.length; i++) {
        const parentName = path.slice(0, i).map(idText).join(".");
        result.set(`${parentName}.$tactStruct`, ancestorTypes[i - 1]);
    }

    // Next, attach to the result all fields declared in the type of the value, in case the value is a struct or contract.
    // For example, suppose we are working with path expression a.f2, which has type:

    // B {g1: Int; g2: Int}

    // This will add the following bindings to result:

    // a.f2.g1 = undefined
    // a.f2.g2 = undefined
    // a.f2.$tactStruct = "B"

    // In other words, this flattens the type of a.f2 to ensure that all the fields of a.f2 occur in the result bindings.
    // This is necessary, because the actual value could be a partial struct, i.e., value = B {g1: 4}, where g2 is missing.

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
    // This will add the actual values. So, if our value is "B {g1: 4, g2: 10}" and our path is a.f2,
    // This will set the bindings:

    // a.f2.g1 = 4
    // a.f2.g2 = 10

    // If the value was the partial struct "B {g1: 4}". This will set only the binding:

    // a.f2.g1 = 4

    // But recall, that in the previous steps, the following two bindings would have been already present in result map:

    // a.f2.g2 = undefined
    // a.f2.$tactStruct = "B"

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
        // do not add the variable to the result, since the flattened tree is already in the
        // result bindings.
        // However, if flattenedType is actually empty, this means that the value is a plain variable
        // and we can set it to be undefined.
        if (flattenedType.size === 0) {
            result.set(varFullName, undefined);
        }
    }

    return {
        ...sctx,
        varBindings: result,
    };
}

/*
This function looks in the bindings the path expression "name", and returns a Value
if found, or undefined if not.

The function carries out the inflation process described above.
*/
export function lookupVariable(
    name: AstId[],
    sctx: StatementContext,
): Value | undefined {
    const varFullName = name.map(idText).join(".");

    const children: Map<string, Value> = new Map();

    // Get all the bindings having varFullName as prefix.
    // These are the children bindings of varFullName.
    // Only those children not having undefined will be picked.

    // For example, if the bindings are

    // a.f2.g1 = 4
    // a.f2.g2 = 10
    // a.f2.$tactStruct = "B"

    // Then, the children of a.f2 will be:

    // g1 = 4
    // g2 = 10
    // $tactStruct = "B"

    // The slice function removes the "a.f2." part from the children names.

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

    // Now proceed to inflate the found children:

    // g1 = 4
    // g2 = 10
    // $tactStruct = "B"

    // Will produce the StructValue:

    // B {g1: 4, g2: 10}

    return inflateToValue(children);
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
    // Copy the initial statement context
    const initialSctx = sctx;

    // Process expression. This updates the statement and compiler contexts.
    // We need resolveExpression to also return the updated statement context
    // because calling mutating functions inside expressions have the same effect
    // of having assignments inside the expressions!!
    const resCtx = resolveExpression(condition.condition, sctx, ctx);
    ctx = resCtx.ctx;
    sctx = resCtx.sctx;

    // Evaluate the condition in the initial statement context.
    const rawConditionValue = callExpressionEvaluation(
        condition.condition,
        ctx,
        initialSctx,
    );

    let conditionValue: boolean | undefined = undefined;

    if (
        rawConditionValue !== undefined &&
        typeof rawConditionValue === "boolean"
    ) {
        conditionValue = rawConditionValue;
    }

    // Remember the bindings just after the condition was processed.
    let postConditionSctx = sctx;

    // Simple if
    if (condition.falseStatements === null && condition.elseif === null) {
        const r = processStatements(
            condition.trueStatements,
            postConditionSctx,
            ctx,
        );
        ctx = r.ctx;

        // Since there is no alternative branch, we only need to check if the condition
        // can be determined
        if (conditionValue !== undefined) {
            if (conditionValue) {
                // Copy the latest updates to all variables in postConditionSctx as found in r.sctx
                postConditionSctx = copyBindings(postConditionSctx, r.sctx);
            }
            // If the condition does not hold, then we ignore any updates to variables
            // in r.sctx, and leave postConditionSctx as is.
        } else {
            // The condition cannot be determined. We need to mark variables in postConditionSctx as
            // undetermined only if they have conflicting values in r.sctx.
            // Note we need to add postConditionSctx in the updatedCtxs because it is the implicit
            // "else" branch.
            postConditionSctx = mergeBranches(postConditionSctx, [
                r.sctx,
                postConditionSctx,
            ]);
        }
        return { ctx, sctx: postConditionSctx, returnAlwaysReachable: false };
    }

    // Simple if-else
    const processedCtx: StatementContext[] = [];
    const returnAlwaysReachableInAllBranches: boolean[] = [];

    // Process true branch
    const r = processStatements(
        condition.trueStatements,
        postConditionSctx,
        ctx,
    );
    ctx = r.ctx;
    processedCtx.push(r.sctx);
    returnAlwaysReachableInAllBranches.push(r.returnAlwaysReachable);

    // Process else/elseif branch
    if (condition.falseStatements !== null && condition.elseif === null) {
        // if-else
        const r = processStatements(
            condition.falseStatements,
            postConditionSctx,
            ctx,
        );
        ctx = r.ctx;
        processedCtx.push(r.sctx);
        returnAlwaysReachableInAllBranches.push(r.returnAlwaysReachable);
    } else if (
        condition.falseStatements === null &&
        condition.elseif !== null
    ) {
        // if-else if
        const r = processCondition(condition.elseif, postConditionSctx, ctx);

        ctx = r.ctx;
        processedCtx.push(r.sctx);
        returnAlwaysReachableInAllBranches.push(r.returnAlwaysReachable);
    } else {
        throwInternalCompilerError("Impossible");
    }

    // Merge statement contexts
    const removed: string[] = [];
    for (const f of postConditionSctx.requiredFields) {
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
        postConditionSctx = removeRequiredVariable(r, postConditionSctx);
    }

    // Now merge the assignments in the different contexts according to the condition value
    if (conditionValue !== undefined) {
        if (conditionValue) {
            // Copy the latest updates to all variables in postConditionSctx as found in
            // processedCtx[0] (i.e., the context from the true branch)
            postConditionSctx = copyBindings(
                postConditionSctx,
                processedCtx[0]!,
            );
        } else {
            // If the condition does not hold, take the updates from processedCtx[1]
            // i.e., whatever branch executed as else or elseif
            postConditionSctx = copyBindings(
                postConditionSctx,
                processedCtx[1]!,
            );
        }
    } else {
        // The condition cannot be determined. We need to mark variables in postConditionSctx as
        // undetermined only if they have conflicting values in the updated contexts.
        postConditionSctx = mergeBranches(postConditionSctx, processedCtx);
    }

    return {
        ctx,
        sctx: postConditionSctx,
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
                    // Copy the initial statement context
                    const initialSctx = sctx;

                    // Process expression. This updates the statement and compiler contexts.
                    const resCtx = resolveExpression(s.expression, sctx, ctx);
                    ctx = resCtx.ctx;
                    sctx = resCtx.sctx;

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

                        // Evaluate the expression in the initial statement context.
                        const varDef = callExpressionEvaluation(
                            s.expression,
                            ctx,
                            initialSctx,
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

                        // Evaluate the expression in the initial statement context.
                        const varDef = callExpressionEvaluation(
                            s.expression,
                            ctx,
                            initialSctx,
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
                    // Copy the initial statement context
                    const initialSctx = sctx;

                    // The following temporal statement context is just for checking the path expression.
                    const tempSctx = { ...sctx, requiredFields: [] };
                    // Process lvalue
                    let resCtx = resolveExpression(s.path, tempSctx, ctx);
                    ctx = resCtx.ctx;
                    // Drop the modified statement context:
                    // Path expressions do not have calls to functions. Hence, the modified
                    // temporal statement context actually does not change its variable bindings.
                    // So, it is safe to drop it.

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

                    // Process expression and update contexts.
                    resCtx = resolveExpression(s.expression, sctx, ctx);
                    ctx = resCtx.ctx;
                    sctx = resCtx.sctx;

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

                    // Evaluate the expression in the initial statement context.
                    const exprVal = callExpressionEvaluation(
                        s.expression,
                        ctx,
                        initialSctx,
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
                    // Copy the initial statement context
                    const initialSctx = sctx;

                    // The following temporal statement context is just for checking the path expression.
                    // Process lvalue
                    const tempSctx = { ...sctx, requiredFields: [] };
                    let resCtx = resolveExpression(s.path, tempSctx, ctx);
                    ctx = resCtx.ctx;
                    // Drop the modified statement context:
                    // Path expressions do not have calls to functions. Hence, the modified
                    // temporal statement context actually does not change its variable bindings.
                    // So, it is safe to drop it.

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

                    // Process expression and update contexts.
                    resCtx = resolveExpression(s.expression, sctx, ctx);
                    ctx = resCtx.ctx;
                    sctx = resCtx.sctx;

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

                    // Evaluate expression in the initial statement context.
                    const exprVal = callExpressionEvaluation(
                        s.expression,
                        ctx,
                        initialSctx,
                    );
                    const ancestorTypes = extractAncestorTypes(s.path, ctx);
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
                    // Copy the initial statement context
                    const initialSctx = sctx;

                    // Process expression and update contexts
                    const resCtx = resolveExpression(s.expression, sctx, ctx);
                    ctx = resCtx.ctx;
                    sctx = resCtx.sctx;

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
                    callExpressionEvaluation(s.expression, ctx, initialSctx);
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
                    // Copy the initial statement context.
                    const initialSctx = sctx;

                    if (s.expression) {
                        // Process expression and update contexts
                        const resCtx = resolveExpression(
                            s.expression,
                            sctx,
                            ctx,
                        );
                        ctx = resCtx.ctx;
                        sctx = resCtx.sctx;

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

                        // Evaluate the return argument in the initial statement contexts, just to check for errors.
                        callExpressionEvaluation(
                            s.expression,
                            ctx,
                            initialSctx,
                        );
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
                    // Copy the initial statement context.
                    const initialSctx = sctx;

                    // Process expression and update contexts.
                    const resCtx = resolveExpression(s.iterations, sctx, ctx);
                    ctx = resCtx.ctx;
                    sctx = resCtx.sctx;

                    // Evaluate the iterations expressions to determine how many iterations.
                    const rawIterationsValue = callExpressionEvaluation(
                        s.iterations,
                        ctx,
                        initialSctx,
                    );

                    let iterationsValue: bigint | undefined = undefined;

                    if (rawIterationsValue !== undefined) {
                        iterationsValue = ensureRepeatInt(
                            rawIterationsValue,
                            s.iterations.loc,
                        );
                    }

                    const postRepeatExprSctx = sctx;

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
                    // assigned variables in the loop undetermined in postRepeatExprSctx, and then
                    // execute processStatements in such statement context.

                    /* The motivation for doing such thing is the following.
                       Suppose we have this program snippet:

                       let a = 10;
                       let x = 7;
                       repeat(v) {
                          a += 1;   // Equivalent to a = a + 1
                          x = 9;
                       }

                       Imagine we are in some arbitrary iteration of the loop. Hence,
                       before starting the arbitrary iteration, both a and x have some unknown value.
                       Hence, we need to start the analysis with a and x undetermined.
                       After a += 1, variable "a" remains undetermined.
                       After x = 9, variable "x" becomes determined with value 9.
                       
                       Hence, after each iteration, variable "a" is always undetermined but "x" always have value 9.

                       For this procedure to work, we need to collect all variables that are assigned inside the loop
                       (including variables which are being changed through a mutating function).

                       For example, in this program

                       let a = 10;
                       let x = 7;
                       repeat(v) {
                          a += 1;
                          x.mutate();  <--- mutate is declared as extends mutates somewhere else
                          if (v >= 1) {
                              z = 8;
                              v.doSomething(); <---- doSomething is ONLY marked as extends, i.e., not a mutating function
                          }
                       }
                       
                       the assigned variables inside the repeat loop would be: {a, x, z}. Note v is not included 
                       because doSomething() is not a mutating function.

                       Function makeAssignedVariablesUndetermined collects these variables and creates the statement 
                       context where these variables have the undefined binding.
                       
                       The intuition is the same for the other loops.
                    */

                    const loopSctx = processStatements(
                        s.statements,
                        makeAssignedVariablesUndetermined(
                            s.statements,
                            postRepeatExprSctx,
                            ctx,
                        ),
                        ctx,
                    ).sctx;

                    // Now merge the assignments in the different contexts according to the iterations value
                    if (iterationsValue !== undefined) {
                        if (iterationsValue <= 0n) {
                            // The loop does not execute.
                            // The final statement context is simply the initial context.
                            sctx = postRepeatExprSctx;
                        } else {
                            // The loop iterates at least once, take the updates from loopSctx
                            sctx = copyBindings(postRepeatExprSctx, loopSctx);
                        }
                    } else {
                        // The number of iterations cannot be determined. We need to mark variables in postRepeatExprSctx as
                        // undetermined only if they have conflicting values in the updated contexts.
                        // We need to include postRepeatExprSctx in the updated contexts, because it represents
                        // the context when the loop does not execute.
                        sctx = mergeBranches(postRepeatExprSctx, [
                            postRepeatExprSctx,
                            loopSctx,
                        ]);
                    }
                }
                break;
            case "statement_until":
                {
                    // Copy the initial statement context.
                    const initialSctx = sctx;

                    // For the correct functioning of the typechecker, we first need to process the condition
                    // in order to check scope of the variables in the condition.
                    // At this stage, we ignore any bindings discovered during processing of the
                    // condition. We will later process the condition again, with the correct bindings.
                    ctx = resolveExpression(
                        s.condition,
                        { ...sctx, varBindings: new Map() },
                        ctx,
                    ).ctx;

                    // Process statements
                    const resStatements = processStatements(
                        s.statements,
                        initialSctx,
                        ctx,
                    );
                    ctx = resStatements.ctx;

                    // Copy all the bindings discovered during the processing of one iteration of the loop body
                    const oneIterSctx = copyBindings(
                        initialSctx,
                        resStatements.sctx,
                    );

                    // Process condition.
                    const resConditionOneIter = resolveExpression(
                        s.condition,
                        {
                            ...initialSctx,
                            varBindings: oneIterSctx.varBindings,
                        },
                        ctx,
                    );

                    // Copy all the bindings discovered during processing of the condition
                    const oneIterPlusConditionSctx = copyBindings(
                        oneIterSctx,
                        resConditionOneIter.sctx,
                    );

                    // Repeat the analysis of the loop body, but this time simulating an arbitrary
                    // iteration of the loop. To simulate such thing, it is enough to make all
                    // assigned variables in the loop undetermined in initialSctx, and then
                    // execute processStatements in such statement context.
                    const resLoop = processStatements(
                        s.statements,
                        makeAssignedVariablesUndetermined(
                            s.statements,
                            initialSctx,
                            ctx,
                        ),
                        ctx,
                    );

                    // Copy all the bindings discovered during the processing of many iterations of the loop body
                    const manyIterSctx = copyBindings(
                        initialSctx,
                        resLoop.sctx,
                    );

                    // Process condition.
                    const resConditionManyIter = resolveExpression(
                        s.condition,
                        {
                            ...initialSctx,
                            varBindings: manyIterSctx.varBindings,
                        },
                        ctx,
                    );

                    // Copy all the bindings discovered during processing of the condition
                    const manyIterPlusConditionSctx = copyBindings(
                        manyIterSctx,
                        resConditionManyIter.sctx,
                    );

                    // XXX a do-until loop is a weird place to always return from a function
                    // so we might want to issue a warning here
                    returnAlwaysReachable ||=
                        resStatements.returnAlwaysReachable;

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
                            // The final statement context is simply the context after one iteration
                            // plus the evaluation of the condition.
                            sctx = oneIterPlusConditionSctx;
                        } else {
                            // The loop iterates at least twice, take the updates from manyIterSctx
                            // plus the updates from the condition.
                            sctx = manyIterPlusConditionSctx;
                        }
                    } else {
                        // The loop condition cannot be determined. We need to mark variables in initial context as
                        // undetermined only if they have conflicting values in the updated contexts.
                        // We need to include oneIterPlusConditionSctx in the updated contexts, because it represents
                        // the context when the loop executes exactly once.
                        sctx = mergeBranches(initialSctx, [
                            oneIterPlusConditionSctx,
                            manyIterPlusConditionSctx,
                        ]);
                    }
                }
                break;
            case "statement_while":
                {
                    // Copy the initial statement context
                    const initialSctx = sctx;

                    // Process expression and update contexts.
                    const resCtx = resolveExpression(s.condition, sctx, ctx);
                    ctx = resCtx.ctx;
                    sctx = resCtx.sctx;

                    const postConditionSctx = sctx;

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
                    // assigned variables in the loop undetermined in postConditionSctx, and then
                    // execute processStatements in such statement context.
                    const loopSctx = processStatements(
                        s.statements,
                        makeAssignedVariablesUndetermined(
                            s.statements,
                            postConditionSctx,
                            ctx,
                        ),
                        ctx,
                    ).sctx;

                    // Evaluate the condition in the initial statement context
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
                            sctx = copyBindings(postConditionSctx, loopSctx);
                        } else {
                            // The loop does not execute.
                            // The final statement context is simply the context after the condition was checked.
                            sctx = postConditionSctx;
                        }
                    } else {
                        // The loop condition cannot be determined. We need to mark variables in postConditionSctx as
                        // undetermined only if they have conflicting values in the updated contexts.
                        // We need to include postConditionSctx in the updated contexts, because it represents
                        // the context when the loop does not execute.
                        sctx = mergeBranches(postConditionSctx, [
                            postConditionSctx,
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
                    sctx = mergeBranches(initialSctx, [initialSctx, sctx]);
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
                    sctx = mergeBranches(initialSctx, [trySctx, catchCtx]);
                }
                break;
            case "statement_foreach": {
                let initialSctx = sctx; // Preserve initial context to use later for merging

                // Resolve map expression and update contexts
                const resCtx = resolveExpression(s.map, sctx, ctx);
                ctx = resCtx.ctx;
                sctx = resCtx.sctx;

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

                const postMapExprSctx = sctx;

                // Add key and value to statement context
                if (!isWildcard(s.keyName)) {
                    checkVariableExists(ctx, sctx, s.keyName);
                    sctx = addVariable(
                        s.keyName,
                        { kind: "ref", name: mapType.key, optional: false },
                        ctx,
                        sctx,
                    );
                }
                if (!isWildcard(s.valueName)) {
                    checkVariableExists(ctx, sctx, s.valueName);
                    sctx = addVariable(
                        s.valueName,
                        { kind: "ref", name: mapType.value, optional: false },
                        ctx,
                        sctx,
                    );
                }

                const postKeyValueSctx = sctx;

                // Process inner statements
                const r = processStatements(s.statements, sctx, ctx);
                ctx = r.ctx;

                // Repeat the analysis of the loop body, but this time simulating an arbitrary
                // iteration of the loop. To simulate such thing, it is enough to make all
                // assigned variables in the loop undetermined in postKeyValueSctx, and then
                // execute processStatements.
                const loopSctx = processStatements(
                    s.statements,
                    makeAssignedVariablesUndetermined(
                        s.statements,
                        postKeyValueSctx,
                        ctx,
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
                    
                    For this, mark variables in the postMapExprSctx as
                    undetermined only if they have conflicting values in the updated contexts.
                    We need to include postMapExprSctx in the updated contexts, because it represents
                    the context when the loop does not execute.
                    */
                const finalBindings = mergeBranches(postMapExprSctx, [
                    postMapExprSctx,
                    loopSctx,
                ]).varBindings;

                // Merge statement contexts (similar to catch block merging)
                const removed: string[] = [];
                for (const f of initialSctx.requiredFields) {
                    if (!r.sctx.requiredFields.find((v) => v === f)) {
                        removed.push(f);
                    }
                }
                for (const r of removed) {
                    initialSctx = removeRequiredVariable(r, initialSctx);
                }

                sctx = { ...initialSctx, varBindings: finalBindings }; // Re-assign the modified initial context back to sctx after merging
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
                f.ast.kind !== "function_decl" &&
                f.ast.kind !== "asm_function_def"
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

/*
Copy the bindings in updatedCtx, back to initialCtx, but only of variables in initialCtx.
*/
function copyBindings(
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

/*
Carries out the merging algorithm:

    foreach var in initialCtx:
        if var maps to the same value v in all updatedCtxs then
            newSctx.set(var, v);
        else 
            // var differs in at least one of the contexts, hence, var is now undetermined.
            newSctx.set(var, undefined);

where initialCtx has been updated to each of the contexts in updatedCtxs.
Each context updatedCtxs represents a possible branch in which initialCtx evolved into.
 */
function mergeBranches(
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

/* Extract all variables that are being assigned or mutated through a mutating function in the provided
list of statements. If V is the set of extracted variables, update the variable bindings in sctx so 
that each variable in V has "undefined" as binding.
*/

function makeAssignedVariablesUndetermined(
    statements: AstStatement[],
    sctx: StatementContext,
    ctx: CompilerContext,
): StatementContext {
    const newBindings = new Map(sctx.varBindings);

    // Now, undefine each of the found variables
    // This means that their values are undetermined.

    for (const varName of extractAssignedVariables(statements, sctx, ctx)) {
        newBindings.set(varName, undefined);
    }

    return {
        ...sctx,
        varBindings: newBindings,
    };
}

/* Extract all variables that are being assigned or mutated through a mutating function in the provided
list of statements.
*/
function extractAssignedVariables(
    statements: AstStatement[],
    sctx: StatementContext,
    ctx: CompilerContext,
): Set<string> {
    let varNames: Set<string> = new Set();

    // Fist, extract all variables assigned inside the statements,
    // as long as those variables occur in the provided statement context.
    for (const stmt of statements) {
        switch (stmt.kind) {
            case "statement_assign":
            case "statement_augmentedassign": {
                const path = tryExtractPath(stmt.path)?.map(idText).join(".");
                if (path !== undefined) {
                    // Include all children of the path as found in the provided statement context
                    for (const key of sctx.varBindings.keys()) {
                        if (key.startsWith(path)) {
                            varNames.add(key);
                        }
                    }
                }

                // Add also all variables mutated in the expression
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [stmt.expression],
                        sctx,
                        ctx,
                    ),
                );
                break;
            }
            case "statement_condition": {
                varNames = varNames.union(
                    extractAssignedVariables(stmt.trueStatements, sctx, ctx),
                );
                if (stmt.falseStatements !== null) {
                    varNames = varNames.union(
                        extractAssignedVariables(
                            stmt.falseStatements,
                            sctx,
                            ctx,
                        ),
                    );
                }
                if (stmt.elseif !== null) {
                    varNames = varNames.union(
                        extractAssignedVariables([stmt.elseif], sctx, ctx),
                    );
                }

                // Add also all variables mutated in the condition
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [stmt.condition],
                        sctx,
                        ctx,
                    ),
                );
                break;
            }

            case "statement_foreach":
                varNames = varNames.union(
                    extractAssignedVariables(stmt.statements, sctx, ctx),
                );
                varNames = varNames.union(
                    extractAssignedVariablesInExpression([stmt.map], sctx, ctx),
                );
                break;

            case "statement_repeat":
                varNames = varNames.union(
                    extractAssignedVariables(stmt.statements, sctx, ctx),
                );
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [stmt.iterations],
                        sctx,
                        ctx,
                    ),
                );
                break;
            case "statement_until":
            case "statement_while":
                varNames = varNames.union(
                    extractAssignedVariables(stmt.statements, sctx, ctx),
                );
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [stmt.condition],
                        sctx,
                        ctx,
                    ),
                );
                break;
            case "statement_try": {
                varNames = varNames.union(
                    extractAssignedVariables(stmt.statements, sctx, ctx),
                );
                break;
            }
            case "statement_try_catch": {
                varNames = varNames.union(
                    extractAssignedVariables(stmt.statements, sctx, ctx),
                );
                varNames = varNames.union(
                    extractAssignedVariables(stmt.catchStatements, sctx, ctx),
                );
                break;
            }
            case "statement_return": {
                if (stmt.expression !== null) {
                    varNames = varNames.union(
                        extractAssignedVariablesInExpression(
                            [stmt.expression],
                            sctx,
                            ctx,
                        ),
                    );
                }
                break;
            }
            case "statement_let":
            case "statement_expression": {
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [stmt.expression],
                        sctx,
                        ctx,
                    ),
                );
                break;
            }
        }
    }

    return varNames;
}

/* Extract all variables that are being mutated through a mutating function in the provided
list of expressions.
*/
function extractAssignedVariablesInExpression(
    expressions: AstExpression[],
    sctx: StatementContext,
    ctx: CompilerContext,
): Set<string> {
    let varNames: Set<string> = new Set();

    function addAllPathChildren(path: string) {
        for (const key of sctx.varBindings.keys()) {
            if (key.startsWith(path)) {
                varNames.add(key);
            }
        }
    }

    for (const exp of expressions) {
        switch (exp.kind) {
            case "conditional": {
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [exp.condition],
                        sctx,
                        ctx,
                    ),
                );
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [exp.thenBranch],
                        sctx,
                        ctx,
                    ),
                );
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [exp.elseBranch],
                        sctx,
                        ctx,
                    ),
                );
                break;
            }
            case "field_access": {
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [exp.aggregate],
                        sctx,
                        ctx,
                    ),
                );
                break;
            }
            case "init_of": {
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(exp.args, sctx, ctx),
                );
                break;
            }
            case "op_binary": {
                varNames = varNames.union(
                    extractAssignedVariablesInExpression([exp.left], sctx, ctx),
                );
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [exp.right],
                        sctx,
                        ctx,
                    ),
                );
                break;
            }
            case "op_unary": {
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        [exp.operand],
                        sctx,
                        ctx,
                    ),
                );
                break;
            }
            case "static_call": {
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(exp.args, sctx, ctx),
                );
                break;
            }
            case "struct_instance": {
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(
                        exp.args.map((init) => init.initializer),
                        sctx,
                        ctx,
                    ),
                );
                break;
            }
            case "method_call": {
                varNames = varNames.union(
                    extractAssignedVariablesInExpression(exp.args, sctx, ctx),
                );

                const path = tryExtractPath(exp.self)?.map(idText).join(".");

                if (path !== undefined) {
                    const src = getExpType(ctx, exp.self);

                    if (src.kind === "ref") {
                        const srcT = getType(ctx, src.name);
                        if (srcT.kind === "struct") {
                            if (StructFunctions.has(idText(exp.method))) {
                                // Treat all API functions as black boxes
                                // Hence, their self parameter could be mutated
                                // Include all children of the path as found in the provided sctx.
                                addAllPathChildren(path);
                            }
                        }

                        const f = srcT.functions.get(
                            idText(exp.method),
                        )?.isMutating;
                        if (f) {
                            // Include all children of the path as found in the provided sctx.
                            addAllPathChildren(path);
                        }
                    }

                    if (src.kind === "map") {
                        if (MapFunctions.has(idText(exp.method))) {
                            // Treat all API functions as black boxes
                            // Hence, their self parameter could be mutated
                            // Include all children of the path as found in the provided sctx.
                            addAllPathChildren(path);
                        }
                    }
                }
                break;
            }
            case "boolean":
            case "id":
            case "null":
            case "number":
            case "string":
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
    // that it is a simple variable without structure. In other words, there is no structure to inflate
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

    // An internal function to avoid repeating code in the  loops below
    function registerChildren(field: AstFieldDecl, fieldType: AstTypeDecl) {
        const children = flattenType(fieldType, ctx);
        if (children.size === 0) {
            result.set(idText(field.name), undefined);
        } else {
            for (const [child, val] of children) {
                result.set(`${idText(field.name)}.${child}`, val);
            }
        }
    }

    if (typeDecl.kind === "struct_decl") {
        for (const field of typeDecl.fields) {
            if (field.type.kind === "type_id") {
                registerChildren(field, getType(ctx, field.type).ast);
            } else if (field.type.kind === "optional_type") {
                const baseType = getOptionalBaseType(field.type);
                if (baseType.kind === "type_id") {
                    registerChildren(field, getType(ctx, baseType).ast);
                } else {
                    // It is a type without children
                    result.set(idText(field.name), undefined);
                }
            } else {
                // It is a type without children
                result.set(idText(field.name), undefined);
            }
        }
        result.set("$tactStruct", idText(typeDecl.name));
    }

    // From the point of view of the analyzer, treat contracts as if they were structs
    if (typeDecl.kind === "contract") {
        for (const field of typeDecl.declarations) {
            if (field.kind === "field_decl") {
                if (field.type.kind === "type_id") {
                    registerChildren(field, getType(ctx, field.type).ast);
                } else if (field.type.kind === "optional_type") {
                    const baseType = getOptionalBaseType(field.type);
                    if (baseType.kind === "type_id") {
                        registerChildren(field, getType(ctx, baseType).ast);
                    } else {
                        // It is a type without children
                        result.set(idText(field.name), undefined);
                    }
                } else {
                    // It is a type without children
                    result.set(idText(field.name), undefined);
                }
            }
        }
        result.set("$tactStruct", idText(typeDecl.name));
    }

    return result;
}

/* Extracts the ancestor types in the path expression.

For example, if the path expression is 

a.f2.g1 

and the type of a is:

A {f1: Int; f2: B {g1: Int; g2: Int}; f3: Bool}

This will return the array:

["A", "B"]
*/
export function extractAncestorTypes(
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

/*
Extracts the type at the base in nested optionals

Example:

T???? would return T

 */
function getOptionalBaseType(
    type: AstOptionalType,
): AstTypeId | AstMapType | AstBouncedMessageType {
    if (type.typeArg.kind === "optional_type") {
        return getOptionalBaseType(type.typeArg);
    } else {
        return type.typeArg;
    }
}
