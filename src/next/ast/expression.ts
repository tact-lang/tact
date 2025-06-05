import type { Id, Loc, TypeId } from "@/next/ast/common";
import type { Type, TMap } from "@/next/ast/type";

export type Expression =
    | OpBinary
    | OpUnary
    | Conditional
    | MethodCall
    | StaticCall
    | StaticMethodCall
    | FieldAccess
    | StructInstance
    | InitOf
    | CodeOf
    | Number
    | Boolean
    | Null
    | String
    | Var
    | Unit
    | Tuple
    | Tensor
    | MapLiteral
    | SetLiteral;

export type Var = {
    readonly kind: "var";
    readonly name: string;
    readonly loc: Loc;
};

export type Number = {
    readonly kind: "number";
    readonly base: NumberBase;
    readonly value: bigint;
    readonly loc: Loc;
};

export type NumberBase = "2" | "8" | "10" | "16";

export type Boolean = {
    readonly kind: "boolean";
    readonly value: boolean;
    readonly loc: Loc;
};

// A String is a string in which escaping characters, like '\\' has been simplified, e.g., '\\' simplified to '\'.
export type String = {
    readonly kind: "string";
    readonly value: string;
    readonly loc: Loc;
};

// `null` value is an inhabitant of several types:
// it can represent missing values in optional types,
// or empty map of any key and value types
export type Null = {
    readonly kind: "null";
    readonly loc: Loc;
};

export type BinaryOperation =
    | "+"
    | "-"
    | "*"
    | "/"
    | "!="
    | ">"
    | "<"
    | ">="
    | "<="
    | "=="
    | "&&"
    | "||"
    | "%"
    | "<<"
    | ">>"
    | "&"
    | "|"
    | "^";

export type OpBinary = {
    readonly kind: "op_binary";
    readonly op: BinaryOperation;
    readonly left: Expression;
    readonly right: Expression;
    readonly loc: Loc;
};

export type UnaryOperation = "+" | "-" | "!" | "!!" | "~";

export type OpUnary = {
    readonly kind: "op_unary";
    readonly op: UnaryOperation;
    readonly operand: Expression;
    readonly loc: Loc;
};

export type FieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: Expression; // contract, trait, struct, message
    readonly field: Id;
    readonly loc: Loc;
};

export type MethodCall = {
    readonly kind: "method_call";
    readonly self: Expression; // anything with a method
    readonly method: Id;
    readonly args: readonly Expression[];
    readonly loc: Loc;
};

// builtins or top-level (module) functions
export type StaticCall = {
    readonly kind: "static_call";
    readonly function: Id;
    readonly typeArgs: readonly Type[];
    readonly args: readonly Expression[];
    readonly loc: Loc;
};

export type StaticMethodCall = {
    readonly kind: "static_method_call";
    readonly self: TypeId;
    readonly typeArgs: readonly Type[];
    readonly function: Id;
    readonly args: readonly Expression[];
    readonly loc: Loc;
};

export type StructInstance = {
    readonly kind: "struct_instance";
    readonly type: TypeId;
    readonly typeArgs: readonly Type[];
    readonly args: readonly StructFieldInitializer[];
    readonly loc: Loc;
};

export type StructFieldInitializer = {
    readonly kind: "struct_field_initializer";
    readonly field: Id;
    readonly initializer: Expression;
    readonly loc: Loc;
};

export type MapLiteral = {
    readonly kind: "map_literal";
    readonly type: TMap;
    readonly fields: readonly MapField[];
    readonly loc: Loc;
};

export type MapField = {
    readonly key: Expression;
    readonly value: Expression;
};

export type SetLiteral = {
    readonly kind: "set_literal";
    readonly valueType: Type;
    readonly fields: readonly Expression[];
    readonly loc: Loc;
};

export type InitOf = {
    readonly kind: "init_of";
    readonly contract: TypeId;
    readonly args: readonly Expression[];
    readonly loc: Loc;
};

export type CodeOf = {
    readonly kind: "code_of";
    readonly contract: TypeId;
    readonly loc: Loc;
};

export type Conditional = {
    readonly kind: "conditional";
    readonly condition: Expression;
    readonly thenBranch: Expression;
    readonly elseBranch: Expression;
    readonly loc: Loc;
};

export type Unit = {
    readonly kind: "unit";
    readonly loc: Loc;
};

export type Tuple = {
    readonly kind: "tuple";
    readonly children: readonly Expression[];
    readonly loc: Loc;
};

export type Tensor = {
    readonly kind: "tensor";
    readonly children: readonly Expression[];
    readonly loc: Loc;
};
