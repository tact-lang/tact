import type { Id, Loc, TypeId } from "@/next/ast/common";
import type { DecodedType, DTypeMap } from "@/next/ast/dtype";
import type { BinaryOperation, NumberBase, UnaryOperation } from "@/next/ast/expression";
import type { Lazy } from "@/next/ast/lazy";

export type DecodedExpression =
    | DOpBinary
    | DOpUnary
    | DConditional
    | DMethodCall
    | DStaticCall
    | DStaticMethodCall
    | DFieldAccess
    | DStructInstance
    | DInitOf
    | DCodeOf
    | DNumber
    | DBoolean
    | DNull
    | DString
    | DVar
    | DUnit
    | DTuple
    | DTensor
    | DMapLiteral
    | DSetLiteral;

export type DVar = {
    readonly kind: "var";
    readonly name: string;
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DNumber = {
    readonly kind: "number";
    readonly base: NumberBase;
    readonly value: bigint;
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DBoolean = {
    readonly kind: "boolean";
    readonly value: boolean;
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DString = {
    readonly kind: "string";
    readonly value: string;
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DNull = {
    readonly kind: "null";
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DOpBinary = {
    readonly kind: "op_binary";
    readonly op: BinaryOperation;
    readonly left: DecodedExpression;
    readonly right: DecodedExpression;
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DOpUnary = {
    readonly kind: "op_unary";
    readonly op: UnaryOperation;
    readonly operand: DecodedExpression;
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DFieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: DecodedExpression;
    readonly field: Id;
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DMethodCall = {
    readonly kind: "method_call";
    readonly self: DecodedExpression; // anything with a method
    readonly method: Id;
    readonly typeArgs: readonly DecodedType[];
    readonly args: readonly DecodedExpression[];
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

// builtins or top-level (module) functions
export type DStaticCall = {
    readonly kind: "static_call";
    readonly function: Id;
    readonly typeArgs: readonly DecodedType[];
    readonly args: readonly DecodedExpression[];
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DStaticMethodCall = {
    readonly kind: "static_method_call";
    readonly self: TypeId;
    readonly typeArgs: readonly DecodedType[];
    readonly function: Id;
    readonly args: readonly DecodedExpression[];
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DStructInstance = {
    readonly kind: "struct_instance";
    readonly type: TypeId;
    readonly typeArgs: readonly DecodedType[];
    readonly args: readonly DStructFieldInitializer[];
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DStructFieldInitializer = {
    readonly field: Id;
    readonly initializer: DecodedExpression;
    readonly loc: Loc;
};

export type DMapLiteral = {
    readonly kind: "map_literal";
    readonly type: DTypeMap;
    readonly fields: readonly DMapField[];
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DMapField = {
    readonly key: DecodedExpression;
    readonly value: DecodedExpression;
};

export type DSetLiteral = {
    readonly kind: "set_literal";
    readonly valueType: DecodedType;
    readonly fields: readonly DecodedExpression[];
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DInitOf = {
    readonly kind: "init_of";
    readonly contract: TypeId;
    readonly args: readonly DecodedExpression[];
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DCodeOf = {
    readonly kind: "code_of";
    readonly contract: TypeId;
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DConditional = {
    readonly kind: "conditional";
    readonly condition: DecodedExpression;
    readonly thenBranch: DecodedExpression;
    readonly elseBranch: DecodedExpression;
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DUnit = {
    readonly kind: "unit";
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DTuple = {
    readonly kind: "tuple";
    readonly children: readonly DecodedExpression[];
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};

export type DTensor = {
    readonly kind: "tensor";
    readonly children: readonly DecodedExpression[];
    readonly computedType: Lazy<DecodedType>;
    readonly loc: Loc;
};
