import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { zip } from "@/utils/array";
import { throwInternal } from "@/error/errors";
import { decodeFnType } from "@/next/types/type-fn";
import { decodeDealiasTypeLazy } from "@/next/types/type";
import { decodeBody } from "@/next/types/body";
import { builtinMethods } from "@/next/types/builtins";
import type { TactSource } from "@/next/imports/source";

export function decodeExtensions(
    Lazy: Ast.ThunkBuilder,
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    scopeRef: () => Ast.Scope,
): ReadonlyMap<string, Ast.Thunk<readonly Ast.Decl<Ast.ExtSig>[]>> {
    const allExts: Map<string, Ast.Thunk<readonly Ast.Decl<Ast.ExtSig>[]>[]> = new Map();

    // imported
    for (const { globals, importedBy } of imported) {
        for (const [name, lazyExts] of globals.extensions) {
            const map = allExts.get(name) ?? [];
            allExts.set(name, map);
            map.push(Lazy({
                callback: function* () {
                    const exts = yield* lazyExts();
                    return exts.map(ext => Ast.Decl(
                        ext.decl,
                        Ast.ViaImport(importedBy, ext.via),
                    ));
                },
                context: [E.TEText(`importing extension method ${name}`)],
                loc: Ast.Builtin(),
                recover: [],
            }));
        }
    }

    // local
    for (const ext of source.items.extensions) {
        const name = ext.fun.name.text;
        const map = allExts.get(name) ?? [];
        allExts.set(name, map);
        map.push(Lazy({
            callback: function* (Lazy) {
                const decoded = yield* decodeExt(Lazy, ext, scopeRef);
                if (!decoded) {
                    return [];
                }
                return [Ast.Decl(
                    decoded,
                    Ast.ViaOrigin(ext.fun.loc, source),
                )];
            },
            context: [
                E.TEText(`defining extension method ${ext.fun.name.text}`)
            ],
            loc: ext.fun.loc,
            recover: [],
        }));
    }

    const result: Map<string, Ast.Thunk<Ast.Decl<Ast.ExtSig>[]>> = new Map();
    for (const [name, exts] of allExts) {
        // checking method overlap is only possible when all the types
        // can be resolved
        result.set(name, Lazy({
            callback: function* () {
                // force all thunks
                const all: Ast.Decl<Ast.ExtSig>[] = [];
                for (const lazyExt of exts) {
                    const exts = yield* lazyExt();
                    all.push(...exts);
                }
    
                // check overlap and deduplicate
                const prevs: Ast.Decl<Ast.ExtSig>[] = [];
                for (const ext of all) {
                    const builtin = builtinMethods.get(name);
                    if (builtin && !isCompatible(builtin, ext.decl.type)) {
                        yield EMethodOverlap(name, Ast.ViaBuiltin(), ext.via);
                        continue;
                    }
                    if (yield* areCompatible(name, prevs, ext)) {
                        prevs.push(ext);
                    }
                }
                return prevs;
            },
            context: [E.TEText(`merging extensions methods with name ${name}`)],
            loc: Ast.Builtin(),
            recover: [],
        }));
    }

    return result;
}

function* decodeExt(
    Lazy: Ast.ThunkBuilder,
    node: Ast.Extension,
    scopeRef: () => Ast.Scope,
) {
    const { selfType, mutates, fun } = node;
    const { type, body, inline, loc } = fun;
    
    const decodedFn = yield* decodeFnType(Lazy, type, scopeRef);

    const lazySelf = decodeDealiasTypeLazy(
        Lazy,
        decodedFn.typeParams,
        selfType,
        scopeRef,
    );
    const self = yield* decodeSelfType(yield* lazySelf(), scopeRef);

    if (!self) {
        return undefined;
    }
    
    const methodType = Ast.DecodedMethodType(
        mutates,
        decodedFn.typeParams,
        self,
        decodedFn.params,
        decodedFn.returnType,
    );

    const decodedBody = yield* decodeBody(
        Lazy,
        body,
        methodType,
        loc,
        scopeRef,
    );

    return Ast.ExtSig(methodType, inline, decodedBody);
}

function* areCompatible(
    name: string,
    prevs: readonly Ast.Decl<Ast.ExtSig>[],
    next: Ast.Decl<Ast.ExtSig>,
): E.WithLog<boolean> {
    for (const prev of prevs) {
        const prevType = prev.decl.type;
        const nextType = next.decl.type;
        // NB! checking by reference, see `toSigDecoded`
        if (prevType !== nextType && !isCompatible(prevType, nextType)) {
            yield EMethodOverlap(name, prev.via, next.via);
            return false;
        }
    }
    return true;
}

const EMethodOverlap = (
    name: string,
    prev: Ast.Via,
    next: Ast.ViaUser,
): E.TcError => ({
    loc: E.viaToRange(next),
    descr: [
        E.TEText(`Method "${name}" overlaps previously defined method`),
        E.TEVia(prev),
    ],
});

