/**
 * The supported version of the Func compiler:
 * https://github.com/ton-blockchain/ton/blob/6897b5624566a2ab9126596d8bc4980dfbcaff2d/crypto/func/func.h#L48
 */
export const FUNC_VERSION: string = "0.4.4";

/**
 * Represents an ordered collection of values.
 * NOTE: Unit type `()` is a special case of the tensor type.
 */
export type FuncTensorType = FuncType[];
export const UNIT_TYPE: FuncType = {
    kind: "tensor",
    value: [] as FuncTensorType,
};

/**
 * Type annotations available within the syntax tree.
 */
export type FuncType =
    | { kind: "int" }
    | { kind: "cell" }
    | { kind: "slice" }
    | { kind: "builder" }
    | { kind: "cont" }
    | { kind: "tuple" }
    | { kind: "tensor"; value: FuncTensorType }
    | { kind: "hole" } // hole type (`_`) filled in local type inference
    | { kind: "type" };

export type FuncAstUnaryOp = "-" | "~" | "+";

export type FuncAstBinaryOp =
    | "+"
    | "-"
    | "*"
    | "/"
    | "%"
    | "<"
    | ">"
    | "&"
    | "|"
    | "^"
    | "=="
    | "!="
    | "<="
    | ">="
    | "<=>"
    | "<<"
    | ">>"
    | "~>>"
    | "^>>"
    | "~/"
    | "^/"
    | "~%"
    | "^%"
    | "/%";

export type FuncAstAugmentedAssignOp =
    | "+="
    | "-="
    | "*="
    | "/="
    | "~/="
    | "^/="
    | "%="
    | "~%="
    | "^%="
    | "<<="
    | ">>="
    | "~>>="
    | "^>>="
    | "&="
    | "|="
    | "^=";

export type FuncAstTmpVarClass = "In" | "Named" | "Tmp" | "UniqueName";

interface FuncAstVarDescrFlags {
    Last: boolean;
    Unused: boolean;
    Const: boolean;
    Int: boolean;
    Zero: boolean;
    NonZero: boolean;
    Pos: boolean;
    Neg: boolean;
    Bool: boolean;
    Bit: boolean;
    Finite: boolean;
    Nan: boolean;
    Even: boolean;
    Odd: boolean;
    Null: boolean;
    NotNull: boolean;
}

//
// Expressions
//

export type FuncAstLiteralExpr =
    | FuncAstNumberExpr
    | FuncAstHexNumberExpr
    | FuncAstBoolExpr
    | FuncAstStringExpr
    | FuncAstNilExpr;
export type FuncAstSimpleExpr =
    | FuncAstIdExpr
    | FuncAstTupleExpr
    | FuncAstTensorExpr
    | FuncAstUnitExpr
    | FuncAstHoleExpr
    | FuncAstPrimitiveTypeExpr;
export type FuncAstCompositeExpr =
    | FuncAstCallExpr
    | FuncAstAssignExpr
    | FuncAstAugmentedAssignExpr
    | FuncAstTernaryExpr
    | FuncAstBinaryExpr
    | FuncAstUnaryExpr
    | FuncAstApplyExpr;
export type FuncAstExpr =
    | FuncAstLiteralExpr
    | FuncAstSimpleExpr
    | FuncAstCompositeExpr;

export type FuncAstIdExpr = {
    kind: "id_expr";
    value: string;
};

export type FuncAstCallExpr = {
    kind: "call_expr";
    // Returns the function object, e.g. get_value().load_int()
    //                                   ^^^^^^^^^^^
    receiver: FuncAstExpr | undefined;
    fun: FuncAstExpr; // function name
    args: FuncAstExpr[];
};

export type FuncAstAssignExpr = {
    kind: "assign_expr";
    lhs: FuncAstExpr;
    rhs: FuncAstExpr;
};

// Augmented assignment: a += 42;
export type FuncAstAugmentedAssignExpr = {
    kind: "augmented_assign_expr";
    lhs: FuncAstExpr;
    op: FuncAstAugmentedAssignOp;
    rhs: FuncAstExpr;
};

export type FuncAstTernaryExpr = {
    kind: "ternary_expr";
    cond: FuncAstExpr;
    trueExpr: FuncAstExpr;
    falseExpr: FuncAstExpr;
};

export type FuncAstBinaryExpr = {
    kind: "binary_expr";
    lhs: FuncAstExpr;
    op: FuncAstBinaryOp;
    rhs: FuncAstExpr;
};

export type FuncAstUnaryExpr = {
    kind: "unary_expr";
    op: FuncAstUnaryOp;
    value: FuncAstExpr;
};

export type FuncAstNumberExpr = {
    kind: "number_expr";
    value: bigint;
};

export type FuncAstHexNumberExpr = {
    kind: "hex_number_expr";
    value: string;
};

export type FuncAstBoolExpr = {
    kind: "bool_expr";
    value: boolean;
};

/**
 * An additional modifier. See: https://docs.ton.org/develop/func/literals_identifiers#string-literals
 */
export type FuncStringLiteralType = "s" | "a" | "u" | "h" | "H" | "c";

export type FuncAstStringExpr = {
    kind: "string_expr";
    value: string;
    ty: FuncStringLiteralType | undefined;
};

export type FuncAstNilExpr = {
    kind: "nil_expr";
};

