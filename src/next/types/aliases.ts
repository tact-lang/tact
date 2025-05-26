import * as Ast from "@/next/ast";
import * as E from "@/next/types/errors";
import type { TactSource } from "@/next/imports/source";
import { throwInternal } from "@/error/errors";
import { decodeTypeParams } from "@/next/types/type-params";
import { decodeType } from "@/next/types/types";
import { zip } from "@/utils/array";

export function* getAllAliases(
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    imported: readonly Ast.SourceCheckResult[],
    source: TactSource,
) {
    const importedAliases: Map<string, Ast.AliasSig> = new Map();
    const localAliases: Map<string, Ast.AliasDecl> = new Map();

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
                const result = yield* checkTypes(type.typeArgs);
                const name = type.name.text;
                if (importedAliases.has(name)) {
                    return result;
                }
                const local = localAliases.get(name);
                if (local) {
                    const alias = yield* decodeAlias(local);
                    return result && alias.kind === 'alias';
                }
                return throwInternal("Alias reference was decoded, but doesn't exist");
            }
        }
    }

    // convert alias into better representation
    function* decodeAlias(decl: Ast.AliasDecl): E.WithLog<Ast.AliasSig | Ast.BadSig> {
        const name = decl.name.text;
        const s = status.get(name);
        const via = Ast.ViaOrigin(decl.loc, source);
            if (!s) {
            status.set(name, Visiting);
            const params = yield* decodeTypeParams(decl.typeParams);
            const type = yield* decodeType(sigs, params, decl.type);
            const result = !(yield* checkType(type))
                ? Ast.BadSig(decl.typeParams.length, via)
                : Ast.AliasSig(params, type, via);
            status.set(name, Result(result));
            return result;
        } else if (s.kind === 'result') {
            return s.result;
        } else {
            yield EAliasOccurs(name, decl.loc);
            return Ast.BadSig(decl.typeParams.length, via);
        }
    }

    // collect aliases from imports
    for (const { globals } of imported) {
        for (const [name, decl] of globals.typeDecls) {
            if (decl.kind === 'alias' && !importedAliases.has(name)) {
                importedAliases.set(name, decl);
            }
        }
    }

    // collect local aliases
    for (const decl of source.items.types) {
        const name = decl.name.text;
        if (decl.kind === 'alias_decl') {
            localAliases.set(name, decl);
        }
    }
    
    // decode local aliases and combine with imported
    const result: Map<string, Ast.AliasSig | Ast.BadSig> =
        new Map(importedAliases);
    for (const [name, decl] of localAliases) {
        const alias = yield* decodeAlias(decl)
        result.set(name, alias);
    }
    return result;
}

type Status = Result | Visiting
// alias was already decoded
type Result = {
    readonly kind: 'result';
    readonly result: Ast.AliasSig | Ast.BadSig;
}
const Result = (alias: Ast.AliasSig | Ast.BadSig): Result => ({ kind: 'result', result: alias });
// we're decoding it right now
type Visiting = {
    readonly kind: 'visiting';
}
const Visiting: Visiting = { kind: 'visiting' };

const EAliasOccurs = (
    name: string,
    loc: Ast.Loc,
): E.TcError => ({
    loc,
    descr: [
        E.TEText(`Alias "${name}" was expanded inside itself`),
    ],
});

export const dealiasType = (
    sigs: ReadonlyMap<string, Ast.DeclSig>,
    aliases: ReadonlyMap<string, Ast.AliasSig | Ast.BadSig>,
    typeParams: Ast.TypeParams,
    type: Ast.Type,
) => {
    const recN = (types: readonly Ast.DecodedType[]): readonly Ast.DecodedType[] => {
        return types.map(type => rec(type));
    };
    const rec = (type: Ast.DecodedType): Ast.DecodedType => {
        switch (type.kind) {
            case "recover": {
                return type;
            }
            case "type_ref": {
                const args = recN(type.typeArgs);
                return Ast.DTypeRef(type.name, args, type.loc);
            }
            case "TypeAlias": {
                const alias = aliases.get(type.name.text);
                if (!alias) {
                    return throwInternal("Decoder returned broken reference");
                }
                if (alias.kind === 'bad') {
                    return Ast.DTypeRecover();
                }
                const args = recN(type.typeArgs);
                // NB! if we could decode alias once, there might be
                //     a nested one too
                return rec(
                    substitute(alias.type, alias.typeParams, args)
                );
            }
            case "TypeParam": {
                return type;
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

    function* root() {
        return rec(yield* decodeType(sigs, typeParams, type));
    }
    return root();
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