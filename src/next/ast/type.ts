import type { Loc, OptionalId, TypeId } from "@/next/ast/common";
import type { BasicType } from "@/next/ast/type-basic";

export type TFunction = {
    readonly typeParams: readonly TypeId[];
    readonly params: readonly TypedParameter[];
    readonly returnType: Type;
};

export type TMethod = {
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
    | TMap
    | TCons
    | TTuple
    | TTensor
    | TBounced
    | TMaybe
    | TBasic;

export type TBasic = {
    readonly kind: "basic";
    readonly type: BasicType;
    readonly loc: Loc;
};

export type TCons = {
    readonly kind: "cons_type";
    readonly name: TypeId;
    readonly typeArgs: readonly Type[];
    readonly loc: Loc;
};

export type TBounced = {
    readonly kind: "TypeBounced";
    readonly type: Type;
    readonly loc: Loc;
};

export type TMaybe = {
    readonly kind: "TypeMaybe";
    readonly type: Type;
    readonly loc: Loc;
};

export type TTuple = {
    readonly kind: "tuple_type";
    readonly typeArgs: readonly Type[];
    readonly loc: Loc;
};

export type TTensor = {
    readonly kind: "tensor_type";
    readonly typeArgs: readonly Type[];
    readonly loc: Loc;
};

export type TMap = {
    readonly kind: "map_type";
    readonly key: Type; // any type except tensor
    readonly value: Type; // any type except tensor
    readonly loc: Loc;
};
