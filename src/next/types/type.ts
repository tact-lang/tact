/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { throwInternal } from "@/error/errors";
import * as Ast from "@/next/ast";
import { messageBuiltin, structBuiltin } from "@/next/types/builtins";
import * as E from "@/next/types/errors";
import { emptyTypeParams } from "@/next/types/type-params";
import { printType } from "@/next/types/type-print";
import { zip } from "@/utils/array";

export const decodeTypeLazy = (
    typeParams: Ast.TypeParams,
    type: Ast.Type,
    scopeRef: () => Ast.Scope,
) => Ast.Lazy(() => decodeType(
    typeParams,
    type,
    scopeRef().typeDecls,
));

export const decodeDealiasTypeLazy = (
    typeParams: Ast.TypeParams,
    type: Ast.Type,
    scopeRef: () => Ast.Scope,
) => Ast.Lazy(function* () {
    const decoded = yield* decodeType(
        typeParams,
        type,
        scopeRef().typeDecls,
    );
    return yield* dealiasTypeAux(
        decoded,
        scopeRef().typeDecls,
    );
});

export function* dealiasType(
    type: Ast.DecodedType,
    scopeRef: () => Ast.Scope,
) {
    return yield* dealiasTypeAux(
        type,
        scopeRef().typeDecls,
    );
}

export function* decodeTypeMap(
    typeParams: Ast.TypeParams,
    type: Ast.TypeMap,
    scopeRef: () => Ast.Scope,
) {
    const { typeDecls } = scopeRef();
    const key = yield* decodeType(typeParams, type.key, typeDecls);
    const value = yield* decodeType(typeParams, type.value, typeDecls);
    return Ast.DTypeMap(key, value, type.loc);
}

export function* decodeTypeSet(
    typeParams: Ast.TypeParams,
    type: Ast.TypeMap,
    scopeRef: () => Ast.Scope,
) {
    const { typeDecls } = scopeRef();
    const key = yield* decodeType(typeParams, type.key, typeDecls);
    const value = yield* decodeType(typeParams, type.value, typeDecls);
    return Ast.DTypeMap(key, value, type.loc);
}

export function decodeType(
    typeParams: Ast.TypeParams,
    type: Ast.Type,
    typeDecls: ReadonlyMap<string, Ast.Decl<Ast.TypeDeclSig>>,
) {
    // decode all the types in an array
    function* recN(
        types: readonly Ast.Type[],
    ): E.WithLog<readonly Ast.DecodedType[]> {
        const results: Ast.DecodedType[] = [];
        for (const type of types) {
            const result = yield* rec(type);
            results.push(result);
        }
        return results;
    }

    // decode a type
    function* rec(
        type: Ast.Type,
    ): E.WithLog<Ast.DecodedType> {
        switch (type.kind) {
            case "unit_type":
            case "TyInt":
            case "TySlice":
            case "TyCell":
            case "TyBuilder":
            case "TypeVoid":
            case "TypeNull":
            case "TypeBool":
            case "TypeAddress":
            case "TypeString":
            case "TypeStateInit":
            case "TypeStringBuilder": {
                return type;
            }
            case "tuple_type": {
                const result = yield* recN(type.typeArgs);
                return Ast.DTypeTuple(result, type.loc);
            }
            case "tensor_type": {
                const result = yield* recN(type.typeArgs);
                return Ast.DTypeTensor(result, type.loc);
            }
            case "map_type": {
                // NB! modify along with decodeTypeMap above
                const key = yield* rec(type.key);
                const value = yield* rec(type.value);
                return Ast.DTypeMap(key, value, type.loc);
            }
            case "TypeBounced": {
                const child = yield* rec(type.type);
                if (child.kind !== 'type_ref' || child.typeArgs.length > 0) {
                    yield EBouncedMessage(type.loc);
                    return Ast.DTypeRecover();
                }
                const typeEntry = typeDecls.get(child.name.text);
                if (!typeEntry) {
                    yield EBouncedMessage(type.loc);
                    return Ast.DTypeRecover();
                } else if (typeEntry.decl.kind === 'message') {
                    return Ast.DTypeBounced(child.name, type.loc);
                } else {
                    yield EBouncedMessage(type.loc);
                    return Ast.DTypeRecover();
                }
            }
            case "TypeMaybe": {
                const child = yield* rec(type.type);
                return Ast.DTypeMaybe(child, type.loc);
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
                        return Ast.DTypeRecover();
                    }
                    return Ast.DTypeParamRef(
                        type.name,
                        type.loc,
                    );
                }

                const typeEntry = typeDecls.get(name);

                // there is no such type at all!
                if (!typeEntry) {
                    yield ETypeNotFound(name, type.loc);
                    return Ast.DTypeRecover();
                }

                // check number of type arguments does match
                if (!(yield* matchArity(
                    name,
                    arity,
                    getArity(typeEntry.decl),
                    type.loc,
                ))) {
                    return Ast.DTypeRecover();
                }

                switch (typeEntry.decl.kind) {
                    case "trait": {
                        yield ETraitNotType(type.loc);
                        return Ast.DTypeRecover();
                    }
                    case "contract": {
                        // this is a ground type reference
                        return Ast.DTypeRef(type.name, typeEntry.decl, [], type.loc);
                    }
                    case "struct":
                    case "message":
                    case "union": {
                        // this is a ground type reference
                        return Ast.DTypeRef(type.name, typeEntry.decl, args, type.loc);
                    }
                    case "alias": {
                        // this is an alias reference
                        return Ast.DTypeAliasRef(Ast.NotDealiased(), type.name, args, type.loc);
                    }
                }
            }
        }
    }

    return rec(type);
}

