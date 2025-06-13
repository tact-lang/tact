/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable @typescript-eslint/no-unused-expressions */
import * as Ast from "@/next/ast";
import { throwInternal } from "@/error/errors";
import { Bool, builtinAugmented, Int } from "@/next/types/builtins";
import { decodeExprCtx } from "@/next/types/expression";
import { convertExprToLValue } from "@/next/types/lvalue";
import {
    assignType,
    dealiasType,
    decodeType,
    decodeTypeLazy,
    checkFnCall,
} from "@/next/types/type";
import {
    anyEff,
    exitEff,
    emptyEff,
    allEff,
    hasStorageAccess as isStorageAccess,
} from "@/next/types/effects";
import { emptyTypeParams } from "@/next/types/type-params";

export function decodeStatementsLazy(
    Lazy: Ast.ThunkBuilder,
    loc: Ast.Loc,
    statements: readonly Ast.Statement[],
    typeParams: Ast.CTypeParams,
    selfTypeRef: () => undefined | Ast.SelfType,
    returnType: Ast.Thunk<Ast.CType>,
    isInit: boolean,
    scopeRef: () => Ast.CSource,
) {
    return Lazy({
        callback: function* (Lazy) {
            const selfType = selfTypeRef();
            const required = isInit ? yield* getRequired(selfType) : undefined;
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
            return Ast.CStatementsAux(res.value, res.effects);
        },
        context: [Ast.TEText("checking statements")],
        loc,
        recover: undefined,
    });
}

const decodeStmts: Decode<
    readonly Ast.Statement[],
    readonly Ast.CStmt[]
> = function* (nodes, ctx, eff) {
    const results: Ast.CStmt[] = [];
    let state = [ctx, eff] as const;
    for (const node of nodes) {
        const result = yield* decodeStatement(node, ctx, eff);
        results.push(result.value);
        state = [result.context, allEff([eff, result.effects])];
    }
    const [context, effects] = state;
    return Result(results, context, effects);
};

const decodeStatement: Decode<Ast.Statement, Ast.CStmt> = function (
    stmt,
    ctx,
    eff,
) {
    switch (stmt.kind) {
        case "statement_let":
            return decodeLet(stmt, ctx, eff);
        case "statement_return":
            return decodeReturn(stmt, ctx, eff);
        case "statement_expression":
            return decodeExpression(stmt, ctx, eff);
        case "statement_assign":
            return decodeAssign(stmt, ctx, eff);
        case "statement_augmentedassign":
            return decodeAssignAugmented(stmt, ctx, eff);
        case "statement_condition":
            return decodeCondition(stmt, ctx, eff);
        case "statement_while":
            return decodeWhile(stmt, ctx, eff);
        case "statement_until":
            return decodeUntil(stmt, ctx, eff);
        case "statement_repeat":
            return decodeRepeat(stmt, ctx, eff);
        case "statement_try":
            return decodeTry(stmt, ctx, eff);
        case "statement_foreach":
            return decodeForeach(stmt, ctx, eff);
        case "statement_destruct":
            return decodeDestruct(stmt, ctx, eff);
        case "statement_block":
            return decodeBlock(stmt, ctx, eff);
    }
};

const decodeLet: Decode<Ast.StatementLet, Ast.CStmtLet> = function* (
    node,
    ctx,
    eff,
) {
    const expr = yield* decodeExprCtx(node.expression, ctx);
    const result = Ast.CStmtLet(node.name, expr.value, node.loc);
    if (node.type) {
        const ascribed = yield* decodeType(
            ctx.typeParams,
            node.type,
            ctx.scopeRef().typeDecls,
        );
        yield* assignType(
            expr.value.loc,
            emptyTypeParams,
            ascribed,
            expr.value.computedType,
            false,
        );
        const newCtx = yield* defineVar(node.name, ascribed, ctx);
        return Result(result, newCtx, expr.eff);
    } else {
        const newCtx = yield* defineVar(node.name, expr.value.computedType, ctx);
        return Result(result, newCtx, expr.eff);
    }
};

const decodeReturn: Decode<Ast.StatementReturn, Ast.CStmtReturn> = function* (node, ctx, eff) {
    if (ctx.required) {
        const missing = [...ctx.required].filter((p) => !eff.mustSetSelf.has(p));
        for (const fieldName of missing) {
            yield EMissingSelfInit(fieldName, node.loc);
        }
    }
    const expr = yield* checkReturnExpr(node.expression, ctx);
    return Result(
        Ast.CStmtReturn(expr?.value, node.loc),
        ctx,
        exitEff(expr ? expr.eff : emptyEff),
    );
};
const EMissingSelfInit = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(`Field "self.${name}" is not initialized by this moment`),
    ],
});
function* checkReturnExpr(node: Ast.Expression | undefined, ctx: Context) {
    if (!node) {
        return undefined;
    }
    const expr = yield* decodeExprCtx(node, ctx);
    yield* assignType(
        expr.value.loc,
        emptyTypeParams,
        ctx.returnType,
        expr.value.computedType,
        false,
    );
    return expr;
}


