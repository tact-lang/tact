import * as Ast from "@/next/ast";
import { builtinTypes } from "@/next/types/builtins";
import { concatReg } from "@/next/types/reg";
import type { TactImport, TactSource } from "@/next/imports/source";
import * as E from "@/next/types/errors";

export function* getDecodeType(
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
) {
    const importedSigs = importSigs(imported);
    const localSigs = getLocalSigs(source);
    const sigs = yield* concatReg(
        builtinTypes,
        'type',
        [...importedSigs, ...localSigs],
    );

    return sigs;
}

const importSigs = (imported: readonly Ast.SourceCheckResult[]) => {
    return imported.map(({ globals, importedBy }) => (
        new Map(
            globals.typeDecls.entries()
                .map(([name, s]) => [name, toSigDecoded(s, importedBy)])
        )
    ));
};

const toSigDecoded = (decl: Ast.TypeDeclSig, importedBy: TactImport): Ast.DeclSig => {
    const via = Ast.ViaImport(importedBy, decl.via);
    switch (decl.kind) {
        case "bad":
            return Ast.DeclSig('forbidden', decl.arity, via);
        case "alias":
            return Ast.DeclSig('alias', decl.typeParams.order.length, via)
        case "contract":
        case "trait":
            return Ast.DeclSig('contract', 0, via);
        case "struct":
        case "message":
        case "union":
            return Ast.DeclSig('usual', decl.typeParams.order.length, via);
    }
};

const getLocalSigs = (source: TactSource) => {
    return source.items.types
        .map((decl) => new Map([[decl.name.text, toSigNew(decl, source)]]))
};

const toSigNew = (decl: Ast.TypeDecl, source: TactSource) => {
    const via = Ast.ViaOrigin(decl.loc, source);
    switch (decl.kind) {
        case "alias_decl": {
            return Ast.DeclSig('alias', decl.typeParams.length, via);
        }
        case "contract":
        case "trait": {
            return Ast.DeclSig('contract', 0, via);
        }
        case "message_decl": {
            return Ast.DeclSig('usual', 0, via);
        }
        case "struct_decl":
        case "union_decl": {
            return Ast.DeclSig('usual', decl.typeParams.length, via);
        }
    }
};

export function decodeType(
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    typeParams: Ast.TypeParams,
    type: Ast.Type,
): E.WithLog<Ast.DecodedType> {
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
                
                const typeEntry = sigs.get(name);

                // there is no such type at all!
                if (!typeEntry) {
                    yield ETypeNotFound(name, type.loc);
                    return Ast.DTypeRecover();
                }

                // check number of type arguments does match
                if (!(yield* matchArity(
                    name,
                    arity,
                    typeEntry.arity,
                    type.loc,
                ))) {
                    return Ast.DTypeRecover();
                }

                switch (typeEntry.use) {
                    case "usual":
                    case "contract": {
                        // this is a ground type reference
                        return Ast.DTypeRef(type.name, args, type.loc);
                    }
                    case "alias": {
                        // this is an alias reference
                        return Ast.DTypeAliasRef(type.name, args, type.loc);
                    }
                    case "forbidden": {
                        // something went wrong with the declaration we refer to
                        // so this cannot be a valid type
                        return Ast.DTypeRecover();
                    }
                }
            }
        }
    }

    return rec(type);
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