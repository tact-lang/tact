/* eslint-disable @typescript-eslint/consistent-type-imports */
/* eslint-disable @typescript-eslint/no-unused-vars */
/* eslint-disable require-yield */
import * as V from "@/next/types/via";
import * as E from "@/next/types/errors";
import * as Ast from "@/next/ast";
import { memo } from "@/utils/tricks";
import type { ResolvedImport, TactImport, TactSource } from "@/next/imports/source";
// import { logDeep } from "@/utils/log-deep.build";
import { builtinFunctions, builtinMethods, builtinTypes } from "@/next/types/builtins";
import { Def, ExtEntry, ExtRegistry, FlatAlias, FlatDecl, InvalidDecl, Registry, Scope } from "@/next/types/flat";
import { throwInternal } from "@/error/errors";
import { zip } from "@/utils/array";

export type SourceCheckResult = {
    // import that lead to reading this file
    readonly importedBy: TactImport;
    // scopes that were computed from this file
    readonly globals: Scope;
}

export type TypeEntry<T> = {
    readonly arity: number;
    readonly decl: T
}
export const TypeEntry = <T>(
    arity: number,
    decl: T,
): TypeEntry<T> => ({ arity, decl });

export const typecheck = (root: TactSource): [Scope, E.TcError[]] => {
    const allErrors: E.TcError[] = [];

    const recur = memo((source: TactSource): Scope => {
        const [value, errors] = E.runLog(tcSource(
            // leave only imports of .tact
            onlyTactImports(source.imports)
                .map(importedBy => ({
                    globals: recur(importedBy.source),
                    importedBy,
                })),
            source,
        ));
        // `recur` is called only once on every source
        // this ensures errors from every source get counted
        // only once
        allErrors.push(...errors);
        return value;
    });

    return [recur(root), allErrors];
};

const onlyTactImports = (imports: readonly ResolvedImport[]): readonly TactImport[] => {
    // typescript narrowing doesn't properly apply to filter,
    // so we need this helper
    const result: TactImport[] = [];
    for (const imp of imports) {
        if (imp.kind === 'tact') {
            result.push(imp);
        }
    }
    return result;
};

function* tcSource(
    // list of import+source pairs for every of file's imports
    imported: readonly SourceCheckResult[],
    // source for current file
    source: TactSource,
): E.WithLog<Scope> {
    const importedTypes = imported.map(({ globals, importedBy }) => (
        mapRegVia<TypeEntry<FlatDecl | Ast.TypeDecl>>(new Map(
            globals.types.entries().map(([name, { value, via }]) => [
                name, { value: TypeEntry(getArity(value), value), via }
            ])
        ), importedBy)
    ));
    const localTypes = source.items.types.map((item) => createRef(
        item.name.text,
        TypeEntry(getArity(item), item),
        V.ViaOrigin(item.loc, source),
    ));
    const undecodedTypes = yield* concatReg(
        builtinTypes,
        'type',
        [...importedTypes, ...localTypes],
    );
    const aliasDecodedTypes = yield* decodeAliases(undecodedTypes);

    const functions = yield* mergeReg(
        imported, source,
        'function',
        (s) => s.functions,
        source.items.functions,
        builtinFunctions,
    );

    const constants = yield* mergeReg(
        imported, source,
        'constant',
        (s) => s.constants,
        source.items.constants,
        new Map([]),
    );

    const extensions = yield* mergeExt(
        imported,
        source,
        source.items.extensions,
        builtinMethods,
        aliasDecodedTypes,
    )

    // for (const t of source.items.types) {
    //     yield* checkTypeDecl(t, unifier, all);
    // }

    // for (const c of source.items.constants) {
    //     yield* checkConstant(c, unifier.withParams([]), all);
    // }

    // for (const f of source.items.functions) {
    //     yield* checkFunction(f, all);
    // }

    // check aliases (no recursion)
    // scope extensions
    // check functions/extension/constant/method body
    // source.items.constants.map(node => checkConstant(node))
    // check type uses (all types should be defined)
    // check kinds (all uses of types are correct)
    // get() opcode
    // message opcode `Expression | undefined`, can only be done after types are checked
    // TODO: constant/function/extension loops

    return {
        types,
        functions,
        constants,
        extensions,
    };
}
const getArity = (type: Ast.TypeDecl | FlatDecl): number => {
    switch (type.kind) {
        case "FlatContract":
        case "FlatTrait":
        case "contract":
        case "trait":
        case "message_decl": {
            return 0;
        }
        case 'InvalidDecl': {
            return type.arity;
        }
        case "struct_decl":
        case "union_decl":
        case "FlatAlias": 
        case "alias_decl": {
            return type.typeParams.length;
        }
    }
};

