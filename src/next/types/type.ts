/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { throwInternal } from "@/error/errors";
import * as Ast from "@/next/ast";
import { messageBuiltin, structBuiltin } from "@/next/types/builtins";
import { emptyTypeParams } from "@/next/types/type-params";
import { printType } from "@/next/types/type-print";
import { zip } from "@/utils/array";

export const decodeTypeLazy = (
    Lazy: Ast.ThunkBuilder,
    typeParams: Ast.CTypeParams,
    type: Ast.Type,
    scopeRef: () => Ast.CSource,
) =>
    Lazy({
        callback: () => decodeType(typeParams, type, scopeRef().typeDecls),
        context: [Ast.TEText("checking type"), Ast.TECode(type.loc)],
        loc: type.loc,
        recover: Ast.CTRecover(),
    });

export const decodeDealiasTypeLazy = (
    Lazy: Ast.ThunkBuilder,
    typeParams: Ast.CTypeParams,
    type: Ast.Type,
    scopeRef: () => Ast.CSource,
) =>
    Lazy({
        callback: function* () {
            const decoded = yield* decodeType(
                typeParams,
                type,
                scopeRef().typeDecls,
            );
            return yield* dealiasTypeAux(decoded, scopeRef().typeDecls);
        },
        context: [Ast.TEText("checking type"), Ast.TECode(type.loc)],
        loc: type.loc,
        recover: Ast.CTRecover(),
    });

export function* dealiasType(type: Ast.CType, scopeRef: () => Ast.CSource) {
    return yield* dealiasTypeAux(type, scopeRef().typeDecls);
}

export function* decodeTypeMap(
    typeParams: Ast.CTypeParams,
    type: Ast.TMap,
    scopeRef: () => Ast.CSource,
) {
    const { typeDecls } = scopeRef();
    const key = yield* decodeType(typeParams, type.key, typeDecls);
    const value = yield* decodeType(typeParams, type.value, typeDecls);
    return Ast.CTMap(key, value, type.loc);
}

export function* decodeTypeSet(
    typeParams: Ast.CTypeParams,
    type: Ast.TMap,
    scopeRef: () => Ast.CSource,
) {
    const { typeDecls } = scopeRef();
    const key = yield* decodeType(typeParams, type.key, typeDecls);
    const value = yield* decodeType(typeParams, type.value, typeDecls);
    return Ast.CTMap(key, value, type.loc);
}

