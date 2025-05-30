import type { Loc, TypeId } from "@/next/ast/common";
import type * as Ast from "@/next/ast/type";

export type DecodedType =
    | DTypeRecover
    | DTypeRef
    | DTypeAliasRef
    | DTypeParamRef
    | DTypeMap
    | DTypeBounced
    | DTypeMaybe
    | DTypeTuple
    | DTypeTensor
    | DTypeInt
    | DTypeSlice
    | DTypeCell
    | DTypeBuilder
    | DTypeUnit
    | DTypeVoid
    | DTypeNull
    | DTypeBool
    | DTypeAddress
    | DTypeString
    | DTypeStringBuilder;

export type DTypeInt = Ast.TypeInt
export type DTypeSlice = Ast.TypeSlice
export type DTypeCell = Ast.TypeCell
export type DTypeBuilder = Ast.TypeBuilder
export type DTypeUnit = Ast.TypeUnit
export type DTypeVoid = Ast.TypeVoid
export type DTypeNull = Ast.TypeNull
export type DTypeBool = Ast.TypeBool
export type DTypeAddress = Ast.TypeAddress
export type DTypeString = Ast.TypeString
export type DTypeStringBuilder = Ast.TypeStringBuilder

export type DTypeRecover = {
    readonly kind: "recover";
}

export type DTypeRef = {
    readonly kind: "type_ref";
    readonly name: TypeId;
    readonly typeArgs: readonly DecodedType[];
    readonly loc: Loc;
};

export type DTypeAliasRef = {
    readonly kind: "TypeAlias"
    readonly name: TypeId;
    readonly typeArgs: readonly DecodedType[];
    readonly loc: Loc;
}

export type DTypeParamRef = {
    readonly kind: "TypeParam"
    readonly name: TypeId;
    readonly loc: Loc;
}

export type DTypeBounced = {
    readonly kind: "TypeBounced"
    // name of the message type
    readonly name: TypeId;
    readonly loc: Loc;
}

export type DTypeMaybe = {
    readonly kind: "TypeMaybe"
    readonly type: DecodedType;
    readonly loc: Loc;
}

export type DTypeMap = {
    readonly kind: "map_type";
    readonly key: DecodedType;
    readonly value: DecodedType;
    readonly loc: Loc;
};

export type DTypeTuple = {
    readonly kind: "tuple_type";
    readonly typeArgs: readonly DecodedType[];
    readonly loc: Loc;
};

export type DTypeTensor = {
    readonly kind: "tensor_type";
    readonly typeArgs: readonly DecodedType[];
    readonly loc: Loc;
};