const decodeExpression: Decode<
    Ast.StatementExpression,
    Ast.CStmtExpression
> = function* (node, ctx, eff) {
    const expr = yield* decodeExprCtx(node.expression, ctx);
    return Result(
        Ast.CStmtExpression(expr.value, node.loc), 
        ctx, 
        expr.eff,
    );
};

const decodeAssign: Decode<
    Ast.StatementAssign,
    Ast.CStmtAssign | Ast.CStmtExpression
> = function* (node, ctx, eff) {
    const right = yield* decodeExprCtx(node.expression, ctx);
    const left = yield* decodeExprCtx(node.path, ctx);
    const path = yield* convertExprToLValue(left.value);
    if (!path) {
        return Result(
            Ast.CStmtExpression(right.value, node.loc),
            ctx,
            allEff([left.eff, right.eff]),
        );
    }
    
    yield* assignType(
        path.loc,
        emptyTypeParams,
        path.computedType,
        right.value.computedType,
        false,
    );
    const argEffs = allEff([left.eff, right.eff]);
    const isAssignToStorage = isStorageAccess(path, ctx.selfType);
    const newEff: Ast.Effects = {
        ...argEffs,
        mayWrite: isAssignToStorage || argEffs.mayWrite,
    };
    return Result(Ast.CStmtAssign(path, right.value, node.loc), ctx, newEff);
};

const decodeAssignAugmented: Decode<
    Ast.StatementAugmentedAssign,
    Ast.CStmtAugmentedAssign | Ast.CStmtExpression
> = function* (node, ctx, eff) {
    const right = yield* decodeExprCtx(node.expression, ctx);
    const left = yield* decodeExprCtx(node.path, ctx);
    const path = yield* convertExprToLValue(left.value);
    if (!path) {
        return Result(Ast.CStmtExpression(right.value, node.loc), ctx, eff);
    }

    const fnType = builtinAugmented.get(node.op);
    if (!fnType) {
        return throwInternal("Builtin operator is not in the map");
    }
    yield* checkFnCall(node.loc, fnType, [
        [left.value.loc, left.value.computedType],
        [right.value.loc, right.value.computedType],
    ]);

    const argEffs = allEff([left.eff, right.eff]);
    const isAssignToStorage = isStorageAccess(path, ctx.selfType);
    const newEff: Ast.Effects = {
        ...argEffs,
        mayRead: isAssignToStorage || argEffs.mayRead,
        mayWrite: isAssignToStorage || argEffs.mayWrite,
    };
    return Result(
        Ast.CStmtAugmentedAssign(node.op, path, right.value, node.loc),
        ctx,
        newEff,
    );
};

const decodeCondition: Decode<Ast.StatementCondition, Ast.CStmtCondition> =
    function* (node, ctx, eff) {
        const condition = yield* decodeExprCtx(node.condition, ctx);
        yield* assignType(
            condition.value.loc,
            emptyTypeParams,
            Bool,
            condition.value.computedType,
            false,
        );
        const trueRes = yield* decodeStmts(node.trueStatements, ctx, eff);
        const falseRes = yield* checkElse(node.falseStatements, ctx, eff);
        return Result(
            Ast.CStmtCondition(
                condition.value,
                trueRes.value,
                falseRes.value,
                node.loc,
            ),
            ctx,
            allEff([
                condition.eff, 
                anyEff([trueRes.effects, falseRes.effects])],
            ),
        );
    };
const checkElse: Decode<
    undefined | readonly Ast.Statement[],
    undefined | readonly Ast.CStmt[]
> = function* (node, ctx, eff) {
    if (typeof node === 'undefined') {
        return Result(undefined, ctx, emptyEff);
    }
    return yield* decodeStmts(node, ctx, eff);
}
const decodeWhile: Decode<Ast.StatementWhile, Ast.CStmtWhile> = function* (
    node,
    ctx,
    eff,
) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(
        condition.value.loc,
        emptyTypeParams,
        Bool,
        condition.value.computedType,
        false,
    );
    const result = yield* decodeStmts(node.statements, ctx, eff);
    // might be executed zero times, so it doesn't matter
    // if it always returns, or assigns to `self`
    return Result(
        Ast.CStmtWhile(condition.value, result.value, node.loc),
        ctx,
        allEff([condition.eff, anyEff([result.effects, emptyEff])]),
    );
};

