/* eslint-disable require-yield */
/* eslint-disable @typescript-eslint/no-unused-vars */
import { throwInternal } from "@/error/errors";
import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
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
                        return Ast.DTypeRef(type.name, [], type.loc);
                    }
                    case "struct":
                    case "message":
                    case "union": {
                        // this is a ground type reference
                        return Ast.DTypeRef(type.name, args, type.loc);
                    }
                    case "alias": {
                        // this is an alias reference
                        return Ast.DTypeAliasRef(type.name, args, type.loc);
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
                return Ast.DTypeRef(type.name, args, type.loc);
            }
            case "TypeAlias": {
                const alias = typeDecls.get(type.name.text);
                if (!alias || alias.decl.kind !== 'alias') {
                    return throwInternal("Type decoder must not return types with dangling references");
                }
                // NB! if we could decode alias once, there might be
                //     a nested one too
                return yield* rec(substitute(
                    yield* alias.decl.type(),
                    alias.decl.typeParams,
                    yield* E.mapLog(type.typeArgs, rec),
                ));
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
            case "TypeBounced": {
                return type;
            }
        }
    }

    return rec(type);
};

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
                return Ast.DTypeRef(type.name, args, type.loc);
            }
            case "TypeAlias": {
                const args = recN(type.typeArgs);
                return Ast.DTypeAliasRef(type.name, args, type.loc);
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
                type: Ast.DTypeRef(typeName, typeArgs, typeName.loc),
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
                Ast.DTypeAliasRef(typeName, typeArgs, typeName.loc),
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
    ascribed: Ast.DecodedType,
    computed: Ast.DecodedType,
    scopeRef: () => Ast.Scope,
): E.WithLog<boolean> {

}

export function* mgu(
    left: Ast.DecodedType,
    right: Ast.DecodedType,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.DecodedType> {
    // left = simplifyHead(left);
    // right = simplifyHead(right);
    // if (left.kind === 'ERROR' || right.kind === 'ERROR') {
    //     return Ty.TypeErrorRecovered();
    // }
    // if (left.kind === 'type_var' || right.kind === 'type_var') {
    //     return throwInternal("Trying to unify type variable");
    // }
    // const children: MismatchTree[] = [];
    // if (assignToAux1(left, right, children)) {
    //     return left;
    // }
    // if (assignToAux1(right, left, children)) {
    //     return right;
    // }
    // if (isNull(right)) {
    //     return Maybe(left, loc);
    // }
    // if (isNull(left)) {
    //     return Maybe(right, loc);
    // }
    // for (const tree of children) {
    //     err.typeMismatch(tree)(loc);
    // }
    // return Ty.TypeErrorRecovered();
}