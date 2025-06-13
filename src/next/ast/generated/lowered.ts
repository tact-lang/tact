import type * as $ from "@/next/ast/lowered";
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/lowered-type";
import type * as $v from "@/next/ast/value";
import type * as $s from "@/next/ast/lowered-stmt";
import type { Effects } from "@/next/ast/effects";
import type { SelfType } from "@/next/ast/type-self";
import type { AsmInstruction } from "@/next/ast/root";
import type { AsmShuffle, ContractAttribute } from "@/next/ast/root";

export type LTypeParams = $.LTypeParams;
export const LTypeParams = (order: readonly $c.TypeId[], set: ReadonlySet<string>): $.LTypeParams => Object.freeze({
    order,
    set
});
export type LAlias = $.LAlias;
export const LAlias = (typeParams: $.LTypeParams, type_: $d.LType): $.LAlias => Object.freeze({
    kind: "alias",
    typeParams,
    type: type_
});
export const isLAlias = ($value: LAlias) => $value.kind === "alias";
export type LInitEmpty = $.LInitEmpty;
export const LInitEmpty = (fill: $c.Ordered<$v.Value>): $.LInitEmpty => Object.freeze({
    kind: "empty",
    fill
});
export const isLInitEmpty = ($value: LInitEmpty) => $value.kind === "empty";
export type LInitParam = $.LInitParam;
export const LInitParam = (type_: $d.LType, init: $v.Value | undefined, loc: $c.Loc): $.LInitParam => Object.freeze({
    type: type_,
    init,
    loc
});
export type LInitSimple = $.LInitSimple;
export const LInitSimple = (fill: $c.Ordered<$.LInitParam>, loc: $c.Loc): $.LInitSimple => Object.freeze({
    kind: "simple",
    fill,
    loc
});
export const isLInitSimple = ($value: LInitSimple) => $value.kind === "simple";
export type LParameter = $.LParameter;
export const LParameter = (name: $c.OptionalId, type_: $d.LType, loc: $c.Loc): $.LParameter => Object.freeze({
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
export const LStatements = (body: readonly $s.LStmt[], effects: Effects): $.LStatements => Object.freeze({
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
export type LInit = $.LInit;
export type LField = $.LField;
export const LField = (type_: $d.LType, init: $v.Value | undefined): $.LField => Object.freeze({
    kind: "field",
    type: type_,
    init
});
export const isLField = ($value: LField) => $value.kind === "field";
export type LFieldConstant<Expr> = $.LFieldConstant<Expr>;
export const LFieldConstant = <Expr,>(type_: $d.LType, init: Expr): $.LFieldConstant<Expr> => Object.freeze({
    kind: "constant",
    type: type_,
    init
});
export const isLFieldConstant = <Expr,>($value: LFieldConstant<Expr>) => $value.kind === "constant";
export type LFieldish<Expr> = $.LFieldish<Expr>;
export type LTMethod = $.LTMethod;
export const LTMethod = (mutates: boolean, typeParams: $.LTypeParams, self: SelfType, params: $.LParameters, returnType: $d.LType): $.LTMethod => Object.freeze({
    kind: "DecodedMethodType",
    mutates,
    typeParams,
    self,
    params,
    returnType
});
export const isLTMethod = ($value: LTMethod) => $value.kind === "DecodedMethodType";
export type LMethod<Body> = $.LMethod<Body>;
export const LMethod = <Body,>(type_: $.LTMethod, inline: boolean, body: Body, getMethodId: bigint | undefined): $.LMethod<Body> => Object.freeze({
    type: type_,
    inline,
    body,
    getMethodId
});
export type LReceiverMessage = $.LReceiverMessage;
export const LReceiverMessage = (name: $c.OptionalId, type_: $d.LTBounced | $d.LTRef, statements: $.LStatements): $.LReceiverMessage => Object.freeze({
    kind: "binary",
    name,
    type: type_,
    statements
});
export const isLReceiverMessage = ($value: LReceiverMessage) => $value.kind === "binary";
export type LReceiverAny = $.LReceiverAny;
export const LReceiverAny = (name: $c.OptionalId, statements: $.LStatements): $.LReceiverAny => Object.freeze({
    name,
    statements
});
export type LBounce = $.LBounce;
export const LBounce = (message: readonly $.LReceiverMessage[], messageAny: $.LReceiverAny | undefined): $.LBounce => Object.freeze({
    message,
    messageAny
});
export type LReceiverString = $.LReceiverString;
export const LReceiverString = (comment: string, statements: $.LStatements): $.LReceiverString => Object.freeze({
    kind: "string",
    comment,
    statements
});
export const isLReceiverString = ($value: LReceiverString) => $value.kind === "string";
export type LReceiverOpcode = $.LReceiverOpcode;
export type LReceiverEmpty = $.LReceiverEmpty;
export const LReceiverEmpty = (statements: $.LStatements): $.LReceiverEmpty => Object.freeze({
    statements
});
export type LReceiver = $.LReceiver;
export const LReceiver = (message: readonly $.LReceiverOpcode[], messageAny: $.LReceiverAny | undefined, stringAny: $.LReceiverAny | undefined, empty: $.LReceiverEmpty | undefined): $.LReceiver => Object.freeze({
    message,
    messageAny,
    stringAny,
    empty
});
export type LReceivers = $.LReceivers;
export const LReceivers = (bounce: $.LBounce, internal: $.LReceiver, external: $.LReceiver): $.LReceivers => Object.freeze({
    bounce,
    internal,
    external
});
export type LMembers<Expr, Body> = $.LMembers<Expr, Body>;
export const LMembers = <Expr, Body>(fieldish: $c.Ordered<$.LFieldish<Expr>>, methods: ReadonlyMap<string, $.LMethod<Body>>, receivers: $.LReceivers): $.LMembers<Expr, Body> => Object.freeze({
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
export type LContractMembers = $.LContractMembers;
export type LContract = $.LContract;
export const LContract = (attributes: readonly ContractAttribute[], init: $.LInit, content: $.LContractMembers): $.LContract => Object.freeze({
    kind: "contract",
    attributes,
    init,
    content
});
export const isLContract = ($value: LContract) => $value.kind === "contract";
export type LTraitMembers = $.LTraitMembers;
export type LTrait = $.LTrait;
export const LTrait = (content: $.LTraitMembers): $.LTrait => Object.freeze({
    kind: "trait",
    content
});
export const isLTrait = ($value: LTrait) => $value.kind === "trait";
export type LStruct = $.LStruct;
export const LStruct = (typeParams: $.LTypeParams, fields: $c.Ordered<$.LField>): $.LStruct => Object.freeze({
    kind: "struct",
    typeParams,
    fields
});
export const isLStruct = ($value: LStruct) => $value.kind === "struct";
export type LMessage = $.LMessage;
export const LMessage = (opcode: bigint, fields: $c.Ordered<$.LField>): $.LMessage => Object.freeze({
    kind: "message",
    opcode,
    fields
});
export const isLMessage = ($value: LMessage) => $value.kind === "message";
export type LUnion = $.LUnion;
export const LUnion = (typeParams: $.LTypeParams, cases: ReadonlyMap<string, ReadonlyMap<string, $.LField>>): $.LUnion => Object.freeze({
    kind: "union",
    typeParams,
    cases
});
export const isLUnion = ($value: LUnion) => $value.kind === "union";
export type LTypeDecl = $.LTypeDecl;
export type LTFunction = $.LTFunction;
export const LTFunction = (typeParams: $.LTypeParams, params: $.LParameters, returnType: $d.LType): $.LTFunction => Object.freeze({
    kind: "DecodedFnType",
    typeParams,
    params,
    returnType
});
export const isLTFunction = ($value: LTFunction) => $value.kind === "DecodedFnType";
export type LFunction = $.LFunction;
export const LFunction = (type_: $.LTFunction, inline: boolean, body: $.LBody): $.LFunction => Object.freeze({
    type: type_,
    inline,
    body
});
export type LConstant = $.LConstant;
export const LConstant = (initializer: $v.Value, type_: $d.LType): $.LConstant => Object.freeze({
    initializer,
    type: type_
});
export type LExtension = $.LExtension;
export const LExtension = (type_: $.LTMethod, inline: boolean, body: $.LBody): $.LExtension => Object.freeze({
    type: type_,
    inline,
    body
});
export type LSource = $.LSource;
export const LSource = (typeDecls: ReadonlyMap<string, $.LTypeDecl>, functions: ReadonlyMap<string, $.LFunction>, constants: ReadonlyMap<string, $.LConstant>, extensions: ReadonlyMap<string, readonly $.LExtension[]>): $.LSource => Object.freeze({
    typeDecls,
    functions,
    constants,
    extensions
});
export type LTypeDeclRefable = $.LTypeDeclRefable;
