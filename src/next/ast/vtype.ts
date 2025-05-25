import type { Loc, TypeId } from "@/next/ast/common";
import type * as Ast from "@/next/ast/type";

export type VType =
    | VTypeVar
    | VTypeMap
    | VTypeCons
    | VTypeTuple
    | VTypeTensor
    | VTypeAlias
    | VTypeInt
    | VTypeSlice
    | VTypeCell
    | VTypeBuilder
    | VTypeUnit
    | VTypeVoid
    | VTypeNull
    | VTypeBool
    | VTypeAddress
    | VTypeString
    | VTypeStringBuilder
    | VTypeBounced
    | VTypeMaybe;

export type VTypeInt = Ast.TypeInt;
export type VTypeSlice = Ast.TypeSlice;
export type VTypeCell = Ast.TypeCell;
export type VTypeBuilder = Ast.TypeBuilder;
export type VTypeUnit = Ast.TypeUnit;
export type VTypeVoid = Ast.TypeVoid;
export type VTypeNull = Ast.TypeNull;
export type VTypeBool = Ast.TypeBool;
export type VTypeAddress = Ast.TypeAddress;
export type VTypeString = Ast.TypeString;
export type VTypeStringBuilder = Ast.TypeStringBuilder;

export type VTypeVar = {
    readonly kind: "type_var";
    readonly id: number;
}

export type VTypeAlias = {
    readonly kind: "TypeAlias"
    readonly cons: VTypeCons;
    readonly type: VType;
    readonly loc: Loc;
}

export type VTypeCons = {
    readonly kind: "cons_type";
    readonly name: TypeId;
    readonly typeArgs: readonly VType[];
    readonly loc: Loc;
};

export type VTypeTuple = {
    readonly kind: "tuple_type";
    readonly typeArgs: readonly VType[];
    readonly loc: Loc;
};

export type VTypeTensor = {
    readonly kind: "tensor_type";
    readonly typeArgs: readonly VType[];
    readonly loc: Loc;
};

export type VTypeMap = {
    readonly kind: "map_type";
    readonly key: VType;
    readonly value: VType;
    readonly loc: Loc;
};

export type VTypeBounced = {
    readonly kind: "TypeBounced"
    readonly type: VType;
    readonly loc: Loc;
}

export type VTypeMaybe = {
    readonly kind: "TypeMaybe"
    readonly type: VType;
    readonly loc: Loc;
}