function isCompatible(
    prev: Ast.DecodedMethodType,
    next: Ast.DecodedMethodType,
) {
    const prevSelf = prev.self;
    const nextSelf = next.self;
    return prevSelf.kind !== nextSelf.kind ||
        prevSelf.ground === 'yes' &&
        nextSelf.ground === 'yes' &&
        !areEqual(prevSelf, nextSelf);
}

function areEqual(
    prevSelf: Ast.MethodGroundType,
    nextSelf: Ast.MethodGroundType
): boolean {
    switch (prevSelf.kind) {
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
            return prevSelf.kind === nextSelf.kind;
        }
        case "type_ref": {
            return prevSelf.kind === nextSelf.kind &&
                prevSelf.name.text === nextSelf.name.text &&
                allEqual(prevSelf.typeArgs, nextSelf.typeArgs);
        }
        case "map_type": {
            return prevSelf.kind === nextSelf.kind &&
                allEqual(
                    [prevSelf.key, prevSelf.value],
                    [nextSelf.key, nextSelf.value],
                );
        }
        case "TypeMaybe": {
            return prevSelf.kind === nextSelf.kind &&
                areEqual(prevSelf.type, prevSelf.type);
        }
        case "tuple_type":
        case "tensor_type": {
            return prevSelf.kind === nextSelf.kind &&
                allEqual(prevSelf.typeArgs, nextSelf.typeArgs);
        }
    }
}

function allEqual(
    prevs: readonly Ast.MethodGroundType[],
    nexts: readonly Ast.MethodGroundType[],
): boolean {
    return zip(prevs, nexts).every(([prev, next]) => areEqual(prev, next));
}

function* decodeSelfType(
    type: Ast.DecodedType,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.SelfType | undefined> {
    switch (type.kind) {
        case "recover": {
            return undefined;
        }
        case "type_ref": {
            const def = scopeRef().typeDecls.get(type.name.text);
            if (!def) {
                return throwInternal("Decoder returned broken reference")
            }
            switch (def.decl.kind) {
                case "alias": {
                    return throwInternal("Decoder returned broken reference")
                }
                case "contract":
                case "trait": {
                    yield ENoMethods("contract", type.loc);
                    return undefined;
                }
                case "struct":
                case "message":
                case "union": {
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
                            def.decl,
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
                        const result = yield* toGroundType(arg, scopeRef);
                        if (!result) {
                            yield EBadMethodType(type.loc);
                            return undefined;
                        }
                        ground.push(result);
                    }
                    return Ast.MGTypeRef(
                        type.name,
                        def.decl,
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
            const ground = yield* toGroundType(type, scopeRef);
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
            const ground = yield* toGroundType(type, scopeRef);
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
            const ground = yield* toGroundType(type, scopeRef);
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
        case "TypeStateInit":
        case "TypeStringBuilder": {
            return {
                ground: "yes",
                ...type,
            };
        }
    }
}

function* toGroundType(
    type: Ast.DecodedType,
    scopeRef: () => Ast.Scope,
): E.WithLog<Ast.MethodGroundType | undefined> {
    switch (type.kind) {
        case "recover": {
            return undefined;
        }
        case "type_ref": {
            const typeDecl = scopeRef().typeDecls.get(type.name.text);
            if (!typeDecl) {
                return throwInternal("Decoder returned broken reference")
            }
            switch (typeDecl.decl.kind) {
                case "contract":
                case "trait": {
                    yield ENoMethods("contract", type.loc);
                    return undefined;
                }
                case "alias": {
                    return throwInternal("Decoder returned broken reference")
                }
                case "struct":
                case "message":
                case "union": {
                    const ground: Ast.MethodGroundType[] = [];
                    for (const arg of type.typeArgs) {
                        const result = yield* toGroundType(arg, scopeRef);
                        if (!result) {
                            return undefined;
                        }
                        ground.push(result);
                    }
                    return Ast.MGTypeRef(
                        type.name,
                        typeDecl.decl,
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
            const key = yield* toGroundType(type.key, scopeRef);
            const value = yield* toGroundType(type.value, scopeRef);
            return key && value && Ast.MGTypeMap(key, value, type.loc);
        }
        case "TypeBounced": {
            return undefined;
        }
        case "TypeMaybe": {
            const child = yield* toGroundType(type.type, scopeRef);
            return child && Ast.MGTypeMaybe(child, type.loc);
        }
        case "tuple_type": {
            const children = yield* E.mapLog(type.typeArgs, function* (child) {
                const result = yield* toGroundType(child, scopeRef);
                return result ? [result] : [];
            });
            return Ast.MGTypeTuple(children.flat(), type.loc);
        }
        case "tensor_type": {
            const children = yield* E.mapLog(type.typeArgs, function* (child) {
                const result = yield* toGroundType(child, scopeRef);
                return result ? [result] : [];
            });
            return Ast.MGTypeTensor(children.flat(), type.loc);
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
        case "TypeStateInit":
        case "TypeStringBuilder": {
            return {
                ground: "yes",
                ...type,
            };
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