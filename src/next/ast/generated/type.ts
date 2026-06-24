/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $ from "@/next/ast/type";

export type Signedness = $.Signedness;
export const allSignedness: readonly $.Signedness[] = ["signed", "unsigned"];
export type IFInt = $.IFInt;
export const IFInt = (
    sign: $.Signedness,
    width: number,
    loc: $c.Range,
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
    loc: $c.Range,
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
export const TypeInt = (format: $.IntFormat, loc: $c.Range): $.TypeInt =>
    Object.freeze({
        kind: "TyInt",
        format,
        loc,
    });
export const isTypeInt = ($value: TypeInt) => $value.kind === "TyInt";
export type SFBits = $.SFBits;
export const SFBits = (bits: number, loc: $c.Range): $.SFBits =>
    Object.freeze({
        kind: "SFBits",
        bits,
        loc,
    });
export const isSFBits = ($value: SFBits) => $value.kind === "SFBits";
export type SFRemaining = $.SFRemaining;
export const SFRemaining = (loc: $c.Range): $.SFRemaining =>
    Object.freeze({
        kind: "SFRemaining",
        loc,
    });
export const isSFRemaining = ($value: SFRemaining) =>
    $value.kind === "SFRemaining";
export type SFDefault = $.SFDefault;
export const SFDefault = (loc: $c.Range): $.SFDefault =>
    Object.freeze({
        kind: "SFDefault",
        loc,
    });
export const isSFDefault = ($value: SFDefault) => $value.kind === "SFDefault";
export type SliceFormat = $.SliceFormat;
export type TypeSlice = $.TypeSlice;
export const TypeSlice = (format: $.SliceFormat, loc: $c.Range): $.TypeSlice =>
    Object.freeze({
        kind: "TySlice",
        format,
        loc,
    });
export const isTypeSlice = ($value: TypeSlice) => $value.kind === "TySlice";
export type RemFormat = $.RemFormat;
export type TypeCell = $.TypeCell;
export const TypeCell = (format: $.RemFormat, loc: $c.Range): $.TypeCell =>
    Object.freeze({
        kind: "TyCell",
        format,
        loc,
    });
export const isTypeCell = ($value: TypeCell) => $value.kind === "TyCell";
export type TypeBuilder = $.TypeBuilder;
export const TypeBuilder = (
    format: $.RemFormat,
    loc: $c.Range,
): $.TypeBuilder =>
    Object.freeze({
        kind: "TyBuilder",
        format,
        loc,
    });
export const isTypeBuilder = ($value: TypeBuilder) =>
    $value.kind === "TyBuilder";
export type TypeUnit = $.TypeUnit;
export const TypeUnit = (loc: $c.Range): $.TypeUnit =>
    Object.freeze({
        kind: "unit_type",
        loc,
    });
export const isTypeUnit = ($value: TypeUnit) => $value.kind === "unit_type";
export type TypeTensor = $.TypeTensor;
export const TypeTensor = (
    typeArgs: readonly $.Type[],
    loc: $c.Range,
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
    loc: $c.Range,
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
    loc: $c.Range,
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
export const TypeMap = (key: $.Type, value: $.Type, loc: $c.Range): $.TypeMap =>
    Object.freeze({
        kind: "map_type",
        key,
        value,
        loc,
    });
export const isTypeMap = ($value: TypeMap) => $value.kind === "map_type";