export type FuncAstApplyExpr = {
    kind: "apply_expr";
    lhs: FuncAstExpr;
    rhs: FuncAstExpr;
};

export type FuncAstTupleExpr = {
    kind: "tuple_expr";
    values: FuncAstExpr[];
};

export type FuncAstTensorExpr = {
    kind: "tensor_expr";
    values: FuncAstExpr[];
};

export type FuncAstUnitExpr = {
    kind: "unit_expr";
};

// Defines a variable applying the local type inference rules:
// var x = 2;
// _ = 2;
export type FuncAstHoleExpr = {
    kind: "hole_expr";
    id: string | undefined;
    init: FuncAstExpr;
};

// Primitive types are used in the syntax tree to express polymorphism.
export type FuncAstPrimitiveTypeExpr = {
    kind: "primitive_type_expr";
    ty: FuncType;
};

//
// Statements
//

export type FuncAstStmt =
    | FuncAstComment // A comment appearing among statements
    | FuncAstBlockStmt
    | FuncAstVarDefStmt
    | FuncAstReturnStmt
    | FuncAstRepeatStmt
    | FuncAstConditionStmt
    | FuncAstDoUntilStmt
    | FuncAstWhileStmt
    | FuncAstExprStmt
    | FuncAstTryCatchStmt;

// Local variable definition:
// int x = 2; // ty = int
// var x = 2; // ty is undefined
export type FuncAstVarDefStmt = {
    kind: "var_def_stmt";
    name: FuncAstIdExpr;
    ty: FuncType | undefined;
    init: FuncAstExpr | undefined;
};

export type FuncAstReturnStmt = {
    kind: "return_stmt";
    value: FuncAstExpr | undefined;
};

export type FuncAstBlockStmt = {
    kind: "block_stmt";
    body: FuncAstStmt[];
};

export type FuncAstRepeatStmt = {
    kind: "repeat_stmt";
    condition: FuncAstExpr;
    body: FuncAstStmt[];
};

export type FuncAstConditionStmt = {
    kind: "condition_stmt";
    condition?: FuncAstExpr;
    ifnot: boolean; // negation: ifnot or elseifnot attribute
    body: FuncAstStmt[];
    else?: FuncAstConditionStmt;
};

export type FuncAstDoUntilStmt = {
    kind: "do_until_stmt";
    body: FuncAstStmt[];
    condition: FuncAstExpr;
};

export type FuncAstWhileStmt = {
    kind: "while_stmt";
    condition: FuncAstExpr;
    body: FuncAstStmt[];
};

export type FuncAstExprStmt = {
    kind: "expr_stmt";
    expr: FuncAstExpr;
};

export type FuncAstTryCatchStmt = {
    kind: "try_catch_stmt";
    tryBlock: FuncAstStmt[];
    catchBlock: FuncAstStmt[];
    catchVar: FuncAstIdExpr | undefined;
};

//
// Other and top-level elements
//

export type FuncAstConstant = {
    kind: "constant";
    ty: FuncType;
    init: FuncAstExpr;
};

export type FuncAstFunctionAttribute =
    | "impure"
    | "inline"
    | "inline_ref"
    | "method_id";

export type FuncAstFormalFunctionParam = {
    kind: "function_param";
    name: FuncAstIdExpr;
    ty: FuncType;
};

export type FuncAstFunctionDeclaration = {
    kind: "function_declaration";
    name: FuncAstIdExpr;
    attrs: FuncAstFunctionAttribute[];
    params: FuncAstFormalFunctionParam[];
    returnTy: FuncType;
};

export type FuncAstFunctionDefinition = {
    kind: "function_definition";
    name: FuncAstIdExpr;
    attrs: FuncAstFunctionAttribute[];
    params: FuncAstFormalFunctionParam[];
    returnTy: FuncType;
    body: FuncAstStmt[];
};

// e.g.: int preload_uint(slice s, int len) asm "PLDUX";
export type FuncAstAsmFunction = {
    kind: "asm_function_definition";
    name: FuncAstIdExpr;
    attrs: FuncAstFunctionAttribute[];
    params: FuncAstFormalFunctionParam[];
    returnTy: FuncType;
    rawAsm: FuncAstStringExpr; // Raw TVM assembly
}

export type FuncAstComment = {
    kind: "comment";
    values: string[]; // Represents multiline comments
    skipCR: boolean; // Skips CR before the next line
    style: ";" | ";;";
};

export type FuncAstInclude = {
    kind: "include";
    value: string;
};

export type FuncAstPragma = {
    kind: "pragma";
    value: string;
};

export type FuncAstGlobalVariable = {
    kind: "global_variable";
    name: FuncAstIdExpr;
    ty: FuncType;
};

export type FuncAstModuleEntry =
    | FuncAstInclude
    | FuncAstPragma
    | FuncAstFunctionDeclaration
    | FuncAstFunctionDefinition
    | FuncAstAsmFunction
    | FuncAstComment
    | FuncAstConstant
    | FuncAstGlobalVariable;

/**
 * Represents a single Func file.
 */
export type FuncAstModule = {
    kind: "module";
    entries: FuncAstModuleEntry[];
};

export type FuncAstNode =
    | FuncAstStmt
    | FuncAstExpr
    | FuncAstModule
    | FuncAstModuleEntry
    | FuncType;