const getArity = (decl: Ast.TypeDeclSig): number => {
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
}

const EBouncedMessage = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Only message types can be bounced<>`),
    ],
});

const ETypeNotFound = (
    name: string,
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Type "${name}" is not defined`),
    ],
});

function* matchArity(
    name: string,
    got: number,
    expected: number,
    loc: Ast.Loc,
): E.WithLog<boolean> {
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
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Type "${name}" is expected to have ${expected} type arguments, got ${got}`),
    ],
});

const ETraitNotType = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Traits cannot be used as types`),
    ],
});

const dealiasTypeAux = (
    type: Ast.DecodedType,
    typeDecls: ReadonlyMap<string, Ast.Decl<Ast.TypeDeclSig>>,
) => {
    function* rec(type: Ast.DecodedType): E.WithLog<Ast.DecodedType> {
        switch (type.kind) {
            case "recover": {
                return type;
            }
            case "type_ref": {
                const args = yield* E.mapLog(type.typeArgs, rec);
                return Ast.DTypeRef(type.name, type.type, args, type.loc);
            }
            case "TypeAlias": {
                const alias = typeDecls.get(type.name.text);
                if (!alias || alias.decl.kind !== 'alias') {
                    return throwInternal("Type decoder must not return types with dangling references");
                }
                // NB! if we could decode alias once, there might be
                //     a nested one too
                const decoded = yield* rec(substituteTypeArgs(
                    yield* alias.decl.type(),
                    alias.decl.typeParams,
                    yield* E.mapLog(type.typeArgs, rec),
                ));
                return Ast.DTypeAliasRef(decoded, type.name, type.typeArgs, type.loc);
            }
            case "TypeParam": {
                return type;
            }
            case "map_type": {
                const key = yield* rec(type.key);
                const value = yield* rec(type.value);
                return Ast.DTypeMap(key, value, type.loc);
            }
            case "TypeMaybe": {
                const args = yield* rec(type.type);
                return Ast.DTypeMaybe(args, type.loc);
            }
            case "tuple_type": {
                const args = yield* E.mapLog(type.typeArgs, rec);
                return Ast.DTypeTuple(args, type.loc);
            }
            case "tensor_type": {
                const args = yield* E.mapLog(type.typeArgs, rec);
                return Ast.DTypeTensor(args, type.loc);
            }
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
            case "TypeStringBuilder":
            case "TypeStateInit":
            case "TypeBounced": {
                return type;
            }
        }
    }

    return rec(type);
};

