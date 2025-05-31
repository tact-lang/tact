/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $ from "@/next/ast/type";

export type Signedness = $.Signedness;
export const allSignedness: readonly $.Signedness[] = ["signed", "unsigned"];
export type IFInt = $.IFInt;
export const IFInt = (
    sign: $.Signedness,
    width: number,
    loc: $c.Loc,
): $.IFInt =>
    Object.freeze({
        kind: "FInt",
        sign,
        width,
        loc,
    });
export const isIFInt = ($value: IFInt) => $value.kind === "FInt";
export type VarIntWidth = $.VarIntWidth;
export const allVarIntWidth: readonly $.VarIntWidth[] = ["16", "32"];
export type IFVarInt = $.IFVarInt;
export const IFVarInt = (
    sign: $.Signedness,
    width: $.VarIntWidth,
    loc: $c.Loc,
): $.IFVarInt =>
    Object.freeze({
        kind: "FVarInt",
        sign,
        width,
        loc,
    });
export const isIFVarInt = ($value: IFVarInt) => $value.kind === "FVarInt";
export type IntFormat = $.IntFormat;
export type TypeInt = $.TypeInt;
export const TypeInt = (format: $.IntFormat, loc: $c.Loc): $.TypeInt =>
    Object.freeze({
        kind: "TyInt",
        format,
        loc,
    });
export const isTypeInt = ($value: TypeInt) => $value.kind === "TyInt";
export type SFBits = $.SFBits;
export const SFBits = (bits: number, loc: $c.Loc): $.SFBits =>
    Object.freeze({
        kind: "SFBits",
        bits,
        loc,
    });
export const isSFBits = ($value: SFBits) => $value.kind === "SFBits";
export type SFRemaining = $.SFRemaining;
export const SFRemaining = (loc: $c.Loc): $.SFRemaining =>
    Object.freeze({
        kind: "SFRemaining",
        loc,
    });
export const isSFRemaining = ($value: SFRemaining) =>
    $value.kind === "SFRemaining";
export type SFDefault = $.SFDefault;
export const SFDefault = (loc: $c.Loc): $.SFDefault =>
    Object.freeze({
        kind: "SFDefault",
        loc,
    });
export const isSFDefault = ($value: SFDefault) => $value.kind === "SFDefault";
export type SliceFormat = $.SliceFormat;
export type TypeSlice = $.TypeSlice;
export const TypeSlice = (format: $.SliceFormat, loc: $c.Loc): $.TypeSlice =>
    Object.freeze({
        kind: "TySlice",
        format,
        loc,
    });
export const isTypeSlice = ($value: TypeSlice) => $value.kind === "TySlice";
export type RemFormat = $.RemFormat;
export type TypeCell = $.TypeCell;
export const TypeCell = (format: $.RemFormat, loc: $c.Loc): $.TypeCell =>
    Object.freeze({
        kind: "TyCell",
        format,
        loc,
    });
export const isTypeCell = ($value: TypeCell) => $value.kind === "TyCell";
export type TypeBuilder = $.TypeBuilder;
export const TypeBuilder = (
    format: $.RemFormat,
    loc: $c.Loc,
): $.TypeBuilder =>
    Object.freeze({
        kind: "TyBuilder",
        format,
        loc,
    });
export const isTypeBuilder = ($value: TypeBuilder) =>
    $value.kind === "TyBuilder";
export type TypeUnit = $.TypeUnit;
export const TypeUnit = (loc: $c.Loc): $.TypeUnit =>
    Object.freeze({
        kind: "unit_type",
        loc,
    });
export const isTypeUnit = ($value: TypeUnit) => $value.kind === "unit_type";
export type TypeTensor = $.TypeTensor;
export const TypeTensor = (
    typeArgs: readonly $.Type[],
    loc: $c.Loc,
): $.TypeTensor =>
    Object.freeze({
        kind: "tensor_type",
        typeArgs,
        loc,
    });
export const isTypeTensor = ($value: TypeTensor) =>
    $value.kind === "tensor_type";
export type TypeTuple = $.TypeTuple;
export const TypeTuple = (
    typeArgs: readonly $.Type[],
    loc: $c.Loc,
): $.TypeTuple =>
    Object.freeze({
        kind: "tuple_type",
        typeArgs,
        loc,
    });
