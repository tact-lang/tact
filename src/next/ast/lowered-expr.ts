import type { Id, Loc, Ordered, TypeId } from "@/next/ast/common";
import type {
    BinaryOperation,
    NumberBase,
    UnaryOperation,
} from "@/next/ast/expression";
// TODO: this seems incorrect
import type { SelfType } from "@/next/ast/type-self";
import type { LTBasic, LType, LTMap, LTRef, LTTensor, LTTuple } from "@/next/ast/lowered-type";

export type LTypeArgs = ReadonlyMap<string, LType>;

export type LExpr =
    | LOpBinary
    | LOpUnary
    | LConditional
    | LMethodCall
    | LStaticCall
    | LStaticMethodCall
    | LFieldAccess
    | LStructCons
    | LInitOf
    | LCodeOf
    | LNumber
    | LBoolean
    | LNull
    | LString
    | LVar
    | LSelf
    | LUnit
    | LTuple
    | LTensor
    | LMapLiteral
    | LSetLiteral;

export type LLValue = LLVar | LLSelf | LLFieldAccess;

export type LLSelf = {
    readonly kind: "self";
    readonly computedType: SelfType;
    readonly loc: Loc;
};

export type LLVar = {
    readonly kind: "var";
    readonly name: string;
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LLFieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: LLValue;
    readonly field: Id;
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LSelf = {
    readonly kind: "self";
    readonly computedType: SelfType;
    readonly loc: Loc;
};

export type LVar = {
    readonly kind: "var";
    readonly name: string;
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LNumber = {
    readonly kind: "number";
    readonly base: NumberBase;
    readonly value: bigint;
    readonly computedType: LTBasic;
    readonly loc: Loc;
};

export type LBoolean = {
    readonly kind: "boolean";
    readonly value: boolean;
    readonly computedType: LTBasic;
    readonly loc: Loc;
};

export type LString = {
    readonly kind: "string";
    readonly value: string;
    readonly computedType: LTBasic;
    readonly loc: Loc;
};

export type LNull = {
    readonly kind: "null";
    readonly computedType: LTBasic;
    readonly loc: Loc;
};

export type LOpBinary = {
    readonly kind: "op_binary";
    readonly op: BinaryOperation;
    readonly left: LExpr;
    readonly right: LExpr;
    readonly typeArgs: LTypeArgs;
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LOpUnary = {
    readonly kind: "op_unary";
    readonly op: UnaryOperation;
    readonly operand: LExpr;
    readonly typeArgs: LTypeArgs;
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LFieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: LExpr;
    readonly field: Id;
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LMethodCall = {
    readonly kind: "method_call";
    readonly self: LExpr;
    readonly method: Id;
    // NB! these are substitutions to self type
    readonly args: readonly LExpr[];
    readonly typeArgs: LTypeArgs;
    readonly computedType: LType;
    readonly loc: Loc;
};

// builtins or top-level (module) functions
export type LStaticCall = {
    readonly kind: "static_call";
    readonly function: Id;
    readonly typeArgs: LTypeArgs;
    readonly args: readonly LExpr[];
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LStaticMethodCall = {
    readonly kind: "static_method_call";
    readonly self: TypeId;
    readonly typeArgs: LTypeArgs;
    readonly function: Id;
    readonly args: readonly LExpr[];
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LStructCons = {
    readonly kind: "struct_instance";
    readonly fields: Ordered<LExpr>;
    readonly computedType: LTRef;
    readonly loc: Loc;
};

export type LMapLiteral = {
    readonly kind: "map_literal";
    readonly fields: readonly LMapField[];
    readonly computedType: LTMap;
    readonly loc: Loc;
};

export type LMapField = {
    readonly key: LExpr;
    readonly value: LExpr;
};

export type LSetLiteral = {
    readonly kind: "set_literal";
    readonly valueType: LType;
    readonly fields: readonly LExpr[];
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LInitOf = {
    readonly kind: "init_of";
    readonly contract: TypeId;
    readonly args: readonly LExpr[];
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LCodeOf = {
    readonly kind: "code_of";
    readonly contract: TypeId;
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LConditional = {
    readonly kind: "conditional";
    readonly condition: LExpr;
    readonly thenBranch: LExpr;
    readonly elseBranch: LExpr;
    readonly computedType: LType;
    readonly loc: Loc;
};

export type LUnit = {
    readonly kind: "unit";
    readonly computedType: LTBasic;
    readonly loc: Loc;
};

export type LTuple = {
    readonly kind: "tuple";
    readonly children: readonly LExpr[];
    readonly computedType: LTTuple;
    readonly loc: Loc;
};

export type LTensor = {
    readonly kind: "tensor";
    readonly children: readonly LExpr[];
    readonly computedType: LTTensor;
    readonly loc: Loc;
};
