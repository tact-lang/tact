import type { CTypeDeclRefable } from "@/next/ast/checked";
import type { Loc, TypeId } from "@/next/ast/common";
import type { BasicType } from "@/next/ast/type-basic";

export type LType =
    | LTRef
    | LTAliasRef
    | LTParamRef
    | LTMap
    | LTBounced
    | LTMaybe
    | LTTuple
    | LTTensor
    | LTBasic;

export type LTBasic = {
    readonly kind: "basic";
    readonly type: BasicType;
    readonly loc: Loc;
};

export type LTRef = {
    readonly kind: "type_ref";
    readonly name: TypeId;
    readonly type: CTypeDeclRefable;
    readonly typeArgs: readonly LType[];
    // readonly funcType: Lazy<FuncType>;
    // readonly alloc: Lazy<Allocation>
    readonly loc: Loc;
};

export type LTAliasRef = {
    readonly kind: "TypeAlias";
    readonly name: TypeId;
    readonly type: LType;
    readonly typeArgs: readonly LType[];
    readonly loc: Loc;
};

export type LTParamRef = {
    readonly kind: "TypeParam";
    readonly name: TypeId;
    readonly loc: Loc;
};

export type LTBounced = {
    readonly kind: "TypeBounced";
    // name of the message type
    readonly name: TypeId;
    readonly loc: Loc;
};

export type LTMaybe = {
    readonly kind: "TypeMaybe";
    readonly type: LType;
    readonly loc: Loc;
};

export type LTMap = {
    readonly kind: "map_type";
    readonly key: LType;
    readonly value: LType;
    readonly loc: Loc;
};

export type LTTuple = {
    readonly kind: "tuple_type";
    readonly typeArgs: readonly LType[];
    readonly loc: Loc;
};

export type LTTensor = {
    readonly kind: "tensor_type";
    readonly typeArgs: readonly LType[];
    readonly loc: Loc;
};