type AliasDecodedDecl = 
    | FlatDecl
    | Ast.Contract
    | Ast.Trait
const decodeAliases = (
    userTypes: Registry<TypeEntry<FlatDecl | Ast.TypeDecl>>,
): E.WithLog<Registry<TypeEntry<AliasDecodedDecl>>> => {
    const EAliasOccurs = (
        name: string,
        loc: Ast.Loc,
    ): E.TcError => ({
        loc,
        descr: [
            E.TEText(`Alias "${name}" was expanded inside itself`),
        ],
    });

    type Status = Success | Failure | Visiting
    // alias was already decoded
    type Success = {
        readonly kind: 'success';
        readonly alias: FlatAlias;
    }
    // failed at decoding the alias
    type Failure = {
        readonly kind: 'failure';
    }
    // we're decoding it right now
    type Visiting = {
        readonly kind: 'visiting';
    }

    // status of checking alias bodies
    const status: Map<string, Status> = new Map();

    // check that neither of the types have cyclic alias references
    function* checkTypes(types: readonly Ast.DecodedType[]): E.WithLog<boolean> {
        let result = true;
        for (const type of types) {
            const partialResult = yield* checkType(type);
            // NB: separate from previous line to avoid short-circuiting
            //     we want to give ALL error message
            result &&= partialResult;
        }
        return result;
    }

    // check decoded type has no cyclic alias references
    function* checkType(type: Ast.DecodedType): E.WithLog<boolean> {
        switch (type.kind) {
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
            case "TypeParam":
            case "TypeStringBuilder": {
                return true;
            }
            case "TypeBounced":
            case "TypeMaybe": {
                return yield* checkType(type.type);
            }
            case "map_type": {
                return (yield* checkType(type.key)) && (yield* checkType(type.value));
            }
            case "type_ref":
            case "tuple_type":
            case "tensor_type": {
                return yield* checkTypes(type.typeArgs);
            }
            case "TypeAlias": {
                // check alias reference's arguments
                const result = yield* checkTypes(type.typeArgs);
                const alias = userTypes.get(type.name.text);
                if (!alias) {
                    return throwInternal("Alias reference was decoded, but doesn't exist");
                }
                const decl = alias.value.decl
                if (decl.kind === 'alias_decl') {
                    return Boolean(yield* decodeAlias(decl)) && result;
                }
                if (decl.kind === 'FlatAlias') {
                    // we don't need to check FlatAlias, because it
                    // was already checked in one of the previous sources
                    return result;
                }
                return throwInternal("Alias reference was decoded, but does not reference alias");
            }
        }
    }

    // convert alias into better representation
    function* decodeAlias(decl: Ast.AliasDecl): E.WithLog<FlatAlias | undefined> {
        const name = decl.name.text;
        const s = status.get(name);
        if (!s) {
            // remember we're trying to do it right now,
            // so that we can throw occurs check for cyclic aliases
            status.set(name, { kind: 'visiting' });

            // decode type of the alias body
            const type = yield* decodeType(
                userTypes,
                decl.typeParams,
                decl.type,
            );

            // something went wrong trying to decode alias body
            if (!type) {
                status.set(name, { kind: 'failure' });
                return undefined;
            }

            const alias = FlatAlias(
                decl.name,
                decl.typeParams,
                type,
                decl.loc,
            );
            yield* checkType(type);

            // remember that we're done with this alias
            status.set(name, { kind: 'success', alias });
            return alias;
        } else if (s.kind === 'failure') {
            return undefined;
        } else if (s.kind === 'success') {
            return s.alias;
        } else {
            yield EAliasOccurs(name, decl.loc);
            return undefined;
        }
    }
    function* root(): E.WithLog<Registry<TypeEntry<AliasDecodedDecl>>> {
        const result: [string, Def<TypeEntry<AliasDecodedDecl>>][] = [];
        // for every type declaration
        for (const [name, def] of userTypes) {
            const decl = def.value.decl;
            // if it's not an alias, return it unchanged
            // cannot decode it yet
            if (decl.kind !== 'alias_decl') {
                result.push([name, { value: {
                    arity: def.value.arity,
                    decl: decl,
                }, via: def.via }]);
                continue;
            }
            // decode the alias
            const res = yield* decodeAlias(decl);
            if (!res) {
                // if decoding failed, store it as invalid type declaration
                result.push([name, { value: {
                    arity: def.value.arity,
                    decl: InvalidDecl(decl.name, def.value.arity, decl.loc),
                }, via: def.via }]);
                continue;
            }
            // we've actually manage to decode the alias
            // and it has neither broken types, nor loops
            result.push([name, { value: {
                arity: def.value.arity,
                decl: res,
            }, via: def.via }]);
        }
        return new Map(result);
    }
    return root();
};

