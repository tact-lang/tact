import type { CTypeDeclRefable } from "@/next/ast/checked";
import type { Loc, TypeId } from "@/next/ast/common";
import type { CTParamRef } from "@/next/ast/checked-type";
import type { BasicType } from "@/next/ast/type-basic";

export type SelfType =
    | SelfTypeGround
    | SVTRef
    | SVTMap
    | SVTMaybe
    | SVTTuple
    | SVTTensor;

export type SelfTypeGround =
    | SGTRef
    | SGTMap
    | SGTMaybe
    | SGTTuple
    | SGTTensor
    | SGTBasic;

export type SGTBasic = {
    readonly ground: "yes";
    readonly kind: "basic";
    readonly type: BasicType;
    readonly loc: Loc;
};

export type SGTRef = {
    readonly ground: "yes";
    readonly kind: "type_ref";
    readonly name: TypeId;
    readonly type: CTypeDeclRefable;
    readonly typeArgs: readonly SelfTypeGround[];
    readonly loc: Loc;
};

export type SGTMaybe = {
    readonly ground: "yes";
    readonly kind: "TypeMaybe";
    readonly type: SelfTypeGround;
    readonly loc: Loc;
};

export type SGTMap = {
    readonly ground: "yes";
    readonly kind: "map_type";
    readonly key: SelfTypeGround;
    readonly value: SelfTypeGround;
    readonly loc: Loc;
};

export type SGTTuple = {
    readonly ground: "yes";
    readonly kind: "tuple_type";
    readonly typeArgs: readonly SelfTypeGround[];
    readonly loc: Loc;
};

export type SGTTensor = {
    readonly ground: "yes";
    readonly kind: "tensor_type";
    readonly typeArgs: readonly SelfTypeGround[];
    readonly loc: Loc;
};

export type SVTRef = {
    readonly ground: "no";
    readonly kind: "type_ref";
    readonly name: TypeId;
    readonly type: CTypeDeclRefable;
    readonly typeArgs: readonly CTParamRef[];
    readonly loc: Loc;
};

export type SVTMaybe = {
    readonly ground: "no";
    readonly kind: "TypeMaybe";
    readonly type: CTParamRef;
    readonly loc: Loc;
};

export type SVTMap = {
    readonly ground: "no";
    readonly kind: "map_type";
    readonly key: CTParamRef;
    readonly value: CTParamRef;
    readonly loc: Loc;
};

export type SVTTuple = {
    readonly ground: "no";
    readonly kind: "tuple_type";
    readonly typeArgs: readonly CTParamRef[];
    readonly loc: Loc;
};

export type SVTTensor = {
    readonly ground: "no";
    readonly kind: "tensor_type";
    readonly typeArgs: readonly CTParamRef[];
    readonly loc: Loc;
};