export function decodeType(
    typeParams: Ast.CTypeParams,
    type: Ast.Type,
    typeDecls: ReadonlyMap<string, Ast.Decl<Ast.CTypeDecl>>,
) {
    // decode all the types in an array
    function* recN(
        types: readonly Ast.Type[],
    ): Ast.Log<readonly Ast.CType[]> {
        const results: Ast.CType[] = [];
        for (const type of types) {
            const result = yield* rec(type);
            results.push(result);
        }
        return results;
    }

    // decode a type
    function* rec(type: Ast.Type): Ast.Log<Ast.CType> {
        switch (type.kind) {
            case "basic": {
                return type;
            }
            case "tuple_type": {
                const result = yield* recN(type.typeArgs);
                return Ast.CTTuple(result, type.loc);
            }
            case "tensor_type": {
                const result = yield* recN(type.typeArgs);
                return Ast.CTTensor(result, type.loc);
            }
            case "map_type": {
                // NB! modify along with decodeTypeMap above
                const key = yield* rec(type.key);
                const value = yield* rec(type.value);
                return Ast.CTMap(key, value, type.loc);
            }
            case "TypeBounced": {
                const child = yield* rec(type.type);
                if (child.kind !== "type_ref" || child.typeArgs.length > 0) {
                    yield EBouncedMessage(type.loc);
                    return Ast.CTRecover();
                }
                const typeEntry = typeDecls.get(child.name.text);
                if (!typeEntry) {
                    yield EBouncedMessage(type.loc);
                    return Ast.CTRecover();
                } else if (typeEntry.decl.kind === "message") {
                    return Ast.CTBounced(child.name, type.loc);
                } else {
                    yield EBouncedMessage(type.loc);
                    return Ast.CTRecover();
                }
            }
            case "TypeMaybe": {
                const child = yield* rec(type.type);
                return Ast.CTMaybe(child, type.loc);
            }
            case "cons_type": {
                // this is where the meat of the procedure is
                // cons can be either parameter, type reference,
                // alias reference, or reference to undefined type
                const name = type.name.text;
                const arity = type.typeArgs.length;

                const args = yield* recN(type.typeArgs);

                // if it's in a list of type parameters, this
                // is a parameter
                if (typeParams.set.has(name)) {
                    // if we used type parameter generically, throw error
                    // because we do not support HKT
                    if (!(yield* matchArity(name, arity, 0, type.loc))) {
                        return Ast.CTRecover();
                    }
                    return Ast.CTParamRef(type.name, type.loc);
                }

                const typeEntry = typeDecls.get(name);

                // there is no such type at all!
                if (!typeEntry) {
                    yield ETypeNotFound(name, type.loc);
                    return Ast.CTRecover();
                }

                // check number of type arguments does match
                if (
                    !(yield* matchArity(
                        name,
                        arity,
                        getArity(typeEntry.decl),
                        type.loc,
                    ))
                ) {
                    return Ast.CTRecover();
                }

                switch (typeEntry.decl.kind) {
                    case "trait": {
                        yield ETraitNotType(type.loc);
                        return Ast.CTRecover();
                    }
                    case "contract": {
                        // this is a ground type reference
                        return Ast.CTRef(
                            type.name,
                            typeEntry.decl,
                            [],
                            type.loc,
                        );
                    }
                    case "struct":
                    case "message":
                    case "union": {
                        // this is a ground type reference
                        return Ast.CTRef(
                            type.name,
                            typeEntry.decl,
                            args,
                            type.loc,
                        );
                    }
                    case "alias": {
                        // this is an alias reference
                        return Ast.CTAliasRef(
                            Ast.CNotDealiased(),
                            type.name,
                            args,
                            type.loc,
                        );
                    }
                }
            }
        }
    }

    return rec(type);
}

const getArity = (decl: Ast.CTypeDecl): number => {
    switch (decl.kind) {
        case "alias":
        case "struct":
        case "union":
            return decl.typeParams.order.length;
        case "contract":
        case "trait":
        case "message":
            return 0;
    }
};

const EBouncedMessage = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Only message types can be bounced<>`)],
});

const ETypeNotFound = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Type "${name}" is not defined`)],
});

function* matchArity(
    name: string,
    got: number,
    expected: number,
    loc: Ast.Loc,
): Ast.Log<boolean> {
    const result = got === expected;
    if (!result) {
        yield EArity(name, expected, got, loc);
    }
    return result;
}

const EArity = (
    name: string,
    expected: number,
    got: number,
    loc: Ast.Loc,
): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(
            `Type "${name}" is expected to have ${expected} type arguments, got ${got}`,
        ),
    ],
});

