import type * as $ from "@/next/ast/lowered-type";
import type * as $c from "@/next/ast/common";
import type { BasicType } from "@/next/ast/type-basic";
import type { CTypeDeclRefable } from "@/next/ast/checked";

export type LTParamRef = $.LTParamRef;
export const LTParamRef = (name: $c.TypeId, loc: $c.Loc): $.LTParamRef => Object.freeze({
    kind: "TypeParam",
    name,
    loc
});
export const isLTParamRef = ($value: LTParamRef) => $value.kind === "TypeParam";
export type LTBounced = $.LTBounced;
export const LTBounced = (name: $c.TypeId, loc: $c.Loc): $.LTBounced => Object.freeze({
    kind: "TypeBounced",
    name,
    loc
});
export const isLTBounced = ($value: LTBounced) => $value.kind === "TypeBounced";
export type LTBasic = $.LTBasic;
export const LTBasic = (type_: BasicType, loc: $c.Loc): $.LTBasic => Object.freeze({
    kind: "basic",
    type: type_,
    loc
});
export const isLTBasic = ($value: LTBasic) => $value.kind === "basic";
export type LTTensor = $.LTTensor;
export const LTTensor = (typeArgs: readonly $.LType[], loc: $c.Loc): $.LTTensor => Object.freeze({
    kind: "tensor_type",
    typeArgs,
    loc
});
export const isLTTensor = ($value: LTTensor) => $value.kind === "tensor_type";
export type LTTuple = $.LTTuple;
export const LTTuple = (typeArgs: readonly $.LType[], loc: $c.Loc): $.LTTuple => Object.freeze({
    kind: "tuple_type",
    typeArgs,
    loc
});
export const isLTTuple = ($value: LTTuple) => $value.kind === "tuple_type";
export type LTMaybe = $.LTMaybe;
export const LTMaybe = (type_: $.LType, loc: $c.Loc): $.LTMaybe => Object.freeze({
    kind: "TypeMaybe",
    type: type_,
    loc
});
export const isLTMaybe = ($value: LTMaybe) => $value.kind === "TypeMaybe";
export type LTMap = $.LTMap;
export const LTMap = (key: $.LType, value: $.LType, loc: $c.Loc): $.LTMap => Object.freeze({
    kind: "map_type",
    key,
    value,
    loc
});
export const isLTMap = ($value: LTMap) => $value.kind === "map_type";
export type LTAliasRef = $.LTAliasRef;
export const LTAliasRef = (name: $c.TypeId, type_: $.LType, typeArgs: readonly $.LType[], loc: $c.Loc): $.LTAliasRef => Object.freeze({
    kind: "TypeAlias",
    name,
    type: type_,
    typeArgs,
    loc
});
export const isLTAliasRef = ($value: LTAliasRef) => $value.kind === "TypeAlias";
export type LTRef = $.LTRef;
export const LTRef = (name: $c.TypeId, type_: CTypeDeclRefable, typeArgs: readonly $.LType[], loc: $c.Loc): $.LTRef => Object.freeze({
    kind: "type_ref",
    name,
    type: type_,
    typeArgs,
    loc
});
export const isLTRef = ($value: LTRef) => $value.kind === "type_ref";
export type LType = $.LType;