import type { CTypeDeclRefable } from "@/next/ast/checked";
import type { Loc, TypeId } from "@/next/ast/common";
import type { BasicType } from "@/next/ast/type-basic";

export type LNotSet = {
    readonly kind: "not-set";
};

export type LType =
    | LTypeRef
    | LTypeAliasRef
    | LTypeParamRef
    | LTypeMap
    | LTypeBounced
    | LTypeMaybe
    | LTypeTuple
    | LTypeTensor
    | LTBasic;

export type LTBasic = {
    readonly kind: "basic";
    readonly type: BasicType;
    readonly loc: Loc;
};

export type LTypeRef = {
    readonly kind: "type_ref";
    readonly name: TypeId;
    readonly type: CTypeDeclRefable;
    readonly typeArgs: readonly LType[];
    // readonly funcType: Lazy<FuncType>;
    // readonly alloc: Lazy<Allocation>
    readonly loc: Loc;
};

export type LTypeAliasRef = {
    readonly kind: "TypeAlias";
    readonly name: TypeId;
    readonly type: LType;
    readonly typeArgs: readonly LType[];
    readonly loc: Loc;
};

export type LTypeParamRef = {
    readonly kind: "TypeParam";
    readonly name: TypeId;
    readonly loc: Loc;
};

export type LTypeBounced = {
    readonly kind: "TypeBounced";
    // name of the message type
    readonly name: TypeId;
    readonly loc: Loc;
};

export type LTypeMaybe = {
    readonly kind: "TypeMaybe";
    readonly type: LType;
    readonly loc: Loc;
};

export type LTypeMap = {
    readonly kind: "map_type";
    readonly key: LType;
    readonly value: LType;
    readonly loc: Loc;
};

export type LTypeTuple = {
    readonly kind: "tuple_type";
    readonly typeArgs: readonly LType[];
    readonly loc: Loc;
};

export type LTypeTensor = {
    readonly kind: "tensor_type";
    readonly typeArgs: readonly LType[];
    readonly loc: Loc;
};
