import type { Ordered } from "@/next/ast/checked";
import type { Id, Loc, TypeId } from "@/next/ast/common";
import type * as D from "@/next/ast/dtype";
import type { BinaryOperation, NumberBase, UnaryOperation } from "@/next/ast/expression";
import type { SelfType } from "@/next/ast/mtype";

// TODO: put Self into main AST and parser
// TODO: add effects

export type TypeArgs = ReadonlyMap<string, D.DecodedType>;

export type DecodedExpression =
    | DOpBinary
    | DOpUnary
    | DConditional
    | DMethodCall
    | DThrowCall
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
    | DSelf
    | DUnit
    | DTuple
    | DTensor
    | DMapLiteral
    | DSetLiteral;

export type LValue =
    | LVar
    | LSelf
    | LFieldAccess

export type LSelf = {
    readonly kind: "self";
    readonly computedType: SelfType;
    readonly loc: Loc;
}

export type LVar = {
    readonly kind: "var";
    readonly name: string;
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type LFieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: LValue;
    readonly field: Id;
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DSelf = {
    readonly kind: "self";
    readonly computedType: SelfType;
    readonly loc: Loc;
}

export type DVar = {
    readonly kind: "var";
    readonly name: string;
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DNumber = {
    readonly kind: "number";
    readonly base: NumberBase;
    readonly value: bigint;
    readonly computedType: D.DTypeInt;
    readonly loc: Loc;
};

export type DBoolean = {
    readonly kind: "boolean";
    readonly value: boolean;
    readonly computedType: D.DTypeBool;
    readonly loc: Loc;
};

export type DString = {
    readonly kind: "string";
    readonly value: string;
    readonly computedType: D.DTypeString;
    readonly loc: Loc;
};

export type DNull = {
    readonly kind: "null";
    readonly computedType: D.DTypeNull;
    readonly loc: Loc;
};

export type DOpBinary = {
    readonly kind: "op_binary";
    readonly op: BinaryOperation;
    readonly left: DecodedExpression;
    readonly right: DecodedExpression;
    readonly typeArgs: TypeArgs;
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DOpUnary = {
    readonly kind: "op_unary";
    readonly op: UnaryOperation;
    readonly operand: DecodedExpression;
    readonly typeArgs: TypeArgs;
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DFieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: DecodedExpression;
    readonly field: Id;
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DMethodCall = {
    readonly kind: "method_call";
    readonly self: DecodedExpression;
    readonly method: Id;
    // NB! these are substitutions to self type
    readonly args: readonly DecodedExpression[];
    readonly typeArgs: TypeArgs;
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DThrowCall = {
    readonly kind: "throw_call";
    readonly function: Id;
    readonly args: readonly DecodedExpression[];
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
}

// builtins or top-level (module) functions
export type DStaticCall = {
    readonly kind: "static_call";
    readonly function: Id;
    readonly typeArgs: TypeArgs;
    readonly args: readonly DecodedExpression[];
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DStaticMethodCall = {
    readonly kind: "static_method_call";
    readonly self: TypeId;
    readonly typeArgs: TypeArgs;
    readonly function: Id;
    readonly args: readonly DecodedExpression[];
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DStructInstance = {
    readonly kind: "struct_instance";
    readonly fields: Ordered<DecodedExpression>;
    readonly computedType: D.DTypeRef | D.DTypeRecover;
    readonly loc: Loc;
};

export type DMapLiteral = {
    readonly kind: "map_literal";
    readonly fields: readonly DMapField[];
    readonly computedType: D.DTypeMap;
    readonly loc: Loc;
};

export type DMapField = {
    readonly key: DecodedExpression;
    readonly value: DecodedExpression;
};

export type DSetLiteral = {
    readonly kind: "set_literal";
    readonly valueType: D.DecodedType;
    readonly fields: readonly DecodedExpression[];
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DInitOf = {
    readonly kind: "init_of";
    readonly contract: TypeId;
    readonly args: readonly DecodedExpression[];
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DCodeOf = {
    readonly kind: "code_of";
    readonly contract: TypeId;
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DConditional = {
    readonly kind: "conditional";
    readonly condition: DecodedExpression;
    readonly thenBranch: DecodedExpression;
    readonly elseBranch: DecodedExpression;
    readonly computedType: D.DecodedType;
    readonly loc: Loc;
};

export type DUnit = {
    readonly kind: "unit";
    readonly computedType: D.DTypeUnit;
    readonly loc: Loc;
};

export type DTuple = {
    readonly kind: "tuple";
    readonly children: readonly DecodedExpression[];
    readonly computedType: D.DTypeTuple;
    readonly loc: Loc;
};

export type DTensor = {
    readonly kind: "tensor";
    readonly children: readonly DecodedExpression[];
    readonly computedType: D.DTypeTensor;
    readonly loc: Loc;
};