const ETraitNotType = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Traits cannot be used as types`)],
});

const dealiasTypeAux = (
    type: Ast.CType,
    typeDecls: ReadonlyMap<string, Ast.Decl<Ast.CTypeDecl>>,
) => {
    function* rec(type: Ast.CType): Ast.Log<Ast.CType> {
        switch (type.kind) {
            case "recover": {
                return type;
            }
            case "type_ref": {
                const args = yield* Ast.mapLog(type.typeArgs, rec);
                return Ast.CTRef(type.name, type.type, args, type.loc);
            }
            case "TypeAlias": {
                const alias = typeDecls.get(type.name.text);
                if (!alias || alias.decl.kind !== "alias") {
                    return throwInternal(
                        "Type decoder must not return types with dangling references",
                    );
                }
                // NB! if we could decode alias once, there might be
                //     a nested one too
                const decoded = yield* rec(
                    substituteTypeArgs(
                        yield* alias.decl.type(),
                        alias.decl.typeParams,
                        yield* Ast.mapLog(type.typeArgs, rec),
                    ),
                );
                return Ast.CTAliasRef(
                    decoded,
                    type.name,
                    type.typeArgs,
                    type.loc,
                );
            }
            case "TypeParam": {
                return type;
            }
            case "map_type": {
                const key = yield* rec(type.key);
                const value = yield* rec(type.value);
                return Ast.CTMap(key, value, type.loc);
            }
            case "TypeMaybe": {
                const args = yield* rec(type.type);
                return Ast.CTMaybe(args, type.loc);
            }
            case "tuple_type": {
                const args = yield* Ast.mapLog(type.typeArgs, rec);
                return Ast.CTTuple(args, type.loc);
            }
            case "tensor_type": {
                const args = yield* Ast.mapLog(type.typeArgs, rec);
                return Ast.CTTensor(args, type.loc);
            }
            case "basic":
            case "TypeBounced": {
                return type;
            }
        }
    }

    return rec(type);
};

// NB! if substitute is used for something other than aliases, do not throwInternal on type.type
export const substituteTypeArgs = (
    type: Ast.CType,
    params: Ast.CTypeParams,
    args: readonly Ast.CType[],
): Ast.CType => {
    if (params.order.length !== args.length) {
        return throwInternal("Decoder didn't check alias arity");
    }

    const substMap = new Map(
        zip(params.order, args).map(([param, arg]) => {
            return [param.text, arg];
        }),
    );

    const recN = (
        types: readonly Ast.CType[],
    ): readonly Ast.CType[] => {
        return types.map((type) => rec(type));
    };

    const rec = (type: Ast.CType): Ast.CType => {
        switch (type.kind) {
            case "TypeParam": {
                const arg = substMap.get(type.name.text);
                if (!arg) {
                    return throwInternal(
                        "Decoder didn't scope alias's type args",
                    );
                }
                return arg;
            }
            case "type_ref": {
                const args = recN(type.typeArgs);
                return Ast.CTRef(type.name, type.type, args, type.loc);
            }
            case "TypeAlias": {
                if (type.type.kind === "NotDealiased") {
                    const args = recN(type.typeArgs);
                    return Ast.CTAliasRef(
                        type.type,
                        type.name,
                        args,
                        type.loc,
                    );
                } else {
                    const args = recN(type.typeArgs); // ??
                    return Ast.CTAliasRef(
                        rec(type.type),
                        type.name,
                        args,
                        type.loc,
                    );
                }
            }
            case "map_type": {
                const key = rec(type.key);
                const value = rec(type.value);
                return Ast.CTMap(key, value, type.loc);
            }
            case "TypeMaybe": {
                const args = rec(type.type);
                return Ast.CTMaybe(args, type.loc);
            }
            case "tuple_type": {
                const args = recN(type.typeArgs);
                return Ast.CTTuple(args, type.loc);
            }
            case "tensor_type": {
                const args = recN(type.typeArgs);
                return Ast.CTTensor(args, type.loc);
            }
            case "recover":
            case "basic":
            case "TypeBounced": {
                return type;
            }
        }
    };

    return rec(type);
};

export function* instantiateStruct(
    typeName: Ast.TypeId,
    typeArgs: readonly Ast.CType[],
    // NB! these are type params from enclosing scope
    typeParams: Ast.CTypeParams,
    scopeRef: () => Ast.CSource,
): Ast.Log<
    undefined | { type: Ast.CTRef; fields: Ast.Ordered<Ast.CField> }
> {
    const decl = scopeRef().typeDecls.get(typeName.text);
    switch (decl?.decl.kind) {
        case undefined: {
            yield ENoSuchType(typeName.text, typeName.loc);
            return undefined;
        }
        case "contract": {
            yield ENotInstantiable(typeName.text, typeName.loc);
            return undefined;
        }
        case "trait":
        case "union": {
            yield ENotInstantiable(typeName.text, typeName.loc);
            return undefined;
        }
        case "struct":
        case "message": {
            const declArity =
                decl.decl.kind === "message"
                    ? 0
                    : decl.decl.typeParams.order.length;
            const useArity = typeArgs.length;
            if (declArity !== useArity) {
                yield ETypeArity(
                    typeName.text,
                    typeName.loc,
                    declArity,
                    useArity,
                );
                return undefined;
            }
            return {
                type: Ast.CTRef(typeName, decl.decl, typeArgs, typeName.loc),
                fields: decl.decl.fields,
            };
        }
        case "alias": {
            const declArity = decl.decl.typeParams.order.length;
            const useArity = typeArgs.length;
            if (declArity !== useArity) {
                yield ETypeArity(
                    typeName.text,
                    typeName.loc,
                    declArity,
                    useArity,
                );
                return undefined;
            }
            const type = yield* dealiasType(
                Ast.CTAliasRef(
                    Ast.CNotDealiased(),
                    typeName,
                    typeArgs,
                    typeName.loc,
                ),
                scopeRef,
            );
            if (type.kind !== "type_ref") {
                yield ENotInstantiable(typeName.text, typeName.loc);
                return undefined;
            }
            return yield* instantiateStruct(
                type.name,
                type.typeArgs,
                typeParams,
                scopeRef,
            );
        }
    }
}
const ENoSuchType = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Type ${name} is not defined`)],
});
const ENotInstantiable = (name: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Cannot create value of type ${name}`)],
});
const ETypeArity = (
    name: string,
    loc: Ast.Loc,
    declArity: number,
    useArity: number,
): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(
            `Type ${name} expects ${declArity} arguments, got ${useArity}`,
        ),
    ],
});

export function typeParamsToSubst(typeParams: Ast.CTypeParams) {
    const subst: Map<string, Ast.CNotSet | Ast.CType> = new Map(
        typeParams.order.map((name) => [name.text, Ast.CNotSet()]),
    );
    return subst;
}

export function* substToTypeArgMap(
    loc: Ast.Loc,
    subst: Map<string, Ast.CType | Ast.CNotSet>,
): Ast.Log<undefined | Ast.TypeArgs> {
    const res = substToTypeArgMapAux(subst);
    if (res.ok) {
        return res.args;
    } else {
        for (const name of res.names) {
            yield EFreeTypeParam(name, loc);
        }
        return undefined;
    }
}

function substToTypeArgMapAux(
    subst: Map<string, Ast.CType | Ast.CNotSet>,
): { ok: true; args: Ast.TypeArgs } | { ok: false; names: readonly string[] } {
    const args: Map<string, Ast.CType> = new Map();
    const names: string[] = [];
    for (const [name, type] of subst) {
        if (type.kind === "not-set") {
            names.push(name);
        } else {
            args.set(name, type);
        }
    }
    if (names.length > 0) {
        return { ok: false, names };
    } else {
        return { ok: true, args };
    }
}

export function* assignType(
    loc: Ast.Loc,
    toFreeTypeParam: Ast.CTypeParams,
    to: Ast.CType,
    from: Ast.CType,
    strict: boolean,
): Ast.Log<undefined | Ast.TypeArgs> {
    const subst = typeParamsToSubst(toFreeTypeParam);
    const result = assignTypeAux(to, from, subst, strict);
    if (result.kind === "failure") {
        yield EMismatch(result.tree, loc);
        return undefined;
    }
    return yield* substToTypeArgMap(loc, subst);
}
const EFreeTypeParam = (paramName: string, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`No substitution for type parameter "${paramName}"`)],
});
const EMismatch = (tree: Ast.MatchTree, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`Type mismatch`), Ast.TEMismatch(tree)],
});

type AssignResult = AssignSuccess | AssignFailure;
type AssignSuccess = {
    readonly kind: "success";
};
const AssignSuccess = (): AssignSuccess => Object.freeze({ kind: "success" });
type AssignFailure = {
    readonly kind: "failure";
    readonly tree: Ast.MatchTree;
};
const AssignFailure = (tree: Ast.MatchTree): AssignFailure =>
    Object.freeze({ kind: "failure", tree });

type Log = Generator<Ast.MatchTree, boolean>;

export function assignTypeAux(
    to: Ast.CType,
    from: Ast.CType,
    subst: Map<string, Ast.CNotSet | Ast.CType>,
    strict: boolean,
) {
    function* recN(
        tos: readonly Ast.CType[],
        froms: readonly Ast.CType[],
    ): Log {
        if (tos.length !== froms.length) {
            return throwInternal(
                "Arg count does not match after type decoding",
            );
        }
        let result = true;
        for (const [to, from] of zip(tos, froms)) {
            const res = yield* rec(to, from);
            // NB! cannot merge into one line, otherwise it will
            //     short-circuit
            result &&= res;
        }
        return result;
    }

    function* rec(to: Ast.CType, from: Ast.CType): Log {
        const result = collectMismatches(to, from);
        if (result.kind === "failure") {
            yield result.tree;
            return false;
        }
        return true;
    }

    function collectMismatches(
        to: Ast.CType,
        from: Ast.CType,
    ): AssignResult {
        const gen = check(to, from);
        const results: Ast.MatchTree[] = [];
        for (;;) {
            const res = gen.next();
            if (!res.done) {
                // collect all errors (if any)
                results.push(res.value);
                continue;
            }
            if (!results.length) {
                return AssignSuccess();
            }
            const toStr = printType(to, false);
            const fromStr = printType(from, false);
            if (!toStr || !fromStr) {
                // if types have errors, we don't print the error
                // because it resulted from another error
                return AssignSuccess();
            }
            return AssignFailure(Ast.MatchTree(to, from, results));
        }
    }

    function* check(to: Ast.CType, from: Ast.CType): Log {
        if (from.kind === "TypeAlias") {
            if (from.type.kind === "NotDealiased") {
                return throwInternal("Decoder returned aliased type");
            }
            from = from.type;
            return yield* rec(to, from);
        }
        switch (to.kind) {
            case "recover": {
                return true;
            }
            case "TypeAlias": {
                if (to.type.kind === "NotDealiased") {
                    return throwInternal("Decoder returned aliased type");
                }
                to = to.type;
                return yield* rec(to, from);
            }
            case "type_ref": {
                const typeVar = subst.get(to.name.text);
                if (!typeVar) {
                    return (
                        to.kind === from.kind &&
                        to.name.text === from.name.text &&
                        (yield* recN(to.typeArgs, from.typeArgs))
                    );
                } else if (typeVar.kind === "not-set") {
                    subst.set(to.name.text, from);
                    return true;
                } else {
                    return yield* rec(typeVar, from);
                }
            }
            case "tuple_type":
            case "tensor_type": {
                return (
                    to.kind === from.kind &&
                    (yield* recN(to.typeArgs, from.typeArgs))
                );
            }
            case "TypeParam": {
                return to.kind === from.kind && to.name.text === from.name.text;
            }
            case "TypeBounced": {
                return to.kind === from.kind && to.name.text === from.name.text;
            }
            case "TypeMaybe": {
                return (
                    (!strict && from.kind === "basic" && from.type.kind === "TypeNull") ||
                    (to.kind === from.kind && (yield* rec(to.type, from.type)))
                );
            }
            case "map_type": {
                return (
                    (!strict && from.kind === "basic" && from.type.kind === "TypeNull") ||
                    (to.kind === from.kind &&
                        (yield* rec(to.key, from.key)) &&
                        (yield* rec(to.value, from.value)))
                );
            }
            case "basic": {
                return from.kind === to.kind;
            }
        }
    }

    return collectMismatches(to, from);
}

export function* mgu(
    left: Ast.CType,
    right: Ast.CType,
    loc: Ast.Loc,
): Ast.Log<Ast.CType> {
    function* rec(
        left: Ast.CType,
        right: Ast.CType,
    ): Ast.Log<Ast.CType> {
        if (right.kind === "TypeAlias") {
            if (right.type.kind === "NotDealiased") {
                return throwInternal("Decoder returned aliased type");
            }
            right = right.type;
            return yield* rec(left, right);
        }
        if (left.kind === "TypeAlias") {
            if (left.type.kind === "NotDealiased") {
                return throwInternal("Decoder returned aliased type");
            }
            left = left.type;
            return yield* rec(left, left);
        }
        const resultL = assignTypeAux(left, right, new Map(), false);
        if (resultL.kind === "success") {
            return left;
        }
        const resultR = assignTypeAux(right, left, new Map(), false);
        if (resultR.kind === "success") {
            return right;
        }
        if (right.kind === "basic" && right.type.kind === "TypeNull") {
            return Ast.CTMaybe(left, loc);
        }
        if (left.kind === "basic" && left.type.kind === "TypeNull") {
            return Ast.CTMaybe(right, loc);
        }
        yield ENotUnifiable(resultL.tree, loc);
        return Ast.CTRecover();
    }

    return yield* rec(left, right);
}
const ENotUnifiable = (tree: Ast.MatchTree, loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(`Branches of condition have mismatched types`),
        Ast.TEMismatch(tree),
    ],
});

export type CallResult = {
    readonly returnType: Ast.CType;
    readonly typeArgMap: Ast.TypeArgs;
};

export function* checkFnCall(
    loc: Ast.Loc,
    fnType: Ast.CTFunction | Ast.CTMethod,
    args: readonly (readonly [Ast.Loc, Ast.CType])[],
): Ast.Log<CallResult> {
    const { typeParams, params, returnType } = fnType;

    const subst = typeParamsToSubst(typeParams);

    for (const [index, { name, type, loc }] of params.order.entries()) {
        const pair = args[index];
        if (!pair) {
            // not enough args
            break;
        }
        const [argLoc, arg] = pair;
        const result = assignTypeAux(yield* type(), arg, subst, false);
        if (result.kind === "failure") {
            yield EMismatchArg(getParamName(name, index), result.tree, argLoc);
        }
    }

    // not enough or too many args
    if (params.order.length !== args.length) {
        yield EFnArity("Function", params.order.length, args.length, loc);
    }

    const typeArgsMap = yield* substToTypeArgMap(loc, subst);

    if (!typeArgsMap) {
        return {
            returnType: Ast.CTRecover(),
            typeArgMap: new Map(),
        };
    }

    const typeArgs: Ast.CType[] = [];
    for (const param of typeParams.order) {
        const arg = typeArgsMap.get(param.text);
        if (!arg) {
            return throwInternal("substToTypeArgMap lost param");
        }
        typeArgs.push(arg);
    }

    const retType = substituteTypeArgs(
        yield* returnType(),
        typeParams,
        typeArgs,
    );

    return { returnType: retType, typeArgMap: typeArgsMap };
}
const EMismatchArg = (
    name: string,
    tree: Ast.MatchTree,
    loc: Ast.Loc,
): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(`Type doesn't match type of parameter ${name}`),
        Ast.TEMismatch(tree),
    ],
});