// NB! if substitute is used for something other than aliases, do not throwInternal on type.type
export const substituteTypeArgs = (
    type: Ast.DecodedType,
    params: Ast.TypeParams,
    args: readonly Ast.DecodedType[],
): Ast.DecodedType => {
    if (params.order.length !== args.length) {
        return throwInternal("Decoder didn't check alias arity");
    }

    const substMap = new Map(zip(params.order, args).map(([param, arg]) => {
        return [param.text, arg];
    }));

    const recN = (types: readonly Ast.DecodedType[]): readonly Ast.DecodedType[] => {
        return types.map(type => rec(type));
    };

    const rec = (type: Ast.DecodedType): Ast.DecodedType => {
        switch (type.kind) {
            case "TypeParam": {
                const arg = substMap.get(type.name.text);
                if (!arg) {
                    return throwInternal("Decoder didn't scope alias's type args");
                }
                return arg;
            }
            case "type_ref": {
                const args = recN(type.typeArgs);
                return Ast.DTypeRef(type.name, type.type, args, type.loc);
            }
            case "TypeAlias": {
                if (type.type.kind === 'NotDealiased') {
                    const args = recN(type.typeArgs);
                    return Ast.DTypeAliasRef(type.type, type.name, args, type.loc);
                } else {
                    const args = recN(type.typeArgs); // ??
                    return Ast.DTypeAliasRef(rec(type.type), type.name, args, type.loc);
                }
            }
            case "map_type": {
                const key = rec(type.key);
                const value = rec(type.value);
                return Ast.DTypeMap(key, value, type.loc);
            }
            case "TypeMaybe": {
                const args = rec(type.type);
                return Ast.DTypeMaybe(args, type.loc);
            }
            case "tuple_type": {
                const args = recN(type.typeArgs);
                return Ast.DTypeTuple(args, type.loc);
            }
            case "tensor_type": {
                const args = recN(type.typeArgs);
                return Ast.DTypeTensor(args, type.loc);
            }
            case "recover":
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
            case "TypeStringBuilder":
            case "TypeStateInit":
            case "TypeBounced": {
                return type;
            }
        }
    };

    return rec(type);
};

export function* instantiateStruct(
    typeName: Ast.TypeId,
    typeArgs: readonly Ast.DecodedType[],
    // NB! these are type params from enclosing scope
    typeParams: Ast.TypeParams,
    scopeRef: () => Ast.Scope,
): E.WithLog<undefined | { type: Ast.DTypeRef, fields: Ast.Ordered<Ast.InhFieldSig> }> {
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
            const declArity = decl.decl.kind === "message"
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
                type: Ast.DTypeRef(
                    typeName,
                    decl.decl,
                    typeArgs,
                    typeName.loc,
                ),
                fields: decl.decl.fields
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
                Ast.DTypeAliasRef(
                    Ast.NotDealiased(),
                    typeName,
                    typeArgs,
                    typeName.loc,
                ),
                scopeRef,
            );
            if (type.kind !== 'type_ref') {
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
const ENoSuchType = (name: string, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Type ${name} is not defined`),
    ],
});
const ENotInstantiable = (name: string, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Cannot create value of type ${name}`),
    ],
});
const ETypeArity = (name: string, loc: Ast.Loc, declArity: number, useArity: number): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Type ${name} expects ${declArity} arguments, got ${useArity}`),
    ],
});

export function typeParamsToSubst(typeParams: Ast.TypeParams) {
    const subst: Map<string, Ast.DNotSet | Ast.DecodedType> = new Map(
        typeParams.order.map(name => [name.text, Ast.DNotSet()])
    );
    return subst;
}

export function* substToTypeArgMap(
    loc: Ast.Loc,
    subst: Map<string, Ast.DecodedType | Ast.DNotSet>
): E.WithLog<undefined | Ast.TypeArgs> {
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
    subst: Map<string, Ast.DecodedType | Ast.DNotSet>
): { ok: true, args: Ast.TypeArgs} | { ok: false, names: readonly string[] } {
    const args: Map<string, Ast.DecodedType> = new Map();
    const names: string[] = [];
    for (const [name, type] of subst) {
        if (type.kind === 'not-set') {
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
    toFreeTypeParam: Ast.TypeParams,
    to: Ast.DecodedType,
    from: Ast.DecodedType,
    strict: boolean,
): E.WithLog<undefined | Ast.TypeArgs> {
    const subst = typeParamsToSubst(toFreeTypeParam);
    const result = assignTypeAux(to, from, subst, strict);
    if (result.kind === 'failure') {
        yield EMismatch(result.tree, loc);
        return undefined;
    }
    return yield* substToTypeArgMap(loc, subst);
}
const EFreeTypeParam = (paramName: string, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`No substitution for type parameter "${paramName}"`),
    ],
});
const EMismatch = (tree: E.MatchTree, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Type mismatch`),
        E.TEMismatch(tree),
    ],
});

