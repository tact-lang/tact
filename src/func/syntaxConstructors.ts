import {
    funcOpCompare,
    funcOpBitwiseShift,
    funcOpAddBitwise,
    funcOpMulBitwise,
    FuncAstHole,
    FuncAstVersionRange,
    FuncAstPragmaVersionRange,
    FuncAstStatementExpression,
    FuncPragmaLiteralValue,
    FuncAstConstantsDefinition,
    FuncConstantType,
    FuncAstParameter,
    FuncAstCR,
    FuncAstCommentSingleLine,
    FuncAstCommentMultiLine,
    FuncAstExpressionVarDecl,
    FuncAstUnit,
    FuncAstExpressionTensor,
    FuncAstExpressionTuple,
    FuncAstIntegerLiteral,
    FuncOpUnary,
    FuncAstExpressionUnary,
    FuncAstExpressionFunCall,
    FuncAstBinaryExpression,
    FuncStringType,
    FuncBinaryOp,
    FuncAstExpressionAssign,
    FuncAstExpressionConditional,
    FuncOpAssign,
    FuncAstId,
    FuncAstStringLiteral,
    FuncAstPlainId,
    FuncAstStatementReturn,
    FuncAstStatementBlock,
    FuncAstStatementRepeat,
    FuncAstStatementCondition,
    FuncAstStatement,
    FuncAstStatementUntil,
    FuncAstStatementWhile,
    FuncAstExpression,
    FuncAstStatementTryCatch,
    FuncAstType,
    FuncAstFunctionAttribute,
    FuncAstFunctionDeclaration,
    FuncAstFunctionDefinition,
    FuncAstAsmFunctionDefinition,
    FuncAstComment,
    FuncAstInclude,
    FuncAstPragma,
    FuncAstGlobalVariable,
    FuncAstModuleItem,
    FuncAstModule,
    FuncAstGlobalVariablesDeclaration,
    dummySrcInfo,
} from "./grammar";
import { dummySrcInfo as tactDummySrcInfo } from "../grammar/grammar";
import { throwInternalCompilerError } from "../errors";

import JSONbig from "json-bigint";

function wrapToId<T extends FuncAstExpression | FuncAstId>(v: T | string): T {
    if (typeof v === "string" && v.includes("[object")) {
        throw new Error(`Incorrect input: ${JSONbig.stringify(v, null, 2)}`);
    }
    return typeof v === "string" ? (id(v) as T) : v;
}

//
// Types
//
export class Type {
    public static int(): FuncAstType {
        return { kind: "type_primitive", value: "int", loc: dummySrcInfo };
    }

    public static cell(): FuncAstType {
        return { kind: "type_primitive", value: "cell", loc: dummySrcInfo };
    }

    public static slice(): FuncAstType {
        return { kind: "type_primitive", value: "slice", loc: dummySrcInfo };
    }

    public static builder(): FuncAstType {
        return { kind: "type_primitive", value: "builder", loc: dummySrcInfo };
    }

    public static cont(): FuncAstType {
        return { kind: "type_primitive", value: "cont", loc: dummySrcInfo };
    }

    public static tuple(): FuncAstType {
        return { kind: "type_primitive", value: "tuple", loc: dummySrcInfo };
    }

    public static tensor(...types: FuncAstType[]): FuncAstType {
        return { kind: "type_tensor", types, loc: dummySrcInfo };
    }

    public static tuple_values(...types: FuncAstType[]): FuncAstType {
        return { kind: "type_tuple", types, loc: dummySrcInfo };
    }

    public static hole(): FuncAstHole {
        return { kind: "hole", value: "_", loc: dummySrcInfo };
    }
}

export class FunAttr {
    public static impure(): FuncAstFunctionAttribute {
        return { kind: "impure", loc: dummySrcInfo };
    }

    public static inline(): FuncAstFunctionAttribute {
        return { kind: "inline", loc: dummySrcInfo };
    }

    public static inline_ref(): FuncAstFunctionAttribute {
        return { kind: "inline_ref", loc: dummySrcInfo };
    }

    public static method_id(
        value?: bigint | number | string,
    ): FuncAstFunctionAttribute {
        const literal =
            typeof value === "string"
                ? string(value)
                : int(value as bigint | number);
        return { kind: "method_id", value: literal, loc: dummySrcInfo };
    }
}

//
// Expressions
//

function integerLiteral(
    num: bigint | number,
    isHex: boolean,
): FuncAstIntegerLiteral {
    return {
        kind: "integer_literal",
        value: typeof num === "bigint" ? num : BigInt(num),
        isHex,
        loc: dummySrcInfo,
    };
}

export function int(num: bigint | number): FuncAstIntegerLiteral {
    return integerLiteral(num, false);
}

