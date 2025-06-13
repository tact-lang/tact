/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/checked-expr";
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/checked-type";
import type * as $e from "@/next/ast/expression";
import type { SelfType } from "@/next/ast/type-self";

export type CCodeOf = $.CCodeOf;
export const CCodeOf = (
    contract: $c.TypeId,
    computedType: $d.CType,
    loc: $c.Loc,
): $.CCodeOf =>
    Object.freeze({
        kind: "code_of",
        contract,
        computedType,
        loc,
    });
export type CNumber = $.CNumber;
export const DNumber = (
    base: $e.NumberBase,
    value: bigint,
    computedType: $d.CTBasic,
    loc: $c.Loc,
): $.CNumber =>
    Object.freeze({
        kind: "number",
        base,
        value,
        computedType,
        loc,
    });
export type CBoolean = $.CBoolean;
export const CBoolean = (
    value: boolean,
    computedType: $d.CTBasic,
    loc: $c.Loc,
): $.CBoolean =>
    Object.freeze({
        kind: "boolean",
        value,
        computedType,
        loc,
    });
export type CNull = $.CNull;
export const CNull = (computedType: $d.CTBasic, loc: $c.Loc): $.CNull =>
    Object.freeze({
        kind: "null",
        computedType,
        loc,
    });
export type CString = $.CString;
export const CString = (
    value: string,
    computedType: $d.CTBasic,
    loc: $c.Loc,
): $.CString =>
    Object.freeze({
        kind: "string",
        value,
        computedType,
        loc,
    });
export type CVar = $.CVar;
export const CVar = (
    name: string,
    computedType: $d.CType,
    loc: $c.Loc,
): $.CVar =>
    Object.freeze({
        kind: "var",
        name,
        computedType,
        loc,
    });
export type CSelf = $.CSelf;
export const CSelf = (computedType: SelfType, loc: $c.Loc): $.CSelf =>
    Object.freeze({
        kind: "self",
        computedType,
        loc,
    });
export type CUnit = $.CUnit;
export const CUnit = (computedType: $d.CTBasic, loc: $c.Loc): $.CUnit =>
    Object.freeze({
        kind: "unit",
        computedType,
        loc,
    });
export type CSetLiteral = $.CSetLiteral;
export const CSetLiteral = (
    valueType: $d.CType,
    computedType: $d.CType,
    fields: readonly $.CExpr[],
    loc: $c.Loc,
): $.CSetLiteral =>
    Object.freeze({
        kind: "set_literal",
        valueType,
        fields,
        computedType,
        loc,
    });
export type CMapField = $.DMapField;
export const CMapField = (
    key: $.CExpr,
    value: $.CExpr,
): $.DMapField =>
    Object.freeze({
        key,
        value,
    });
export type CMapLiteral = $.CMapLiteral;
export const CMapLiteral = (
    computedType: $d.CTMap,
    fields: readonly $.DMapField[],
    loc: $c.Loc,
): $.CMapLiteral =>
    Object.freeze({
        kind: "map_literal",
        fields,
        computedType,
        loc,
    });
export type CTensor = $.CTensor;
export const CTensor = (
    children: readonly $.CExpr[],
    computedType: $d.CTTensor,
    loc: $c.Loc,
): $.CTensor =>
    Object.freeze({
        kind: "tensor",
        children,
        computedType,
        loc,
    });
export type CTuple = $.CTuple;
export const CTuple = (
    children: readonly $.CExpr[],
    computedType: $d.CTTuple,
    loc: $c.Loc,
): $.CTuple =>
    Object.freeze({
        kind: "tuple",
        children,
        computedType,
        loc,
    });
export type CInitOf = $.CInitOf;
export const CInitOf = (
    contract: $c.TypeId,
    args: readonly $.CExpr[],
    computedType: $d.CType,
    loc: $c.Loc,
): $.CInitOf =>
    Object.freeze({
        kind: "init_of",
        contract,
        args,
        computedType,
        loc,
    });