const decodeType = (
    userTypes: Registry<TypeEntry<FlatDecl | Ast.TypeDecl>>,
    typeParams: readonly Ast.TypeId[],
    type: Ast.Type,
): E.WithLog<Ast.DecodedType | undefined> => {
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

    // decode all the types in an array
    function* recN(
        types: readonly Ast.Type[],
    ): E.WithLog<undefined | readonly Ast.DecodedType[]> {
        const results: Ast.DecodedType[] = [];
        for (const type of types) {
            const result = yield* rec(type);
            if (result) {
                results.push(result);
            } else {
                return undefined
            }
        }
        return results;
    }

    // decode a type
    function* rec(
        type: Ast.Type,
    ): E.WithLog<Ast.DecodedType | undefined> {
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
                return result && Ast.DTypeTuple(result, type.loc);
            }
            case "tensor_type": {
                const result = yield* recN(type.typeArgs);
                return result && Ast.DTypeTensor(result, type.loc);
            }
            case "map_type": {
                const key = yield* rec(type.key);
                const value = yield* rec(type.value);
                if (!key || !value) {
                    return undefined;
                }
                return Ast.DTypeMap(key, value, type.loc);
            }
            case "TypeBounced": {
                const child = yield* rec(type.type);
                if (!child) {
                    return undefined;
                }
                return Ast.DTypeBounced(child, type.loc);
            }
            case "TypeMaybe": {
                const child = yield* rec(type.type);
                if (!child) {
                    return undefined;
                }
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
                const param = typeParams.find(p => p.text);
                if (param) {
                    // if we used type parameter generically, throw error
                    // because we do not support HKT
                    if (!(yield* matchArity(name, arity, 0, type.loc))) {
                        return undefined;
                    }
                    return Ast.DTypeParamRef(
                        type.name,
                        type.loc,
                    );
                }
                
                const typeEntry = userTypes.get(name);

                // there is no such type at all!
                if (!typeEntry) {
                    yield ETypeNotFound(name, type.loc);
                    return undefined;
                }

                // check number of type arguments does match
                if (!(yield* matchArity(
                    name,
                    arity,
                    typeEntry.value.arity,
                    type.loc,
                ))) {
                    return undefined;
                }

                // arguments did match, but something is wrong with them
                if (!args) {
                    return undefined;
                }

                const decl = typeEntry.value.decl;
                switch (decl.kind) {
                    case "InvalidDecl": {
                        // something went wrong with the declaration we refer to
                        // so this cannot be a valid type
                        return undefined;
                    }
                    case "FlatAlias":
                    case "alias_decl": {
                        // this is an alias reference
                        return Ast.DTypeAliasRef(type.name, args, type.loc);
                    }
                    case "FlatContract":
                    case "FlatTrait":
                    case "struct_decl":
                    case "message_decl":
                    case "union_decl":
                    case "contract":
                    case "trait": {
                        // this is a ground type reference
                        return Ast.DTypeRef(type.name, args, type.loc);
                    }
                }
            }
        }
    }

    return rec(type);
}

