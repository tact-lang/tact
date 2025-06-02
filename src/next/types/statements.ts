/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable @typescript-eslint/no-unused-expressions */
import * as Ast from "@/next/ast";
import { throwInternal } from "@/error/errors";
import { Bool, builtinAugmented, Int, Void } from "@/next/types/builtins";
import { decodeExprCtx } from "@/next/types/expression";
import { convertExprToLValue } from "@/next/types/lvalue";
import { assignType, dealiasType, decodeType, decodeTypeLazy, checkFnCall } from "@/next/types/type";
import { emptyEff, mergeEff, setHadAssign, setHadExit } from "@/next/types/effects";
import { emptyTypeParams } from "@/next/types/type-params";

export function decodeStatementsLazy(
    Lazy: Ast.ThunkBuilder,
    loc: Ast.Loc,
    statements: readonly Ast.Statement[],
    typeParams: Ast.TypeParams,
    selfTypeRef: () => undefined | Ast.SelfType,
    returnType: Ast.Thunk<Ast.DecodedType>,
    isInit: boolean,
    scopeRef: () => Ast.Scope,
) {
    return Lazy({
        callback: function* (Lazy) {
            const selfType = selfTypeRef();
            const required = isInit
                ? yield* getRequired(selfType)
                : undefined;
            const ctx: Context = {
                Lazy,
                localScopeRef: new Map(),
                required,
                returnType: yield* returnType(),
                scopeRef,
                selfType,
                typeParams,
            };
            const res = yield* decodeStmts(statements, ctx, emptyEff);
            return Ast.StatementsAux(res.node, res.effects);
        },
        context: [Ast.TEText("checking statements")],
        loc,
        recover: undefined,
    });
}

const decodeStmts: Decode<
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
        yield* assignType(expr.loc, emptyTypeParams, ascribed, expr.computedType, false);
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
        yield* assignType(expr.loc, emptyTypeParams, ctx.returnType, expr.computedType, false);
        return Result(Ast.DStatementReturn(expr, node.loc), ctx, newEff);
    } else {
        yield* assignType(node.loc, emptyTypeParams, ctx.returnType, Void, false);
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
        yield* assignType(path.loc, emptyTypeParams, path.computedType, right.computedType, false);
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
    yield* checkFnCall(
        node.loc,
        fnType, 
        [
            [left.loc, left.computedType],
            [right.loc, right.computedType],
        ],
    );
    if (path) {
        const newEff = yield* setHadAssign(eff, path);
        return Result(Ast.DStatementAugmentedAssign(node.op, path, right, node.loc), ctx, newEff);
    } else {
        return Result(Ast.DStatementExpression(right, node.loc), ctx, eff);
    }
};

const decodeCondition: Decode<Ast.StatementCondition, Ast.DStatementCondition> = function* (node, ctx, eff) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(condition.loc, emptyTypeParams, Bool, condition.computedType, false);
    const trueRes = yield* decodeStmts(node.trueStatements, ctx, eff);
    if (node.falseStatements) {
        const falseRes = yield* decodeStmts(node.falseStatements, ctx, eff);
        const newEff = mergeEff(trueRes.effects, falseRes.effects);
        return Result(Ast.DStatementCondition(condition, trueRes.node, falseRes.node, node.loc), ctx, newEff);
    } else {
        const newEff = mergeEff(trueRes.effects, eff);
        return Result(Ast.DStatementCondition(condition, trueRes.node, undefined, node.loc), ctx, newEff);
    }
};

const decodeWhile: Decode<Ast.StatementWhile, Ast.DStatementWhile> = function* (node, ctx, eff) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(condition.loc, emptyTypeParams, Bool, condition.computedType, false);
    const result = yield* decodeStmts(node.statements, ctx, eff);
    // might be executed zero times, so it doesn't matter
    // if it always returns, or assigns to `self`
    return Result(Ast.DStatementWhile(condition, result.node, node.loc), ctx, eff);
};

const decodeUntil: Decode<Ast.StatementUntil, Ast.DStatementUntil> = function* (node, ctx, eff) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(condition.loc, emptyTypeParams, Bool, condition.computedType, false);
    const result = yield* decodeStmts(node.statements, ctx, eff);
    // until executes its body at least once
    return Result(Ast.DStatementUntil(condition, result.node, node.loc), ctx, result.effects);
};

