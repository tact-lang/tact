import type * as $ from "@/next/ast/lowered";
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/checked-type";
import type * as $v from "@/next/ast/value";
import type { DecodedStatement } from "@/next/ast/checked-stmt";
import type { Effects } from "@/next/ast/generated/effects";
import type { SelfType } from "@/next/ast/type-self";
import type { AsmShuffle, ContractAttribute } from "@/next/ast/generated/root";
import type { AsmInstruction } from "@/next/ast/root";

export type LTypeParams = $.LTypeParams;
export const LTypeParams = (order: readonly $c.TypeId[], set: ReadonlySet<string>): $.LTypeParams => Object.freeze({
    order,
    set
});
export type LAliasSig = $.LAliasSig;
export const LAliasSig = (typeParams: $.LTypeParams, type_: $d.CType): $.LAliasSig => Object.freeze({
    kind: "alias",
    typeParams,
    type: type_
});
export const isLAliasSig = ($value: LAliasSig) => $value.kind === "alias";
export type LOrdered<T> = $.LOrdered<T>;
export const LOrdered = <T,>(order: readonly string[], map: ReadonlyMap<string, T>): $.LOrdered<T> => Object.freeze({
    order,
    map
});
export type LInitEmpty = $.LInitEmpty;
export const LInitEmpty = (fill: $.LOrdered<$v.Value>): $.LInitEmpty => Object.freeze({
    kind: "empty",
    fill
});
export const isLInitEmpty = ($value: LInitEmpty) => $value.kind === "empty";
export type LInitParam = $.LInitParam;
export const LInitParam = (type_: $d.CType, init: $v.Value | undefined, loc: $c.Loc): $.LInitParam => Object.freeze({
    type: type_,
    init,
    loc
});
export type LInitSimple = $.LInitSimple;
export const LInitSimple = (fill: $.LOrdered<$.LInitParam>, loc: $c.Loc): $.LInitSimple => Object.freeze({
    kind: "simple",
    fill,
    loc
});
export const isLInitSimple = ($value: LInitSimple) => $value.kind === "simple";
export type LParameter = $.LParameter;
export const LParameter = (name: $c.OptionalId, type_: $d.CType, loc: $c.Loc): $.LParameter => Object.freeze({
    name,
    type: type_,
    loc
});
export type LParameters = $.LParameters;
export const LParameters = (order: readonly $.LParameter[], set: ReadonlySet<string>): $.LParameters => Object.freeze({
    order,
    set
});
export type LStatements = $.LStatements;
export const LStatements = (body: readonly DecodedStatement[], effects: Effects): $.LStatements => Object.freeze({
    body,
    effects
});
export type LInitFn = $.LInitFn;
export const LInitFn = (params: $.LParameters, statements: $.LStatements): $.LInitFn => Object.freeze({
    kind: "function",
    params,
    statements
});
export const isLInitFn = ($value: LInitFn) => $value.kind === "function";
export type LInitSig = $.LInitSig;
export type LInhFieldSig = $.LInhFieldSig;
export const LInhFieldSig = (type_: $d.CType, init: $v.Value | undefined): $.LInhFieldSig => Object.freeze({
    kind: "field",
    type: type_,
    init
});
export const isLInhFieldSig = ($value: LInhFieldSig) => $value.kind === "field";
export type LFieldConstSig<Expr> = $.LFieldConstSig<Expr>;
export const LFieldConstSig = <Expr,>(overridable: boolean, type_: $d.CType, init: Expr): $.LFieldConstSig<Expr> => Object.freeze({
    kind: "constant",
    overridable,
    type: type_,
    init
});
export const isLFieldConstSig = <Expr,>($value: LFieldConstSig<Expr>) => $value.kind === "constant";
export type LFieldish<Expr> = $.LFieldish<Expr>;
export type LDecodedMethodType = $.LDecodedMethodType;
export const LDecodedMethodType = (mutates: boolean, typeParams: $.LTypeParams, self: SelfType, params: $.LParameters, returnType: $d.CType): $.LDecodedMethodType => Object.freeze({
    kind: "DecodedMethodType",
    mutates,
    typeParams,
    self,
    params,
    returnType
});
export const isLDecodedMethodType = ($value: LDecodedMethodType) => $value.kind === "DecodedMethodType";
export type LMethodSig<Body> = $.LMethodSig<Body>;
export const LMethodSig = <Body,>(overridable: boolean, type_: $.LDecodedMethodType, inline: boolean, body: Body, getMethodId: bigint | undefined): $.LMethodSig<Body> => Object.freeze({
    overridable,
    type: type_,
    inline,
    body,
    getMethodId
});
export type LMessageRecv = $.LMessageRecv;
export const LMessageRecv = (name: $c.OptionalId, type_: $d.CTRef, statements: $.LStatements): $.LMessageRecv => Object.freeze({
    kind: "binary",
    name,
    type: type_,
    statements
});
export const isLMessageRecv = ($value: LMessageRecv) => $value.kind === "binary";
export type LMessageAnyRecv = $.LMessageAnyRecv;
export const LMessageAnyRecv = (name: $c.OptionalId, statements: $.LStatements): $.LMessageAnyRecv => Object.freeze({
    name,
    statements
});
export type LBounceSig = $.LBounceSig;
export const LBounceSig = (message: readonly $.LMessageRecv[], messageAny: $.LMessageAnyRecv | undefined): $.LBounceSig => Object.freeze({
    message,
    messageAny
});
export type LStringRecv = $.LStringRecv;
export const LStringRecv = (comment: string, statements: $.LStatements): $.LStringRecv => Object.freeze({
    kind: "string",
    comment,
    statements
});
export const isLStringRecv = ($value: LStringRecv) => $value.kind === "string";
export type LOpcodeRecv = $.LOpcodeRecv;
export type LStringAnyRecv = $.LStringAnyRecv;
export const LStringAnyRecv = (name: $c.OptionalId, statements: $.LStatements): $.LStringAnyRecv => Object.freeze({
    name,
    statements
});
export type LEmptyRecv = $.LEmptyRecv;
export const LEmptyRecv = (statements: $.LStatements): $.LEmptyRecv => Object.freeze({
    statements
});
export type LRecvSig = $.LRecvSig;
export const LRecvSig = (message: readonly $.LOpcodeRecv[], messageAny: $.LMessageAnyRecv | undefined, stringAny: $.LStringAnyRecv | undefined, empty: $.LEmptyRecv | undefined): $.LRecvSig => Object.freeze({
    message,
    messageAny,
    stringAny,
    empty
});
export type LReceivers = $.LReceivers;
export const LReceivers = (bounce: $.LBounceSig, internal: $.LRecvSig, external: $.LRecvSig): $.LReceivers => Object.freeze({
    bounce,
    internal,
    external
});
export type LCommonSig<Expr, Body> = $.LCommonSig<Expr, Body>;
export const LCommonSig = <Expr, Body>(fieldish: $.LOrdered<$.LFieldish<Expr>>, methods: ReadonlyMap<string, $.LMethodSig<Body>>, receivers: $.LReceivers): $.LCommonSig<Expr, Body> => Object.freeze({
    fieldish,
    methods,
    receivers
});
export type LTactBody = $.LTactBody;
export const LTactBody = (statements: $.LStatements): $.LTactBody => Object.freeze({
    kind: "tact",
    statements
});
export const isLTactBody = ($value: LTactBody) => $value.kind === "tact";
export type LFuncBody = $.LFuncBody;
export const LFuncBody = (nativeName: $c.FuncId): $.LFuncBody => Object.freeze({
    kind: "func",
    nativeName
});
export const isLFuncBody = ($value: LFuncBody) => $value.kind === "func";
export type LFiftBody = $.LFiftBody;
export const LFiftBody = (shuffle: AsmShuffle, instructions: readonly AsmInstruction[]): $.LFiftBody => Object.freeze({
    kind: "fift",
    shuffle,
    instructions
});
export const isLFiftBody = ($value: LFiftBody) => $value.kind === "fift";
export type LBody = $.LBody;
export type LContractContent = $.LContractContent;
export type LContractSig = $.LContractSig;
export const LContractSig = (attributes: readonly ContractAttribute[], init: $.LInitSig, content: $.LContractContent): $.LContractSig => Object.freeze({
    kind: "contract",
    attributes,
    init,
    content
});
export const isLContractSig = ($value: LContractSig) => $value.kind === "contract";
export type LTraitContent = $.LTraitContent;
export type LTraitSig = $.LTraitSig;
export const LTraitSig = (content: $.LTraitContent): $.LTraitSig => Object.freeze({
    kind: "trait",
    content
});
export const isLTraitSig = ($value: LTraitSig) => $value.kind === "trait";
export type LStructSig = $.LStructSig;
export const LStructSig = (typeParams: $.LTypeParams, fields: $.LOrdered<$.LInhFieldSig>): $.LStructSig => Object.freeze({
    kind: "struct",
    typeParams,
    fields
});
export const isLStructSig = ($value: LStructSig) => $value.kind === "struct";
export type LMessageSig = $.LMessageSig;
export const LMessageSig = (opcode: bigint, fields: $.LOrdered<$.LInhFieldSig>): $.LMessageSig => Object.freeze({
    kind: "message",
    opcode,
    fields
});
export const isLMessageSig = ($value: LMessageSig) => $value.kind === "message";
export type LUnionSig = $.LUnionSig;
export const LUnionSig = (typeParams: $.LTypeParams, cases: ReadonlyMap<string, ReadonlyMap<string, $.LInhFieldSig>>): $.LUnionSig => Object.freeze({
    kind: "union",
    typeParams,
    cases
});
export const isLUnionSig = ($value: LUnionSig) => $value.kind === "union";
export type LTypeDeclSig = $.LTypeDeclSig;
export type LDecodedFnType = $.LDecodedFnType;
export const LDecodedFnType = (typeParams: $.LTypeParams, params: $.LParameters, returnType: $d.CType): $.LDecodedFnType => Object.freeze({
    kind: "DecodedFnType",
    typeParams,
    params,
    returnType
});
export const isLDecodedFnType = ($value: LDecodedFnType) => $value.kind === "DecodedFnType";
export type LFnSig = $.LFnSig;
export const LFnSig = (type_: $.LDecodedFnType, inline: boolean, body: $.LBody): $.LFnSig => Object.freeze({
    type: type_,
    inline,
    body
});
export type LConstSig = $.LConstSig;
export const LConstSig = (initializer: $v.Value, type_: $d.CType): $.LConstSig => Object.freeze({
    initializer,
    type: type_
});
export type LExtSig = $.LExtSig;
export const LExtSig = (type_: $.LDecodedMethodType, inline: boolean, body: $.LBody): $.LExtSig => Object.freeze({
    type: type_,
    inline,
    body
});
export type LoweredSource = $.LSource;
export const LoweredSource = (typeDecls: ReadonlyMap<string, $.LTypeDeclSig>, functions: ReadonlyMap<string, $.LFnSig>, constants: ReadonlyMap<string, $.LConstSig>, extensions: ReadonlyMap<string, readonly $.LExtSig[]>): $.LSource => Object.freeze({
    typeDecls,
    functions,
    constants,
    extensions
});
export type LDecodedParameter = $.LDecodedParameter;
export const LDecodedParameter = (name: $c.OptionalId, type_: $d.CType, loc: $c.Loc): $.LDecodedParameter => Object.freeze({
    name,
    type: type_,
    loc
});