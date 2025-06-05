import type { CTypeDeclRefable } from "@/next/ast/checked";
import type { Loc, TypeId } from "@/next/ast/common";
import type { BasicType } from "@/next/ast/type-basic";

export type DNotSet = {
    readonly kind: "not-set";
};

export type CType =
    | CTRecover
    | CTRef
    | CTAliasRef
    | CTParamRef
    | CTMap
    | CTBounced
    | CTMaybe
    | CTTuple
    | CTTensor
    | CTBasic;

export type CTBasic = {
    readonly kind: "basic";
    readonly type: BasicType;
    readonly loc: Loc;
};

export type CTRecover = {
    readonly kind: "recover";
};

export type CNotDealiased = {
    readonly kind: "NotDealiased";
};

export type CTRef = {
    readonly kind: "type_ref";
    readonly name: TypeId;
    readonly type: CTypeDeclRefable;
    readonly typeArgs: readonly CType[];
    // readonly funcType: Lazy<FuncType>;
    // readonly alloc: Lazy<Allocation>
    readonly loc: Loc;
};

export type CTAliasRef = {
    readonly kind: "TypeAlias";
    readonly name: TypeId;
    readonly type: CNotDealiased | CType;
    readonly typeArgs: readonly CType[];
    readonly loc: Loc;
};

export type CTParamRef = {
    readonly kind: "TypeParam";
    readonly name: TypeId;
    readonly loc: Loc;
};

export type CTBounced = {
    readonly kind: "TypeBounced";
    // name of the message type
    readonly name: TypeId;
    readonly loc: Loc;
};

export type CTMaybe = {
    readonly kind: "TypeMaybe";
    readonly type: CType;
    readonly loc: Loc;
};

export type CTMap = {
    readonly kind: "map_type";
    readonly key: CType;
    readonly value: CType;
    readonly loc: Loc;
};

export type CTTuple = {
    readonly kind: "tuple_type";
    readonly typeArgs: readonly CType[];
    readonly loc: Loc;
};

export type CTTensor = {
    readonly kind: "tensor_type";
    readonly typeArgs: readonly CType[];
    readonly loc: Loc;
};