const decodeUntil: Decode<Ast.StatementUntil, Ast.CStmtUntil> = function* (
    node,
    ctx,
    eff,
) {
    const condition = yield* decodeExprCtx(node.condition, ctx);
    yield* assignType(
        condition.value.loc,
        emptyTypeParams,
        Bool,
        condition.value.computedType,
        false,
    );
    const result = yield* decodeStmts(node.statements, ctx, eff);
    return Result(
        Ast.CStmtUntil(condition.value, result.value, node.loc),
        ctx,
        allEff([result.effects, condition.eff, anyEff([result.effects, emptyEff])]),
    );
};

const decodeRepeat: Decode<Ast.StatementRepeat, Ast.CStmtRepeat> =
    function* (node, ctx, eff) {
        const iterations = yield* decodeExprCtx(node.iterations, ctx);
        yield* assignType(
            iterations.value.loc,
            emptyTypeParams,
            Int,
            iterations.value.computedType,
            false,
        );
        const result = yield* decodeStmts(node.statements, ctx, eff);
        // might be executed zero times, so it doesn't matter
        // if it always returns, or assigns to `self`
        return Result(
            Ast.CStmtRepeat(iterations.value, result.value, node.loc),
            ctx,
            allEff([iterations.eff, anyEff([result.effects, emptyEff])]),
        );
    };

const decodeTry: Decode<Ast.StatementTry, Ast.CStmtTry> = function* (
    node,
    ctx,
    eff,
) {
    const tryRes = yield* decodeStmts(node.statements, ctx, eff);
    if (node.catchBlock) {
        const newCtx = yield* defineVar(node.catchBlock.name, Int, ctx);
        const catchRes = yield* decodeStmts(
            node.catchBlock.statements,
            newCtx,
            eff,
        );
        const catchBlock = Ast.CCatchBlock(node.catchBlock.name, catchRes.value);
        return Result(
            Ast.CStmtTry(tryRes.value, catchBlock, node.loc),
            ctx,
            anyEff([tryRes.effects, catchRes.effects]),
        );
    } else {
        return Result(
            Ast.CStmtTry(tryRes.value, undefined, node.loc),
            ctx,
            tryRes.effects,
        );
    }
};

const decodeForeach: Decode<Ast.StatementForEach, Ast.CStmtForEach> =
    function* (node, ctx, eff) {
        const map = yield* decodeExprCtx(node.map, ctx);
        const innerCtx = yield* defineForVars(
            map.value.computedType,
            node.keyName,
            node.valueName,
            ctx,
        );
        const result = yield* decodeStmts(node.statements, innerCtx, eff);
        return Result(
            Ast.CStmtForEach(
                node.keyName,
                node.valueName,
                map.value,
                result.value,
                node.loc,
            ),
            ctx,
            allEff([map.eff, anyEff([result.effects, emptyEff])]),
        );
    };
function* defineForVars(
    type: Ast.CType,
    keyName: Ast.OptionalId,
    valueName: Ast.OptionalId,
    ctx: Context,
): Ast.Log<Context> {
    if (type.kind === "map_type") {
        const ctxKey = yield* defineVar(keyName, type.key, ctx);
        const ctxKV = yield* defineVar(valueName, type.value, ctxKey);
        return ctxKV;
    } else if (type.kind === "TypeAlias") {
        const childType = type.type;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (childType.kind === "NotDealiased") {
            return throwInternal("Non-dealiased type in foreach");
        }
        return yield* defineForVars(childType, keyName, valueName, ctx);
    } else {
        const ctxKey = yield* defineVar(keyName, Ast.CTRecover(), ctx);
        const ctxKV = yield* defineVar(valueName, Ast.CTRecover(), ctxKey);
        return ctxKV;
    }
}

const decodeDestruct: Decode<
    Ast.StatementDestruct,
    Ast.CStmtDestruct | Ast.CStmtExpression
