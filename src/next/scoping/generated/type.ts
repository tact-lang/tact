/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $ from "@/next/scoping/type";

export type Inferred = $.Inferred;
export const Inferred = (range: $.Loc, readableName: string): $.Inferred => Object.freeze({
    kind: "inferred",
    range,
    readableName
});
export const isInferred = ($value: Inferred) => $value.kind === "inferred";
export type Loc = $.Loc;

export type Signedness = $.Signedness;
export const allSignedness: readonly $.Signedness[] = ["signed", "unsigned"];
export type IFInt = $.IFInt;
export const IFInt = (
    sign: $.Signedness,
    width: number,
    loc: $.Loc,
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
    loc: $.Loc,
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
export const TypeInt = (format: $.IntFormat, loc: $.Loc): $.TypeInt =>
    Object.freeze({
        kind: "TyInt",
        format,
        loc,
    });
export const isTypeInt = ($value: TypeInt) => $value.kind === "TyInt";
export type SFBits = $.SFBits;
export const SFBits = (bits: number, loc: $.Loc): $.SFBits =>
    Object.freeze({
        kind: "SFBits",
        bits,
        loc,
    });
export const isSFBits = ($value: SFBits) => $value.kind === "SFBits";
export type SFRemaining = $.SFRemaining;
export const SFRemaining = (loc: $.Loc): $.SFRemaining =>
    Object.freeze({
        kind: "SFRemaining",
        loc,
    });
export const isSFRemaining = ($value: SFRemaining) =>
    $value.kind === "SFRemaining";
export type SFDefault = $.SFDefault;
export const SFDefault = (loc: $.Loc): $.SFDefault =>
    Object.freeze({
        kind: "SFDefault",
        loc,
    });
export const isSFDefault = ($value: SFDefault) => $value.kind === "SFDefault";
export type SliceFormat = $.SliceFormat;
export type TypeSlice = $.TypeSlice;
export const TypeSlice = (format: $.SliceFormat, loc: $.Loc): $.TypeSlice =>
    Object.freeze({
        kind: "TySlice",
        format,
        loc,
    });
export const isTypeSlice = ($value: TypeSlice) => $value.kind === "TySlice";
export type RemFormat = $.RemFormat;
export type TypeCell = $.TypeCell;
export const TypeCell = (format: $.RemFormat, loc: $.Loc): $.TypeCell =>
    Object.freeze({
        kind: "TyCell",
        format,
        loc,
    });
export const isTypeCell = ($value: TypeCell) => $value.kind === "TyCell";
export type TypeBuilder = $.TypeBuilder;
export const TypeBuilder = (
    format: $.RemFormat,
    loc: $.Loc,
): $.TypeBuilder =>
    Object.freeze({
        kind: "TyBuilder",
        format,
        loc,
    });
export const isTypeBuilder = ($value: TypeBuilder) =>
    $value.kind === "TyBuilder";
export type TypeUnit = $.TypeUnit;
export const TypeUnit = (loc: $.Loc): $.TypeUnit =>
    Object.freeze({
        kind: "unit_type",
        loc,
    });
export const isTypeUnit = ($value: TypeUnit) => $value.kind === "unit_type";
export type TypeTensor = $.TypeTensor;
export const TypeTensor = (
    typeArgs: readonly $.Type[],
    loc: $.Loc,
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
    loc: $.Loc,
): $.TypeTuple =>
    Object.freeze({
        kind: "tuple_type",
        typeArgs,
        loc,
    });
export const isTypeTuple = ($value: TypeTuple) => $value.kind === "tuple_type";
export type TypeCons = $.TypeCons;
export const TypeCons = (
    name: $.TypeId,
    typeArgs: readonly $.Type[],
    loc: $.Loc,
): $.TypeCons =>
    Object.freeze({
        kind: "cons_type",
        name,
        typeArgs,
        loc,
    });
export const isTypeCons = ($value: TypeCons) => $value.kind === "cons_type";
export type LocType = $.LocType;
export type Type = $.Type;
export type TypeMap = $.TypeMap;
export const TypeMap = (key: $.Type, value: $.Type, loc: $.Loc): $.TypeMap =>
    Object.freeze({
        kind: "map_type",
        key,
        value,
        loc,
    });
export const isTypeMap = ($value: TypeMap) => $value.kind === "map_type";
export type TypeFunction = $.TypeFunction;
export const TypeFunction = (params: readonly $.Type[], returnType: $.Type | undefined): $.TypeFunction => Object.freeze({
    kind: "function",
    params,
    returnType
});
export const isTypeFunction = ($value: TypeFunction) => $value.kind === "function";
export type Builtin = $.Builtin;
export const Builtin = (readableName: string): $.Builtin => Object.freeze({
    kind: "builtin",
    readableName
});
export const isBuiltin = ($value: Builtin) => $value.kind === "builtin";
export type TypeVar = $.TypeVar;
export const TypeVar = (id: number): $.TypeVar => Object.freeze({
    kind: "type_var",
    id
});
export const isTypeVar = ($value: TypeVar) => $value.kind === "type_var";
export type TypeId = $.TypeId;
export const TypeId = (text: string, loc: $.Loc): $.TypeId => Object.freeze({
    kind: "type_id",
    text,
    loc
});
export const isTypeId = ($value: TypeId) => $value.kind === "type_id";
export type TypeErrorRecovered = $.TypeErrorRecovered;
export const TypeErrorRecovered = (): $.TypeErrorRecovered => Object.freeze({
    kind: "ERROR"
});
export const isTypeErrorRecovered = ($value: TypeErrorRecovered) => $value.kind === "ERROR";
