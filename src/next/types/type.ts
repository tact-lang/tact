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

export const dealiasTypeLazy = (
    typeParams: Ast.TypeParams,
    type: Ast.Type,
    scopeRef: () => Ast.Scope,
) => Ast.Lazy(function* () {
    const decoded = yield* decodeType(
        typeParams,
        type,
        scopeRef().typeDecls,
    );
    return yield* dealiasType(
        decoded,
        scopeRef().typeDecls,
    );
});

function decodeType(
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
                const key = yield* rec(type.key);
                const value = yield* rec(type.value);
                return Ast.DTypeMap(key, value, type.loc);
            }
            case "TypeBounced": {
                const child = yield* rec(type.type);
                return Ast.DTypeBounced(child, type.loc);
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

const dealiasType = (
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
            case "TypeBounced": {
                const args = yield* rec(type.type);
                return Ast.DTypeBounced(args, type.loc);
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
            case "TypeStringBuilder": {
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
            case "TypeBounced": {
                const args = rec(type.type);
                return Ast.DTypeBounced(args, type.loc);
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
            case "TypeStringBuilder": {
                return type;
            }
        }
    };

    return rec(type);
};

export function* assignType(
    ascribed: Ast.DecodedType,
    computed: Ast.DecodedType,
    scopeRef: () => Ast.Scope,
) {

}