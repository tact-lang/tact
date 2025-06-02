import type { Loc, OptionalId, TypeId } from "@/next/ast/common";

export type FnType = {
    readonly typeParams: readonly TypeId[];
    readonly params: readonly TypedParameter[];
    readonly returnType: Type;
};

export type MethodFnType = {
    readonly typeParams: readonly TypeId[];
    readonly self: Type;
    readonly args: readonly TypedParameter[];
    readonly returnType: Type;
};

export type TypedParameter = {
    readonly name: OptionalId;
    readonly type: Type;
    readonly loc: Loc;
};

export type Type =
    | TypeMap
    | TypeCons
    | TypeInt
    | TypeSlice
    | TypeCell
    | TypeBuilder
    | TypeTuple
    | TypeUnit
    | TypeTensor
    | TypeVoid
    | TypeNull
    | TypeBool
    | TypeAddress
    | TypeStateInit
    | TypeString
    | TypeStringBuilder
    | TypeBounced
    | TypeMaybe;

export type TypeCons = {
    readonly kind: "cons_type";
    readonly name: TypeId;
    readonly typeArgs: readonly Type[];
    readonly loc: Loc;
};

export type TypeVoid = {
    readonly kind: "TypeVoid";
    readonly loc: Loc;
};

export type TypeNull = {
    readonly kind: "TypeNull";
    readonly loc: Loc;
};

export type TypeBool = {
    readonly kind: "TypeBool";
    readonly loc: Loc;
};

export type TypeAddress = {
    readonly kind: "TypeAddress";
    readonly loc: Loc;
};

export type TypeStateInit = {
    readonly kind: "TypeStateInit";
    readonly loc: Loc;
};

export type TypeString = {
    readonly kind: "TypeString";
    readonly loc: Loc;
};

export type TypeStringBuilder = {
    readonly kind: "TypeStringBuilder";
    readonly loc: Loc;
};

export type TypeBounced = {
    readonly kind: "TypeBounced";
    readonly type: Type;
    readonly loc: Loc;
};

export type TypeMaybe = {
    readonly kind: "TypeMaybe";
    readonly type: Type;
    readonly loc: Loc;
};

export type TypeInt = {
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

export type TypeSlice = {
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

export type TypeCell = {
    readonly kind: "TyCell";
    readonly format: RemFormat;
    readonly loc: Loc;
};
export type TypeBuilder = {
    readonly kind: "TyBuilder";
    readonly format: RemFormat;
    readonly loc: Loc;
};
export type RemFormat = SFRemaining | SFDefault;

export type TypeTuple = {
    readonly kind: "tuple_type";
    readonly typeArgs: readonly Type[];
    readonly loc: Loc;
};

export type TypeUnit = {
    readonly kind: "unit_type";
    readonly loc: Loc;
};

export type TypeTensor = {
    readonly kind: "tensor_type";
    readonly typeArgs: readonly Type[];
    readonly loc: Loc;
};

export type TypeMap = {
    readonly kind: "map_type";
    readonly key: Type; // any type except tensor
    readonly value: Type; // any type except tensor
    readonly loc: Loc;
};