export type CStructCons = $.CStructCons;
export const CStructCons = (
    fields: $c.Ordered<undefined | CExpr>,
    computedType: $d.CTRef | $d.CTRecover,
    loc: $c.Loc,
): $.CStructCons =>
    Object.freeze({
        kind: "struct_instance",
        fields,
        computedType,
        loc,
    });
export type CFieldAccess = $.CFieldAccess;
export const CFieldAccess = (
    aggregate: $.CExpr,
    field: $c.Id,
    computedType: $d.CType,
    loc: $c.Loc,
): $.CFieldAccess =>
    Object.freeze({
        kind: "field_access",
        aggregate,
        field,
        computedType,
        loc,
    });
export type CStaticMethodCall = $.CStaticMethodCall;
export const CStaticMethodCall = (
    self: $c.TypeId,
    typeArgs: $.TypeArgs,
    function_: $c.Id,
    args: readonly $.CExpr[],
    computedType: $d.CType,
    loc: $c.Loc,
): $.CStaticMethodCall =>
    Object.freeze({
        kind: "static_method_call",
        self,
        typeArgs,
        function: function_,
        args,
        computedType,
        loc,
    });
export type TypeArgs = $.TypeArgs;
export type CStaticCall = $.CStaticCall;
export const CStaticCall = (
    function_: $c.Id,
    typeArgs: $.TypeArgs,
    args: readonly $.CExpr[],
    computedType: $d.CType,
    loc: $c.Loc,
): $.CStaticCall =>
    Object.freeze({
        kind: "static_call",
        function: function_,
        typeArgs,
        args,
        computedType,
        loc,
    });
export type CMethodCall = $.CMethodCall;
export const CMethodCall = (
    self: $.CExpr,
    method: $c.Id,
    args: readonly $.CExpr[],
    typeArgs: $.TypeArgs,
    computedType: $d.CType,
    loc: $c.Loc,
): $.CMethodCall =>
    Object.freeze({
        kind: "method_call",
        self,
        method,
        typeArgs,
        args,
        computedType,
        loc,
    });
export type CConditional = $.CConditional;
export const CConditional = (
    condition: $.CExpr,
    thenBranch: $.CExpr,
    elseBranch: $.CExpr,
    computedType: $d.CType,
    loc: $c.Loc,
): $.CConditional =>
    Object.freeze({
        kind: "conditional",
        condition,
        thenBranch,
        elseBranch,
        computedType,
        loc,
    });
export type COpUnary = $.COpUnary;
export const COpUnary = (
    op: $e.UnaryOperation,
    operand: $.CExpr,
    typeArgs: ReadonlyMap<string, $d.CType>,
    computedType: $d.CType,
    loc: $c.Loc,
): $.COpUnary =>
    Object.freeze({
        kind: "op_unary",
        op,
        operand,
        typeArgs,
        computedType,
        loc,
    });
export type COpBinary = $.COpBinary;
export const COpBinary = (
    op: $e.BinaryOperation,
    left: $.CExpr,
    right: $.CExpr,
    typeArgs: ReadonlyMap<string, $d.CType>,
    computedType: $d.CType,
    loc: $c.Loc,
): $.COpBinary =>
    Object.freeze({
        kind: "op_binary",
        op,
        left,
        right,
        typeArgs,
        computedType,
        loc,
    });
export type CExpr = $.CExpr;
export type CLVar = $.CLVar;
export const CLVar = (
    name: string,
    computedType: $d.CType,
    loc: $c.Loc,
): $.CLVar =>
    Object.freeze({
        kind: "var",
        name,
        computedType,
        loc,
    });
export type CLSelf = $.CLSelf;
export const CLSelf = (computedType: SelfType, loc: $c.Loc): $.CLSelf =>
    Object.freeze({
        kind: "self",
        computedType,
        loc,
    });
export type CLFieldAccess = $.CLFieldAccess;
export const CLFieldAccess = (
    aggregate: $.CLValue,
    field: $c.Id,
    computedType: $d.CType,
    loc: $c.Loc,
): $.CLFieldAccess =>
    Object.freeze({
        kind: "field_access",
        aggregate,
        field,
        computedType,
        loc,
    });
export type LValue = $.CLValue;
