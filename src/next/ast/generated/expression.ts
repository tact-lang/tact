/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $t from "@/next/ast/type";
import type * as $ from "@/next/ast/expression";

export type BinaryOperation = $.BinaryOperation;
export const allBinaryOperation: readonly $.BinaryOperation[] = [
    "+",
    "-",
    "*",
    "/",
    "!=",
    ">",
    "<",
    ">=",
    "<=",
    "==",
    "&&",
    "||",
    "%",
    "<<",
    ">>",
    "&",
    "|",
    "^",
];
export type UnaryOperation = $.UnaryOperation;
export const allUnaryOperation: readonly $.UnaryOperation[] = [
    "+",
    "-",
    "!",
    "!!",
    "~",
];
export type CodeOf = $.CodeOf;
export const CodeOf = (contract: $c.TypeId, loc: $c.Loc): $.CodeOf =>
    Object.freeze({
        kind: "code_of",
        contract,
        loc,
    });
export const isCodeOf = ($value: CodeOf) => $value.kind === "code_of";
export type NumberBase = $.NumberBase;
export const allNumberBase: readonly $.NumberBase[] = ["2", "8", "10", "16"];
export type Number = $.Number;
export const Number = (
    base: $.NumberBase,
    value: bigint,
    loc: $c.Loc,
): $.Number =>
    Object.freeze({
        kind: "number",
        base,
        value,
        loc,
    });
export const isNumber = ($value: Number) => $value.kind === "number";
export type Boolean = $.Boolean;
export const Boolean = (value: boolean, loc: $c.Loc): $.Boolean =>
    Object.freeze({
        kind: "boolean",
        value,
        loc,
    });
export const isBoolean = ($value: Boolean) => $value.kind === "boolean";
export type Null = $.Null;
export const Null = (loc: $c.Loc): $.Null =>
    Object.freeze({
        kind: "null",
        loc,
    });
export const isNull = ($value: Null) => $value.kind === "null";
export type String = $.String;
export const String = (value: string, loc: $c.Loc): $.String =>
    Object.freeze({
        kind: "string",
        value,
        loc,
    });
export const isString = ($value: String) => $value.kind === "string";
export type Var = $.Var;
export const Var = (name: string, loc: $c.Loc): $.Var =>
    Object.freeze({
        kind: "var",
        name,
        loc,
    });
export const isVar = ($value: Var) => $value.kind === "var";
export type Unit = $.Unit;
export const Unit = (loc: $c.Loc): $.Unit =>
    Object.freeze({
        kind: "unit",
        loc,
    });
export const isUnit = ($value: Unit) => $value.kind === "unit";
export type Tensor = $.Tensor;
export const Tensor = (
    children: readonly $.Expression[],
    loc: $c.Loc,
): $.Tensor =>
    Object.freeze({
        kind: "tensor",
        children,
        loc,
    });
export const isTensor = ($value: Tensor) => $value.kind === "tensor";
export type Tuple = $.Tuple;
export const Tuple = (
    children: readonly $.Expression[],
    loc: $c.Loc,
): $.Tuple =>
    Object.freeze({
        kind: "tuple",
        children,
        loc,
    });
export const isTuple = ($value: Tuple) => $value.kind === "tuple";
export type InitOf = $.InitOf;
export const InitOf = (
    contract: $c.TypeId,
    args: readonly $.Expression[],
    loc: $c.Loc,
): $.InitOf =>
    Object.freeze({
        kind: "init_of",
        contract,
        args,
        loc,
    });
export const isInitOf = ($value: InitOf) => $value.kind === "init_of";
export type StructFieldInitializer = $.StructFieldInitializer;
export const StructFieldInitializer = (
    field: $c.Id,
    initializer: $.Expression,
    loc: $c.Loc,
): $.StructFieldInitializer =>
    Object.freeze({
        kind: "struct_field_initializer",
        field,
        initializer,
        loc,
    });
export const isStructFieldInitializer = ($value: StructFieldInitializer) =>
    $value.kind === "struct_field_initializer";
export type StructInstance = $.StructInstance;
export const StructInstance = (
    type_: $c.TypeId,
    typeArgs: readonly $t.Type[],
    args: readonly $.StructFieldInitializer[],
    loc: $c.Loc,
): $.StructInstance =>
    Object.freeze({
        kind: "struct_instance",
        type: type_,
        typeArgs,
        args,
        loc,
    });