function* mergeExt(
    results: readonly SourceCheckResult[],
    source: TactSource,
    items: readonly Ast.Extension[],
    builtins: ReadonlyMap<string, Ast.MMethodFnType>,
    userTypes: Registry<TypeEntry<AliasDecodedDecl>>,
): E.WithLog<ExtRegistry> {
    const EMethodOverlap = (
        name: string,
        prev: V.Via,
        next: V.ViaUser,
    ): E.TcError => ({
        loc: E.viaToRange(next),
        descr: [
            E.TEText(`Method "${name}" overlaps previously defined method`),
            E.TEVia(prev),
        ],
    });

    const imported: ExtRegistry[] = results.map(({ globals, importedBy }) => {
        return new Map(globals.extensions.entries().map(([k, v]) => {
            return [k, v.map((e) => ({
                via: V.ViaImport(importedBy, e.via),
                self: e.self,
                typeParams: e.typeParams,
                mutates: e.mutates,
                fun: e.fun,
            }))];
        }));
    });

    const local: ExtRegistry[] = [];
    for (const item of items) {
        const fun = item.fun;
        const type = yield* decodeType(
            userTypes,
            fun.type.typeParams,
            item.selfType
        );

        if (!type) {
            // self type is wrong
            continue;
        }

        // type without any aliases
        const methodType = yield* toSelfType(
            userTypes,
            resolveAliases(userTypes, type)
        );
        if (!methodType) {
            continue;
        }

        local.push(new Map([[fun.name.text, [{
            via: V.ViaOrigin(fun.loc, source),
            self: methodType,
            typeParams: fun.type.typeParams,
            mutates: item.mutates,
            fun: item.fun,
        }]]]));
    }

    const all = [...imported, ...local];

    const prev: Map<string, readonly ExtEntry[]> = new Map();
    for (const next of all) {
        for (const [name, nextMap] of next) {
            const prevMap = [...prev.get(name) ?? []];
            const builtin = builtins.get(name);
            for (const entry of nextMap) {
                const { typeParams, self } = entry
                // defined in compiler
                const prevBuiltin = !areOrdered(builtin, nextSchema);
                if (prevBuiltin) {
                    yield EMethodOverlap(name, V.ViaBuiltin(), nextDef.via);
                    continue;
                }
                const prevEntry = prevMap.find(([prevSchema]) => !unifier.areOrdered(
                    prevSchema, nextSchema
                ));
                // not defined yet; define it now
                if (!prevEntry) {
                    prevMap.push([nextSchema, nextDef]);
                    continue;
                }
                const [, prevDef] = prevEntry;
                // already defined, and it's not a diamond situation
                if (prevDef.via.source !== nextDef.via.source) {
                    yield EMethodOverlap(name, prevDef.via, nextDef.via);
                }
            }
            prev.set(name, prevMap);
        }
    }
    return prev;
}

