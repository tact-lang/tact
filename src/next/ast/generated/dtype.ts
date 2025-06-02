/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/dtype";
import type * as $c from "@/next/ast/common";
import type { TypeDeclRefable } from "@/next/ast/checked";

export type DTypeParamRef = $.DTypeParamRef;
export const DTypeParamRef = (name: $c.TypeId, loc: $c.Loc): $.DTypeParamRef =>
    Object.freeze({
        kind: "TypeParam",
        name,
        loc,
    });
export const isDTypeParamRef = ($value: DTypeParamRef) =>
    $value.kind === "TypeParam";
export type DTypeTensor = $.DTypeTensor;
export const DTypeTensor = (
    typeArgs: readonly $.DecodedType[],
    loc: $c.Loc,
): $.DTypeTensor =>
    Object.freeze({
        kind: "tensor_type",
        typeArgs,
        loc,
    });
export const isDTypeTensor = ($value: DTypeTensor) =>
    $value.kind === "tensor_type";
export type DTypeTuple = $.DTypeTuple;
export const DTypeTuple = (
    typeArgs: readonly $.DecodedType[],
    loc: $c.Loc,
): $.DTypeTuple =>
    Object.freeze({
        kind: "tuple_type",
        typeArgs,
        loc,
    });
export const isDTypeTuple = ($value: DTypeTuple) =>
    $value.kind === "tuple_type";
export type DTypeMaybe = $.DTypeMaybe;
export const DTypeMaybe = (type_: $.DecodedType, loc: $c.Loc): $.DTypeMaybe =>
    Object.freeze({
        kind: "TypeMaybe",
        type: type_,
        loc,
    });
export const isDTypeMaybe = ($value: DTypeMaybe) => $value.kind === "TypeMaybe";
export type DTypeBounced = $.DTypeBounced;
export const DTypeBounced = (name: $c.TypeId, loc: $c.Loc): $.DTypeBounced =>
    Object.freeze({
        kind: "TypeBounced",
        name,
        loc,
    });
export const isDTypeBounced = ($value: DTypeBounced) =>
    $value.kind === "TypeBounced";
export type DTypeMap = $.DTypeMap;
export const DTypeMap = (
    key: $.DecodedType,
    value: $.DecodedType,
    loc: $c.Loc,
): $.DTypeMap =>
    Object.freeze({
        kind: "map_type",
        key,
        value,
        loc,
    });
export const isDTypeMap = ($value: DTypeMap) => $value.kind === "map_type";
export type DTypeAliasRef = $.DTypeAliasRef;
export const DTypeAliasRef = (
    type: NotDealiased | DecodedType,
    name: $c.TypeId,
    typeArgs: readonly $.DecodedType[],
    loc: $c.Loc,
): $.DTypeAliasRef =>
    Object.freeze({
        kind: "TypeAlias",
        name,
        type,
        typeArgs,
        loc,
    });
export const isDTypeAliasRef = ($value: DTypeAliasRef) =>
    $value.kind === "TypeAlias";
export type DTypeRef = $.DTypeRef;
export const DTypeRef = (
    name: $c.TypeId,
    type: TypeDeclRefable,
    typeArgs: readonly $.DecodedType[],
    loc: $c.Loc,
): $.DTypeRef =>
    Object.freeze({
        kind: "type_ref",
        name,
        type,
        typeArgs,
        loc,
    });
export const isDTypeRef = ($value: DTypeRef) => $value.kind === "type_ref";
export type DecodedType = $.DecodedType;
export type DTypeRecover = $.DTypeRecover;
export const DTypeRecover = (): $.DTypeRecover =>
    Object.freeze({
        kind: "recover",
    });
export const isDTypeRecover = ($value: DTypeRecover) =>
    $value.kind === "recover";
export type DTypeStateInit = $.DTypeStateInit;
export const DTypeStateInit = (loc: $c.Loc): $.DTypeStateInit =>
    Object.freeze({
        kind: "TypeStateInit",
        loc,
    });
export const isDTypeStateInit = ($value: DTypeStateInit) =>
    $value.kind === "TypeStateInit";

export type NotDealiased = $.NotDealiased;
export const NotDealiased = (): $.NotDealiased =>
    Object.freeze({
        kind: "NotDealiased",
    });
export const isNotDealiased = ($value: NotDealiased) =>
    $value.kind === "NotDealiased";
export type DNotSet = $.DNotSet;
export const DNotSet = (): $.DNotSet =>
    Object.freeze({
        kind: "not-set",
    });
export const isDNotSet = ($value: DNotSet) => $value.kind === "not-set";
