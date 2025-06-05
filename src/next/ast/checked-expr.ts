import type { Ordered, Recover } from "@/next/ast/checked";
import type { Id, Loc, TypeId } from "@/next/ast/common";
import type * as D from "@/next/ast/checked-type";
import type {
    BinaryOperation,
    NumberBase,
    UnaryOperation,
} from "@/next/ast/expression";
import type { SelfType } from "@/next/ast/type-self";

export type TypeArgs = ReadonlyMap<string, D.CType>;

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
    | DSelf
    | DUnit
    | DTuple
    | DTensor
    | DMapLiteral
    | DSetLiteral;

export type LValue = LVar | LSelf | LFieldAccess;

export type LSelf = {
    readonly kind: "self";
    readonly computedType: SelfType;
    readonly loc: Loc;
};

export type LVar = {
    readonly kind: "var";
    readonly name: string;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type LFieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: LValue;
    readonly field: Id;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DSelf = {
    readonly kind: "self";
    readonly computedType: SelfType;
    readonly loc: Loc;
};

export type DVar = {
    readonly kind: "var";
    readonly name: string;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DNumber = {
    readonly kind: "number";
    readonly base: NumberBase;
    readonly value: bigint;
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type DBoolean = {
    readonly kind: "boolean";
    readonly value: boolean;
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type DString = {
    readonly kind: "string";
    readonly value: string;
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type DNull = {
    readonly kind: "null";
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type DOpBinary = {
    readonly kind: "op_binary";
    readonly op: BinaryOperation;
    readonly left: DecodedExpression;
    readonly right: DecodedExpression;
    readonly typeArgs: TypeArgs;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DOpUnary = {
    readonly kind: "op_unary";
    readonly op: UnaryOperation;
    readonly operand: DecodedExpression;
    readonly typeArgs: TypeArgs;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DFieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: DecodedExpression;
    readonly field: Id;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DMethodCall = {
    readonly kind: "method_call";
    readonly self: DecodedExpression;
    readonly method: Id;
    // NB! these are substitutions to self type
    readonly args: readonly DecodedExpression[];
    readonly typeArgs: TypeArgs;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

// builtins or top-level (module) functions
export type DStaticCall = {
    readonly kind: "static_call";
    readonly function: Id;
    readonly typeArgs: TypeArgs;
    readonly args: readonly DecodedExpression[];
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DStaticMethodCall = {
    readonly kind: "static_method_call";
    readonly self: TypeId;
    readonly typeArgs: TypeArgs;
    readonly function: Id;
    readonly args: readonly DecodedExpression[];
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DStructInstance = {
    readonly kind: "struct_instance";
    readonly fields: Ordered<Recover<DecodedExpression>>;
    readonly computedType: D.CTRef | D.CTRecover;
    readonly loc: Loc;
};

export type DMapLiteral = {
    readonly kind: "map_literal";
    readonly fields: readonly DMapField[];
    readonly computedType: D.CTMap;
    readonly loc: Loc;
};

export type DMapField = {
    readonly key: DecodedExpression;
    readonly value: DecodedExpression;
};

export type DSetLiteral = {
    readonly kind: "set_literal";
    readonly valueType: D.CType;
    readonly fields: readonly DecodedExpression[];
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DInitOf = {
    readonly kind: "init_of";
    readonly contract: TypeId;
    readonly args: readonly DecodedExpression[];
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DCodeOf = {
    readonly kind: "code_of";
    readonly contract: TypeId;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DConditional = {
    readonly kind: "conditional";
    readonly condition: DecodedExpression;
    readonly thenBranch: DecodedExpression;
    readonly elseBranch: DecodedExpression;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type DUnit = {
    readonly kind: "unit";
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type DTuple = {
    readonly kind: "tuple";
    readonly children: readonly DecodedExpression[];
    readonly computedType: D.CTTuple;
    readonly loc: Loc;
};

export type DTensor = {
    readonly kind: "tensor";
    readonly children: readonly DecodedExpression[];
    readonly computedType: D.CTTensor;
    readonly loc: Loc;
};
