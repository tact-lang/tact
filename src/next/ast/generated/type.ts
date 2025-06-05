/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $ from "@/next/ast/type";
import type { BasicType } from "@/next/ast/type-basic";

export type TBasic = $.TTensor;
export const TBasic = (
    type: BasicType,
    loc: $c.Loc,
): $.TBasic =>
    Object.freeze({
        kind: "basic",
        type,
        loc,
    });
export type TTensor = $.TTensor;
export const TTensor = (
    typeArgs: readonly $.Type[],
    loc: $c.Loc,
): $.TTensor =>
    Object.freeze({
        kind: "tensor_type",
        typeArgs,
        loc,
    });
export type TTuple = $.TTuple;
export const TTuple = (
    typeArgs: readonly $.Type[],
    loc: $c.Loc,
): $.TTuple =>
    Object.freeze({
        kind: "tuple_type",
        typeArgs,
        loc,
    });
export type TCons = $.TCons;
export const TCons = (
    name: $c.TypeId,
    typeArgs: readonly $.Type[],
    loc: $c.Loc,
): $.TCons =>
    Object.freeze({
        kind: "cons_type",
        name,
        typeArgs,
        loc,
    });
export type Type = $.Type;
export type TMap = $.TMap;
export const TMap = (key: $.Type, value: $.Type, loc: $c.Loc): $.TMap =>
    Object.freeze({
        kind: "map_type",
        key,
        value,
        loc,
    });

export type TBounced = $.TBounced;
export const TBounced = (type_: $.Type, loc: $c.Loc): $.TBounced =>
    Object.freeze({
        kind: "TypeBounced",
        type: type_,
        loc,
    });
export type TMaybe = $.TMaybe;
export const TMaybe = (type_: $.Type, loc: $c.Loc): $.TMaybe =>
    Object.freeze({
        kind: "TypeMaybe",
        type: type_,
        loc,
    });
export type TypedParameter = $.TypedParameter;
export const TypedParameter = (
    name: $c.OptionalId,
    type_: $.Type,
    loc: $c.Loc,
): $.TypedParameter =>
    Object.freeze({
        name,
        type: type_,
        loc,
    });
export type TFunction = $.TFunction;
export const TFunction = (
    typeParams: readonly $c.TypeId[],
    params: readonly $.TypedParameter[],
    returnType: $.Type,
): $.TFunction =>
    Object.freeze({
        typeParams,
        params,
        returnType,
    });
export type TMethod = $.TMethod;
export const TMethod = (
    typeParams: readonly $c.TypeId[],
    self: $.Type,
    args: readonly $.TypedParameter[],
    returnType: $.Type,
): $.TMethod =>
    Object.freeze({
        typeParams,
        self,
        args,
        returnType,
    });