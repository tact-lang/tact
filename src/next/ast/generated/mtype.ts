/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/ast/mtype";
import type * as $c from "@/next/ast/common";
import type * as $d from "@/next/ast/dtype";

export type MGTypeInt = $.MGTypeInt;
export type MGTypeSlice = $.MGTypeSlice;
export type MGTypeCell = $.MGTypeCell;
export type MGTypeBuilder = $.MGTypeBuilder;
export type MGTypeUnit = $.MGTypeUnit;
export type MGTypeVoid = $.MGTypeVoid;
export type MGTypeNull = $.MGTypeNull;
export type MGTypeBool = $.MGTypeBool;
export type MGTypeAddress = $.MGTypeAddress;
export type MGTypeString = $.MGTypeString;
export type MGTypeStringBuilder = $.MGTypeStringBuilder;
export type MGTypeRef = $.MGTypeRef;
export const MGTypeRef = (name: $c.TypeId, typeArgs: readonly $.MethodGroundType[], loc: $c.Loc): $.MGTypeRef => Object.freeze({
    ground: "yes",
    kind: "type_ref",
    name,
    typeArgs,
    loc
});
export const isMGTypeRef = ($value: MGTypeRef) => $value.kind === "type_ref";
export type MGTypeMaybe = $.MGTypeMaybe;
export const MGTypeMaybe = (type_: $.MethodGroundType, loc: $c.Loc): $.MGTypeMaybe => Object.freeze({
    ground: "yes",
    kind: "TypeMaybe",
    type: type_,
    loc
});
export const isMGTypeMaybe = ($value: MGTypeMaybe) => $value.kind === "TypeMaybe";
export type MGTypeMap = $.MGTypeMap;
export const MGTypeMap = (key: $.MethodGroundType, value: $.MethodGroundType, loc: $c.Loc): $.MGTypeMap => Object.freeze({
    ground: "yes",
    kind: "map_type",
    key,
    value,
    loc
});
export const isMGTypeMap = ($value: MGTypeMap) => $value.kind === "map_type";
export type MGTypeTuple = $.MGTypeTuple;
export const MGTypeTuple = (typeArgs: readonly $.MethodGroundType[], loc: $c.Loc): $.MGTypeTuple => Object.freeze({
    ground: "yes",
    kind: "tuple_type",
    typeArgs,
    loc
});
export const isMGTypeTuple = ($value: MGTypeTuple) => $value.kind === "tuple_type";
export type MGTypeTensor = $.MGTypeTensor;
export const MGTypeTensor = (typeArgs: readonly $.MethodGroundType[], loc: $c.Loc): $.MGTypeTensor => Object.freeze({
    ground: "yes",
    kind: "tensor_type",
    typeArgs,
    loc
});
export const isMGTypeTensor = ($value: MGTypeTensor) => $value.kind === "tensor_type";
export type MVTypeRef = $.MVTypeRef;
export const MVTypeRef = (name: $c.TypeId, typeArgs: readonly $d.DTypeParamRef[], loc: $c.Loc): $.MVTypeRef => Object.freeze({
    ground: "no",
    kind: "type_ref",
    name,
    typeArgs,
    loc
});
export const isMVTypeRef = ($value: MVTypeRef) => $value.kind === "type_ref";
export type MVTypeMaybe = $.MVTypeMaybe;
export const MVTypeMaybe = (type_: $d.DTypeParamRef, loc: $c.Loc): $.MVTypeMaybe => Object.freeze({
    ground: "no",
    kind: "TypeMaybe",
    type: type_,
    loc
});
export const isMVTypeMaybe = ($value: MVTypeMaybe) => $value.kind === "TypeMaybe";
export type MVTypeMap = $.MVTypeMap;
export const MVTypeMap = (key: $d.DTypeParamRef, value: $d.DTypeParamRef, loc: $c.Loc): $.MVTypeMap => Object.freeze({
    ground: "no",
    kind: "map_type",
    key,
    value,
    loc
});
export const isMVTypeMap = ($value: MVTypeMap) => $value.kind === "map_type";
export type MVTypeTuple = $.MVTypeTuple;
export const MVTypeTuple = (typeArgs: readonly $d.DTypeParamRef[], loc: $c.Loc): $.MVTypeTuple => Object.freeze({
    ground: "no",
    kind: "tuple_type",
    typeArgs,
    loc
});
export const isMVTypeTuple = ($value: MVTypeTuple) => $value.kind === "tuple_type";
export type MVTypeTensor = $.MVTypeTensor;
export const MVTypeTensor = (typeArgs: readonly $d.DTypeParamRef[], loc: $c.Loc): $.MVTypeTensor => Object.freeze({
    ground: "no",
    kind: "tensor_type",
    typeArgs,
    loc
});
export const isMVTypeTensor = ($value: MVTypeTensor) => $value.kind === "tensor_type";
export type SelfType = $.SelfType;
export type MethodGroundType = $.MethodGroundType;
export type MMethodFnType = $.MMethodFnType;
export const MMethodFnType = (typeParams: readonly $c.TypeId[], self: $.SelfType, args: readonly $.MTypedParameter[], returnType: $d.DecodedType): $.MMethodFnType => Object.freeze({
    typeParams,
    self,
    args,
    returnType
});
export type MTypedParameter = $.MTypedParameter;
export const MTypedParameter = (name: $c.OptionalId, type_: $d.DecodedType, loc: $c.Loc): $.MTypedParameter => Object.freeze({
    kind: "typed_parameter",
    name,
    type: type_,
    loc
});
export type MFnType = $.MFnType;
export const MFnType = (typeParams: readonly $c.TypeId[], args: readonly $.MTypedParameter[], returnType: $d.DecodedType): $.MFnType => Object.freeze({
    typeParams,
    args,
    returnType
});