type AssignResult = AssignSuccess | AssignFailure
type AssignSuccess = {
    readonly kind: 'success';
}
const AssignSuccess = (): AssignSuccess => Object.freeze({ kind: 'success' });
type AssignFailure = {
    readonly kind: 'failure';
    readonly tree: E.MatchTree;
}
const AssignFailure = (tree: E.MatchTree): AssignFailure => Object.freeze({ kind: 'failure', tree });

type Log = Generator<E.MatchTree, boolean>;

export function assignTypeAux(
    to: Ast.DecodedType,
    from: Ast.DecodedType,
    subst: Map<string, Ast.DNotSet | Ast.DecodedType>,
    strict: boolean,
) {
    function* recN(
        tos: readonly Ast.DecodedType[],
        froms: readonly Ast.DecodedType[],
    ): Log {
        if (tos.length !== froms.length) {
            return throwInternal("Arg count does not match after type decoding");
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

    function* rec(
        to: Ast.DecodedType,
        from: Ast.DecodedType,
    ): Log {
        const result = collectMismatches(to, from);
        if (result.kind === 'failure') {
            yield result.tree;
            return false;
        }
        return true;
    }

    function collectMismatches(
        to: Ast.DecodedType,
        from: Ast.DecodedType,
    ): AssignResult {
        const gen = check(to, from);
        const results: E.MatchTree[] = [];
        for (; ;) {
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
            return AssignFailure(E.MatchTree(to, from, results));
        }
    }

    function* check(
        to: Ast.DecodedType,
        from: Ast.DecodedType,
    ): Log {
        if (from.kind === 'TypeAlias') {
            if (from.type.kind === 'NotDealiased') {
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
                if (to.type.kind === 'NotDealiased') {
                    return throwInternal("Decoder returned aliased type");
                }
                to = to.type;
                return yield* rec(to, from);
            }
            case "type_ref": {
                const typeVar = subst.get(to.name.text);
                if (!typeVar) {
                    return to.kind === from.kind &&
                        to.name.text === from.name.text &&
                        (yield* recN(to.typeArgs, from.typeArgs));
                } else if (typeVar.kind === 'not-set') {
                    subst.set(to.name.text, from);
                    return true;
                } else {
                    return yield* rec(typeVar, from);
                }
            }
            case "tuple_type":
            case "tensor_type": {
                return to.kind === from.kind &&
                    (yield* recN(to.typeArgs, from.typeArgs));
            }
            case "TypeParam": {
                return to.kind === from.kind &&
                    to.name.text === from.name.text;
            }
            case "TypeBounced": {
                return to.kind === from.kind &&
                    to.name.text === from.name.text;
            }
            case "TypeMaybe": {
                return !strict && from.kind === 'TypeNull' ||
                    to.kind === from.kind &&
                    (yield* rec(to.type, from.type));
            }
            case "map_type": {
                return !strict && from.kind === 'TypeNull' ||
                    to.kind === from.kind &&
                    (yield* rec(to.key, from.key)) &&
                    (yield* rec(to.value, from.value));
            }
            case "TyInt":
            case "TySlice":
            case "TyCell":
            case "TyBuilder":
            case "unit_type":
            case "TypeVoid":
            case "TypeNull":
            case "TypeBool":
            case "TypeAddress":
            case "TypeStateInit":
            case "TypeString":
            case "TypeStringBuilder": {
                return from.kind === to.kind;
            }
        }
    }

    return collectMismatches(to, from);
}

export function* mgu(
    left: Ast.DecodedType,
    right: Ast.DecodedType,
    loc: Ast.Loc,
): E.WithLog<Ast.DecodedType> {
    function* rec(
        left: Ast.DecodedType,
        right: Ast.DecodedType,
    ): E.WithLog<Ast.DecodedType> {
        if (right.kind === 'TypeAlias') {
            if (right.type.kind === 'NotDealiased') {
                return throwInternal("Decoder returned aliased type");
            }
            right = right.type;
            return yield* rec(left, right);
        }
        if (left.kind === 'TypeAlias') {
            if (left.type.kind === 'NotDealiased') {
                return throwInternal("Decoder returned aliased type");
            }
            left = left.type;
            return yield* rec(left, left);
        }
        const resultL = assignTypeAux(left, right, new Map(), false);
        if (resultL.kind === 'success') {
            return left;
        }
        const resultR = assignTypeAux(right, left, new Map(), false);
        if (resultR.kind === 'success') {
            return right;
        }
        if (right.kind === 'TypeNull') {
            return Ast.DTypeMaybe(left, loc);
        }
        if (left.kind === 'TypeNull') {
            return Ast.DTypeMaybe(right, loc);
        }
        yield ENotUnifiable(resultL.tree, loc);
        return Ast.DTypeRecover();
    }

    return yield* rec(left, right);
}
const ENotUnifiable = (tree: E.MatchTree, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Branches of condition have mismatched types`),
        E.TEMismatch(tree),
    ],
});

export type CallResult = {
    readonly returnType: Ast.DecodedType;
    readonly typeArgMap: Ast.TypeArgs;
}

export function* checkFnCall(
    loc: Ast.Loc,
    fnType: Ast.DecodedFnType | Ast.DecodedMethodType,
    args: readonly (readonly [Ast.Loc, Ast.DecodedType])[],
): E.WithLog<CallResult> {
    const { typeParams, params, returnType } = fnType;

    const subst = typeParamsToSubst(typeParams);

    for (const [index, { name, type, loc }] of params.order.entries()) {
        const pair = args[index];
        if (!pair) {
            // not enough args
            break;
        }
        const [argLoc, arg] = pair;
        const result = assignTypeAux(
            yield* type(),
            arg,
            subst,
            false,
        );
        if (result.kind === 'failure') {
            yield EMismatchArg(
                getParamName(name, index), 
                result.tree, 
                argLoc,
            );
        }
    }

    // not enough or too many args
    if (params.order.length !== args.length) {
        yield EFnArity('Function', params.order.length, args.length, loc);
    }

    const typeArgsMap = yield* substToTypeArgMap(loc, subst);

    if (!typeArgsMap) {
        return {
            returnType: Ast.DTypeRecover(),
            typeArgMap: new Map(),
        };
    }

    const typeArgs: Ast.DecodedType[] = [];
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
const EMismatchArg = (name: string, tree: E.MatchTree, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Type doesn't match type of parameter ${name}`),
        E.TEMismatch(tree),
    ],
});

