import type { Loc } from "@/next/ast";

export type TypeId = {
    readonly kind: "type_id";
    readonly text: string;
    readonly loc: Loc;
};

export type Loc = Loc | Inferred | Builtin;

/**
 * Type that was computed from AST
 */
export type Inferred = {
    readonly kind: "inferred";
    readonly range: Loc;
    readonly readableName: string;
}

/**
 * Type that came from builtins, where we don't have location at all
 */
export type Builtin = {
    readonly kind: "builtin";
    readonly readableName: string;
}

export type TypeFunction = {
    readonly kind: "function";
    // readonly typeParams: readonly string[];
    readonly params: readonly Type[];
    readonly returnType: undefined | Type;
}

export type Type =
    | TypeErrorRecovered
    | TypeVar
    | TypeMap
    | TypeCons
    | TypeInt
    | TypeSlice
    | TypeCell
    | TypeBuilder
    | TypeTuple
    | TypeUnit
    | TypeTensor;

export type LocType =
    | TypeMap
    | TypeCons
    | TypeInt
    | TypeSlice
    | TypeCell
    | TypeBuilder
    | TypeTuple
    | TypeUnit
    | TypeTensor

export type TypeErrorRecovered = {
    readonly kind: "ERROR";
};

export type TypeVar = {
    readonly kind: "type_var";
    readonly id: number;
};

export type TypeCons = {
    readonly kind: "cons_type";
    readonly name: TypeId;
    readonly typeArgs: readonly Type[];
    readonly loc: Loc;
};

export type TypeBool = {
    readonly kind: "TyBool";
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
