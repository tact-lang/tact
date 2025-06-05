/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type { Ordered } from "@/next/ast/checked";
import type * as $ from "@/next/ast/checked-expr";
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/checked-type";
import type * as $e from "@/next/ast/expression";
import type { SelfType } from "@/next/ast/type-self";

export type DCodeOf = $.DCodeOf;
export const DCodeOf = (
    contract: $c.TypeId,
    computedType: $d.CType,
    loc: $c.Loc,
): $.DCodeOf =>
    Object.freeze({
        kind: "code_of",
        contract,
        computedType,
        loc,
    });
export const isDCodeOf = ($value: DCodeOf) => $value.kind === "code_of";
export type DNumber = $.DNumber;
export const DNumber = (
    base: $e.NumberBase,
    value: bigint,
    computedType: $d.CTBasic,
    loc: $c.Loc,
): $.DNumber =>
    Object.freeze({
        kind: "number",
        base,
        value,
        computedType,
        loc,
    });
export const isDNumber = ($value: DNumber) => $value.kind === "number";
export type DBoolean = $.DBoolean;
export const DBoolean = (
    value: boolean,
    computedType: $d.CTBasic,
    loc: $c.Loc,
): $.DBoolean =>
    Object.freeze({
        kind: "boolean",
        value,
        computedType,
        loc,
    });
export const isDBoolean = ($value: DBoolean) => $value.kind === "boolean";
export type DNull = $.DNull;
export const DNull = (computedType: $d.CTBasic, loc: $c.Loc): $.DNull =>
    Object.freeze({
        kind: "null",
        computedType,
        loc,
    });
export const isDNull = ($value: DNull) => $value.kind === "null";
export type DString = $.DString;
export const DString = (
    value: string,
    computedType: $d.CTBasic,
    loc: $c.Loc,
): $.DString =>
    Object.freeze({
        kind: "string",
        value,
        computedType,
        loc,
    });
export const isDString = ($value: DString) => $value.kind === "string";
export type DVar = $.DVar;
export const DVar = (
    name: string,
    computedType: $d.CType,
    loc: $c.Loc,
): $.DVar =>
    Object.freeze({
        kind: "var",
        name,
        computedType,
        loc,
    });
export const isDVar = ($value: DVar) => $value.kind === "var";
export type DSelf = $.DSelf;
export const DSelf = (computedType: SelfType, loc: $c.Loc): $.DSelf =>
    Object.freeze({
        kind: "self",
        computedType,
        loc,
    });
export const isDSelf = ($value: DSelf) => $value.kind === "self";
export type DUnit = $.DUnit;
export const DUnit = (computedType: $d.CTBasic, loc: $c.Loc): $.DUnit =>
    Object.freeze({
        kind: "unit",
        computedType,
        loc,
    });
export const isDUnit = ($value: DUnit) => $value.kind === "unit";
export type DSetLiteral = $.DSetLiteral;
export const DSetLiteral = (
    valueType: $d.CType,
    computedType: $d.CType,
    fields: readonly $.DecodedExpression[],
    loc: $c.Loc,
): $.DSetLiteral =>
    Object.freeze({
        kind: "set_literal",
        valueType,
        fields,
        computedType,
        loc,
    });
export const isDSetLiteral = ($value: DSetLiteral) =>
    $value.kind === "set_literal";
export type DMapField = $.DMapField;
export const DMapField = (
    key: $.DecodedExpression,
    value: $.DecodedExpression,
): $.DMapField =>
    Object.freeze({
        key,
        value,
    });
export type DMapLiteral = $.DMapLiteral;
export const DMapLiteral = (
    computedType: $d.CTMap,
    fields: readonly $.DMapField[],
    loc: $c.Loc,
): $.DMapLiteral =>
    Object.freeze({
        kind: "map_literal",
        fields,
        computedType,
        loc,
    });
export const isDMapLiteral = ($value: DMapLiteral) =>
    $value.kind === "map_literal";
export type DTensor = $.DTensor;
export const DTensor = (
    children: readonly $.DecodedExpression[],
    computedType: $d.CTTensor,
    loc: $c.Loc,
): $.DTensor =>
    Object.freeze({
        kind: "tensor",
        children,
        computedType,
        loc,
    });
export const isDTensor = ($value: DTensor) => $value.kind === "tensor";
export type DTuple = $.DTuple;
export const DTuple = (
    children: readonly $.DecodedExpression[],
    computedType: $d.CTTuple,
    loc: $c.Loc,
): $.DTuple =>
    Object.freeze({
        kind: "tuple",
        children,
        computedType,
        loc,
    });
export const isDTuple = ($value: DTuple) => $value.kind === "tuple";
export type DInitOf = $.DInitOf;
export const DInitOf = (
    contract: $c.TypeId,
    args: readonly $.DecodedExpression[],
    computedType: $d.CType,
    loc: $c.Loc,
): $.DInitOf =>
    Object.freeze({
        kind: "init_of",
        contract,
        args,
        computedType,
        loc,
    });
