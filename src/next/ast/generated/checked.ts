/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/dtype";
import type * as $m from "@/next/ast/mtype";
import type * as $v from "@/next/ast/via";
import type * as $ from "@/next/ast/checked";
import type { TactImport } from "@/next/imports/source";
import type { Lazy } from "@/next/ast/lazy";
import type { AsmInstruction, AsmShuffle, ContractAttribute } from "@/next/ast/root";
import type { DecodedStatement } from "@/next/ast/checked-stmt";
import type { DecodedExpression } from "@/next/ast/checked-expr";

export type TypeParams = $.TypeParams;
export const TypeParams = (order: readonly $c.TypeId[], set: ReadonlySet<string>): TypeParams => Object.freeze({
    order,
    set,
});
export type AliasSig = $.AliasSig;
export const AliasSig = (typeParams: $.TypeParams, type_: Lazy<$d.DecodedType>): $.AliasSig => Object.freeze({
    kind: 'alias',
    typeParams,
    type: type_,
});
export type Ordered<V> = $.Ordered<V>;
export const Ordered = <V>(order: readonly string[], map: ReadonlyMap<string, V>): $.Ordered<V> => Object.freeze({
    order,
    map
});

export type DecodedFnType = $.DecodedFnType;
export const DecodedFnType = (typeParams: $.TypeParams, params: $.Parameters, returnType: Lazy<$d.DecodedType>): $.DecodedFnType => Object.freeze({
    kind: "DecodedFnType",
    typeParams,
    params,
    returnType
});
export type MessageRecv = $.MessageRecv;
export const MessageRecv = (name: $c.OptionalId, type_: $d.DTypeRef): $.MessageRecv => Object.freeze({
    name,
    type: type_,
});
export type MessageAnyRecv = $.MessageAnyRecv;
export const MessageAnyRecv = (name: $c.OptionalId): $.MessageAnyRecv => Object.freeze({
    name,
});
export type BounceSig = $.BounceSig;
export const BounceSig = (message: ReadonlyMap<string, DeclMem<$.MessageRecv>>, messageAny: DeclMem<$.MessageAnyRecv> | undefined): $.BounceSig => Object.freeze({
    message,
    messageAny
});
export type StringRecv = $.StringRecv;
export const StringRecv = (comment: string): $.StringRecv => Object.freeze({
    comment,
});
export type StringAnyRecv = $.StringAnyRecv;
export const StringAnyRecv = (name: $c.OptionalId): $.StringAnyRecv => Object.freeze({
    name,
});
export type EmptyRecv = $.EmptyRecv;
export const EmptyRecv = (): $.EmptyRecv => Object.freeze({
    one: 1,
});
export type RecvSig = $.RecvSig;
export const RecvSig = (
    message: ReadonlyMap<string, DeclMem<$.MessageRecv>>,
    messageAny: DeclMem<$.MessageAnyRecv> | undefined,
    string_: ReadonlyMap<string, DeclMem<$.StringRecv>>,
    stringAny: DeclMem<$.StringAnyRecv> | undefined,
    empty: DeclMem<$.EmptyRecv> | undefined
): $.RecvSig => Object.freeze({
    message,
    messageAny,
    string: string_,
    stringAny,
    empty
});
export type FieldSig = $.FieldSig;
export const FieldSig = (type_: Lazy<$d.DecodedType>, via: $v.ViaUser): $.FieldSig => Object.freeze({
    type: type_,
    via
});
export type StructSig = $.StructSig;
export const StructSig = (typeParams: $.TypeParams, fields: $.Ordered<$.FieldSig>): $.StructSig => Object.freeze({
    kind: "struct",
    typeParams,
    fields,
});
export const isStructSig = ($value: StructSig) => $value.kind === "struct";
export type MessageSig = $.MessageSig;
export const MessageSig = (typeParams: $.TypeParams, fields: $.Ordered<$.FieldSig>): $.MessageSig => Object.freeze({
    kind: "message",
    typeParams,
    fields,
});
export const isMessageSig = ($value: MessageSig) => $value.kind === "message";
export type UnionSig = $.UnionSig;
export const UnionSig = (typeParams: $.TypeParams, cases: ReadonlyMap<string, ReadonlyMap<string, Lazy<$d.DecodedType>>>): $.UnionSig => Object.freeze({
    kind: "union",
    typeParams,
    cases,
});
export const isUnionSig = ($value: UnionSig) => $value.kind === "union";
export type TypeDeclSig = $.TypeDeclSig;
export type ConstSig = $.ConstSig;
export const ConstSig = (init: Lazy<DecodedExpression>, type_: Lazy<$d.DecodedType>): $.ConstSig => Object.freeze({
    initializer: init,
    type: type_,
});
export type ExtSig = $.ExtSig;
export const ExtSig = (type: $.DecodedMethodType, inline: boolean, body: $.Body): $.ExtSig => Object.freeze({
    type,
    inline,
    body,
});
export type Scope = $.Scope;
export type Decl<T> = $.Decl<T>;
export const Decl = <T>(decl: T, via: $v.ViaUser): Decl<T> => ({
    decl, via
});
export const Scope = (typeDecls: ReadonlyMap<string, $.Decl<$.TypeDeclSig>>, fnSigs: ReadonlyMap<string, $.Decl<$.FnSig>>, constSigs: ReadonlyMap<string, $.Decl<$.ConstSig>>, extSigs: ReadonlyMap<string, Lazy<readonly $.Decl<$.ExtSig>[]>>): $.Scope => Object.freeze({
    typeDecls,
    functions: fnSigs,
    constants: constSigs,
    extensions: extSigs
});
export type DecodedMethodType = $.DecodedMethodType;
export const DecodedMethodType = (mutates: boolean, typeParams: $.TypeParams, self: $m.SelfType, params: $.Parameters, returnType: Lazy<$d.DecodedType>): $.DecodedMethodType => Object.freeze({
    kind: "DecodedMethodType",
    mutates,
    typeParams,
    self,
    params,
    returnType
});
export type DecodedParameter = $.DecodedParameter;
export const DecodedParameter = (name: $c.OptionalId, type_: Lazy<$d.DecodedType>, loc: $c.Loc): $.DecodedParameter => Object.freeze({
    name,
    type: type_,
    loc
});
export type SourceCheckResult = $.SourceCheckResult;
export const SourceCheckResult = (importedBy: TactImport, globals: $.Scope): $.SourceCheckResult => Object.freeze({
    importedBy,
    globals
});
export type Parameter = $.Parameter;
export const Parameter = (name: $c.OptionalId, type_: Lazy<$d.DecodedType>, loc: $c.Loc): $.Parameter => Object.freeze({
    name,
    type: type_,
    loc
});
export type Parameters = $.Parameters;
export const Parameters = (order: readonly $.Parameter[], set: ReadonlySet<string>): $.Parameters => Object.freeze({
    order,
    set
});
export type TactBody = $.TactBody;
export const TactBody = (statements: readonly DecodedStatement[]): $.TactBody => Object.freeze({
    kind: "tact",
    statements
});
export const isTactBody = ($value: TactBody) => $value.kind === "tact";
export type FuncBody = $.FuncBody;
export const FuncBody = (nativeName: $c.FuncId): $.FuncBody => Object.freeze({
    kind: "func",
    nativeName
});
export const isFuncBody = ($value: FuncBody) => $value.kind === "func";
export type FiftBody = $.FiftBody;
export const FiftBody = (shuffle: Lazy<AsmShuffle>, instructions: readonly AsmInstruction[]): $.FiftBody => Object.freeze({
    kind: "fift",
    shuffle,
    instructions
});
export const isFiftBody = ($value: FiftBody) => $value.kind === "fift";
export type Body = $.Body;
export type FnSig = $.FnSig;
export const FnSig = (type_: $.DecodedFnType, inline: boolean, body: $.Body): $.FnSig => Object.freeze({
    type: type_,
    inline,
    body,
});
export type DeclMem<T> = $.DeclMem<T>;
export const DeclMem = <T>(decl: T, via: $v.ViaMember): DeclMem<T> => ({
    decl, via
});
export type InhFieldSig<Expr> = $.InhFieldSig<Expr>;
export const InhFieldSig = <Expr,>(type_: Lazy<$d.DecodedType>, init: Expr): $.InhFieldSig<Expr> => Object.freeze({
    kind: "field",
    type: type_,
    init
});
export const isInhFieldSig = <Expr,>($value: InhFieldSig<Expr>) => $value.kind === "field";
export type FieldConstSig<Expr> = $.FieldConstSig<Expr>;
export const FieldConstSig = <Expr,>(overridable: boolean, type_: Lazy<$d.DecodedType>, init: Expr): $.FieldConstSig<Expr> => Object.freeze({
    kind: "constant",
    overridable,
    type: type_,
    init
});
export const isFieldConstSig = <Expr,>($value: FieldConstSig<Expr>) => $value.kind === "constant";
export type Fieldish<Expr> = $.Fieldish<Expr>;
export type MethodSig<Body> = $.MethodSig<Body>;
export const MethodSig = <Body,>(overridable: boolean, type_: $.DecodedMethodType, inline: boolean, body: Body, getMethodId: Lazy<bigint> | undefined): $.MethodSig<Body> => Object.freeze({
    overridable,
    type: type_,
    inline,
    body,
    getMethodId
});
export type CommonSig<Expr, Body> = $.CommonSig<Expr, Body>;
export const CommonSig = <Expr, Body>(fieldish: $.Ordered<$.DeclMem<$.Fieldish<Expr>>>, methods: ReadonlyMap<string, $.DeclMem<$.MethodSig<Body>>>, bounce: $.BounceSig, internal: $.RecvSig, external: $.RecvSig): $.CommonSig<Expr, Body> => Object.freeze({
    fieldish,
    methods,
    bounce,
    internal,
    external
});
export type ContractSig = $.ContractSig;
export const ContractSig = (attributes: readonly ContractAttribute[], params: $.Parameters, content: Lazy<$.CommonSig<Lazy<DecodedExpression>, $.Body>>): $.ContractSig => Object.freeze({
    kind: "contract",
    attributes,
    params,
    content
});
export const isContractSig = ($value: ContractSig) => $value.kind === "contract";
export type ContractContent = $.ContractContent;
export type TraitContent = $.TraitContent;
export type TraitSig = $.TraitSig;
export const TraitSig = (content: Lazy<$.CommonSig<Lazy<DecodedExpression> | undefined, $.Body | undefined>>): $.TraitSig => Object.freeze({
    kind: "trait",
    content
});
export const isTraitSig = ($value: TraitSig) => $value.kind === "trait";