> = function* (node, ctx, eff) {
    const expr = yield* decodeExprCtx(node.expression, ctx);

    const typeArgs = yield* Ast.mapLog(node.typeArgs, function* (arg) {
        return yield* decodeTypeLazy(
            ctx.Lazy,
            ctx.typeParams,
            arg,
            ctx.scopeRef,
        )();
    });

    const decl = yield* findStruct(node.type, typeArgs, ctx.scopeRef);
    if (!decl) {
        return Result(Ast.CStmtExpression(expr.value, node.loc), ctx, expr.eff);
    }

    const ascribed = Ast.CTRef(node.type, decl, typeArgs, node.loc);
    yield* assignType(
        node.loc,
        emptyTypeParams,
        ascribed,
        expr.value.computedType,
        false,
    );

    // see checkFields in expression.ts
    const [fields, newCtx] = yield* checkFields(
        node.loc,
        node.identifiers,
        decl.fields,
        node.ignoreUnspecifiedFields,
        ctx,
    );

    return Result(
        Ast.CStmtDestruct(
            node.type,
            fields,
            node.ignoreUnspecifiedFields,
            expr.value,
            node.loc,
        ),
        newCtx,
        expr.eff,
    );
};
function* checkFields(
    nodeLoc: Ast.Loc,
    stmtFields: readonly (readonly [Ast.Id, Ast.OptionalId])[],
    declFields: Ast.Ordered<Ast.CField>,
    ignoreUnspecifiedFields: boolean,
    ctx: Context,
): Ast.Log<readonly [Ast.Ordered<Ast.CDestructPattern>, Context]> {
    const order: string[] = [];
    const map: Map<string, [Ast.CDestructPattern, Ast.Loc]> = new Map();
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

        map.set(fieldName, [Ast.CDestructPattern(field, variable), field.loc]);

        ctx = yield* defineVar(variable, yield* decl.type(), ctx);
    }

    if (!ignoreUnspecifiedFields) {
        for (const fieldName of declFields.order) {
            if (!map.has(fieldName)) {
                yield EMissingField(fieldName, nodeLoc);
            }
        }
    }

    const result = new Map(
        [...map].map(([name, [pattern]]) => [name, pattern]),
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
    descr: [Ast.TEText(`There is no field "${name}"`), Ast.TECode(next)],
});
const EDuplicateField = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
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
    typeArgs: Ast.CType[],
    scopeRef: () => Ast.CSource,
) {
    const decl = scopeRef().typeDecls.get(id.text);
    if (!decl) {
        return throwInternal("Bad ref from decoder");
    }
    switch (decl.decl.kind) {
        case "alias": {
            const type = yield* dealiasType(
                Ast.CTAliasRef(Ast.CNotDealiased(), id, typeArgs, id.loc),
                scopeRef,
            );
            if (
                type.kind === "type_ref" &&
                (type.type.kind === "struct" || type.type.kind === "message")
            ) {
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
    descr: [Ast.TEText(`Type "${name}" doesn't `), Ast.TECode(prev)],
});

const decodeBlock: Decode<Ast.StatementBlock, Ast.CStmtBlock> = function* (
    node,
    ctx,
    eff,
) {
    const result = yield* decodeStmts(node.statements, ctx, eff);
    return Result(
        Ast.CStmtBlock(result.value, node.loc),
        ctx,
        result.effects,
    );
};

type Decode<T, U> = (
    node: T,
    context: Context,
    effAbove: Ast.Effects,
) => Ast.Log<Result<U>>;

type Result<U> = {
    readonly value: U;
    readonly context: Context;
    readonly effects: Ast.Effects;
};
const Result = <U>(
    value: U,
    context: Context,
    effects: Ast.Effects,
): Result<U> => Object.freeze({ value, context, effects });

type Context = {
    readonly Lazy: Ast.ThunkBuilder;
    readonly scopeRef: () => Ast.CSource;
    readonly selfType: Ast.SelfType | undefined;
    readonly required: undefined | ReadonlySet<string>;
    readonly typeParams: Ast.CTypeParams;
    readonly returnType: Ast.CType;
    readonly localScopeRef: ReadonlyMap<string, [Ast.CType, Ast.Loc]>;
};

function* defineVar(
    node: Ast.OptionalId,
    type: Ast.CType,
    ctx: Context,
): Ast.Log<Context> {
    if (node.kind === "wildcard") {
        // there is nothing to define for a wildcard
        return ctx;
    }

    if (node.text === "self") {
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
    descr: [Ast.TEText(`Cannot define a variable "self"`)],
});
const ERedefineVar = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`Variable ${name} is already defined`),
        Ast.TEText(`Defined at:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
    ],
});
const EShadowConst = (
    name: string,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`Variable ${name} shadows a global constant`),
        Ast.TEText(`Defined at:`),
        Ast.TECode(next),
        Ast.TEText(`Previously defined at:`),
        Ast.TECode(prev),
    ],
});

function* getRequired(
    selfType: Ast.SelfType | undefined,
): Ast.Log<undefined | Set<string>> {
    if (!selfType) {
        return new Set();
    }
    const required: Set<string> = new Set();
    switch (selfType.kind) {
        case "type_ref": {
            switch (selfType.type.kind) {
                case "contract":
                case "trait": {
                    const { fieldish } = yield* selfType.type.content();
                    for (const [name, field] of fieldish.map) {
                        if (field.decl.kind === "field" && !field.decl.init) {
                            required.add(name);
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
        case "basic": {
            return undefined;
        }
    }
}
