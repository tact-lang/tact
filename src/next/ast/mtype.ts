import type { OptionalId, Loc, TypeId } from "@/next/ast/common";
import type { DecodedType, DTypeParamRef } from "@/next/ast/dtype";
import type * as Ast from "@/next/ast/type";

export type MFnType = {
    readonly typeParams: readonly TypeId[];
    readonly args: readonly MTypedParameter[];
    readonly returnType: DecodedType,
}

export type MMethodFnType = {
    readonly typeParams: readonly TypeId[];
    readonly self: SelfType;
    readonly args: readonly MTypedParameter[];
    readonly returnType: DecodedType,
}

export type MTypedParameter = {
    readonly kind: "typed_parameter";
    readonly name: OptionalId;
    readonly type: DecodedType;
    readonly loc: Loc;
};

export type SelfType =
    | MethodGroundType
    | MVTypeRef
    | MVTypeMap
    | MVTypeMaybe
    | MVTypeTuple
    | MVTypeTensor;

export type MethodGroundType =
    | MGTypeRef
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
    | MGTypeStringBuilder
    | MGTypeMap
    | MGTypeMaybe
    | MGTypeTuple
    | MGTypeTensor;

export type MGTypeInt = Ast.TypeInt
export type MGTypeSlice = Ast.TypeSlice
export type MGTypeCell = Ast.TypeCell
export type MGTypeBuilder = Ast.TypeBuilder
export type MGTypeUnit = Ast.TypeUnit
export type MGTypeVoid = Ast.TypeVoid
export type MGTypeNull = Ast.TypeNull
export type MGTypeBool = Ast.TypeBool
export type MGTypeAddress = Ast.TypeAddress
export type MGTypeString = Ast.TypeString
export type MGTypeStringBuilder = Ast.TypeStringBuilder

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