function getParamName(name: Ast.OptionalId, index: number) {
    return name.kind === "id" ? name.text : `#${index + 1}`;
}

const EFnArity = (
    kind: string,
    expected: number,
    got: number,
    loc: Ast.Loc,
): Ast.TcError => ({
    loc,
    descr: [
        Ast.TEText(
            `${kind} is expected to have ${expected} type arguments, got ${got}`,
        ),
    ],
});

export function* checkFnCallWithArgs(
    Lazy: Ast.ThunkBuilder,
    loc: Ast.Loc,
    fnType: Ast.CTFunction | undefined,
    ascribedTypeArgs: readonly Ast.CType[],
    args: readonly (readonly [Ast.Loc, Ast.CType])[],
): Ast.Log<CallResult> {
    if (!fnType) {
        yield ENoFunction(loc);
        return { returnType: Ast.CTRecover(), typeArgMap: new Map() };
    }
    if (ascribedTypeArgs.length === 0) {
        return yield* checkFnCall(loc, fnType, args);
    }
    if (fnType.typeParams.order.length !== ascribedTypeArgs.length) {
        return { returnType: Ast.CTRecover(), typeArgMap: new Map() };
    }
    const result = yield* checkFnCall(
        loc,
        substFnType(Lazy, loc, fnType, ascribedTypeArgs),
        args,
    );
    return {
        returnType: result.returnType,
        typeArgMap: new Map(
            zip(fnType.typeParams.order, args).map(([name, [, type]]) => [
                name.text,
                type,
            ]),
        ),
    };
}
const ENoFunction = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`No such function`), Ast.TECode(loc)],
});