const resolveAliases = (
    userTypes: Registry<TypeEntry<AliasDecodedDecl>>,
    type: Ast.DecodedType,
) => {
    const recN = (types: readonly Ast.DecodedType[]): readonly Ast.DecodedType[] => {
        return types.map(type => rec(type));
    };
    const rec = (type: Ast.DecodedType): Ast.DecodedType => {
        switch (type.kind) {
            case "type_ref": {
                return Ast.DTypeRef(
                    type.name,
                    recN(type.typeArgs),
                    type.loc,
                );
            }
            case "TypeAlias": {
                const def = userTypes.get(type.name.text);
                if (!def) {
                    return throwInternal("Decoder returned broken reference");
                }
                const decl = def.value.decl;
                if (decl.kind !== 'FlatAlias') {
                    return throwInternal("Decoder returned broken reference");
                }
                // NB! if we could decode alias once, there might be
                //     a nested one too
                return rec(substitute(
                    decl.type,
                    decl.typeParams,
                    recN(type.typeArgs),
                ));
            }
            case "TypeParam": {
                return type;
            }
            case "map_type": {
                return Ast.DTypeMap(
                    rec(type.key),
                    rec(type.value),
                    type.loc,
                );
            }
            case "TypeBounced": {
                return Ast.DTypeBounced(
                    rec(type.type),
                    type.loc,
                );
            }
            case "TypeMaybe": {
                return Ast.DTypeMaybe(
                    rec(type.type),
                    type.loc,
                );
            }
            case "tuple_type": {
                return Ast.DTypeTuple(
                    recN(type.typeArgs),
                    type.loc,
                );
            }
            case "tensor_type": {
                return Ast.DTypeTensor(
                    recN(type.typeArgs),
                    type.loc,
                );
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
    };
    return rec(type);
};

const substitute = (
    type: Ast.DecodedType,
    params: readonly Ast.TypeId[],
    args: readonly Ast.DecodedType[],
): Ast.DecodedType => {
    if (params.length !== args.length) {
        return throwInternal("Decoder didn't check alias arity");
    }

    const substMap = new Map(zip(params, args).map(([param, arg]) => {
        return [param.text, arg];
    }))

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
                return Ast.DTypeRef(
                    type.name,
                    recN(type.typeArgs),
                    type.loc,
                );
            }
            case "TypeAlias": {
                return Ast.DTypeAliasRef(
                    type.name,
                    recN(type.typeArgs),
                    type.loc,
                );
            }
            case "map_type": {
                return Ast.DTypeMap(
                    rec(type.key),
                    rec(type.value),
                    type.loc,
                );
            }
            case "TypeBounced": {
                return Ast.DTypeBounced(
                    rec(type.type),
                    type.loc,
                );
            }
            case "TypeMaybe": {
                return Ast.DTypeMaybe(
                    rec(type.type),
                    type.loc,
                );
            }
            case "tuple_type": {
                return Ast.DTypeTuple(
                    recN(type.typeArgs),
                    type.loc,
                );
            }
            case "tensor_type": {
                return Ast.DTypeTensor(
                    recN(type.typeArgs),
                    type.loc,
                );
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
    };

    return rec(type);
};

function* toSelfType(
    userTypes: Registry<TypeEntry<AliasDecodedDecl>>,
    type: Ast.DecodedType,
): E.WithLog<Ast.SelfType | undefined> {
    switch (type.kind) {
        case "type_ref": {
            const def = userTypes.get(type.name.text);
            if (!def) {
                return throwInternal("Decoder returned broken reference")
            }
            const decl = def.value.decl;
            switch (decl.kind) {
                case "InvalidDecl": {
                    return undefined;
                }
                case "FlatAlias": {
                    return throwInternal("Decoder returned broken reference")
                }
                case "FlatContract":
                case "contract": {
                    yield ENoMethods("contract", type.loc);
                    return undefined;
                }
                case "FlatTrait":
                case "trait": {
                    yield ENoMethods("trait", type.loc);
                    return undefined;
                }
                case "struct_decl":
                case "message_decl":
                case "union_decl": {
                    const allVars = type.typeArgs.filter(arg => {
                        return arg.kind === 'TypeParam';
                    });
                    if (type.typeArgs.length === allVars.length) {
                        const argNames = new Set(allVars.map(v => v.name.text));
                        if (argNames.size !== allVars.length) {
                            // type variables are not distinct
                            yield EBadMethodType(type.loc);
                            return undefined;
                        }
                        return Ast.MVTypeRef(
                            type.name,
                            allVars,
                            type.loc,
                        );    
                    }
                    if (type.typeArgs.length > 0 && allVars.length > 0) {
                        // has vars, but it's not all the parameters
                        yield EBadMethodType(type.loc);
                        return undefined;
                    }
                    const ground: Ast.MethodGroundType[] = [];
                    for (const arg of type.typeArgs) {
                        const result = yield* toGroundType(userTypes, arg);
                        if (!result) {
                            yield EBadMethodType(type.loc);
                            return undefined;
                        }
                        ground.push(result);
                    }
                    return Ast.MGTypeRef(
                        type.name,
                        ground,
                        type.loc,
                    );
                }
            }
            // somehow typescript wants this
            return throwInternal("Unknown declaration type");
        }
        case "TypeAlias": {
            return throwInternal("resolveAliases didn't resolve them");
        }
        case "TypeParam": {
            yield EBadMethodType(type.loc);
            return undefined;
        }
        case "map_type": {
            if (type.key.kind === 'TypeParam' && type.value.kind === 'TypeParam') {
                return Ast.MVTypeMap(
                    type.key,
                    type.value,
                    type.loc,
                );
            }
            const ground = yield* toGroundType(userTypes, type);
            if (!ground) {
                yield EBadMethodType(type.loc);
                return undefined;
            }
            return ground;
        }
        case "TypeBounced": {
            yield EBadMethodType(type.loc);
            return undefined;
        }
        case "TypeMaybe": {
            if (type.type.kind === 'TypeParam') {
                return Ast.MVTypeMaybe(
                    type.type,
                    type.loc,
                );
            }
            const ground = yield* toGroundType(userTypes, type);
            if (!ground) {
                yield EBadMethodType(type.loc);
                return undefined;
            }
            return ground;
        }
        case "tensor_type": 
        case "tuple_type": {
            const mvCons = type.kind === 'tuple_type'
                ? Ast.MVTypeTuple
                : Ast.MVTypeTensor;
            const allVars = type.typeArgs.filter(arg => {
                return arg.kind === 'TypeParam';
            });
            if (type.typeArgs.length === allVars.length) {
                const argNames = new Set(allVars.map(v => v.name.text));
                if (argNames.size !== allVars.length) {
                    // type variables are not distinct
                    yield EBadMethodType(type.loc);
                    return undefined;
                }
                return mvCons(
                    allVars,
                    type.loc,
                );    
            }
            const ground = yield* toGroundType(userTypes, type);
            if (!ground) {
                yield EBadMethodType(type.loc);
                return undefined;
            }
            return ground;
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
const EBadMethodType = (
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Type of self must either have no type parameters, or be a generic type with distinct type parameters`),
    ],
});
const ENoMethods = (
    kind: string,
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Cannot define methods on ${kind}`),
    ],
});

function* toGroundType(
    userTypes: Registry<TypeEntry<AliasDecodedDecl>>,
    type: Ast.DecodedType
): E.WithLog<Ast.MethodGroundType | undefined> {
    switch (type.kind) {
        case "type_ref": {
            const def = userTypes.get(type.name.text);
            if (!def) {
                return throwInternal("Decoder returned broken reference")
            }
            const decl = def.value.decl;
            switch (decl.kind) {
                case "InvalidDecl": {
                    return undefined;
                }
                case "FlatAlias": {
                    return throwInternal("Decoder returned broken reference")
                }
                case "FlatContract":
                case "contract": {
                    yield ENoMethods("contract", type.loc);
                    return undefined;
                }
                case "FlatTrait":
                case "trait": {
                    yield ENoMethods("trait", type.loc);
                    return undefined;
                }
                case "struct_decl":
                case "message_decl":
                case "union_decl": {
                    const ground: Ast.MethodGroundType[] = [];
                    for (const arg of type.typeArgs) {
                        const result = yield* toGroundType(userTypes, arg);
                        if (!result) {
                            return undefined;
                        }
                        ground.push(result);
                    }
                    return Ast.MGTypeRef(
                        type.name,
                        ground,
                        type.loc,
                    );
                }
            }
            // somehow typescript wants this
            return throwInternal("Unknown declaration type");
        }
        case "TypeAlias": {
            return throwInternal("resolveAliases didn't resolve them");
        }
        case "TypeParam": {
            return undefined;
        }
        case "map_type": {
            const key = yield* toGroundType(userTypes, type.key);
            const value = yield* toGroundType(userTypes, type.value);
            if (!key || !value) {
                return undefined;
            }
            return Ast.MGTypeMap(key, value, type.loc);
        }
        case "TypeBounced": {
            return undefined;
        }
        case "TypeMaybe": {
            const child = yield* toGroundType(userTypes, type.type);
            if (!child) {
                return undefined;
            }
            return Ast.MGTypeMaybe(child, type.loc);
        }
        case "tuple_type": {
            const children: Ast.MethodGroundType[] = [];
            for (const child of type.typeArgs) {
                const result = yield* toGroundType(userTypes, child);
                if (!result) {
                    return undefined;
                }
                children.push(result);
            }
            return Ast.MGTypeTuple(children, type.loc);
        }
        case "tensor_type": {
            const children: Ast.MethodGroundType[] = [];
            for (const child of type.typeArgs) {
                const result = yield* toGroundType(userTypes, child);
                if (!result) {
                    return undefined;
                }
                children.push(result);
            }
            return Ast.MGTypeTensor(children, type.loc);
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

function* mergeReg<T extends { name: Ast.Id | Ast.TypeId, loc: Ast.Loc }>(
    results: readonly SourceCheckResult[],
    source: TactSource,
    kind: string,
    get1: (s: Scope) => Registry<T>,
    items: readonly T[],
    builtin: Map<string, unknown>,
): E.WithLog<Registry<T>> {
    const imported = results.map(({ globals, importedBy }) => (
        mapRegVia<T>(get1(globals), importedBy)
    ));
    const local = items.map((item) => createRef(
        item.name.text,
        item,
        V.ViaOrigin(item.loc, source),
    ));
    return yield* concatReg(
        builtin,
        kind,
        [...imported, ...local],
    )
}

const createRef = <V>(name: string, value: V, via: V.ViaUser): Registry<V> => {
    return new Map([[name, { value, via }]]);
};

const mapRegVia = <V>(fns: Registry<V>, importedBy: TactImport): Registry<V> => {
    return new Map(fns.entries().map(([k, v]) => {
        return [k, {
            value: v.value,
            via: V.ViaImport(importedBy, v.via),
        }];
    }));
};

function* concatReg<V>(
    builtins: Map<string, unknown>,
    kind: string,
    all: readonly Registry<V>[]
): E.WithLog<Registry<V>> {
    const ERedefine = (kind: string, name: string, prev: V.Via, next: V.ViaUser): E.TcError => ({
        loc: E.viaToRange(next),
        descr: [
            E.TEText(`There already is a ${kind} "${name}" from`),
            E.TEVia(prev),
        ],
    });

    const prev: Map<string, Def<V>> = new Map();
    for (const next of all) {
        for (const [name, nextItem] of next) {
            const prevItem = prev.get(name);
            // defined in compiler
            if (builtins.has(name)) {
                yield ERedefine(kind, name, V.ViaBuiltin(), nextItem.via);
                continue;
            }
            // not defined yet; define it now
            if (typeof prevItem === 'undefined') {
                prev.set(name, nextItem);
                continue;
            }
            // already defined, and it's not a diamond situation
            if (prevItem.via.source !== nextItem.via.source) {
                yield ERedefine(kind, name, prevItem.via, nextItem.via);
            }
        }
    }
    return prev;
}
