import type { Recover } from "@/next/ast/checked";
import type { Id, Loc, Ordered, TypeId } from "@/next/ast/common";
import type * as D from "@/next/ast/checked-type";
import type {
    BinaryOperation,
    NumberBase,
    UnaryOperation,
} from "@/next/ast/expression";
import type { SelfType } from "@/next/ast/type-self";

export type TypeArgs = ReadonlyMap<string, D.CType>;

export type CExpr =
    | COpBinary
    | COpUnary
    | CConditional
    | CMethodCall
    | CStaticCall
    | CStaticMethodCall
    | CFieldAccess
    | CStructCons
    | CInitOf
    | CCodeOf
    | CNumber
    | CBoolean
    | CNull
    | CString
    | CVar
    | CSelf
    | CUnit
    | CTuple
    | CTensor
    | CMapLiteral
    | CSetLiteral;

export type CLValue = CLVar | CLSelf | CLFieldAccess;

export type CLSelf = {
    readonly kind: "self";
    readonly computedType: SelfType;
    readonly loc: Loc;
};

export type CLVar = {
    readonly kind: "var";
    readonly name: string;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CLFieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: CLValue;
    readonly field: Id;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CSelf = {
    readonly kind: "self";
    readonly computedType: SelfType;
    readonly loc: Loc;
};

export type CVar = {
    readonly kind: "var";
    readonly name: string;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CNumber = {
    readonly kind: "number";
    readonly base: NumberBase;
    readonly value: bigint;
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type CBoolean = {
    readonly kind: "boolean";
    readonly value: boolean;
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type CString = {
    readonly kind: "string";
    readonly value: string;
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type CNull = {
    readonly kind: "null";
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type COpBinary = {
    readonly kind: "op_binary";
    readonly op: BinaryOperation;
    readonly left: CExpr;
    readonly right: CExpr;
    readonly typeArgs: TypeArgs;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type COpUnary = {
    readonly kind: "op_unary";
    readonly op: UnaryOperation;
    readonly operand: CExpr;
    readonly typeArgs: TypeArgs;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CFieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: CExpr;
    readonly field: Id;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CMethodCall = {
    readonly kind: "method_call";
    readonly self: CExpr;
    readonly method: Id;
    // NB! these are substitutions to self type
    readonly args: readonly CExpr[];
    readonly typeArgs: TypeArgs;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

// builtins or top-level (module) functions
export type CStaticCall = {
    readonly kind: "static_call";
    readonly function: Id;
    readonly typeArgs: TypeArgs;
    readonly args: readonly CExpr[];
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CStaticMethodCall = {
    readonly kind: "static_method_call";
    readonly self: TypeId;
    readonly typeArgs: TypeArgs;
    readonly function: Id;
    readonly args: readonly CExpr[];
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CStructCons = {
    readonly kind: "struct_instance";
    readonly fields: Ordered<Recover<CExpr>>;
    readonly computedType: D.CTRef | D.CTRecover;
    readonly loc: Loc;
};

export type CMapLiteral = {
    readonly kind: "map_literal";
    readonly fields: readonly DMapField[];
    readonly computedType: D.CTMap;
    readonly loc: Loc;
};

export type DMapField = {
    readonly key: CExpr;
    readonly value: CExpr;
};

export type CSetLiteral = {
    readonly kind: "set_literal";
    readonly valueType: D.CType;
    readonly fields: readonly CExpr[];
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CInitOf = {
    readonly kind: "init_of";
    readonly contract: TypeId;
    readonly args: readonly CExpr[];
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CCodeOf = {
    readonly kind: "code_of";
    readonly contract: TypeId;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CConditional = {
    readonly kind: "conditional";
    readonly condition: CExpr;
    readonly thenBranch: CExpr;
    readonly elseBranch: CExpr;
    readonly computedType: D.CType;
    readonly loc: Loc;
};

export type CUnit = {
    readonly kind: "unit";
    readonly computedType: D.CTBasic;
    readonly loc: Loc;
};

export type CTuple = {
    readonly kind: "tuple";
    readonly children: readonly CExpr[];
    readonly computedType: D.CTTuple;
    readonly loc: Loc;
};

export type CTensor = {
    readonly kind: "tensor";
    readonly children: readonly CExpr[];
    readonly computedType: D.CTTensor;
    readonly loc: Loc;
};
