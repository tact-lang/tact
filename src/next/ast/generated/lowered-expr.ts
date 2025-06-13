import type * as $ from "@/next/ast/lowered-expr";
import type * as $t from "@/next/ast/lowered-type";
import type * as $c from "@/next/ast/common";
import type { BinaryOperation, NumberBase, UnaryOperation } from "@/next/ast/expression";
import type { SelfType } from "@/next/ast/type-self";

export type LTypeArgs = $.LTypeArgs;
export type LCodeOf = $.LCodeOf;
export const LCodeOf = (contract: $c.TypeId, computedType: $t.LType, loc: $c.Loc): $.LCodeOf => Object.freeze({
    kind: "code_of",
    contract,
    computedType,
    loc
});
export const isLCodeOf = ($value: LCodeOf) => $value.kind === "code_of";
export type LNumber = $.LNumber;
export const LNumber = (base: NumberBase, value: bigint, computedType: $t.LTBasic, loc: $c.Loc): $.LNumber => Object.freeze({
    kind: "number",
    base,
    value,
    computedType,
    loc
});
export const isLNumber = ($value: LNumber) => $value.kind === "number";
export type LBoolean = $.LBoolean;
export const LBoolean = (value: boolean, computedType: $t.LTBasic, loc: $c.Loc): $.LBoolean => Object.freeze({
    kind: "boolean",
    value,
    computedType,
    loc
});
export const isLBoolean = ($value: LBoolean) => $value.kind === "boolean";
export type LNull = $.LNull;
export const LNull = (computedType: $t.LTBasic, loc: $c.Loc): $.LNull => Object.freeze({
    kind: "null",
    computedType,
    loc
});
export const isLNull = ($value: LNull) => $value.kind === "null";
export type LString = $.LString;
export const LString = (value: string, computedType: $t.LTBasic, loc: $c.Loc): $.LString => Object.freeze({
    kind: "string",
    value,
    computedType,
    loc
});
export const isLString = ($value: LString) => $value.kind === "string";
export type LVar = $.LVar;
export const LVar = (name: string, computedType: $t.LType, loc: $c.Loc): $.LVar => Object.freeze({
    kind: "var",
    name,
    computedType,
    loc
});
export const isLVar = ($value: LVar) => $value.kind === "var";
export type LSelf = $.LSelf;
export const LSelf = (computedType: SelfType, loc: $c.Loc): $.LSelf => Object.freeze({
    kind: "self",
    computedType,
    loc
});
export const isLSelf = ($value: LSelf) => $value.kind === "self";
export type LUnit = $.LUnit;
export const LUnit = (computedType: $t.LTBasic, loc: $c.Loc): $.LUnit => Object.freeze({
    kind: "unit",
    computedType,
    loc
});
export const isLUnit = ($value: LUnit) => $value.kind === "unit";
export type LSetLiteral = $.LSetLiteral;
export const LSetLiteral = (valueType: $t.LType, fields: readonly $.LExpr[], computedType: $t.LType, loc: $c.Loc): $.LSetLiteral => Object.freeze({
    kind: "set_literal",
    valueType,
    fields,
    computedType,
    loc
});
export const isLSetLiteral = ($value: LSetLiteral) => $value.kind === "set_literal";
export type LMapField = $.LMapField;
export const LMapField = (key: $.LExpr, value: $.LExpr): $.LMapField => Object.freeze({
    key,
    value
});
export type LMapLiteral = $.LMapLiteral;
export const LMapLiteral = (fields: readonly $.LMapField[], computedType: $t.LTMap, loc: $c.Loc): $.LMapLiteral => Object.freeze({
    kind: "map_literal",
    fields,
    computedType,
    loc
});
export const isLMapLiteral = ($value: LMapLiteral) => $value.kind === "map_literal";
export type LTensor = $.LTensor;
export const LTensor = (children: readonly $.LExpr[], computedType: $t.LTTensor, loc: $c.Loc): $.LTensor => Object.freeze({
    kind: "tensor",
    children,
    computedType,
    loc
});
export const isLTensor = ($value: LTensor) => $value.kind === "tensor";
export type LTuple = $.LTuple;
export const LTuple = (children: readonly $.LExpr[], computedType: $t.LTTuple, loc: $c.Loc): $.LTuple => Object.freeze({
    kind: "tuple",
    children,
    computedType,
    loc
});
export const isLTuple = ($value: LTuple) => $value.kind === "tuple";
export type LInitOf = $.LInitOf;
export const LInitOf = (contract: $c.TypeId, args: readonly $.LExpr[], computedType: $t.LType, loc: $c.Loc): $.LInitOf => Object.freeze({
    kind: "init_of",
    contract,
    args,
    computedType,
    loc
});
export const isLInitOf = ($value: LInitOf) => $value.kind === "init_of";
export type LStructCons = $.LStructCons;
export const LStructCons = (fields: $c.Ordered<$.LExpr>, computedType: $t.LTRef, loc: $c.Loc): $.LStructCons => Object.freeze({
    kind: "struct_instance",
    fields,
    computedType,
    loc
});
export const isLStructInstance = ($value: LStructCons) => $value.kind === "struct_instance";
export type LFieldAccess = $.LFieldAccess;
export const LFieldAccess = (aggregate: $.LExpr, field: $c.Id, computedType: $t.LType, loc: $c.Loc): $.LFieldAccess => Object.freeze({
    kind: "field_access",
    aggregate,
    field,
    computedType,
    loc
});
export const isLFieldAccess = ($value: LFieldAccess) => $value.kind === "field_access";
export type LStaticMethodCall = $.LStaticMethodCall;
export const LStaticMethodCall = (self: $c.TypeId, typeArgs: $.LTypeArgs, function_: $c.Id, args: readonly $.LExpr[], computedType: $t.LType, loc: $c.Loc): $.LStaticMethodCall => Object.freeze({
    kind: "static_method_call",
    self,
    typeArgs,
    function: function_,
    args,
    computedType,
    loc
});
export const isLStaticMethodCall = ($value: LStaticMethodCall) => $value.kind === "static_method_call";
export type LStaticCall = $.LStaticCall;
export const LStaticCall = (function_: $c.Id, typeArgs: $.LTypeArgs, args: readonly $.LExpr[], computedType: $t.LType, loc: $c.Loc): $.LStaticCall => Object.freeze({
    kind: "static_call",
    function: function_,
    typeArgs,
    args,
    computedType,
    loc
});
export const isLStaticCall = ($value: LStaticCall) => $value.kind === "static_call";
export type LMethodCall = $.LMethodCall;
export const LMethodCall = (self: $.LExpr, method: $c.Id, args: readonly $.LExpr[], typeArgs: $.LTypeArgs, computedType: $t.LType, loc: $c.Loc): $.LMethodCall => Object.freeze({
    kind: "method_call",
    self,
    method,
    args,
    typeArgs,
    computedType,
    loc
});
export const isLMethodCall = ($value: LMethodCall) => $value.kind === "method_call";
export type LConditional = $.LConditional;
export const LConditional = (condition: $.LExpr, thenBranch: $.LExpr, elseBranch: $.LExpr, computedType: $t.LType, loc: $c.Loc): $.LConditional => Object.freeze({
    kind: "conditional",
    condition,
    thenBranch,
    elseBranch,
    computedType,
    loc
});
export const isLConditional = ($value: LConditional) => $value.kind === "conditional";
export type LOpUnary = $.LOpUnary;
export const LOpUnary = (op: UnaryOperation, operand: $.LExpr, typeArgs: $.LTypeArgs, computedType: $t.LType, loc: $c.Loc): $.LOpUnary => Object.freeze({
    kind: "op_unary",
    op,
    operand,
    typeArgs,
    computedType,
    loc
});
export const isLOpUnary = ($value: LOpUnary) => $value.kind === "op_unary";
export type LOpBinary = $.LOpBinary;
export const LOpBinary = (op: BinaryOperation, left: $.LExpr, right: $.LExpr, typeArgs: $.LTypeArgs, computedType: $t.LType, loc: $c.Loc): $.LOpBinary => Object.freeze({
    kind: "op_binary",
    op,
    left,
    right,
    typeArgs,
    computedType,
    loc
});
export const isLOpBinary = ($value: LOpBinary) => $value.kind === "op_binary";
export type LExpr = $.LExpr;
export type LLVar = $.LLVar;
export const LLVar = (name: string, computedType: $t.LType, loc: $c.Loc): $.LLVar => Object.freeze({
    kind: "var",
    name,
    computedType,
    loc
});
export const isLLVar = ($value: LLVar) => $value.kind === "var";
export type LLSelf = $.LLSelf;
export const LLSelf = (computedType: SelfType, loc: $c.Loc): $.LLSelf => Object.freeze({
    kind: "self",
    computedType,
    loc
});
export const isLLSelf = ($value: LLSelf) => $value.kind === "self";
export type LLFieldAccess = $.LLFieldAccess;
export const LLFieldAccess = (aggregate: $.LLValue, field: $c.Id, computedType: $t.LType, loc: $c.Loc): $.LLFieldAccess => Object.freeze({
    kind: "field_access",
    aggregate,
    field,
    computedType,
    loc
});
export const isLLFieldAccess = ($value: LLFieldAccess) => $value.kind === "field_access";
export type LLValue = $.LLValue;