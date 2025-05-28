/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/checked-expr";
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/dtype";
import type * as $e from "@/next/ast/expression";
import type { Lazy } from "@/next/ast/lazy";


export type DCodeOf = $.DCodeOf;
export const DCodeOf = (contract: $c.TypeId, computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DCodeOf => Object.freeze({
    kind: "code_of",
    contract,
    computedType,
    loc
});
export const isDCodeOf = ($value: DCodeOf) => $value.kind === "code_of";
export type DNumber = $.DNumber;
export const DNumber = (base: $e.NumberBase, value: bigint, computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DNumber => Object.freeze({
    kind: "number",
    base,
    value,
    computedType,
    loc
});
export const isDNumber = ($value: DNumber) => $value.kind === "number";
export type DBoolean = $.DBoolean;
export const DBoolean = (value: boolean, computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DBoolean => Object.freeze({
    kind: "boolean",
    value,
    computedType,
    loc
});
export const isDBoolean = ($value: DBoolean) => $value.kind === "boolean";
export type DNull = $.DNull;
export const DNull = (computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DNull => Object.freeze({
    kind: "null",
    computedType,
    loc
});
export const isDNull = ($value: DNull) => $value.kind === "null";
export type DString = $.DString;
export const DString = (value: string, computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DString => Object.freeze({
    kind: "string",
    value,
    computedType,
    loc
});
export const isDString = ($value: DString) => $value.kind === "string";
export type DVar = $.DVar;
export const DVar = (name: string, computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DVar => Object.freeze({
    kind: "var",
    name,
    computedType,
    loc
});
export const isDVar = ($value: DVar) => $value.kind === "var";
export type DUnit = $.DUnit;
export const DUnit = (computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DUnit => Object.freeze({
    kind: "unit",
    computedType,
    loc
});
export const isDUnit = ($value: DUnit) => $value.kind === "unit";
export type DSetLiteral = $.DSetLiteral;
export const DSetLiteral = (valueType: $d.DecodedType, computedType: Lazy<$d.DecodedType>, fields: readonly $.DecodedExpression[], loc: $c.Loc): $.DSetLiteral => Object.freeze({
    kind: "set_literal",
    valueType,
    fields,
    computedType,
    loc
});
export const isDSetLiteral = ($value: DSetLiteral) => $value.kind === "set_literal";
export type DMapField = $.DMapField;
export const DMapField = (key: $.DecodedExpression, value: $.DecodedExpression): $.DMapField => Object.freeze({
    key,
    value
});
export type DMapLiteral = $.DMapLiteral;
export const DMapLiteral = (type_: $d.DTypeMap, computedType: Lazy<$d.DecodedType>, fields: readonly $.DMapField[], loc: $c.Loc): $.DMapLiteral => Object.freeze({
    kind: "map_literal",
    type: type_,
    fields,
    computedType,
    loc
});
export const isDMapLiteral = ($value: DMapLiteral) => $value.kind === "map_literal";
export type DTensor = $.DTensor;
export const DTensor = (children: readonly $.DecodedExpression[], computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DTensor => Object.freeze({
    kind: "tensor",
    children,
    computedType,
    loc
});
export const isDTensor = ($value: DTensor) => $value.kind === "tensor";
export type DTuple = $.DTuple;
export const DTuple = (children: readonly $.DecodedExpression[], computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DTuple => Object.freeze({
    kind: "tuple",
    children,
    computedType,
    loc
});
export const isDTuple = ($value: DTuple) => $value.kind === "tuple";
export type DInitOf = $.DInitOf;
export const DInitOf = (contract: $c.TypeId, args: readonly $.DecodedExpression[], computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DInitOf => Object.freeze({
    kind: "init_of",
    contract,
    args,
    computedType,
    loc
});
export const isDInitOf = ($value: DInitOf) => $value.kind === "init_of";
export type DStructFieldInitializer = $.DStructFieldInitializer;
export const DStructFieldInitializer = (field: $c.Id, initializer: $.DecodedExpression, loc: $c.Loc): $.DStructFieldInitializer => Object.freeze({
    field,
    initializer,
    loc
});
export type DStructInstance = $.DStructInstance;
export const DStructInstance = (type_: $c.TypeId, typeArgs: readonly $d.DecodedType[], args: readonly $.DStructFieldInitializer[], computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DStructInstance => Object.freeze({
    kind: "struct_instance",
    type: type_,
    typeArgs,
    args,
    computedType,
    loc
});
export const isDStructInstance = ($value: DStructInstance) => $value.kind === "struct_instance";
export type DFieldAccess = $.DFieldAccess;
export const DFieldAccess = (aggregate: $.DecodedExpression, field: $c.Id, computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DFieldAccess => Object.freeze({
    kind: "field_access",
    aggregate,
    field,
    computedType,
    loc
});
export const isDFieldAccess = ($value: DFieldAccess) => $value.kind === "field_access";
export type DStaticMethodCall = $.DStaticMethodCall;
export const DStaticMethodCall = (self: $c.TypeId, typeArgs: readonly $d.DecodedType[], function_: $c.Id, args: readonly $.DecodedExpression[], computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DStaticMethodCall => Object.freeze({
    kind: "static_method_call",
    self,
    typeArgs,
    function: function_,
    args,
    computedType,
    loc
});
export const isDStaticMethodCall = ($value: DStaticMethodCall) => $value.kind === "static_method_call";
export type DStaticCall = $.DStaticCall;
export const DStaticCall = (function_: $c.Id, typeArgs: readonly $d.DecodedType[], args: readonly $.DecodedExpression[], computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DStaticCall => Object.freeze({
    kind: "static_call",
    function: function_,
    typeArgs,
    args,
    computedType,
    loc
});
export const isDStaticCall = ($value: DStaticCall) => $value.kind === "static_call";
export type DMethodCall = $.DMethodCall;
export const DMethodCall = (self: $.DecodedExpression, method: $c.Id, typeArgs: readonly $d.DecodedType[], args: readonly $.DecodedExpression[], computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DMethodCall => Object.freeze({
    kind: "method_call",
    self,
    method,
    typeArgs,
    args,
    computedType,
    loc
});
export const isDMethodCall = ($value: DMethodCall) => $value.kind === "method_call";
export type DConditional = $.DConditional;
export const DConditional = (condition: $.DecodedExpression, thenBranch: $.DecodedExpression, elseBranch: $.DecodedExpression, computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DConditional => Object.freeze({
    kind: "conditional",
    condition,
    thenBranch,
    elseBranch,
    computedType,
    loc
});
export const isDConditional = ($value: DConditional) => $value.kind === "conditional";
export type DOpUnary = $.DOpUnary;
export const DOpUnary = (op: $e.UnaryOperation, operand: $.DecodedExpression, computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DOpUnary => Object.freeze({
    kind: "op_unary",
    op,
    operand,
    computedType,
    loc
});
export const isDOpUnary = ($value: DOpUnary) => $value.kind === "op_unary";
export type DOpBinary = $.DOpBinary;
export const DOpBinary = (op: $e.BinaryOperation, left: $.DecodedExpression, right: $.DecodedExpression, computedType: Lazy<$d.DecodedType>, loc: $c.Loc): $.DOpBinary => Object.freeze({
    kind: "op_binary",
    op,
    left,
    right,
    computedType,
    loc
});
export const isDOpBinary = ($value: DOpBinary) => $value.kind === "op_binary";
export type DecodedExpression = $.DecodedExpression;
