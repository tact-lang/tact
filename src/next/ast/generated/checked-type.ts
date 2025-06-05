/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/checked-type";
import type * as $c from "@/next/ast/common";
import type { CTypeDeclRefable } from "@/next/ast/checked";
import type { BasicType } from "@/next/ast/type-basic";

export type CTBasic = $.CTBasic;
export const CTBasic = (type: BasicType, loc: $c.Loc): $.CTBasic =>
    Object.freeze({
        kind: "basic",
        type,
        loc,
    });
export type CTypeParamRef = $.CTParamRef;
export const CTypeParamRef = (name: $c.TypeId, loc: $c.Loc): $.CTParamRef =>
    Object.freeze({
        kind: "TypeParam",
        name,
        loc,
    });
export const isCTypeParamRef = ($value: CTypeParamRef) =>
    $value.kind === "TypeParam";
export type CTypeTensor = $.CTTensor;
export const CTypeTensor = (
    typeArgs: readonly $.CType[],
    loc: $c.Loc,
): $.CTTensor =>
    Object.freeze({
        kind: "tensor_type",
        typeArgs,
        loc,
    });
export const isCTypeTensor = ($value: CTypeTensor) =>
    $value.kind === "tensor_type";
export type CTypeTuple = $.CTTuple;
export const CTypeTuple = (
    typeArgs: readonly $.CType[],
    loc: $c.Loc,
): $.CTTuple =>
    Object.freeze({
        kind: "tuple_type",
        typeArgs,
        loc,
    });
export const isCTypeTuple = ($value: CTypeTuple) =>
    $value.kind === "tuple_type";
export type CTypeMaybe = $.CTMaybe;
export const CTypeMaybe = (type_: $.CType, loc: $c.Loc): $.CTMaybe =>
    Object.freeze({
        kind: "TypeMaybe",
        type: type_,
        loc,
    });
export const isCTypeMaybe = ($value: CTypeMaybe) => $value.kind === "TypeMaybe";
export type CTypeBounced = $.CTBounced;
export const CTypeBounced = (name: $c.TypeId, loc: $c.Loc): $.CTBounced =>
    Object.freeze({
        kind: "TypeBounced",
        name,
        loc,
    });
export const isCTypeBounced = ($value: CTypeBounced) =>
    $value.kind === "TypeBounced";
export type CTypeMap = $.CTMap;
export const CTypeMap = (
    key: $.CType,
    value: $.CType,
    loc: $c.Loc,
): $.CTMap =>
    Object.freeze({
        kind: "map_type",
        key,
        value,
        loc,
    });
export const isCTypeMap = ($value: CTypeMap) => $value.kind === "map_type";
export type CTypeAliasRef = $.CTAliasRef;
export const CTypeAliasRef = (
    type: CNotDealiased | CType,
    name: $c.TypeId,
    typeArgs: readonly $.CType[],
    loc: $c.Loc,
): $.CTAliasRef =>
    Object.freeze({
        kind: "TypeAlias",
        name,
        type,
        typeArgs,
        loc,
    });
export const isCTypeAliasRef = ($value: CTypeAliasRef) =>
    $value.kind === "TypeAlias";
export type DTypeRef = $.CTRef;
export const DTypeRef = (
    name: $c.TypeId,
    type: CTypeDeclRefable,
    typeArgs: readonly $.CType[],
    loc: $c.Loc,
): $.CTRef =>
    Object.freeze({
        kind: "type_ref",
        name,
        type,
        typeArgs,
        loc,
    });
export const isCTypeRef = ($value: DTypeRef) => $value.kind === "type_ref";
export type CType = $.CType;
export type CTypeRecover = $.CTRecover;
export const CTypeRecover = (): $.CTRecover =>
    Object.freeze({
        kind: "recover",
    });
export const isCTypeRecover = ($value: CTypeRecover) =>
    $value.kind === "recover";

export type CNotDealiased = $.CNotDealiased;
export const CNotDealiased = (): $.CNotDealiased =>
    Object.freeze({
        kind: "NotDealiased",
    });
export const isCNotDealiased = ($value: CNotDealiased) =>
    $value.kind === "NotDealiased";
export type CNotSet = $.DNotSet;
export const CNotSet = (): $.DNotSet =>
    Object.freeze({
        kind: "not-set",
    });
export const isCNotSet = ($value: CNotSet) => $value.kind === "not-set";
