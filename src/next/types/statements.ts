/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable @typescript-eslint/no-unused-expressions */
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { throwInternal } from "@/error/errors";
import { Bool, builtinAugmented, Int } from "@/next/types/builtins";
import { decodeExprCtx } from "@/next/types/expression";
import { convertExprToLValue } from "@/next/types/lvalue";
import { assignType, decodeType } from "@/next/types/type";
import { getCallResult } from "@/next/types/type-fn";

export function decodeStatements(
    statements: readonly Ast.Statement[],
    scopeRef: () => Ast.Scope,
): readonly Ast.DecodedStatement[] {
    const context: Context = {
        scopeRef,
        localScopeRef,
        required: getRequired(selfType),
        selfType,
        returnType,
        typeParams,
    };
    yield* rec(statements, context, emptyEff);
    return [];
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

function* getRequired(selfType: Ast.SelfType | undefined): E.WithLog<undefined | Set<string>> {
    if (!selfType) {
        return new Set();
    }
    const required: Set<string> = new Set();
    switch (selfType.kind) {
        case "type_ref": {
            switch (selfType.type.kind) {
                case "contract":
                case "trait": {
                    const { fieldish } = (yield* selfType.type.content());
                    for (const [name, field] of fieldish.map) {
                        if (field.decl.kind === 'field' && !field.decl.init) {
                            required.add(name)
                        }
                    }
                    return required;
                }
                case "struct":
                case "message":
                case "union": {
                    // no requirement to fill self on these, because they have
                    // no init()
                    return required;
                }
            }
            // linter needs this
            return required;
        }
        case "map_type":
        case "TypeMaybe":
        case "tuple_type":
        case "tensor_type":
        case "TyInt":
        case "TySlice":
        case "TyCell":
        case "TyBuilder":
        case "unit_type":
        case "TypeVoid":
        case "TypeNull":
        case "TypeBool":
        case "TypeAddress":
        case "TypeString":
        case "TypeStateInit":
        case "TypeStringBuilder": {
            return undefined;
        }
    }
}

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
        yield* assignType(ascribed, expr.computedType, ctx.scopeRef);
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
        yield* assignType(ctx.returnType, expr.computedType, ctx.scopeRef);
        return Result(Ast.DStatementReturn(expr, node.loc), ctx, newEff);
    } else {
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
        yield* assignType(path.computedType, right.computedType, ctx.scopeRef);
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
    yield* assignType(Bool, condition.computedType, ctx.scopeRef);
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
    yield* assignType(Bool, condition.computedType, ctx.scopeRef);
    const result = yield* rec(node.statements, ctx, eff);
    // might be executed zero times, so it doesn't matter
    // if it always returns, or assigns to `self`
    return Result(Ast.DStatementWhile(condition, result.node, node.loc), ctx, eff);
};

const decodeUntil: Decode<Ast.StatementUntil, Ast.DStatementUntil> = function* (node, ctx, eff) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(Bool, condition.computedType, ctx.scopeRef);
    const result = yield* rec(node.statements, ctx, eff);
    // until executes its body at least once
    return Result(Ast.DStatementUntil(condition, result.node, node.loc), ctx, result.effects);
};

const decodeRepeat: Decode<Ast.StatementRepeat, Ast.DStatementRepeat> = function* (node, ctx, eff) {
    const iterations = yield* decodeExprCtx(node.iterations, ctx);
    yield* assignType(Int, iterations.computedType, ctx.scopeRef);
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

const decodeDestruct: Decode<Ast.StatementDestruct, Ast.DStatementDestruct> = function* (node, ctx, eff) {
    const expr = yield* decodeExprCtx(node.expression, ctx);
    node.identifiers // defineVar each, ReadonlyMap -> Ordered, assignType like in decodeStructCons
    node.ignoreUnspecifiedFields // throw if #identifier != declTypes.get(node.type).fields.filter(x => x.kind === 'field').length
    node.type // assignType(ascribed, expr.computedType)
};

const decodeBlock: Decode<Ast.StatementBlock, Ast.DStatementBlock> = function* (node, ctx, eff) {
    const [body, bodyCtx] = yield* rec(node.statements, ctx, eff);
    // TODO: handle return/self bullshit
    return [Ast.DStatementBlock(body, node.loc), ctx];
};