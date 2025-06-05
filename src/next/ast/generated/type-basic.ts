/* eslint-disable @typescript-eslint/no-unnecessary-condition */
import type * as $c from "@/next/ast/common";
import type * as $ from "@/next/ast/type-basic";

export type BasicType = $.BasicType
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
export type IntFormat = $.IntFormat;
export type TInt = $.TInt;
export const TInt = (format: $.IntFormat, loc: $c.Loc): $.TInt =>
    Object.freeze({
        kind: "TyInt",
        format,
        loc,
    });
export type SFBits = $.SFBits;
export const SFBits = (bits: number, loc: $c.Loc): $.SFBits =>
    Object.freeze({
        kind: "SFBits",
        bits,
        loc,
    });
export type SFRemaining = $.SFRemaining;
export const SFRemaining = (loc: $c.Loc): $.SFRemaining =>
    Object.freeze({
        kind: "SFRemaining",
        loc,
    });
export type SFDefault = $.SFDefault;
export const SFDefault = (loc: $c.Loc): $.SFDefault =>
    Object.freeze({
        kind: "SFDefault",
        loc,
    });
export type SliceFormat = $.SliceFormat;
export type TSlice = $.TSlice;
export const TSlice = (format: $.SliceFormat, loc: $c.Loc): $.TSlice =>
    Object.freeze({
        kind: "TySlice",
        format,
        loc,
    });
export type RemFormat = $.RemFormat;
export type TCell = $.TCell;
export const TCell = (format: $.RemFormat, loc: $c.Loc): $.TCell =>
    Object.freeze({
        kind: "TyCell",
        format,
        loc,
    });
export type TBuilder = $.TBuilder;
export const TBuilder = (format: $.RemFormat, loc: $c.Loc): $.TBuilder =>
    Object.freeze({
        kind: "TyBuilder",
        format,
        loc,
    });
export type TUnit = $.TUnit;
export const TUnit = (loc: $c.Loc): $.TUnit =>
    Object.freeze({
        kind: "unit_type",
        loc,
    });
export type TVoid = $.TVoid;
export const TVoid = (loc: $c.Loc): $.TVoid =>
    Object.freeze({
        kind: "TypeVoid",
        loc,
    });
export type TNull = $.TNull;
export const TNull = (loc: $c.Loc): $.TNull =>
    Object.freeze({
        kind: "TypeNull",
        loc,
    });
export type TBool = $.TBool;
export const TBool = (loc: $c.Loc): $.TBool =>
    Object.freeze({
        kind: "TypeBool",
        loc,
    });
export type TAddress = $.TAddress;
export const TAddress = (loc: $c.Loc): $.TAddress =>
    Object.freeze({
        kind: "TypeAddress",
        loc,
    });
export type TString = $.TString;
export const TString = (loc: $c.Loc): $.TString =>
    Object.freeze({
        kind: "TypeString",
        loc,
    });
export type TStringBuilder = $.TStringBuilder;
export const TStringBuilder = (loc: $c.Loc): $.TStringBuilder =>
    Object.freeze({
        kind: "TypeStringBuilder",
        loc,
    });
export type TStateInit = $.TStateInit;
export const TStateInit = (loc: $c.Loc): $.TStateInit =>
    Object.freeze({
        kind: "TypeStateInit",
        loc,
    });