export const isDInitOf = ($value: DInitOf) => $value.kind === "init_of";
export type DStructInstance = $.DStructInstance;
export const DStructInstance = (
    fields: Ordered<undefined | DecodedExpression>,
    computedType: $d.CTRef | $d.CTRecover,
    loc: $c.Loc,
): $.DStructInstance =>
    Object.freeze({
        kind: "struct_instance",
        fields,
        computedType,
        loc,
    });
export const isDStructInstance = ($value: DStructInstance) =>
    $value.kind === "struct_instance";
export type DFieldAccess = $.DFieldAccess;
export const DFieldAccess = (
    aggregate: $.DecodedExpression,
    field: $c.Id,
    computedType: $d.CType,
    loc: $c.Loc,
): $.DFieldAccess =>
    Object.freeze({
        kind: "field_access",
        aggregate,
        field,
        computedType,
        loc,
    });
export const isDFieldAccess = ($value: DFieldAccess) =>
    $value.kind === "field_access";
export type DStaticMethodCall = $.DStaticMethodCall;
export const DStaticMethodCall = (
    self: $c.TypeId,
    typeArgs: $.TypeArgs,
    function_: $c.Id,
    args: readonly $.DecodedExpression[],
    computedType: $d.CType,
    loc: $c.Loc,
): $.DStaticMethodCall =>
    Object.freeze({
        kind: "static_method_call",
        self,
        typeArgs,
        function: function_,
        args,
        computedType,
        loc,
    });
export const isDStaticMethodCall = ($value: DStaticMethodCall) =>
    $value.kind === "static_method_call";
export type TypeArgs = $.TypeArgs;
export type DStaticCall = $.DStaticCall;
export const DStaticCall = (
    function_: $c.Id,
    typeArgs: $.TypeArgs,
    args: readonly $.DecodedExpression[],
    computedType: $d.CType,
    loc: $c.Loc,
): $.DStaticCall =>
    Object.freeze({
        kind: "static_call",
        function: function_,
        typeArgs,
        args,
        computedType,
        loc,
    });
export const isDStaticCall = ($value: DStaticCall) =>
    $value.kind === "static_call";
export type DMethodCall = $.DMethodCall;
export const DMethodCall = (
    self: $.DecodedExpression,
    method: $c.Id,
    args: readonly $.DecodedExpression[],
    typeArgs: $.TypeArgs,
    computedType: $d.CType,
    loc: $c.Loc,
): $.DMethodCall =>
    Object.freeze({
        kind: "method_call",
        self,
        method,
        typeArgs,
        args,
        computedType,
        loc,
    });
export const isDMethodCall = ($value: DMethodCall) =>
    $value.kind === "method_call";
export type DConditional = $.DConditional;
export const DConditional = (
    condition: $.DecodedExpression,
    thenBranch: $.DecodedExpression,
    elseBranch: $.DecodedExpression,
    computedType: $d.CType,
    loc: $c.Loc,
): $.DConditional =>
    Object.freeze({
        kind: "conditional",
        condition,
        thenBranch,
        elseBranch,
        computedType,
        loc,
    });
export const isDConditional = ($value: DConditional) =>
    $value.kind === "conditional";
export type DOpUnary = $.DOpUnary;
export const DOpUnary = (
    op: $e.UnaryOperation,
    operand: $.DecodedExpression,
    typeArgs: ReadonlyMap<string, $d.CType>,
    computedType: $d.CType,
    loc: $c.Loc,
): $.DOpUnary =>
    Object.freeze({
        kind: "op_unary",
        op,
        operand,
        typeArgs,
        computedType,
        loc,
    });
export const isDOpUnary = ($value: DOpUnary) => $value.kind === "op_unary";
export type DOpBinary = $.DOpBinary;
export const DOpBinary = (
    op: $e.BinaryOperation,
    left: $.DecodedExpression,
    right: $.DecodedExpression,
    typeArgs: ReadonlyMap<string, $d.CType>,
    computedType: $d.CType,
    loc: $c.Loc,
): $.DOpBinary =>
    Object.freeze({
        kind: "op_binary",
        op,
        left,
        right,
        typeArgs,
        computedType,
        loc,
    });
export const isDOpBinary = ($value: DOpBinary) => $value.kind === "op_binary";
export type DecodedExpression = $.DecodedExpression;
export type LVar = $.LVar;
export const LVar = (
    name: string,
    computedType: $d.CType,
    loc: $c.Loc,
): $.LVar =>
    Object.freeze({
        kind: "var",
        name,
        computedType,
        loc,
    });
export const isLVar = ($value: LVar) => $value.kind === "var";
export type LSelf = $.LSelf;
export const LSelf = (computedType: SelfType, loc: $c.Loc): $.LSelf =>
    Object.freeze({
        kind: "self",
        computedType,
        loc,
    });
export const isLSelf = ($value: LSelf) => $value.kind === "self";
export type LFieldAccess = $.LFieldAccess;
export const LFieldAccess = (
    aggregate: $.LValue,
    field: $c.Id,
    computedType: $d.CType,
    loc: $c.Loc,
): $.LFieldAccess =>
    Object.freeze({
        kind: "field_access",
        aggregate,
        field,
        computedType,
        loc,
    });
export const isLFieldAccess = ($value: LFieldAccess) =>
    $value.kind === "field_access";
export type LValue = $.LValue;