export const isTypeTuple = ($value: TypeTuple) => $value.kind === "tuple_type";
export type TypeCons = $.TypeCons;
export const TypeCons = (
    name: $c.TypeId,
    typeArgs: readonly $.Type[],
    loc: $c.Loc,
): $.TypeCons =>
    Object.freeze({
        kind: "cons_type",
        name,
        typeArgs,
        loc,
    });
export const isTypeCons = ($value: TypeCons) => $value.kind === "cons_type";
export type Type = $.Type;
export type TypeMap = $.TypeMap;
export const TypeMap = (key: $.Type, value: $.Type, loc: $c.Loc): $.TypeMap =>
    Object.freeze({
        kind: "map_type",
        key,
        value,
        loc,
    });
export const isTypeMap = ($value: TypeMap) => $value.kind === "map_type";

export type TypeVoid = $.TypeVoid;
export const TypeVoid = (loc: $c.Loc): $.TypeVoid => Object.freeze({
    kind: "TypeVoid",
    loc
});
export const isTypeVoid = ($value: TypeVoid) => $value.kind === "TypeVoid";
export type TypeNull = $.TypeNull;
export const TypeNull = (loc: $c.Loc): $.TypeNull => Object.freeze({
    kind: "TypeNull",
    loc
});
export const isTypeNull = ($value: TypeNull) => $value.kind === "TypeNull";
export type TypeBool = $.TypeBool;
export const TypeBool = (loc: $c.Loc): $.TypeBool => Object.freeze({
    kind: "TypeBool",
    loc
});
export const isTypeBool = ($value: TypeBool) => $value.kind === "TypeBool";
export type TypeAddress = $.TypeAddress;
export const TypeAddress = (loc: $c.Loc): $.TypeAddress => Object.freeze({
    kind: "TypeAddress",
    loc
});
export const isTypeAddress = ($value: TypeAddress) => $value.kind === "TypeAddress";
export type TypeString = $.TypeString;
export const TypeString = (loc: $c.Loc): $.TypeString => Object.freeze({
    kind: "TypeString",
    loc
});
export const isTypeString = ($value: TypeString) => $value.kind === "TypeString";
export type TypeStringBuilder = $.TypeStringBuilder;
export const TypeStringBuilder = (loc: $c.Loc): $.TypeStringBuilder => Object.freeze({
    kind: "TypeStringBuilder",
    loc
});
export const isTypeStringBuilder = ($value: TypeStringBuilder) => $value.kind === "TypeStringBuilder";
export type TypeBounced = $.TypeBounced;
export const TypeBounced = (type_: $.Type, loc: $c.Loc): $.TypeBounced => Object.freeze({
    kind: "TypeBounced",
    type: type_,
    loc
});
export const isTypeBounced = ($value: TypeBounced) => $value.kind === "TypeBounced";
export type TypeMaybe = $.TypeMaybe;
export const TypeMaybe = (type_: $.Type, loc: $c.Loc): $.TypeMaybe => Object.freeze({
    kind: "TypeMaybe",
    type: type_,
    loc
});
export const isTypeMaybe = ($value: TypeMaybe) => $value.kind === "TypeMaybe";
export type TypedParameter = $.TypedParameter;
export const TypedParameter = (name: $c.OptionalId, type_: $.Type, loc: $c.Loc): $.TypedParameter => Object.freeze({
    name,
    type: type_,
    loc
});
export type FnType = $.FnType;
export const FnType = (typeParams: readonly $c.TypeId[], params: readonly $.TypedParameter[], returnType: $.Type): $.FnType => Object.freeze({
    typeParams,
    params,
    returnType
});
export type MethodFnType = $.MethodFnType;
export const MethodFnType = (typeParams: readonly $c.TypeId[], self: $.Type, args: readonly $.TypedParameter[], returnType: $.Type): $.MethodFnType => Object.freeze({
    typeParams,
    self,
    args,
    returnType
});
export type TypeStateInit = $.TypeStateInit;
export const TypeStateInit = (loc: $c.Loc): $.TypeStateInit => Object.freeze({
    kind: "TypeStateInit",
    loc
});
export const isTypeStateInit = ($value: TypeStateInit) => $value.kind === "TypeStateInit";
