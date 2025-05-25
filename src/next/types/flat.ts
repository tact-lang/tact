import type * as Ast from "@/next/ast";
import type { TactImport } from "@/next/imports/source";
import * as V from "@/next/types/via";

export type Scope = {
    readonly types: Registry<FlatDecl>;
    readonly functions: Registry<Ast.Function>;
    readonly constants: Registry<Ast.Constant>;
    readonly extensions: ExtRegistry;
}

export type Registry<T> = Map<string, Def<T>>;

export type Def<T> = {
    // the definition
    readonly value: T;
    // where it was defined
    readonly via: V.ViaUser;
}
export const Def = <T>(value: T, via: V.ViaUser): Def<T> => ({ value, via });
export const importDef = <T>(importedBy: TactImport, { value, via }: Def<T>): Def<T> => Def(value, V.ViaImport(importedBy, via));

export type ExtRegistry = Map<string, readonly ExtEntry[]>

export type ExtEntry = {
    readonly self: Ast.SelfType;
    readonly typeParams: readonly Ast.TypeId[];
    readonly mutates: boolean;
    readonly fun: Ast.Function;
    readonly via: V.ViaUser;
}

export type FlatDecl =
    | InvalidDecl
    | FlatAlias
    | FlatContract
    | FlatTrait
    | Ast.StructDecl
    | Ast.MessageDecl
    | Ast.UnionDecl;

export type InvalidDecl = {
    readonly kind: 'InvalidDecl';
    readonly name: Ast.TypeId;
    readonly arity: number;
    readonly loc: Ast.Loc;
}
export const InvalidDecl = (
    name: Ast.TypeId,
    arity: number,
    loc: Ast.Loc,
): InvalidDecl => ({ kind: 'InvalidDecl', name, arity, loc });

export type FlatAlias = {
    readonly kind: 'FlatAlias';
    readonly name: Ast.TypeId;
    readonly typeParams: readonly Ast.TypeId[];
    readonly type: Ast.DecodedType;
    readonly loc: Ast.Loc;
}
export const FlatAlias = (
    name: Ast.TypeId,
    typeParams: readonly Ast.TypeId[],
    type: Ast.DecodedType,
    loc: Ast.Loc,
): FlatAlias => ({ kind: 'FlatAlias', name, type, typeParams, loc });

export type Schema = {
    readonly typeArgs: readonly Ast.TypeId[];
    readonly type: Ast.DecodedType;
}

export type FlatContent = {
    readonly name: Ast.TypeId;
    readonly attributes: readonly Ast.ContractAttribute[];
    readonly declarations: Ast.LocalItems;
    readonly loc: Ast.Loc;
};
export const FlatContent = (
    name: Ast.TypeId,
    attributes: readonly Ast.ContractAttribute[],
    declarations: Ast.LocalItems,
    loc: Ast.Loc,
): FlatContent => ({ attributes, declarations, name, loc });

export type FlatContract = {
    readonly kind: 'FlatContract';
    readonly init: undefined | Ast.Init;
    readonly content: FlatContent;
};
export const FlatContract = (
    init: undefined | Ast.Init,
    content: FlatContent,
): FlatContract => ({ kind: 'FlatContract', content, init });

export type FlatTrait = {
    readonly kind: 'FlatTrait';
    readonly content: FlatContent;
};
export const FlatTrait = (content: FlatContent): FlatTrait => ({ kind: 'FlatTrait', content });

export type FlatItems = {
    readonly fields: readonly Ast.FieldDecl[];
    readonly methods: readonly FlatMethod[];
    readonly receivers: readonly Ast.Receiver[];
    readonly constants: readonly Ast.Constant[];
};
export const FlatItems = (
    fields: readonly Ast.FieldDecl[],
    methods: readonly FlatMethod[],
    receivers: readonly Ast.Receiver[],
    constants: readonly Ast.Constant[],
): FlatItems => ({ constants, fields, methods, receivers });

export type FlatMethod = {
    readonly mutates: boolean;
    readonly fun: Ast.Function;
    readonly get: undefined | Ast.GetAttribute;
};
export const FlatMethod = (
    mutates: boolean,
    fun: Ast.Function,
    get: undefined | Ast.GetAttribute,
): FlatMethod => ({ fun, get, mutates });