function substFnType(
    Lazy: Ast.ThunkBuilder,
    fnLoc: Ast.Loc,
    {
        typeParams,
        params,
        returnType,
    }: Ast.CTFunction | Ast.CTMethod,
    args: readonly Ast.CType[],
) {
    const order: Ast.CParameter[] = [];
    for (const [index, param] of params.order.entries()) {
        order.push(
            Ast.CParameter(
                param.name,
                Lazy({
                    callback: function* () {
                        return substituteTypeArgs(
                            yield* param.type(),
                            typeParams,
                            args,
                        );
                    },
                    context: [
                        Ast.TEText(
                            `substituting into parameter ${getParamName(param.name, index)}`,
                        ),
                    ],
                    loc: param.loc,
                    recover: Ast.CTRecover(),
                }),
                param.loc,
            ),
        );
    }
    return Ast.CTFunction(
        emptyTypeParams,
        Ast.CParameters(order, params.set),
        Lazy({
            callback: function* () {
                return substituteTypeArgs(
                    yield* returnType(),
                    typeParams,
                    args,
                );
            },
            context: [Ast.TEText(`substituting into return type`)],
            loc: fnLoc,
            recover: Ast.CTRecover(),
        }),
    );
}

export type MethodCallResult = CallResult & {
    readonly mutates: boolean;
};

