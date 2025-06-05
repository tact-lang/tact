import type { Loc } from "@/next/ast/common";

export type BasicType = TInt
    | TSlice
    | TCell
    | TBuilder
    | TUnit
    | TVoid
    | TNull
    | TBool
    | TAddress
    | TStateInit
    | TString
    | TStringBuilder

export type TUnit = {
    readonly kind: "unit_type";
    readonly loc: Loc;
};
    
export type TInt = {
    readonly kind: "TyInt";
    readonly format: IntFormat;
    readonly loc: Loc;
};
export type IntFormat = IFInt | IFVarInt;
export type IFInt = {
    readonly kind: "FInt";
    readonly sign: Signedness;
    readonly width: number;
    readonly loc: Loc;
};
export type IFVarInt = {
    readonly kind: "FVarInt";
    readonly sign: Signedness;
    readonly width: VarIntWidth;
    readonly loc: Loc;
};
export type VarIntWidth = "16" | "32";
export type Signedness = "signed" | "unsigned";

export type TSlice = {
    readonly kind: "TySlice";
    readonly format: SliceFormat;
    readonly loc: Loc;
};
export type SliceFormat = SFBits | SFRemaining | SFDefault;
export type SFBits = {
    readonly kind: "SFBits";
    readonly bits: number;
    readonly loc: Loc;
};
export type SFRemaining = {
    readonly kind: "SFRemaining";
    readonly loc: Loc;
};
export type SFDefault = {
    readonly kind: "SFDefault";
    readonly loc: Loc;
};

export type TCell = {
    readonly kind: "TyCell";
    readonly format: RemFormat;
    readonly loc: Loc;
};
export type TBuilder = {
    readonly kind: "TyBuilder";
    readonly format: RemFormat;
    readonly loc: Loc;
};
export type RemFormat = SFRemaining | SFDefault;

export type TVoid = {
    readonly kind: "TypeVoid";
    readonly loc: Loc;
};

export type TNull = {
    readonly kind: "TypeNull";
    readonly loc: Loc;
};

export type TBool = {
    readonly kind: "TypeBool";
    readonly loc: Loc;
};

export type TAddress = {
    readonly kind: "TypeAddress";
    readonly loc: Loc;
};

export type TStateInit = {
    readonly kind: "TypeStateInit";
    readonly loc: Loc;
};

export type TString = {
    readonly kind: "TypeString";
    readonly loc: Loc;
};

export type TStringBuilder = {
    readonly kind: "TypeStringBuilder";
    readonly loc: Loc;
};