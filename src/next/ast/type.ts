import type { Range, TypeId } from "@/next/ast/common";

export type Type =
    | TypeCons
    | TypeInt
    | TypeSlice
    | TypeCell
    | TypeBuilder
    | TypeTuple
    | TypeUnit
    | TypeTensor;

export type TypeCons = {
    readonly kind: "cons_type";
    readonly name: TypeId;
    readonly typeArgs: readonly Type[];
    readonly loc: Range;
};

export type TypeInt = {
    readonly kind: "TyInt";
    readonly format: IntFormat;
    readonly loc: Range;
};
export type IntFormat = IFInt | IFVarInt;
export type IFInt = {
    readonly kind: "FInt";
    readonly sign: Signedness;
    readonly width: number;
    readonly loc: Range;
};
export type IFVarInt = {
    readonly kind: "FVarInt";
    readonly sign: Signedness;
    readonly width: VarIntWidth;
    readonly loc: Range;
};
export type VarIntWidth = "16" | "32";
export type Signedness = "signed" | "unsigned";

export type TypeSlice = {
    readonly kind: "TySlice";
    readonly format: SliceFormat;
    readonly loc: Range;
};
export type SliceFormat = SFBits | SFRemaining | SFDefault;
export type SFBits = {
    readonly kind: "SFBits";
    readonly bits: number;
    readonly loc: Range;
};
export type SFRemaining = {
    readonly kind: "SFRemaining";
    readonly loc: Range;
};
export type SFDefault = {
    readonly kind: "SFDefault";
    readonly loc: Range;
};

export type TypeCell = {
    readonly kind: "TyCell";
    readonly format: RemFormat;
    readonly loc: Range;
};
export type TypeBuilder = {
    readonly kind: "TyBuilder";
    readonly format: RemFormat;
    readonly loc: Range;
};
export type RemFormat = SFRemaining | SFDefault;

export type TypeTuple = {
    readonly kind: "tuple_type";
    readonly typeArgs: readonly Type[];
    readonly loc: Range;
};

export type TypeUnit = {
    readonly kind: "unit_type";
    readonly loc: Range;
};

export type TypeTensor = {
    readonly kind: "tensor_type";
    readonly typeArgs: readonly Type[];
    readonly loc: Range;
};