function hexToBigInt(hexString: string): bigint {
    if (hexString.startsWith("0x")) {
        hexString = hexString.slice(2);
    }
    return BigInt(`0x${hexString}`);
}

export function hex(value: string | bigint | number): FuncAstIntegerLiteral {
    const num = typeof value === "string" ? hexToBigInt(value) : value;
    return integerLiteral(num, true);
}

export function bool(value: boolean): FuncAstPlainId {
    return id(`${value}`) as FuncAstPlainId;
}

export function string(
    value: string,
    ty?: FuncStringType,
): FuncAstStringLiteral {
    return {
        kind: "string_singleline",
        value,
        ty,
        loc: dummySrcInfo,
    };
}

export function nil(): FuncAstPlainId {
    return id("nil") as FuncAstPlainId;
}

export function id(value: string): FuncAstId {
    if (value.length > 1 && (value.startsWith(".") || value.startsWith("~"))) {
        return {
            kind: "method_id",
            value: value.slice(1),
            prefix: value[0]! as "." | "~",
            loc: dummySrcInfo,
        };
    } else {
        return {
            kind: "plain_id",
            value,
            loc: dummySrcInfo,
        };
    }
}

export function call(
    fun: FuncAstExpression | string,
    args: FuncAstExpression[],
    // TODO: doesn't support method calls
    params: Partial<{ receiver: FuncAstExpression }> = {},
): FuncAstExpressionFunCall {
    return {
        kind: "expression_fun_call",
        object: wrapToId(fun) as FuncAstId,
        arguments: args,
        loc: dummySrcInfo,
    };
}

export function assign(
    left: FuncAstExpression,
    right: FuncAstExpression,
): FuncAstExpressionAssign {
    return augassign(left, "=", right);
}

export function augassign(
    left: FuncAstExpression,
    op: FuncOpAssign,
    right: FuncAstExpression,
): FuncAstExpressionAssign {
    return {
        kind: "expression_assign",
        left,
        op,
        right,
        loc: dummySrcInfo,
    };
}

export function ternary(
    cond: FuncAstExpression,
    trueExpr: FuncAstExpression,
    falseExpr: FuncAstExpression,
): FuncAstExpressionConditional {
    return {
        kind: "expression_conditional",
        condition: cond,
        consequence: trueExpr,
        alternative: falseExpr,
        loc: dummySrcInfo,
    };
}

function isFuncOp<T extends readonly string[]>(
    str: string,
    ops: T,
): str is T[number] {
    return (ops as readonly string[]).includes(str);
}

export function binop(
    left: FuncAstExpression,
    op: FuncBinaryOp,
    right: FuncAstExpression,
): FuncAstBinaryExpression {
    if (isFuncOp(op, funcOpCompare)) {
        return {
            kind: "expression_compare",
            left,
            op,
            right,
            loc: dummySrcInfo,
        };
    }
    if (isFuncOp(op, funcOpBitwiseShift)) {
        return {
            kind: "expression_bitwise_shift",
            left,
            ops: [{ op, expr: right }],
            loc: dummySrcInfo,
        };
    }
    if (isFuncOp(op, funcOpAddBitwise)) {
        return {
            kind: "expression_add_bitwise",
            negateLeft: false,
            left,
            ops: [{ op, expr: right }],
            loc: dummySrcInfo,
        };
    }
    if (isFuncOp(op, funcOpMulBitwise)) {
        return {
            kind: "expression_mul_bitwise",
            left,
            ops: [{ op, expr: right }],
            loc: dummySrcInfo,
        };
    }

    throwInternalCompilerError(
        `Unsupported binary operation: ${op}`,
        tactDummySrcInfo,
    );
}

export function unop(
    op: FuncOpUnary,
    operand: FuncAstExpression,
): FuncAstExpressionUnary {
    return {
        kind: "expression_unary",
        op,
        operand,
        loc: dummySrcInfo,
    };
}

export function tuple(
    expressions: FuncAstExpression[],
): FuncAstExpressionTuple {
    return {
        kind: "expression_tuple",
        expressions,
        loc: dummySrcInfo,
    };
}

export function tensor(
    ...expressions: FuncAstExpression[]
): FuncAstExpressionTensor {
    return {
        kind: "expression_tensor",
        expressions,
        loc: dummySrcInfo,
    };
}

export function unit(): FuncAstUnit {
    return { kind: "unit", value: "()", loc: dummySrcInfo };
}

export function hole(value: "_" | "var"): FuncAstType {
    return { kind: "hole", value, loc: dummySrcInfo };
}

//
// Statements
//