export function* lookupMethod(
    Lazy: Ast.ThunkBuilder,
    selfType: Ast.CType,
    method: Ast.Id,
    args: readonly (readonly [Ast.Loc, Ast.CType])[],
    typeDecls: ReadonlyMap<string, Ast.Decl<Ast.CTypeDecl>>,
    extensions: ReadonlyMap<string, Ast.Thunk<readonly Ast.Decl<Ast.CExtension>[]>>,
): Ast.Log<MethodCallResult> {
    if (selfType.kind === "recover") {
        return { returnType: Ast.CTRecover(), typeArgMap: new Map(), mutates: false };
    }
    if (selfType.kind === "TypeAlias") {
        if (selfType.type.kind === "NotDealiased") {
            return throwInternal("Calling method on non-dealiased type");
        }

        return yield* lookupMethod(
            Lazy,
            selfType,
            method,
            args,
            typeDecls,
            extensions,
        );
    }

    if (selfType.kind !== "type_ref") {
        return yield* lookupExts(Lazy, selfType, method, args, extensions);
    }

    const selfDecl = typeDecls.get(selfType.name.text);
    if (!selfDecl) {
        yield ENoMethod(method.loc);
        return { returnType: Ast.CTRecover(), typeArgMap: new Map(), mutates: false };
    }

    if (selfDecl.decl.kind === "struct" || selfDecl.decl.kind === "message") {
        const builtinMap =
            selfDecl.decl.kind === "struct" ? structBuiltin : messageBuiltin;
        const builtin = builtinMap.get(method.text);
        if (builtin) {
            return {
                ...yield* checkFnCall(method.loc, builtin, args),
                mutates: false,
            };
        }
        return yield* lookupExts(Lazy, selfType, method, args, extensions);
    }

    if (selfDecl.decl.kind === "contract" || selfDecl.decl.kind === "trait") {
        const content = yield* selfDecl.decl.content();
        const met = content.methods.get(method.text);
        if (!met) {
            yield ENoMethod(method.loc);
            return { returnType: Ast.CTRecover(), typeArgMap: new Map(), mutates: false };
        }
        return {
            ...yield* checkFnCall(method.loc, met.decl.type, args),
            mutates: met.decl.type.mutates,
        };
    }

    yield ENoMethod(method.loc);
    return { returnType: Ast.CTRecover(), typeArgMap: new Map(), mutates: false };
}