function getParamName(name: Ast.OptionalId, index: number) {
    return name.kind === 'id' ? name.text : `#${index + 1}`;
}

const EFnArity = (
    kind: string,
    expected: number,
    got: number,
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`${kind} is expected to have ${expected} type arguments, got ${got}`),
    ],
});

export function* checkFnCallWithArgs(
    loc: Ast.Loc,
    fnType: Ast.DecodedFnType | undefined,
    ascribedTypeArgs: readonly Ast.DecodedType[],
    args: readonly (readonly [Ast.Loc, Ast.DecodedType])[],
): E.WithLog<CallResult> {
    if (!fnType) {
        yield ENoFunction(loc);
        return { returnType: Ast.DTypeRecover(), typeArgMap: new Map() };
    }
    if (ascribedTypeArgs.length === 0) {
        return yield* checkFnCall(loc, fnType, args)
    }
    if (fnType.typeParams.order.length !== ascribedTypeArgs.length) {
        return { returnType: Ast.DTypeRecover(), typeArgMap: new Map() };
    }
    const result = yield* checkFnCall(
        loc,
        substFnType(fnType, ascribedTypeArgs),
        args,
    );
    return {
        returnType: result.returnType,
        typeArgMap: new Map(
            zip(fnType.typeParams.order, args)
                .map(([name, [, type]]) => [name.text, type]),
        ),
    };
}
const ENoFunction = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`No such function`),
        E.TECode(loc),
    ],
});

