import type { Loc, TypeId } from "@/next/ast/common";
import type { DTypeParamRef } from "@/next/ast/dtype";
import type * as Ast from "@/next/ast/type";

export type SelfType =
    | MethodGroundType
    | MVTypeRef
    | MVTypeMap
    | MVTypeMaybe
    | MVTypeTuple
    | MVTypeTensor;

export type MethodGroundType =
    | MGTypeRef
    | MGTypeMap
    | MGTypeMaybe
    | MGTypeTuple
    | MGTypeTensor
    | MGTypeInt
    | MGTypeSlice
    | MGTypeCell
    | MGTypeBuilder
    | MGTypeUnit
    | MGTypeVoid
    | MGTypeNull
    | MGTypeBool
    | MGTypeAddress
    | MGTypeString
    | MGTypeStringBuilder;

export type Ground<T> = T & {
    readonly ground: "yes",
}

export type MGTypeInt = Ground<Ast.TypeInt>
export type MGTypeSlice = Ground<Ast.TypeSlice>
export type MGTypeCell = Ground<Ast.TypeCell>
export type MGTypeBuilder = Ground<Ast.TypeBuilder>
export type MGTypeUnit = Ground<Ast.TypeUnit>
export type MGTypeVoid = Ground<Ast.TypeVoid>
export type MGTypeNull = Ground<Ast.TypeNull>
export type MGTypeBool = Ground<Ast.TypeBool>
export type MGTypeAddress = Ground<Ast.TypeAddress>
export type MGTypeString = Ground<Ast.TypeString>
export type MGTypeStringBuilder = Ground<Ast.TypeStringBuilder>

export type MGTypeRef = {
    readonly ground: "yes",
    readonly kind: "type_ref";
    readonly name: TypeId;
    readonly typeArgs: readonly MethodGroundType[];
    readonly loc: Loc;
};

export type MGTypeMaybe = {
    readonly ground: "yes";
    readonly kind: "TypeMaybe"
    readonly type: MethodGroundType;
    readonly loc: Loc;
}

export type MGTypeMap = {
    readonly ground: "yes";
    readonly kind: "map_type";
    readonly key: MethodGroundType;
    readonly value: MethodGroundType;
    readonly loc: Loc;
};

export type MGTypeTuple = {
    readonly ground: "yes";
    readonly kind: "tuple_type";
    readonly typeArgs: readonly MethodGroundType[];
    readonly loc: Loc;
};

export type MGTypeTensor = {
    readonly ground: "yes";
    readonly kind: "tensor_type";
    readonly typeArgs: readonly MethodGroundType[];
    readonly loc: Loc;
};



export type MVTypeRef = {
    readonly ground: "no",
    readonly kind: "type_ref";
    readonly name: TypeId;
    readonly typeArgs: readonly DTypeParamRef[];
    readonly loc: Loc;
};

export type MVTypeMaybe = {
    readonly ground: "no",
    readonly kind: "TypeMaybe"
    readonly type: DTypeParamRef;
    readonly loc: Loc;
}

export type MVTypeMap = {
    readonly ground: "no",
    readonly kind: "map_type";
    readonly key: DTypeParamRef;
    readonly value: DTypeParamRef;
    readonly loc: Loc;
};

export type MVTypeTuple = {
    readonly ground: "no",
    readonly kind: "tuple_type";
    readonly typeArgs: readonly DTypeParamRef[];
    readonly loc: Loc;
};

export type MVTypeTensor = {
    readonly ground: "no",
    readonly kind: "tensor_type";
    readonly typeArgs: readonly DTypeParamRef[];
    readonly loc: Loc;
};