function* lookupExts(
    Lazy: Ast.ThunkBuilder,
    selfType: Ast.CType,
    method: Ast.Id,
    args: readonly (readonly [Ast.Loc, Ast.CType])[],
    extensions: ReadonlyMap<string, Ast.Thunk<readonly Ast.Decl<Ast.CExtension>[]>>,
): Ast.Log<MethodCallResult> {
    const lazyExts = extensions.get(method.text);
    if (!lazyExts) {
        yield ENoMethod(method.loc);
        return { returnType: Ast.CTRecover(), typeArgMap: new Map(), mutates: false };
    }
    const exts = yield* lazyExts();
    const grounds: [Ast.CTMethod, Ast.TypeArgs][] = [];
    const withVars: [Ast.CTMethod, Ast.TypeArgs][] = [];
    for (const { decl } of exts) {
        const subst = typeParamsToSubst(decl.type.typeParams);
        const result = assignTypeAux(decl.type.self, selfType, subst, true);
        if (result.kind !== "success") {
            continue;
        }
        const res = substToTypeArgMapAux(subst);
        if (!res.ok) {
            continue;
        }
        const into = decl.type.self.ground ? grounds : withVars;
        into.push([decl.type, res.args]);
    }
    if (grounds.length > 1 || withVars.length > 1) {
        return throwInternal("Overlapping methods were allowed");
    }
    const [ground] = grounds;
    const [withVar] = withVars;
    const either = ground || withVar;
    if (!either) {
        yield ENoMethod(method.loc);
        return { returnType: Ast.CTRecover(), typeArgMap: new Map(), mutates: false };
    }
    const [methodType, typeArgs] = either;
    const result = yield* checkFnCall(
        method.loc,
        substFnType(
            Lazy,
            method.loc,
            methodType,
            typeArgsToParams(typeArgs, methodType.typeParams),
        ),
        args,
    );
    return {
        returnType: result.returnType,
        typeArgMap: typeArgs,
        mutates: methodType.mutates,
    };
}