function substFnType(
    { typeParams, params, returnType }: Ast.DecodedFnType | Ast.DecodedMethodType,
    args: readonly Ast.DecodedType[],
) {
    const order: Ast.Parameter[] = [];
    for (const param of params.order) {
        order.push(Ast.Parameter(
            param.name,
            Ast.Lazy(function* () {
                return substituteTypeArgs(
                    yield* param.type(),
                    typeParams,
                    args,
                );
            }),
            param.loc,
        ));
    }
    return Ast.DecodedFnType(
        emptyTypeParams,
        Ast.Parameters(
            order,
            params.set
        ),
        Ast.Lazy(function* () {
            return substituteTypeArgs(
                yield* returnType(),
                typeParams,
                args,
            );
        }),
    );
}

export function* lookupMethod(
    selfType: Ast.DecodedType,
    method: Ast.Id,
    args: readonly (readonly [Ast.Loc, Ast.DecodedType])[],
    typeDecls: ReadonlyMap<string, Ast.Decl<Ast.TypeDeclSig>>,
    extensions: ReadonlyMap<string, Ast.Lazy<readonly Ast.Decl<Ast.ExtSig>[]>>,
): E.WithLog<CallResult>  {
    if (selfType.kind === 'recover') {
        return { returnType: Ast.DTypeRecover(), typeArgMap: new Map() };
    }
    if (selfType.kind === 'TypeAlias') {
        if (selfType.type.kind === 'NotDealiased') {
            return throwInternal("Calling method on non-dealiased type")
        }

        return yield* lookupMethod(
            selfType,
            method,
            args,
            typeDecls,
            extensions,
        );
    }

    if (selfType.kind !== 'type_ref') {
        return yield* lookupExts(
            selfType,
            method,
            args,
            extensions,
        );
    }

    const selfDecl = typeDecls.get(selfType.name.text);
    if (!selfDecl) {
        yield ENoMethod(method.loc);
        return { returnType: Ast.DTypeRecover(), typeArgMap: new Map() };
    }
    
    if (selfDecl.decl.kind === 'struct' || selfDecl.decl.kind === 'message') {
        const builtinMap = selfDecl.decl.kind === 'struct'
            ? structBuiltin
            : messageBuiltin;
        const builtin = builtinMap.get(method.text);
        if (builtin) {
            return yield* checkFnCall(method.loc, builtin, args);
        }
        return yield* lookupExts(
            selfType,
            method,
            args,
            extensions,
        );
    }
    
    if (selfDecl.decl.kind === 'contract' || selfDecl.decl.kind === 'trait') {
        const content = yield* selfDecl.decl.content();
        const met = content.methods.get(method.text);
        if (!met) {
            yield ENoMethod(method.loc);
            return { returnType: Ast.DTypeRecover(), typeArgMap: new Map() };
        }
        return yield* checkFnCall(
            method.loc,
            met.decl.type,
            args
        );
    }

    yield ENoMethod(method.loc);
    return { returnType: Ast.DTypeRecover(), typeArgMap: new Map() };
}

