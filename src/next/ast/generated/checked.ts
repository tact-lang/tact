/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/dtype";
import type * as $m from "@/next/ast/mtype";
import type * as $v from "@/next/ast/via";
import type * as $ from "@/next/ast/checked";
import type { TactImport } from "@/next/imports/source";
import type { Thunk } from "@/next/ast/lazy";
import type { AsmInstruction, AsmShuffle, ContractAttribute } from "@/next/ast/root";
import type { DecodedStatement } from "@/next/ast/checked-stmt";
import type { Value } from "@/next/ast/value";
import type { Effects } from "@/next/ast/effects";

export type TypeParams = $.TypeParams;
export const TypeParams = (order: readonly $c.TypeId[], set: ReadonlySet<string>): TypeParams => Object.freeze({
    order,
    set,
});
export type AliasSig = $.AliasSig;
export const AliasSig = (typeParams: $.TypeParams, type_: Thunk<$d.DecodedType>): $.AliasSig => Object.freeze({
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
export const DecodedFnType = (typeParams: $.TypeParams, params: $.Parameters, returnType: Thunk<$d.DecodedType>): $.DecodedFnType => Object.freeze({
    kind: "DecodedFnType",
    typeParams,
    params,
    returnType
});
export type BounceSig = $.BounceSig;
export const BounceSig = (message: readonly DeclMem<MessageRecv>[], messageAny: DeclMem<$.MessageAnyRecv> | undefined): $.BounceSig => Object.freeze({
    message,
    messageAny
});

export type StructSig = $.StructSig;
export const StructSig = (typeParams: $.TypeParams, fields: $.Ordered<$.InhFieldSig>): $.StructSig => Object.freeze({
    kind: "struct",
    typeParams,
    fields,
});
export const isStructSig = ($value: StructSig) => $value.kind === "struct";
export type UnionSig = $.UnionSig;
export const UnionSig = (typeParams: $.TypeParams, cases: ReadonlyMap<string, ReadonlyMap<string, InhFieldSig>>): $.UnionSig => Object.freeze({
    kind: "union",
    typeParams,
    cases,
});
export const isUnionSig = ($value: UnionSig) => $value.kind === "union";
export type TypeDeclSig = $.TypeDeclSig;
export type ConstSig = $.ConstSig;
export const ConstSig = (init: Thunk<Value | undefined>, type_: Thunk<$d.DecodedType>): $.ConstSig => Object.freeze({
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
export const Scope = (typeDecls: ReadonlyMap<string, $.Decl<$.TypeDeclSig>>, fnSigs: ReadonlyMap<string, $.Decl<$.FnSig>>, constSigs: ReadonlyMap<string, $.Decl<$.ConstSig>>, extSigs: ReadonlyMap<string, Thunk<readonly $.Decl<$.ExtSig>[]>>): $.Scope => Object.freeze({
    typeDecls,
    functions: fnSigs,
    constants: constSigs,
    extensions: extSigs
});
export type DecodedMethodType = $.DecodedMethodType;
export const DecodedMethodType = (mutates: boolean, typeParams: $.TypeParams, self: $m.SelfType, params: $.Parameters, returnType: Thunk<$d.DecodedType>): $.DecodedMethodType => Object.freeze({
    kind: "DecodedMethodType",
    mutates,
    typeParams,
    self,
    params,
    returnType
});
export type DecodedParameter = $.DecodedParameter;
export const DecodedParameter = (name: $c.OptionalId, type_: Thunk<$d.DecodedType>, loc: $c.Loc): $.DecodedParameter => Object.freeze({
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
export const Parameter = (name: $c.OptionalId, type_: Thunk<$d.DecodedType>, loc: $c.Loc): $.Parameter => Object.freeze({
    name,
    type: type_,
    loc
});
export type Recover<T> = $.Recover<T>;
export type Parameters = $.Parameters;
export const Parameters = (order: readonly $.Parameter[], set: ReadonlySet<string>): $.Parameters => Object.freeze({
    order,
    set
});
export type TactBody = $.TactBody;
export const TactBody = (statements: Thunk<StatementsAux | undefined>): $.TactBody => Object.freeze({
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
export const FiftBody = (shuffle: Thunk<AsmShuffle | undefined>, instructions: readonly AsmInstruction[]): $.FiftBody => Object.freeze({
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
export type InhFieldSig = $.InhFieldSig;
export const InhFieldSig = (type_: Thunk<$d.DecodedType>, init: Thunk<Value | undefined> | undefined): $.InhFieldSig => Object.freeze({
    kind: "field",
    type: type_,
    init
});
export const isInhFieldSig = ($value: InhFieldSig) => $value.kind === "field";
export type FieldConstSig<Expr> = $.FieldConstSig<Expr>;
export const FieldConstSig = <Expr,>(overridable: boolean, type_: Thunk<$d.DecodedType>, init: Expr): $.FieldConstSig<Expr> => Object.freeze({
    kind: "constant",
    overridable,
    type: type_,
    init
});
export const isFieldConstSig = <Expr,>($value: FieldConstSig<Expr>) => $value.kind === "constant";
export type Fieldish<Expr> = $.Fieldish<Expr>;
export type MethodSig<Body> = $.MethodSig<Body>;
export const MethodSig = <Body,>(overridable: boolean, type_: $.DecodedMethodType, inline: boolean, body: Body, getMethodId: Thunk<undefined | bigint> | undefined): $.MethodSig<Body> => Object.freeze({
    overridable,
    type: type_,
    inline,
    body,
    getMethodId
});
export type Receivers = $.Receivers;
export type CommonSig<Expr, Body> = $.CommonSig<Expr, Body>;
export const CommonSig = <Expr, Body>(fieldish: $.Ordered<$.DeclMem<$.Fieldish<Expr>>>, methods: ReadonlyMap<string, $.DeclMem<$.MethodSig<Body>>>, receivers: $.Receivers): $.CommonSig<Expr, Body> => Object.freeze({
    fieldish,
    methods,
    receivers
});
export type ContractContent = $.ContractContent;
export type TraitContent = $.TraitContent;
export type TraitSig = $.TraitSig;
export const TraitSig = (content: Thunk<$.CommonSig<Thunk<Value | undefined> | undefined, $.Body | undefined>>): $.TraitSig => Object.freeze({
    kind: "trait",
    content
});
export const isTraitSig = ($value: TraitSig) => $value.kind === "trait";
export type MessageRecv = $.MessageRecv;
export const MessageRecv = (name: $c.OptionalId, type_: $d.DTypeRef | $d.DTypeBounced, statements: Thunk<undefined | StatementsAux>): $.MessageRecv => Object.freeze({
    kind: "binary",
    name,
    type: type_,
    statements
});
export type MessageAnyRecv = $.MessageAnyRecv;
export const MessageAnyRecv = (name: $c.OptionalId, statements: Thunk<undefined | StatementsAux>): $.MessageAnyRecv => Object.freeze({
    name,
    statements
});
export type StringRecv = $.StringRecv;
export const StringRecv = (comment: string, statements: Thunk<undefined | StatementsAux>): $.StringRecv => Object.freeze({
    kind: "string",
    comment,
    statements
});
export type StringAnyRecv = $.StringAnyRecv;
export const StringAnyRecv = (name: $c.OptionalId, statements: Thunk<undefined | StatementsAux>): $.StringAnyRecv => Object.freeze({
    name,
    statements
});
export type EmptyRecv = $.EmptyRecv;
export const EmptyRecv = (statements: Thunk<undefined | StatementsAux>): $.EmptyRecv => Object.freeze({
    statements
});
export type OpcodeRecv = $.OpcodeRecv;
export type RecvSig = $.RecvSig;
export const RecvSig = (message: readonly DeclMem<OpcodeRecv>[], messageAny: $.DeclMem<$.MessageAnyRecv> | undefined, stringAny: $.DeclMem<$.StringAnyRecv> | undefined, empty: $.DeclMem<$.EmptyRecv> | undefined): $.RecvSig => Object.freeze({
    message,
    messageAny,
    stringAny,
    empty
});
export type MessageSig = $.MessageSig;
export const MessageSig = (opcode: Thunk<undefined | bigint>, fields: $.Ordered<$.InhFieldSig>): $.MessageSig => Object.freeze({
    kind: "message",
    opcode,
    fields
});
export const isMessageSig = ($value: MessageSig) => $value.kind === "message";
export type InitEmpty = $.InitEmpty;
export const InitEmpty = (fill: Thunk<undefined | $.Ordered<Thunk<Value | undefined>>>): $.InitEmpty => Object.freeze({
    kind: "empty",
    fill
});
export const isInitEmpty = ($value: InitEmpty) => $value.kind === "empty";
export type InitParam = $.InitParam;
export const InitParam = (type_: Thunk<$d.DecodedType>, init: Thunk<Value | undefined> | undefined, loc: $c.Loc): $.InitParam => Object.freeze({
    type: type_,
    init,
    loc
});
export type InitSimple = $.InitSimple;
export const InitSimple = (fill: $.Ordered<$.InitParam>, loc: $c.Loc): $.InitSimple => Object.freeze({
    kind: "simple",
    fill,
    loc
});
export const isInitSimple = ($value: InitSimple) => $value.kind === "simple";
export type StatementsAux = $.StatementsAux 
export const StatementsAux = (body: readonly DecodedStatement[], effects: Effects): $.StatementsAux => Object.freeze({
    body, effects,
});
export type InitFn = $.InitFn;
export const InitFn = (params: $.Parameters, statements: Thunk<undefined | StatementsAux>): $.InitFn => Object.freeze({
    kind: "function",
    params,
    statements
});
export const isInitFn = ($value: InitFn) => $value.kind === "function";
export type Statements = $.Statements;
export type InitSig = $.InitSig;
export type ContractSig = $.ContractSig;
export type TypeDeclRefable = $.TypeDeclRefable;
export const ContractSig = (attributes: readonly ContractAttribute[], init: $.InitSig, content: Thunk<$.ContractContent>): $.ContractSig => Object.freeze({
    kind: "contract",
    attributes,
    init,
    content
});
export const isContractSig = ($value: ContractSig) => $value.kind === "contract";
