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
export type CTParamRef = $.CTParamRef;
export const CTParamRef = (name: $c.TypeId, loc: $c.Loc): $.CTParamRef =>
    Object.freeze({
        kind: "TypeParam",
        name,
        loc,
    });
export type CTTensor = $.CTTensor;
export const CTTensor = (
    typeArgs: readonly $.CType[],
    loc: $c.Loc,
): $.CTTensor =>
    Object.freeze({
        kind: "tensor_type",
        typeArgs,
        loc,
    });
export type CTTuple = $.CTTuple;
export const CTTuple = (
    typeArgs: readonly $.CType[],
    loc: $c.Loc,
): $.CTTuple =>
    Object.freeze({
        kind: "tuple_type",
        typeArgs,
        loc,
    });
export type CTMaybe = $.CTMaybe;
export const CTMaybe = (type_: $.CType, loc: $c.Loc): $.CTMaybe =>
    Object.freeze({
        kind: "TypeMaybe",
        type: type_,
        loc,
    });
export type CTBounced = $.CTBounced;
export const CTBounced = (name: $c.TypeId, loc: $c.Loc): $.CTBounced =>
    Object.freeze({
        kind: "TypeBounced",
        name,
        loc,
    });
export type CTMap = $.CTMap;
export const CTMap = (
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
export type CTAliasRef = $.CTAliasRef;
export const CTAliasRef = (
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
export type CTRef = $.CTRef;
export const CTRef = (
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
export type CType = $.CType;
export type CTRecover = $.CTRecover;
export const CTRecover = (): $.CTRecover =>
    Object.freeze({
        kind: "recover",
    });

export type CNotDealiased = $.CNotDealiased;
export const CNotDealiased = (): $.CNotDealiased =>
    Object.freeze({
        kind: "NotDealiased",
    });
export type CNotSet = $.CNotSet;
export const CNotSet = (): $.CNotSet =>
    Object.freeze({
        kind: "not-set",
    });