function typeArgsToParams(args: Ast.TypeArgs, params: Ast.CTypeParams) {
    const result: Ast.CType[] = [];
    for (const name of params.order) {
        const arg = args.get(name.text);
        if (!arg) {
            return throwInternal("Lost type arguments");
        }
        result.push(arg);
    }
    return result;
}

const ENoMethod = (loc: Ast.Loc): Ast.TcError => ({
    loc,
    descr: [Ast.TEText(`No such method`), Ast.TECode(loc)],
});

export function* assignMethodType(
    prev: Ast.CTMethod,
    next: Ast.CTMethod,
    prevVia: Ast.ViaMember,
    nextVia: Ast.ViaMember,
): Ast.Log<void> {
    const result = assignTypeAux(
        yield* prev.returnType(),
        yield* next.returnType(),
        new Map(),
        true,
    );
    if (result.kind === "failure") {
        yield EMismatchReturn(result.tree, prevVia.defLoc, nextVia.defLoc);
        return undefined;
    }
    const prevArity = prev.params.order.length;
    const nextArity = next.params.order.length;

    for (const [index, [prevParam, nextParam]] of zip(
        prev.params.order,
        next.params.order,
    ).entries()) {
        const result = assignTypeAux(
            yield* prevParam.type(),
            yield* nextParam.type(),
            new Map(),
            true,
        );
        if (result.kind === "failure") {
            yield EMismatchParam(
                getParamName(nextParam.name, index),
                result.tree,
                prevVia.defLoc,
                nextVia.defLoc,
            );
        }
    }

    if (prevArity !== nextArity) {
        yield EFnArity("Method", prevArity, nextArity, nextVia.defLoc);
    }
}

const EMismatchReturn = (
    tree: Ast.MatchTree,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(`Return type doesn't match with inherited method`),
        Ast.TEMismatch(tree),
        Ast.TEText(`Inherited from:`),
        Ast.TECode(prev),
        Ast.TEText(`Override at:`),
        Ast.TECode(next),
    ],
});

const EMismatchParam = (
    name: string,
    tree: Ast.MatchTree,
    prev: Ast.Loc,
    next: Ast.Loc,
): Ast.TcError => ({
    loc: next,
    descr: [
        Ast.TEText(
            `Type of parameter ${name} doesn't match with inherited method`,
        ),
        Ast.TEMismatch(tree),
        Ast.TEText(`Inherited from:`),
        Ast.TECode(prev),
        Ast.TEText(`Override at:`),
        Ast.TECode(next),
    ],
});