const decodeRepeat: Decode<Ast.StatementRepeat, Ast.DStatementRepeat> = function* (node, ctx, eff) {
    const iterations = yield* decodeExprCtx(node.iterations, ctx);
    yield* assignType(iterations.loc, emptyTypeParams, Int, iterations.computedType, false);
    const result = yield* decodeStmts(node.statements, ctx, eff);
    // might be executed zero times, so it doesn't matter
    // if it always returns, or assigns to `self`
    return Result(Ast.DStatementRepeat(iterations, result.node, node.loc), ctx, eff);
};

const decodeTry: Decode<Ast.StatementTry, Ast.DStatementTry> = function* (node, ctx, eff) {
    const tryRes = yield* decodeStmts(node.statements, ctx, eff);
    if (node.catchBlock) {
        const newCtx = yield* defineVar(node.catchBlock.name, Int, ctx);
        const catchRes = yield* decodeStmts(node.catchBlock.statements, newCtx, eff);
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
    const result = yield* decodeStmts(node.statements, innerCtx, eff);
    return Result(Ast.DStatementForEach(node.keyName, node.valueName, map, result.node, node.loc), ctx, eff);
};
function* defineForVars(
    type: Ast.DecodedType,
    keyName: Ast.OptionalId,
    valueName: Ast.OptionalId,
    ctx: Context,
): Ast.WithLog<Context> {
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

    const typeArgs = yield* Ast.mapLog(node.typeArgs, function* (arg) {
        return yield* decodeTypeLazy(ctx.Lazy, ctx.typeParams, arg, ctx.scopeRef)();
    });

    const decl = yield* findStruct(node.type, typeArgs, ctx.scopeRef);
    if (!decl) {
        return Result(Ast.DStatementExpression(expr, node.loc), ctx, eff);
    }

    const ascribed = Ast.DTypeRef(node.type, decl, typeArgs, node.loc);
    yield* assignType(node.loc, emptyTypeParams, ascribed, expr.computedType, false);
    
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
): Ast.WithLog<readonly [Ast.Ordered<Ast.DestructPattern>, Context]> {
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
const EMissingField = (name: string, prev: Ast.Loc): Ast.TcError => ({
    loc: prev,
    descr: [
        Ast.TEText(`Value for field "${name}" is missing`),
        Ast.TECode(prev),
    ],
});
const ENoSuchField = (name: string, next: Ast.Loc): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`There is no field "${name}"`),
        Ast.TECode(next),
    ],
});
const EDuplicateField = (name: string, prev: Ast.Loc, next: Ast.Loc): Ast.TcError => ({
    loc: prev,
    descr: [
        Ast.TEText(`Duplicate field "${name}"`),
        Ast.TEText(`Defined at:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
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
const ENotDestructible = (name: string, prev: Ast.Loc): Ast.TcError => ({
    loc: prev,
    descr: [
        Ast.TEText(`Type "${name}" doesn't `),
        Ast.TECode(prev),
    ],
});

const decodeBlock: Decode<Ast.StatementBlock, Ast.DStatementBlock> = function* (node, ctx, eff) {
    const result = yield* decodeStmts(node.statements, ctx, eff);
    return Result(Ast.DStatementBlock(result.node, node.loc), ctx, result.effects);
};

type Decode<T, U> = (
    node: T,
    context: Context, 
    effects: Ast.Effects,
) => Ast.WithLog<Result<U>>

type Result<U> = {
    readonly node: U;
    readonly context: Context;
    readonly effects: Ast.Effects;
}
const Result = <U>(
    node: U,
    context: Context,
    effects: Ast.Effects,
): Result<U> => Object.freeze({ node, context, effects });

type Context = {
    readonly Lazy: Ast.ThunkBuilder,
    readonly scopeRef: () => Ast.Scope;
    readonly selfType: Ast.SelfType | undefined;
    readonly required: undefined | ReadonlySet<string>;
    readonly typeParams: Ast.TypeParams;
    readonly returnType: Ast.DecodedType;
    readonly localScopeRef: ReadonlyMap<string, [Ast.DecodedType, Ast.Loc]>;
}

function* defineVar(
    node: Ast.OptionalId, 
    type: Ast.DecodedType, 
    ctx: Context,
): Ast.WithLog<Context> {
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
const ENoDefineSelf = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(`Cannot define a variable "self"`),
    ],
});
const ERedefineVar = (name: string, prev: Ast.Loc, next: Ast.Loc): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`Variable ${name} is already defined`),
        Ast.TEText(`Defined at:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
    ],
});
const EShadowConst = (name: string, prev: Ast.Loc, next: Ast.Loc): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`Variable ${name} shadows a global constant`),
        Ast.TEText(`Defined at:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
    ],
});

function* getRequired(selfType: Ast.SelfType | undefined): Ast.WithLog<undefined | Set<string>> {
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