function* lookupExts(
    selfType: Ast.DecodedType,
    method: Ast.Id,
    args: readonly (readonly [Ast.Loc, Ast.DecodedType])[],
    extensions: ReadonlyMap<string, Ast.Lazy<readonly Ast.Decl<Ast.ExtSig>[]>>,
) {
    const lazyExts = extensions.get(method.text);
    if (!lazyExts) {
        yield ENoMethod(method.loc);
        return { returnType: Ast.DTypeRecover(), typeArgMap: new Map() };
    }
    const exts = yield* lazyExts();
    const grounds: [Ast.DecodedMethodType, Ast.TypeArgs][] = []
    const withVars: [Ast.DecodedMethodType, Ast.TypeArgs][] = []
    for (const { decl } of exts) {
        const subst = typeParamsToSubst(decl.type.typeParams);
        const result = assignTypeAux(decl.type.self, selfType, subst, true);
        if (result.kind !== 'success') {
            continue;
        }
        const res = substToTypeArgMapAux(subst);
        if (!res.ok) {
            continue;
        }
        const into = decl.type.self.ground
            ? grounds
            : withVars;
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
        return { returnType: Ast.DTypeRecover(), typeArgMap: new Map() };
    }
    const [methodType, typeArgs] = either;
    const result = yield* checkFnCall(
        method.loc,
        substFnType(
            methodType,
            typeArgsToParams(typeArgs, methodType.typeParams),
        ),
        args
    );
    return {
        returnType: result.returnType,
        typeArgMap: typeArgs,
    };
}

function typeArgsToParams(
    args: Ast.TypeArgs,
    params: Ast.TypeParams,
) {
    const result: Ast.DecodedType[] = [];
    for (const name of params.order) {
        const arg = args.get(name.text);
        if (!arg) {
            return throwInternal("Lost type arguments");
        }
        result.push(arg);
    }
    return result;
}

const ENoMethod = (loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`No such method`),
        E.TECode(loc),
    ],
});

export function* assignMethodType(
    prev: Ast.DecodedMethodType,
    next: Ast.DecodedMethodType,
    prevVia: Ast.ViaMember,
    nextVia: Ast.ViaMember
): E.WithLog<void> {
    const result = assignTypeAux(
        yield* prev.returnType(), 
        yield* next.returnType(), 
        new Map(), 
        true
    );
    if (result.kind === 'failure') {
        yield EMismatchReturn(result.tree, prevVia.defLoc, nextVia.defLoc);
        return undefined;
    }
    const prevArity = prev.params.order.length;
    const nextArity = next.params.order.length;

    for (const [index, [prevParam, nextParam]] of zip(prev.params.order, next.params.order).entries()) {
        const result = assignTypeAux(
            yield* prevParam.type(), 
            yield* nextParam.type(), 
            new Map(), 
            true
        );
        if (result.kind === 'failure') {
            yield EMismatchParam(
                getParamName(nextParam.name, index),
                result.tree, 
                prevVia.defLoc, 
                nextVia.defLoc,
            );
        }
    }

    if (prevArity !== nextArity) {
        yield EFnArity('Method', prevArity, nextArity, nextVia.defLoc)
    }
}

const EMismatchReturn = (tree: E.MatchTree, prev: Ast.Loc, next: Ast.Loc): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Return type doesn't match with inherited method`),
        E.TEMismatch(tree),
        E.TEText(`Inherited from:`),
        E.TECode(prev),
        E.TEText(`Override at:`),
        E.TECode(next),
    ],
});

const EMismatchParam = (name: string, tree: E.MatchTree, prev: Ast.Loc, next: Ast.Loc): E.TcError => ({
    loc: next,
    descr: [
        E.TEText(`Type of parameter ${name} doesn't match with inherited method`),
        E.TEMismatch(tree),
        E.TEText(`Inherited from:`),
        E.TECode(prev),
        E.TEText(`Override at:`),
        E.TECode(next),
    ],
});