export const isStructInstance = ($value: StructInstance) =>
    $value.kind === "struct_instance";
export type StaticCall = $.StaticCall;
export const StaticCall = (
    function_: $c.Id,
    typeArgs: readonly $t.Type[],
    args: readonly $.Expression[],
    loc: $c.Loc,
): $.StaticCall =>
    Object.freeze({
        kind: "static_call",
        function: function_,
        typeArgs,
        args,
        loc,
    });
export const isStaticCall = ($value: StaticCall) =>
    $value.kind === "static_call";
export type FieldAccess = $.FieldAccess;
export const FieldAccess = (
    aggregate: $.Expression,
    field: $c.Id,
    loc: $c.Loc,
): $.FieldAccess =>
    Object.freeze({
        kind: "field_access",
        aggregate,
        field,
        loc,
    });
export const isFieldAccess = ($value: FieldAccess) =>
    $value.kind === "field_access";
export type MethodCall = $.MethodCall;
export const MethodCall = (
    self: $.Expression,
    method: $c.Id,
    typeArgs: readonly $t.Type[],
    args: readonly $.Expression[],
    loc: $c.Loc,
): $.MethodCall =>
    Object.freeze({
        kind: "method_call",
        self,
        method,
        typeArgs,
        args,
        loc,
    });
export const isMethodCall = ($value: MethodCall) =>
    $value.kind === "method_call";
export type Conditional = $.Conditional;
export const Conditional = (
    condition: $.Expression,
    thenBranch: $.Expression,
    elseBranch: $.Expression,
    loc: $c.Loc,
): $.Conditional =>
    Object.freeze({
        kind: "conditional",
        condition,
        thenBranch,
        elseBranch,
        loc,
    });
export const isConditional = ($value: Conditional) =>
    $value.kind === "conditional";
export type OpUnary = $.OpUnary;
export const OpUnary = (
    op: $.UnaryOperation,
    operand: $.Expression,
    loc: $c.Loc,
): $.OpUnary =>
    Object.freeze({
        kind: "op_unary",
        op,
        operand,
        loc,
    });
export const isOpUnary = ($value: OpUnary) => $value.kind === "op_unary";
export type OpBinary = $.OpBinary;
export const OpBinary = (
    op: $.BinaryOperation,
    left: $.Expression,
    right: $.Expression,
    loc: $c.Loc,
): $.OpBinary =>
    Object.freeze({
        kind: "op_binary",
        op,
        left,
        right,
        loc,
    });
export const isOpBinary = ($value: OpBinary) => $value.kind === "op_binary";
export type Expression = $.Expression;
export type MapField = $.MapField;
export const MapField = (key: $.Expression, value: $.Expression): $.MapField =>
    Object.freeze({
        key,
        value,
    });
export type MapLiteral = $.MapLiteral;
export const MapLiteral = (
    type_: $t.TypeMap,
    fields: readonly $.MapField[],
    loc: $c.Loc,
): $.MapLiteral =>
    Object.freeze({
        kind: "map_literal",
        type: type_,
        fields,
        loc,
    });
export const isMapLiteral = ($value: MapLiteral) =>
    $value.kind === "map_literal";
export type SetLiteral = $.SetLiteral;
export const SetLiteral = (
    valueType: $t.Type,
    fields: readonly $.Expression[],
    loc: $c.Loc,
): $.SetLiteral =>
    Object.freeze({
        kind: "set_literal",
        valueType,
        fields,
        loc,
    });
export const isSetLiteral = ($value: SetLiteral) =>
    $value.kind === "set_literal";
export type StaticMethodCall = $.StaticMethodCall;
export const StaticMethodCall = (self: $c.TypeId, typeArgs: readonly $t.Type[], function_: $c.Id, args: readonly $.Expression[], loc: $c.Loc): $.StaticMethodCall => Object.freeze({
    kind: "static_method_call",
    self,
    typeArgs,
    function: function_,
    args,
    loc
});
export const isStaticMethodCall = ($value: StaticMethodCall) => $value.kind === "static_method_call";
