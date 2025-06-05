/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/type-self";
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/checked-type";
import type { CTypeDeclRefable } from "@/next/ast/checked";
import type { BasicType } from "@/next/ast/type-basic";

export type SGTBasic = $.SGTRef;
export const SGTBasic = (
    type: BasicType,
    loc: $c.Loc,
): $.SGTBasic =>
    Object.freeze({
        ground: "yes",
        kind: "basic",
        type,
        loc,
    });
export type SGTRef = $.SGTRef;
export const SGTRef = (
    name: $c.TypeId,
    type: CTypeDeclRefable,
    typeArgs: readonly $.SelfTypeGround[],
    loc: $c.Loc,
): $.SGTRef =>
    Object.freeze({
        ground: "yes",
        kind: "type_ref",
        name,
        type,
        typeArgs,
        loc,
    });
export type SGTMaybe = $.SGTMaybe;
export const SGTMaybe = (
    type_: $.SelfTypeGround,
    loc: $c.Loc,
): $.SGTMaybe =>
    Object.freeze({
        ground: "yes",
        kind: "TypeMaybe",
        type: type_,
        loc,
    });
export type SGTMap = $.SGTMap;
export const SGTMap = (
    key: $.SelfTypeGround,
    value: $.SelfTypeGround,
    loc: $c.Loc,
): $.SGTMap =>
    Object.freeze({
        ground: "yes",
        kind: "map_type",
        key,
        value,
        loc,
    });
export type SGTTuple = $.SGTTuple;
export const SGTTuple = (
    typeArgs: readonly $.SelfTypeGround[],
    loc: $c.Loc,
): $.SGTTuple =>
    Object.freeze({
        ground: "yes",
        kind: "tuple_type",
        typeArgs,
        loc,
    });
export type SGTTensor = $.SGTTensor;
export const SGTTensor = (
    typeArgs: readonly $.SelfTypeGround[],
    loc: $c.Loc,
): $.SGTTensor =>
    Object.freeze({
        ground: "yes",
        kind: "tensor_type",
        typeArgs,
        loc,
    });
export type SVTRef = $.SVTRef;
export const SVTRef = (
    name: $c.TypeId,
    type: CTypeDeclRefable,
    typeArgs: readonly $d.CTParamRef[],
    loc: $c.Loc,
): $.SVTRef =>
    Object.freeze({
        ground: "no",
        kind: "type_ref",
        name,
        type,
        typeArgs,
        loc,
    });
export type SVTMaybe = $.SVTMaybe;
export const SVTMaybe = (
    type_: $d.CTParamRef,
    loc: $c.Loc,
): $.SVTMaybe =>
    Object.freeze({
        ground: "no",
        kind: "TypeMaybe",
        type: type_,
        loc,
    });
export type SVTMap = $.SVTMap;
export const SVTMap = (
    key: $d.CTParamRef,
    value: $d.CTParamRef,
    loc: $c.Loc,
): $.SVTMap =>
    Object.freeze({
        ground: "no",
        kind: "map_type",
        key,
        value,
        loc,
    });
export type SVTTuple = $.SVTTuple;
export const SVTTuple = (
    typeArgs: readonly $d.CTParamRef[],
    loc: $c.Loc,
): $.SVTTuple =>
    Object.freeze({
        ground: "no",
        kind: "tuple_type",
        typeArgs,
        loc,
    });
export type SVTTensor = $.SVTTensor;
export const SVTTensor = (
    typeArgs: readonly $d.CTParamRef[],
    loc: $c.Loc,
): $.SVTTensor =>
    Object.freeze({
        ground: "no",
        kind: "tensor_type",
        typeArgs,
        loc,
    });
export type SelfType = $.SelfType;
export type SelfTypeGround = $.SelfTypeGround;
