import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import { dealiasType } from "@/next/types/aliases";
import { decodeFnType } from "@/next/types/util";
import { builtinMethods } from "@/next/types/builtins";
import { throwInternal } from "@/error/errors";
import type { TactImport, TactSource } from "@/next/imports/source";
import { zip } from "@/utils/array";

export function* getAllExtensions(
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    aliases: Map<string, Ast.AliasSig | Ast.BadSig>,
): E.WithLog<ReadonlyMap<string, readonly Ast.ExtSig[]>> {
    const importedExts = imported.flatMap(({ globals, importedBy }) => (
        [...globals.extSigs]
            .map(([name, exts]) => [name, exts.map(ext => toSigDecoded(ext, importedBy))] as const)
    ));
    const localExts = yield* E.mapLog(source.items.extensions, function* (ext) {
        const { selfType, mutates, fun } = ext;
        const { name, type, body, inline, loc } = fun;
        const via = Ast.ViaOrigin(loc, source);
        const decodedFn = yield* decodeFnType(type, via, sigs, aliases);
        const self = yield* toSelfType(sigs, yield* dealiasType(
            sigs,
            aliases,
            decodedFn.typeParams,
            selfType,
        ));
        if (!self) {
            return [];
        }
        const methodType = Ast.DecodedMethodType(
            decodedFn.typeParams,
            self,
            decodedFn.params,
            decodedFn.returnType,
        );
        return [[name.text, [Ast.ExtSig(methodType, via)]] as const];
    });

    const result: Map<string, Ast.ExtSig[]> = new Map();
    for (const [name, exts] of [...importedExts, ...localExts.flat()]) {
        const prev = result.get(name) ?? [];
        result.set(name, prev);
        for (const ext of exts) {
            const builtin = builtinMethods.get(name);
            if (builtin && !isCompatible(builtin, ext.type)) {
                yield EMethodOverlap(name, Ast.ViaBuiltin(), ext.via);
                continue;
            }
            const prevs = result.get(name) ?? [];
            if (yield* areCompatible(name, prevs, ext)) {
                prev.push(ext);
            }
        }
    }

    return result;
}

function* areCompatible(
    name: string,
    prevs: readonly Ast.ExtSig[],
    next: Ast.ExtSig,
): E.WithLog<boolean> {
    for (const prev of prevs) {
        // NB! checking by reference, see `toSigDecoded`
        if (prev.type !== next.type && !isCompatible(prev.type, next.type)) {
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
): boolean {
    return prev.self.kind !== next.self.kind ||
        prev.self.ground === 'yes' &&
        next.self.ground === 'yes' &&
        !areEqual(prev.self, next.self);
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

const toSigDecoded = (
    prev: Ast.ExtSig,
    importedBy: TactImport,
): Ast.ExtSig => {
    const via = Ast.ViaImport(importedBy, prev.via);
    // NB! it's important to NOT change the reference to prev.type
    //     as we're deduplicating same extension by reference
    return Ast.ExtSig(prev.type, via);
};

function* toSelfType(
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    type: Ast.DecodedType,
): E.WithLog<Ast.SelfType | undefined> {
    switch (type.kind) {
        case "recover": {
            return undefined;
        }
        case "type_ref": {
            const def = sigs.get(type.name.text);
            if (!def) {
                return throwInternal("Decoder returned broken reference")
            }
            switch (def.use) {
                case "alias": {
                    return throwInternal("Decoder returned broken reference")
                }
                case "contract": {
                    yield ENoMethods("contract", type.loc);
                    return undefined;
                }
                case "forbidden": {
                    return undefined;
                }
                case "usual": {
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
                        const result = yield* toGroundType(sigs, arg);
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
            const ground = yield* toGroundType(sigs, type);
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
            const ground = yield* toGroundType(sigs, type);
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
            const ground = yield* toGroundType(sigs, type);
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
            return {
                ground: "yes",
                ...type,
            };
        }
    }
}

function* toGroundType(
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    type: Ast.DecodedType
): E.WithLog<Ast.MethodGroundType | undefined> {
    switch (type.kind) {
        case "recover": {
            return undefined;
        }
        case "type_ref": {
            const typeDecl = sigs.get(type.name.text);
            if (!typeDecl) {
                return throwInternal("Decoder returned broken reference")
            }
            switch (typeDecl.use) {
                case "contract": {
                    yield ENoMethods("contract", type.loc);
                    return undefined;
                }
                case "alias": {
                    return throwInternal("Decoder returned broken reference")
                }
                case "forbidden": {
                    return undefined;
                }
                case "usual": {
                    const ground: Ast.MethodGroundType[] = [];
                    for (const arg of type.typeArgs) {
                        const result = yield* toGroundType(sigs, arg);
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
            const key = yield* toGroundType(sigs, type.key);
            const value = yield* toGroundType(sigs, type.value);
            return key && value && Ast.MGTypeMap(key, value, type.loc);
        }
        case "TypeBounced": {
            return undefined;
        }
        case "TypeMaybe": {
            const child = yield* toGroundType(sigs, type.type);
            return child && Ast.MGTypeMaybe(child, type.loc);
        }
        case "tuple_type": {
            const children = yield* E.mapLog(type.typeArgs, function* (child) {
                const result = yield* toGroundType(sigs, child);
                return result ? [result] : [];
            });
            return Ast.MGTypeTuple(children.flat(), type.loc);
        }
        case "tensor_type": {
            const children = yield* E.mapLog(type.typeArgs, function* (child) {
                const result = yield* toGroundType(sigs, child);
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