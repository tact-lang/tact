/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable @typescript-eslint/no-unused-expressions */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { throwInternal } from "@/error/errors";
import { Bool, builtinAugmented, Int, Void } from "@/next/types/builtins";
import { decodeExprCtx } from "@/next/types/expression";
import { convertExprToLValue } from "@/next/types/lvalue";
import { assignType, dealiasType, decodeType, decodeTypeLazy } from "@/next/types/type";
import { getCallResult } from "@/next/types/type-fn";

export function decodeStatements(
    statements: readonly Ast.Statement[],
    typeParams: Ast.TypeParams,
    selfType: undefined | Ast.SelfType,
    returnType: Ast.DecodedType,
    required: undefined | ReadonlySet<string>,
    scopeRef: () => Ast.Scope,
) {
    const ctx: Context = {
        localScopeRef: new Map(),
        required,
        returnType,
        scopeRef,
        selfType,
        typeParams,
    };
    return rec(statements, ctx, emptyEff);
}

const rec: Decode<
    readonly Ast.Statement[],
    readonly Ast.DecodedStatement[]
> = function* (nodes, ctx, eff) {
    const results: Ast.DecodedStatement[] = [];
    let state = [ctx, eff] as const;
    for (const node of nodes) {
        const result = yield* decodeStatement(node, ctx, eff);
        results.push(result.node);
        state = [result.context, result.effects];
    }
    const [context, effects] = state;
    return Result(results, context, effects);
};

type Decode<T, U> = (
    node: T,
    context: Context, 
    effects: Effects,
) => E.WithLog<Result<U>>

type Result<U> = {
    readonly node: U;
    readonly context: Context;
    readonly effects: Effects;
}
const Result = <U>(
    node: U,
    context: Context,
    effects: Effects,
): Result<U> => Object.freeze({ node, context, effects });

type Context = {
    readonly scopeRef: () => Ast.Scope;
    readonly selfType: Ast.SelfType | undefined;
    readonly required: undefined | ReadonlySet<string>;
    readonly typeParams: Ast.TypeParams;
    readonly returnType: Ast.DecodedType;
    readonly localScopeRef: ReadonlyMap<string, [Ast.DecodedType, Ast.Loc]>;
}

type Effects = {
    readonly returnOrThrow: boolean;
    readonly setSelfPaths: ReadonlySet<string>;
}
const Effects = (
    returnOrThrow: boolean,
    setSelfPaths: ReadonlySet<string>,
): Effects => Object.freeze({ returnOrThrow, setSelfPaths })

const emptyEff: Effects = Object.freeze({
    returnOrThrow: false,
    setSelfPaths: new Set<string>(),
});

// when two branches merge
const mergeEff = (left: Effects, right: Effects): Effects => {
    return Effects(
        left.returnOrThrow && right.returnOrThrow,
        new Set([...left.setSelfPaths].filter(p => right.setSelfPaths.has(p)))
    );
};

// on every assign
function* setHadAssign(
    eff: Effects,
    lvalue: Ast.LValue,
): E.WithLog<Effects> {
    const setSelfPaths = new Set(eff.setSelfPaths);
    switch (lvalue.kind) {
        case "self": {
            // self = ...;
            yield ENoSelfAssign(lvalue.loc);
            break;
        }
        case "field_access": {
            if (lvalue.aggregate.kind === 'self') {
                // self.x = ...;
                setSelfPaths.add(lvalue.field.text);
            }
            break;
        }
        case "var": {
            // x = ...;
        }
    }
    return Effects(eff.returnOrThrow, setSelfPaths);
}
const ENoSelfAssign = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Cannot assign to self`),
    ],
});

// on every return or throw
function* setHadExit(
    eff: Effects, 
    successful: boolean, 
    required: undefined | ReadonlySet<string>,
    returnLoc: Ast.Loc,
): E.WithLog<Effects> {
    if (successful && required) {
        const missing = [...required].filter(p => !eff.setSelfPaths.has(p));
        for (const fieldName of missing) {
            yield EMissingSelfInit(fieldName, returnLoc);
        }
    }
    return Effects(true, eff.setSelfPaths);
}
const EMissingSelfInit = (name: string, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Field "self.${name}" is not initialized by this moment`),
    ],
});

