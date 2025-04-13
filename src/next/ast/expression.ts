import type { Id, Range, TypeId } from "@/next/ast/common";

export type Expression =
    | OpBinary
    | OpUnary
    | Conditional
    | MethodCall
    | FieldAccess
    | StaticCall
    | StructInstance
    | InitOf
    | CodeOf
    | Number
    | Boolean
    | Null
    | String
    | Var;

export type Var = {
    readonly kind: "var";
    readonly name: string;
    readonly loc: Range;
};

export type Number = {
    readonly kind: "number";
    readonly base: NumberBase;
    readonly value: bigint;
    readonly loc: Range;
};

export type NumberBase = "2" | "8" | "10" | "16";

export type Boolean = {
    readonly kind: "boolean";
    readonly value: boolean;
    readonly loc: Range;
};

// A String is a string in which escaping characters, like '\\' has been simplified, e.g., '\\' simplified to '\'.
export type String = {
    readonly kind: "string";
    readonly value: string;
    readonly loc: Range;
};

// `null` value is an inhabitant of several types:
// it can represent missing values in optional types,
// or empty map of any key and value types
export type Null = {
    readonly kind: "null";
    readonly loc: Range;
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
    readonly loc: Range;
};

export type UnaryOperation = "+" | "-" | "!" | "!!" | "~";

export type OpUnary = {
    readonly kind: "op_unary";
    readonly op: UnaryOperation;
    readonly operand: Expression;
    readonly loc: Range;
};

export type FieldAccess = {
    readonly kind: "field_access";
    readonly aggregate: Expression; // contract, trait, struct, message
    readonly field: Id;
    readonly loc: Range;
};

export type MethodCall = {
    readonly kind: "method_call";
    readonly self: Expression; // anything with a method
    readonly method: Id;
    readonly args: readonly Expression[];
    readonly loc: Range;
};

// builtins or top-level (module) functions
export type StaticCall = {
    readonly kind: "static_call";
    readonly function: Id;
    readonly args: readonly Expression[];
    readonly loc: Range;
};

export type StructInstance = {
    readonly kind: "struct_instance";
    readonly type: TypeId;
    readonly args: readonly StructFieldInitializer[];
    readonly loc: Range;
};

export type StructFieldInitializer = {
    readonly kind: "struct_field_initializer";
    readonly field: Id;
    readonly initializer: Expression;
    readonly loc: Range;
};

export type InitOf = {
    readonly kind: "init_of";
    readonly contract: TypeId;
    readonly args: readonly Expression[];
    readonly loc: Range;
};

export type CodeOf = {
    readonly kind: "code_of";
    readonly contract: TypeId;
    readonly loc: Range;
};

export type Conditional = {
    readonly kind: "conditional";
    readonly condition: Expression;
    readonly thenBranch: Expression;
    readonly elseBranch: Expression;
    readonly loc: Range;
};