export function vardef(
    ty: FuncAstType | "_",
    names: string | string[],
    init?: FuncAstExpression,
): FuncAstStatement {
    if (Array.isArray(names) && names.length === 0) {
        throwInternalCompilerError(
            `Variable definition cannot have an empty set of names`,
            tactDummySrcInfo,
        );
    }
    const varDecl: FuncAstExpressionVarDecl = {
        kind: "expression_var_decl",
        ty: ty === "_" ? hole("_") : ty,
        names:
            typeof names === "string"
                ? (id(names) as FuncAstId)
                : {
                      kind: "expression_tensor_var_decl",
                      names: names.map(id),
                      loc: dummySrcInfo,
                  },
        loc: dummySrcInfo,
    };
    return expr(init === undefined ? varDecl : assign(varDecl, init));
}

export function ret(expression?: FuncAstExpression): FuncAstStatementReturn {
    return {
        kind: "statement_return",
        expression,
        loc: dummySrcInfo,
    };
}

export function block(statements: FuncAstStatement[]): FuncAstStatementBlock {
    return {
        kind: "statement_block",
        statements,
        loc: dummySrcInfo,
    };
}

export function repeat(
    iterations: FuncAstExpression,
    statements: FuncAstStatement[],
): FuncAstStatementRepeat {
    return {
        kind: "statement_repeat",
        iterations,
        statements,
        loc: dummySrcInfo,
    };
}

export function condition(
    condition: FuncAstExpression,
    bodyStmts: FuncAstStatement[],
    elseStmts?: FuncAstStatement[],
    params: Partial<{ positive: boolean }> = {},
): FuncAstStatementCondition {
    const { positive = false } = params;
    return {
        kind: "statement_condition_if",
        condition,
        positive,
        consequences: bodyStmts,
        alternatives: elseStmts,
        loc: dummySrcInfo,
    };
}

export function conditionElseif(
    conditionIf: FuncAstExpression,
    bodyStmts: FuncAstStatement[],
    conditionElseif: FuncAstExpression,
    elseifStmts: FuncAstStatement[],
    elseStmts?: FuncAstStatement[],
    params: Partial<{ positiveIf: boolean; positiveElseif: boolean }> = {},
): FuncAstStatementCondition {
    const { positiveIf = false, positiveElseif = false } = params;
    return {
        kind: "statement_condition_elseif",
        positiveIf,
        conditionIf,
        consequencesIf: bodyStmts,
        positiveElseif,
        conditionElseif,
        consequencesElseif: elseifStmts,
        alternativesElseif: elseStmts,
        loc: dummySrcInfo,
    };
}

export function doUntil(
    condition: FuncAstExpression,
    statements: FuncAstStatement[],
): FuncAstStatementUntil {
    return {
        kind: "statement_until",
        statements,
        condition,
        loc: dummySrcInfo,
    };
}

export function while_(
    condition: FuncAstExpression,
    statements: FuncAstStatement[],
): FuncAstStatementWhile {
    return {
        kind: "statement_while",
        condition,
        statements,
        loc: dummySrcInfo,
    };
}

export function expr(
    expression: FuncAstExpression,
): FuncAstStatementExpression {
    return {
        kind: "statement_expression",
        expression,
        loc: dummySrcInfo,
    };
}

export function tryCatch(
    statementsTry: FuncAstStatement[],
    catchExceptionName: string | FuncAstId,
    catchExitCodeName: string | FuncAstId,
    statementsCatch: FuncAstStatement[],
): FuncAstStatementTryCatch {
    return {
        kind: "statement_try_catch",
        statementsTry,
        catchExceptionName: wrapToId(catchExceptionName),
        catchExitCodeName: wrapToId(catchExitCodeName),
        statementsCatch,
        loc: dummySrcInfo,
    };
}

// Other top-level elements

export function comment(
    ...args: (string | Partial<{ skipCR: boolean; style: ";" | ";;" }>)[]
): FuncAstComment {
    let params: Partial<{ skipCR: boolean; style: ";" | ";;" }> = {};
    let values: string[];

    if (args.length > 0 && typeof args[args.length - 1] === "object") {
        params = args.pop() as Partial<{ skipCR: boolean; style: ";" | ";;" }>;
    }
    values = args as string[];
    const { skipCR = false, style = ";;" } = params;
    return values.length === 1
        ? ({
              kind: "comment_singleline",
              line: values[0],
              style,
              loc: dummySrcInfo,
          } as FuncAstCommentSingleLine)
        : ({
              kind: "comment_multiline",
              lines: values,
              skipCR,
              style,
              loc: dummySrcInfo,
          } as FuncAstCommentMultiLine);
}

export function cr(lines: number = 1): FuncAstCR {
    return {
        kind: "cr",
        lines,
    };
}