function* defineVar(
    node: Ast.OptionalId, 
    type: Ast.DecodedType, 
    ctx: Context,
): E.WithLog<Context> {
    if (node.kind === 'wildcard') {
        // there is nothing to define for a wildcard
        return ctx;
    }
    
    if (node.text === 'self') {
        yield ENoDefineSelf(node.loc);
        return ctx;
    }
    
    const prev = ctx.localScopeRef.get(node.text);
    if (prev) {
        const [, prevLoc] = prev;
        yield ERedefineVar(node.text, prevLoc, node.loc);
        return ctx;
    }

    const constant = ctx.scopeRef().constants.get(node.text);
    if (constant) {
        const prevLoc = constant.via.defLoc;
        yield EShadowConst(node.text, prevLoc, node.loc);
        return ctx;
    }

    const localScopeRef = new Map(ctx.localScopeRef);
    localScopeRef.set(node.text, [type, node.loc]);
    return { ...ctx, localScopeRef };
}
const ENoDefineSelf = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Cannot define a variable "self"`),
    ],
});
const ERedefineVar = (name: string, prev: Ast.Loc, next: Ast.Loc): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Variable ${name} is already defined`),
        E.TEText(`Defined at:`),
        E.TECode(next),
        E.TEText(`Previously defined at:`),
        E.TECode(prev),
    ],
});
const EShadowConst = (name: string, prev: Ast.Loc, next: Ast.Loc): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Variable ${name} shadows a global constant`),
        E.TEText(`Defined at:`),
        E.TECode(next),
        E.TEText(`Previously defined at:`),
        E.TECode(prev),
    ],
});

const decodeStatement: Decode<Ast.Statement, Ast.DecodedStatement> = function (stmt, ctx, eff) {
    switch (stmt.kind) {
        case "statement_let": return decodeLet(stmt, ctx, eff);
        case "statement_return": return decodeReturn(stmt, ctx, eff);
        case "statement_expression": return decodeExpression(stmt, ctx, eff);
        case "statement_assign": return decodeAssign(stmt, ctx, eff);
        case "statement_augmentedassign": return decodeAssignAugmented(stmt, ctx, eff);
        case "statement_condition": return decodeCondition(stmt, ctx, eff);
        case "statement_while": return decodeWhile(stmt, ctx, eff);
        case "statement_until": return decodeUntil(stmt, ctx, eff);
        case "statement_repeat": return decodeRepeat(stmt, ctx, eff);
        case "statement_try": return decodeTry(stmt, ctx, eff);
        case "statement_foreach": return decodeForeach(stmt, ctx, eff);
        case "statement_destruct": return decodeDestruct(stmt, ctx, eff);
        case "statement_block": return decodeBlock(stmt, ctx, eff);
    }
}

const decodeLet: Decode<Ast.StatementLet, Ast.DStatementLet> = function* (node, ctx, eff) {
    const expr = yield* decodeExprCtx(node.expression, ctx);
    const result = Ast.DStatementLet(node.name, expr, node.loc);
    if (node.type) {
        const ascribed = yield* decodeType(ctx.typeParams, node.type, ctx.scopeRef().typeDecls)
        yield* assignType(expr.loc, ascribed, expr.computedType);
        const newCtx = yield* defineVar(node.name, ascribed, ctx);
        return Result(result, newCtx, eff);
    } else {
        const newCtx = yield* defineVar(node.name, expr.computedType, ctx);
        return Result(result, newCtx, eff);
    }
};

const decodeReturn: Decode<Ast.StatementReturn, Ast.DStatementReturn> = function* (node, ctx, eff) {
    const newEff = yield* setHadExit(eff, true, ctx.required, node.loc);
    if (node.expression) {
        const expr = yield* decodeExprCtx(node.expression, ctx);
        yield* assignType(expr.loc, ctx.returnType, expr.computedType);
        return Result(Ast.DStatementReturn(expr, node.loc), ctx, newEff);
    } else {
        yield* assignType(node.loc, ctx.returnType, Void);
        return Result(Ast.DStatementReturn(undefined, node.loc), ctx, newEff);
    }
};

const decodeExpression: Decode<Ast.StatementExpression, Ast.DStatementExpression> = function* (node, ctx, eff) {
    const expr = yield* decodeExprCtx(node.expression, ctx);
    if (expr.kind === 'throw_call') {
        const newEff = yield* setHadExit(eff, true, ctx.required, node.loc);
        return Result(Ast.DStatementExpression(expr, node.loc), ctx, newEff);
    } else {
        return Result(Ast.DStatementExpression(expr, node.loc), ctx, eff);
    }
};

const decodeAssign: Decode<Ast.StatementAssign, Ast.DStatementAssign | Ast.DStatementExpression> = function* (node, ctx, eff) {
    const right = yield* decodeExprCtx(node.expression, ctx);    
    const left = yield* decodeExprCtx(node.path, ctx);
    const path = yield* convertExprToLValue(left);
    if (path) {
        yield* assignType(path.loc, path.computedType, right.computedType);
        const newEff = yield* setHadAssign(eff, path);
        return Result(Ast.DStatementAssign(path, right, node.loc), ctx, newEff);
    } else {
        return Result(Ast.DStatementExpression(right, node.loc), ctx, eff);
    }
};

const decodeAssignAugmented: Decode<Ast.StatementAugmentedAssign, Ast.DStatementAugmentedAssign | Ast.DStatementExpression> = function* (node, ctx, eff) {
    const right = yield* decodeExprCtx(node.expression, ctx);    
    const left = yield* decodeExprCtx(node.path, ctx);
    const path = yield* convertExprToLValue(left);
    const fnType = builtinAugmented.get(node.op);
    if (!fnType) {
        return throwInternal("Builtin operator is not in the map");
    }
    yield* getCallResult(fnType, [left.computedType, right.computedType]);
    if (path) {
        const newEff = yield* setHadAssign(eff, path);
        return Result(Ast.DStatementAugmentedAssign(node.op, path, right, node.loc), ctx, newEff);
    } else {
        return Result(Ast.DStatementExpression(right, node.loc), ctx, eff);
    }
};

const decodeCondition: Decode<Ast.StatementCondition, Ast.DStatementCondition> = function* (node, ctx, eff) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(condition.loc, Bool, condition.computedType);
    const trueRes = yield* rec(node.trueStatements, ctx, eff);
    if (node.falseStatements) {
        const falseRes = yield* rec(node.falseStatements, ctx, eff);
        const newEff = mergeEff(trueRes.effects, falseRes.effects);
        return Result(Ast.DStatementCondition(condition, trueRes.node, falseRes.node, node.loc), ctx, newEff);
    } else {
        const newEff = mergeEff(trueRes.effects, eff);
        return Result(Ast.DStatementCondition(condition, trueRes.node, undefined, node.loc), ctx, newEff);
    }
};

const decodeWhile: Decode<Ast.StatementWhile, Ast.DStatementWhile> = function* (node, ctx, eff) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(condition.loc, Bool, condition.computedType);
    const result = yield* rec(node.statements, ctx, eff);
    // might be executed zero times, so it doesn't matter
    // if it always returns, or assigns to `self`
    return Result(Ast.DStatementWhile(condition, result.node, node.loc), ctx, eff);
};

const decodeUntil: Decode<Ast.StatementUntil, Ast.DStatementUntil> = function* (node, ctx, eff) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(condition.loc, Bool, condition.computedType);
    const result = yield* rec(node.statements, ctx, eff);
    // until executes its body at least once
    return Result(Ast.DStatementUntil(condition, result.node, node.loc), ctx, result.effects);
};

const decodeRepeat: Decode<Ast.StatementRepeat, Ast.DStatementRepeat> = function* (node, ctx, eff) {
    const iterations = yield* decodeExprCtx(node.iterations, ctx);
    yield* assignType(iterations.loc, Int, iterations.computedType);
    const result = yield* rec(node.statements, ctx, eff);
    // might be executed zero times, so it doesn't matter
    // if it always returns, or assigns to `self`
    return Result(Ast.DStatementRepeat(iterations, result.node, node.loc), ctx, eff);
};

const decodeTry: Decode<Ast.StatementTry, Ast.DStatementTry> = function* (node, ctx, eff) {
    const tryRes = yield* rec(node.statements, ctx, eff);
    if (node.catchBlock) {
        const newCtx = yield* defineVar(node.catchBlock.name, Int, ctx);
        const catchRes = yield* rec(node.catchBlock.statements, newCtx, eff);
        const catchBlock = Ast.DCatchBlock(node.catchBlock.name, catchRes.node);
        const newEff = mergeEff(tryRes.effects, catchRes.effects);
        return Result(Ast.DStatementTry(tryRes.node, catchBlock, node.loc), ctx, newEff);
    } else {
        return Result(Ast.DStatementTry(tryRes.node, undefined, node.loc), ctx, tryRes.effects);
    }
};

const decodeForeach: Decode<Ast.StatementForEach, Ast.DStatementForEach> = function* (node, ctx, eff) {
    const map = yield* decodeExprCtx(node.map, ctx);
    const innerCtx = yield* defineForVars(
        map.computedType,
        node.keyName,
        node.valueName,
        ctx,
    );
    const result = yield* rec(node.statements, innerCtx, eff);
    return Result(Ast.DStatementForEach(node.keyName, node.valueName, map, result.node, node.loc), ctx, eff);
};
function* defineForVars(
    type: Ast.DecodedType,
    keyName: Ast.OptionalId,
    valueName: Ast.OptionalId,
    ctx: Context,
): E.WithLog<Context> {
    if (type.kind === 'map_type') {
        const ctxKey = yield* defineVar(keyName, type.key, ctx);
        const ctxKV = yield* defineVar(valueName, type.value, ctxKey);
        return ctxKV;
    } else if (type.kind === 'TypeAlias') {
        const childType = type.type;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (childType.kind === 'NotDealiased') {
            return throwInternal("Non-dealiased type in foreach");
        }
        return yield* defineForVars(childType, keyName, valueName, ctx);
    } else {
        const ctxKey = yield* defineVar(keyName, Ast.DTypeRecover(), ctx);
        const ctxKV = yield* defineVar(valueName, Ast.DTypeRecover(), ctxKey);
        return ctxKV;
    }
}

const decodeDestruct: Decode<Ast.StatementDestruct, Ast.DStatementDestruct | Ast.DStatementExpression> = function* (node, ctx, eff) {
    const expr = yield* decodeExprCtx(node.expression, ctx);

    const typeArgs = yield* E.mapLog(node.typeArgs, function* (arg) {
        return yield* decodeTypeLazy(ctx.typeParams, arg, ctx.scopeRef)();
    });

    const decl = yield* findStruct(node.type, typeArgs, ctx.scopeRef);
    if (!decl) {
        return Result(Ast.DStatementExpression(expr, node.loc), ctx, eff);
    }

    const ascribed = Ast.DTypeRef(node.type, decl, typeArgs, node.loc);
    yield* assignType(node.loc, ascribed, expr.computedType);
    
    // see checkFields in expression.ts
    const [fields, newCtx] = yield* checkFields(
        node.loc,
        node.identifiers, 
        decl.fields, 
        node.ignoreUnspecifiedFields,
        ctx,
    );

    return Result(Ast.DStatementDestruct(node.type, fields, node.ignoreUnspecifiedFields, expr, node.loc), newCtx, eff);
};
function* checkFields(
    nodeLoc: Ast.Loc,
    stmtFields: readonly (readonly [Ast.Id, Ast.OptionalId])[],
    declFields: Ast.Ordered<Ast.InhFieldSig>,
    ignoreUnspecifiedFields: boolean,
    ctx: Context,
): E.WithLog<readonly [Ast.Ordered<Ast.DestructPattern>, Context]> {
    const order: string[] = [];
    const map: Map<string, [Ast.DestructPattern, Ast.Loc]> = new Map();
    for (const [field, variable] of stmtFields) {
        const fieldName = field.text;
        const prev = map.get(fieldName);
        if (prev) {
            const [, prevLoc] = prev;
            yield EDuplicateField(fieldName, prevLoc, field.loc);
            continue;
        }
        
        const decl = declFields.map.get(fieldName);
        if (!decl) {
            yield ENoSuchField(fieldName, field.loc);
            continue;
        }

        order.push(fieldName);

        map.set(fieldName, [Ast.DestructPattern(
            field,
            variable,
        ), field.loc]);

        ctx = yield* defineVar(
            variable, 
            yield* decl.type(), 
            ctx
        );
    }

    if (!ignoreUnspecifiedFields) {
        for (const fieldName of declFields.order) {
            if (!map.has(fieldName)) {
                yield EMissingField(fieldName, nodeLoc);
            }
        }
    }

    const result = new Map(
        [...map].map(([name, [pattern]]) => [name, pattern])
    );
    return [Ast.Ordered(order, result), ctx];
}
const EMissingField = (name: string, prev: Ast.Loc): E.TcError => ({
    loc: prev,
    descr: [
        E.TEText(`Value for field "${name}" is missing`),
        E.TECode(prev),
    ],
});
const ENoSuchField = (name: string, next: Ast.Loc): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`There is no field "${name}"`),
        E.TECode(next),
    ],
});
const EDuplicateField = (name: string, prev: Ast.Loc, next: Ast.Loc): E.TcError => ({
    loc: prev,
    descr: [
        E.TEText(`Duplicate field "${name}"`),
        E.TEText(`Defined at:`),
        E.TECode(next),
        E.TEText(`Previously defined at:`),
        E.TECode(prev),
    ],
});
function* findStruct(
    id: Ast.TypeId,
    typeArgs: Ast.DecodedType[],
    scopeRef: () => Ast.Scope,
) {
    const decl = scopeRef().typeDecls.get(id.text);
    if (!decl) {
        return throwInternal("Bad ref from decoder");
    }
    switch (decl.decl.kind) {
        case "alias": {
            const type = yield* dealiasType(
                Ast.DTypeAliasRef(
                    Ast.NotDealiased(),
                    id,
                    typeArgs,
                    id.loc,
                ),
                scopeRef,
            );
            if (type.kind === 'type_ref' && (type.type.kind === 'struct' || type.type.kind === 'message')) {
                return type.type;
            } else {
                yield ENotDestructible(id.text, id.loc);
                return undefined;
            }
        }
        case "contract":
        case "union":
        case "trait": {
            yield ENotDestructible(id.text, id.loc);
            return undefined;
        }
        case "struct":
        case "message": {
            return decl.decl;
        }
    }
}
const ENotDestructible = (name: string, prev: Ast.Loc): E.TcError => ({
    loc: prev,
    descr: [
        E.TEText(`Type "${name}" doesn't `),
        E.TECode(prev),
    ],
});

const decodeBlock: Decode<Ast.StatementBlock, Ast.DStatementBlock> = function* (node, ctx, eff) {
    const result = yield* rec(node.statements, ctx, eff);
    return Result(Ast.DStatementBlock(result.node, node.loc), ctx, result.effects);
};