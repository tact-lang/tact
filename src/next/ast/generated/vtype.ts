/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/vtype";
import type * as $c from "@/next/ast/common";

export type VTypeVar = $.VTypeVar;
export const VTypeVar = (id: number): $.VTypeVar => Object.freeze({
    kind: "type_var",
    id
});
export const isVTypeVar = ($value: VTypeVar) => $value.kind === "type_var";
export type VTypeInt = $.VTypeInt;
export type VTypeSlice = $.VTypeSlice;
export type VTypeCell = $.VTypeCell;
export type VTypeBuilder = $.VTypeBuilder;
export type VTypeUnit = $.VTypeUnit;
export type VTypeVoid = $.VTypeVoid;
export type VTypeNull = $.VTypeNull;
export type VTypeBool = $.VTypeBool;
export type VTypeAddress = $.VTypeAddress;
export type VTypeString = $.VTypeString;
export type VTypeStringBuilder = $.VTypeStringBuilder;
export type VTypeMaybe = $.VTypeMaybe;
export const VTypeMaybe = (type_: $.VType, loc: $c.Loc): $.VTypeMaybe => Object.freeze({
    kind: "TypeMaybe",
    type: type_,
    loc
});
export const isVTypeMaybe = ($value: VTypeMaybe) => $value.kind === "TypeMaybe";
export type VTypeBounced = $.VTypeBounced;
export const VTypeBounced = (type_: $.VType, loc: $c.Loc): $.VTypeBounced => Object.freeze({
    kind: "TypeBounced",
    type: type_,
    loc
});
export const isVTypeBounced = ($value: VTypeBounced) => $value.kind === "TypeBounced";
export type VTypeTensor = $.VTypeTensor;
export const VTypeTensor = (typeArgs: readonly $.VType[], loc: $c.Loc): $.VTypeTensor => Object.freeze({
    kind: "tensor_type",
    typeArgs,
    loc
});
export const isVTypeTensor = ($value: VTypeTensor) => $value.kind === "tensor_type";
export type VTypeTuple = $.VTypeTuple;
export const VTypeTuple = (typeArgs: readonly $.VType[], loc: $c.Loc): $.VTypeTuple => Object.freeze({
    kind: "tuple_type",
    typeArgs,
    loc
});
export const isVTypeTuple = ($value: VTypeTuple) => $value.kind === "tuple_type";
export type VTypeCons = $.VTypeCons;
export const VTypeCons = (name: $c.TypeId, typeArgs: readonly $.VType[], loc: $c.Loc): $.VTypeCons => Object.freeze({
    kind: "cons_type",
    name,
    typeArgs,
    loc
});
export const isVTypeCons = ($value: VTypeCons) => $value.kind === "cons_type";
export type VTypeMap = $.VTypeMap;
export const VTypeMap = (key: $.VType, value: $.VType, loc: $c.Loc): $.VTypeMap => Object.freeze({
    kind: "map_type",
    key,
    value,
    loc
});
export const isVTypeMap = ($value: VTypeMap) => $value.kind === "map_type";
export type VType = $.VType;
export type VTypeAlias = $.VTypeAlias;
export const VTypeAlias = (cons: $.VTypeCons, type_: $.VType, loc: $c.Loc): $.VTypeAlias => Object.freeze({
    kind: "TypeAlias",
    cons,
    type: type_,
    loc
});
export const isVTypeAlias = ($value: VTypeAlias) => $value.kind === "TypeAlias";