export function constant(
    name: string | FuncAstId,
    init: FuncAstExpression,
    ty?: FuncConstantType,
): FuncAstConstantsDefinition {
    return {
        kind: "constants_definition",
        constants: [
            {
                kind: "constant",
                ty,
                name: wrapToId(name) as FuncAstPlainId,
                value: init,
                loc: dummySrcInfo,
            },
        ],
        loc: dummySrcInfo,
    };
}

export function functionParam(
    name: string | FuncAstPlainId,
    ty: FuncAstType | undefined,
): FuncAstParameter {
    return {
        kind: "parameter",
        name: wrapToId(name),
        ty,
        loc: dummySrcInfo,
    };
}

export function functionDeclaration(
    name: string | FuncAstPlainId,
    parameters: FuncAstParameter[],
    attributes: FuncAstFunctionAttribute[],
    returnTy: FuncAstType,
): FuncAstFunctionDeclaration {
    return {
        kind: "function_declaration",
        forall: undefined,
        name: wrapToId(name),
        parameters,
        attributes,
        returnTy,
        loc: dummySrcInfo,
    };
}

export type FunParamValue = [string, FuncAstType];

function transformFunctionParams(
    paramValues: FunParamValue[],
): FuncAstParameter[] {
    return paramValues.map(
        ([name, ty]) =>
            ({
                kind: "parameter",
                name: wrapToId(name),
                ty,
                loc: dummySrcInfo,
            }) as FuncAstParameter,
    );
}

export function fun(
    name: string | FuncAstId,
    paramValues: FunParamValue[],
    attributes: FuncAstFunctionAttribute[],
    returnTy: FuncAstType,
    statements: FuncAstStatement[],
): FuncAstFunctionDefinition {
    return {
        kind: "function_definition",
        forall: undefined,
        name: wrapToId(name) as FuncAstPlainId,
        attributes,
        parameters: transformFunctionParams(paramValues),
        returnTy,
        statements,
        loc: dummySrcInfo,
    };
}

export function asmfun(
    name: string | FuncAstId,
    paramValues: FunParamValue[],
    attributes: FuncAstFunctionAttribute[],
    returnTy: FuncAstType,
    asmStrings: string[],
): FuncAstAsmFunctionDefinition {
    return {
        kind: "asm_function_definition",
        forall: undefined,
        name: wrapToId(name) as FuncAstPlainId,
        attributes,
        parameters: transformFunctionParams(paramValues),
        returnTy,
        arrangement: undefined,
        asmStrings: asmStrings.map((a) => string(a)),
        loc: dummySrcInfo,
    };
}

export function toDeclaration(
    def: FuncAstFunctionDefinition,
): FuncAstFunctionDeclaration {
    return {
        kind: "function_declaration",
        forall: def.forall,
        returnTy: def.returnTy,
        attributes: def.attributes,
        name: def.name,
        parameters: def.parameters,
        loc: dummySrcInfo,
    };
}

export function include(path: string): FuncAstInclude {
    return {
        kind: "include",
        path: string(path),
        loc: dummySrcInfo,
    };
}

export function version(
    op: FuncAstVersionRange["op"],
    versionString: string,
): FuncAstPragmaVersionRange {
    const versionNumbers = versionString.split(".").map(BigInt);
    if (versionNumbers.length < 1) {
        throwInternalCompilerError(
            `Incorrect version: ${versionString}. Expected format: "1.2.3"`,
            tactDummySrcInfo,
        );
    }
    const range: FuncAstVersionRange = {
        kind: "version_range",
        op,
        major: versionNumbers[0]!,
        minor: versionNumbers[1],
        patch: versionNumbers[2],
        loc: dummySrcInfo,
    };
    return {
        kind: "pragma_version_range",
        allow: true,
        range,
        loc: dummySrcInfo,
    };
}

export function pragma(value: FuncPragmaLiteralValue): FuncAstPragma {
    return {
        kind: "pragma_literal",
        literal: value,
        loc: dummySrcInfo,
    };
}

export function global(
    ty: FuncAstType,
    name: string | FuncAstId,
): FuncAstGlobalVariablesDeclaration {
    return {
        kind: "global_variables_declaration",
        globals: [
            {
                kind: "global_variable",
                name: wrapToId(name),
                ty,
                loc: dummySrcInfo,
            } as FuncAstGlobalVariable,
        ],
        loc: dummySrcInfo,
    };
}

export function moduleEntry(entry: FuncAstModuleItem): FuncAstModuleItem {
    return entry;
}

export function mod(...items: FuncAstModuleItem[]): FuncAstModule {
    return {
        kind: "module",
        items,
        loc: dummySrcInfo,
    };
}
