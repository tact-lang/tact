/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/dtype";
import type * as $m from "@/next/ast/mtype";
import type * as $v from "@/next/ast/via";
import type * as $ from "@/next/ast/checked";
import type { TactImport } from "@/next/imports/source";

export type TypeUse = $.TypeUse;
export const allTypeUse: readonly $.TypeUse[] = ["usual", "alias", "forbidden"];
export type DeclSig = $.DeclSig;
export const DeclSig = (use: $.TypeUse, arity: number, via: $v.ViaUser): $.DeclSig => Object.freeze({
    use,
    arity,
    via
});
export type DeclSigs = $.DeclSigs;
export type TypeParams = $.TypeParams;
export const TypeParams = (order: readonly $c.TypeId[], set: ReadonlySet<string>): TypeParams => Object.freeze({
    order,
    set,
});
export type AliasSig = $.AliasSig;
export const AliasSig = (typeParams: $.TypeParams, type_: $d.DecodedType, via: $v.ViaUser): $.AliasSig => Object.freeze({
    kind: 'alias',
    typeParams,
    type: type_,
    via
});
export type Ordered<V> = $.Ordered<V>;
export const Ordered = <V>(order: readonly string[], map: ReadonlyMap<string, V>): $.Ordered<V> => Object.freeze({
    order,
    map
});
export type InhFieldSig = $.InhFieldSig;
export const InhFieldSig = (type_: $d.DecodedType, via: $v.ViaMember): $.InhFieldSig => Object.freeze({
    type: type_,
    via
});
export type FieldConstSig = $.FieldConstSig;
export const FieldConstSig = (overridable: boolean, override: boolean, type_: $d.DecodedType, via: $v.ViaMember): $.FieldConstSig => Object.freeze({
    overridable,
    override,
    type: type_,
    via
});
export type DecodedFnType = $.DecodedFnType;
export const DecodedFnType = (typeParams: $.TypeParams, params: $.Parameters, returnType: $d.DecodedType): $.DecodedFnType => Object.freeze({
    typeParams,
    params,
    returnType
});
export type MethodSig = $.MethodSig;
export const MethodSig = (overridable: boolean, override: boolean, type_: $.DecodedFnType, via: $v.ViaMember): $.MethodSig => Object.freeze({
    overridable,
    override,
    type: type_,
    via
});
export type MessageRecv = $.MessageRecv;
export const MessageRecv = (name: $c.OptionalId, type_: $d.DTypeRef, via: $v.ViaMember): $.MessageRecv => Object.freeze({
    name,
    type: type_,
    via
});
export type MessageAnyRecv = $.MessageAnyRecv;
export const MessageAnyRecv = (name: $c.OptionalId, via: $v.ViaMember): $.MessageAnyRecv => Object.freeze({
    name,
    via
});
export type BounceSig = $.BounceSig;
export const BounceSig = (message: ReadonlyMap<string, $.MessageRecv>, messageAny: $.MessageAnyRecv | undefined): $.BounceSig => Object.freeze({
    message,
    messageAny
});
export type StringRecv = $.StringRecv;
export const StringRecv = (comment: string, via: $v.ViaMember): $.StringRecv => Object.freeze({
    comment,
    via
});
export type StringAnyRecv = $.StringAnyRecv;
export const StringAnyRecv = (name: $c.OptionalId, via: $v.ViaMember): $.StringAnyRecv => Object.freeze({
    name,
    via
});
export type EmptyRecv = $.EmptyRecv;
export const EmptyRecv = (via: $v.ViaMember): $.EmptyRecv => Object.freeze({
    via
});
export type RecvSig = $.RecvSig;
export const RecvSig = (message: ReadonlyMap<string, $.MessageRecv>, messageAny: $.MessageAnyRecv | undefined, string_: ReadonlyMap<string, $.StringRecv>, stringAny: $.StringAnyRecv | undefined, empty: $.EmptyRecv | undefined): $.RecvSig => Object.freeze({
    message,
    messageAny,
    string: string_,
    stringAny,
    empty
});
export type CommonSig = $.CommonSig;
export const CommonSig = (name: $c.TypeId, fields: $.Ordered<$.InhFieldSig>, constants: ReadonlyMap<string, $.FieldConstSig>, methods: ReadonlyMap<string, $.MethodSig>, bounce: $.BounceSig, internal: $.RecvSig, external: $.RecvSig): $.CommonSig => Object.freeze({
    name,
    fields,
    constants,
    methods,
    bounce,
    internal,
    external
});
export type ContractSig = $.ContractSig;
export const ContractSig = (init: $.Parameters, content: $.CommonSig, via: $v.ViaUser): $.ContractSig => Object.freeze({
    kind: 'contract',
    init,
    content,
    via,
});
export type TraitSig = $.TraitSig;
export const TraitSig = (content: $.CommonSig, via: $v.ViaUser): $.TraitSig => Object.freeze({
    kind: 'trait',
    content,
    via
});
export type FieldSig = $.FieldSig;
export const FieldSig = (type_: $d.DecodedType, via: $v.ViaUser): $.FieldSig => Object.freeze({
    type: type_,
    via
});
export type StructSig = $.StructSig;
export const StructSig = (typeParams: $.TypeParams, fields: $.Ordered<$.FieldSig>, via: $v.ViaUser): $.StructSig => Object.freeze({
    kind: "struct",
    typeParams,
    fields,
    via
});
export const isStructSig = ($value: StructSig) => $value.kind === "struct";
export type MessageSig = $.MessageSig;
export const MessageSig = (typeParams: $.TypeParams, fields: $.Ordered<$.FieldSig>, via: $v.ViaUser): $.MessageSig => Object.freeze({
    kind: "message",
    typeParams,
    fields,
    via
});
export const isMessageSig = ($value: MessageSig) => $value.kind === "message";
export type UnionSig = $.UnionSig;
export const UnionSig = (typeParams: $.TypeParams, cases: ReadonlyMap<string, ReadonlyMap<string, $d.DecodedType>>, via: $v.ViaUser): $.UnionSig => Object.freeze({
    kind: "union",
    typeParams,
    cases,
    via
});
export const isUnionSig = ($value: UnionSig) => $value.kind === "union";
export type TypeDeclSig = $.TypeDeclSig;
export type FnSig = $.FnSig;
export const FnSig = (type_: $.DecodedFnType, via: $v.ViaUser): $.FnSig => Object.freeze({
    type: type_,
    via
});
export type ConstSig = $.ConstSig;
export const ConstSig = (type_: $d.DecodedType, via: $v.ViaUser): $.ConstSig => Object.freeze({
    type: type_,
    via
});
export type ExtSig = $.ExtSig;
export const ExtSig = (type: $.DecodedMethodType, via: $v.ViaUser): $.ExtSig => Object.freeze({
    type,
    via
});
export type Scope = $.Scope;
export const Scope = (typeDecls: ReadonlyMap<string, $.TypeDeclSig>, fnSigs: ReadonlyMap<string, $.FnSig>, constSigs: ReadonlyMap<string, $.ConstSig>, extSigs: ReadonlyMap<string, readonly $.ExtSig[]>): $.Scope => Object.freeze({
    typeDecls,
    fnSigs,
    constSigs,
    extSigs
});
export type DecodedMethodType = $.DecodedMethodType;
export const DecodedMethodType = (typeParams: $.TypeParams, self: $m.SelfType, params: $.Parameters, returnType: $d.DecodedType): $.DecodedMethodType => Object.freeze({
    typeParams,
    self,
    params,
    returnType
});
export type DecodedParameter = $.DecodedParameter;
export const DecodedParameter = (name: $c.OptionalId, type_: $d.DecodedType, loc: $c.Loc): $.DecodedParameter => Object.freeze({
    name,
    type: type_,
    loc
});
export type SourceCheckResult = $.SourceCheckResult;
export const SourceCheckResult = (importedBy: TactImport, globals: $.Scope): $.SourceCheckResult => Object.freeze({
    importedBy,
    globals
});
export type BadSig = $.BadSig;
export const BadSig = (
    arity: number,
    via: $v.ViaUser,
): $.BadSig => Object.freeze({
    kind: "bad",
    arity,
    via,
});
export const isBadSig = ($value: BadSig) => $value.kind === "bad";
export type Parameter = $.Parameter;
export const Parameter = (name: $c.OptionalId, type_: $d.DecodedType, loc: $c.Loc): $.Parameter => Object.freeze({
    name,
    type: type_,
    loc
});
export type Parameters = $.Parameters;
export const Parameters = (order: readonly $.Parameter[], set: ReadonlySet<string>): $.Parameters => Object.freeze({
    order,
    set
});