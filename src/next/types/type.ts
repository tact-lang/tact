/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { throwInternal } from "@/error/errors";
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { printType } from "@/next/types/type-print";
import { zip } from "@/utils/array";

// type C<T> = map<int4, T>
// type B<T, U> = [T, U]
// type A<T> = B<T, C<T>>

// head-first
// A<X> -> B<X, C<X>> -> [X, C<X>] -> [X, map<int4, X>]

// arg-first
// A<X> -> B<X, C<X>> -> B<X, map<int4, X>> -> [X, map<int4, X>]

// if head of the type is an alias
//     substitute alias
//     store head and args
//     recurse
// if head of the type is another type
//     recurse on arguments

// we never substitute into alias-cons (throwInternal)
// substitution only happens into body of alias decl
// body of alias decl is not dealiased, thus doesn't have alias-cons

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
                const decoded = yield* rec(substitute(
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

// NB! is substitute is used for something other than aliases, do not throwInternal on type.type
const substitute = (
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
                const args = recN(type.typeArgs);
                if (type.type.kind !== 'NotDealiased') {
                    return throwInternal("Substitution must not happen into a type with resolved aliases");
                }
                return Ast.DTypeAliasRef(type.type, type.name, args, type.loc);
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
            // TODO: support Foo { } syntax for contracts
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

export function* assignType(
    loc: Ast.Loc,
    to: Ast.DecodedType,
    from: Ast.DecodedType,
): E.WithLog<boolean> {
    const result = assignTypeAux(to, from);
    if (result.kind === 'failure') {
        yield EMismatch(result.tree, loc);
        return false;
    }
    return true;
}

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

function assignTypeAux(
    to: Ast.DecodedType,
    from: Ast.DecodedType,
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
                return to.kind === from.kind &&
                    to.name.text === from.name.text &&
                    (yield* recN(to.typeArgs, from.typeArgs));
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
                return from.kind === 'TypeNull' ||
                    to.kind === from.kind &&
                    (yield* rec(to.type, from.type));
            }
            case "map_type": {
                return from.kind === 'TypeNull' ||
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
const EMismatch = (tree: E.MatchTree, loc: Ast.Loc): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Type mismatch`),
        E.TEMismatch(tree),
    ],
});

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
        const resultL = assignTypeAux(left, right);
        if (resultL.kind === 'success') {
            return left;
        }
        const resultR = assignTypeAux(right, left);
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