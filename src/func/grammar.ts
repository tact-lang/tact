import {
    Interval as RawInterval,
    IterationNode,
    MatchResult,
    Node,
} from "ohm-js";
import path from "path";
import { cwd } from "process";
import FuncGrammar from "./grammar.ohm-bundle";

//
// Utility declarations and definitions
//

/** Currently processed file */
let currentFile: string | undefined;

/**
 * Information about source code location (file and interval within it)
 * and the source code contents.
 */
export class FuncSrcInfo {
    readonly #interval: RawInterval;
    readonly #file: string | undefined;

    constructor(interval: RawInterval, file: string | undefined) {
        this.#interval = interval;
        this.#file = file;
    }

    get file() {
        return this.#file;
    }

    get contents() {
        return this.#interval.contents;
    }

    get interval() {
        return this.#interval;
    }
}

/**
 * Generic FunC error in FunC parser
 */
export class FuncError extends Error {
    readonly loc: FuncSrcInfo;

    constructor(message: string, loc: FuncSrcInfo) {
        super(message);
        this.loc = loc;
    }
}

/**
 * FunC parse error, which generally occurs when either the sources didn't match the grammar, or the AST couldn't be constructed
 */
export class FuncParseError extends FuncError {
    constructor(message: string, loc: FuncSrcInfo) {
        super(message, loc);
    }
}

/**
 * FunC syntax error, which occurs when the AST couldn't be constructed based on the obtained parse results
 */
export class FuncSyntaxError extends FuncError {
    constructor(message: string, loc: FuncSrcInfo) {
        super(message, loc);
    }
}

/**
 * Constructs a location string based on the `sourceInfo`
 */
function locationStr(sourceInfo: FuncSrcInfo): string {
    if (sourceInfo.file === undefined) {
        return "";
    }

    const loc = sourceInfo.interval.getLineAndColumn() as {
        lineNum: number;
        colNum: number;
    };
    const file = path.relative(cwd(), sourceInfo.file);
    return `${file}:${loc.lineNum}:${loc.colNum}: `;
}

/**
 * Throws a FunC parse error occured in the given `path` file
 */
export function throwFuncParseError(
    matchResult: MatchResult,
    path: string | undefined,
): never {
    const interval = matchResult.getInterval();
    const source = new FuncSrcInfo(interval, path);

    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const message = `Parse error: expected ${(matchResult as any).getExpectedText()}\n`;
    throw new FuncParseError(
        `${locationStr(source)}${message}\n${interval.getLineAndColumnMessage()}`,
        source,
    );
}

/**
 * Throws a FunC syntax error occcured with the given `source`
 */
export function throwFuncSyntaxError(
    message: string,
    source: FuncSrcInfo,
): never {
    throw new FuncSyntaxError(
        `${locationStr(source)}${message}\n${source.interval.getLineAndColumnMessage()}`,
        source,
    );
}

/**
 * Temporarily sets `currentFile` to `path`, calls a callback function, then resets `currentValue`
 * Returns a value produced by a callback function call
 */
export function inFile<T>(path: string, callback: () => T) {
    currentFile = path;
    const r = callback();
    currentFile = undefined;
    return r;
}

/**
 * Creates a `FuncSrcInfo` reference to the Node `s` and `currentFile`
 */
export function createSrcInfo(s: Node) {
    return new FuncSrcInfo(s.source, currentFile);
}

/**
 * Unwraps optional grammar elements (marked with "?"),
 * since ohm-js represents those as lists (IterationNodes)
 */
function unwrapOptNode<T>(
    optional: IterationNode,
    f: (n: Node) => T,
): T | undefined {
    const optNode = optional.children[0] as Node | undefined;
    return optNode !== undefined ? f(optNode) : undefined;
}


const funcBuiltinOperatorFunctions = [
    "_+_",
    "_-_",
    "-_",
    "_*_",
    "_/_",
    "_~/_",
    "_^/_",
    "_%_",
    "_~%_",
    "_^%_",
    "_/%_",
    "_<<_",
    "_>>_",
    "_~>>_",
    "_^>>_",
    "_&_",
    "_|_",
    "_^_",
    "~_",
    "^_+=_",
    "^_-=_",
    "^_*=_",
    "^_/=_",
    "^_~/=_",
    "^_^/=_",
    "^_%=_",
    "^_~%=_",
    "^_^%=_",
    "^_<<=_",
    "^_>>=_",
    "^_~>>=_",
    "^_^>>=_",
    "^_&=_",
    "^_|=_",
    "^_^=_",
    "_==_",
    "_!=_",
    "_<_",
    "_>_",
    "_<=_",
    "_>=_",
    "_<=>_",
];
    
const funcBuiltinFunctions = [
    "divmod",
    "moddiv",
    "muldiv",
    "muldivr",
    "muldivc",
    "muldivmod",
    "null?",
    "throw",
    "throw_if",
    "throw_unless",
    "throw_arg",
    "throw_arg_if",
    "throw_arg_unless",
    "load_int",
    "load_uint",
    "preload_int",
    "preload_uint",
    "store_int",
    "store_uint",
    "load_bits",
    "preload_bits",
    "int_at",
    "cell_at",
    "slice_at",
    "tuple_at",
    "at",
    "touch",
    "touch2",
    "run_method0",
    "run_method1",
    "run_method2",
    "run_method3",
];

const funcBuiltinMethods = [
    "~divmod",
    "~moddiv",
    "~store_int",
    "~store_uint",
    "~touch",
    "~touch2",
    "~dump",
    "~stdump",
];

const funcBuiltinConstants = ["true", "false", "nil", "Nil"];

const funcKeywords = [
    "extern",
    "global",
    "asm",
    "impure",
    "inline_ref",
    "inline",
    "auto_apply",
    "method_id",
    "operator",
    "infixl",
    "infixr",
    "infix",
    "const",
];

const funcControlKeywords = [
    "return",
    "var",
    "repeat",
    "do",
    "while",
    "until",
    "try",
    "catch",
    "ifnot",
    "if",
    "then",
    "elseifnot",
    "elseif",
    "else",
];

const funcTypeKeywords = [
    "int",
    "cell",
    "slice",
    "builder",
    "cont",
    "tuple",
    "type",
    "forall",
];

const funcDirectives = ["#include", "#pragma"];

const funcDelimiters = ["->", "{", "}", ",", ".", ";"];

const funcOperators = [
    "!=",
    "?",
    ":",
    "%=",
    "%",
    "&=",
    "&",
    "*=",
    "*",
    "+=",
    "+",
    "-=",
    "-",
    "/%",
    "/=",
    "/",
    "<=>",
    "<<=",
    "<<",
    "<=",
    "<",
    "==",
    "=",
    ">>=",
    ">>",
    ">=",
    ">",
    "^>>=",
    "^>>",
    "^=",
    "^/=",
    "^/",
    "^%=",
    "^%",
    "^",
    "|=",
    "|",
    "~>>=",
    "~>>",
    "~/=",
    "~/",
    "~%",
    "~",
];

const funcDecIntRegex = /^\-?[0-9]+$/;

const funcHexIntRegex = /^\-?0x[0-9a-fA-F]+$/;

/**
 * Checks that the given identifier (including the prefix in case of methodId)
 * can be used in declarations/definitions, i.e. it's:
 * - NOT a builtin operator function
 * - NOT a builtin function
 * - NOT a builtin method
 * - NOT a builtin constant
 * - NOT an underscore
 */
function checkDeclaredId(ident: string, loc: FuncSrcInfo, altPrefix?: string): void | never {
    // not an operatorId
    if (funcBuiltinOperatorFunctions.includes(ident)) {
        throwFuncSyntaxError(
            `${altPrefix ?? "Declared identifier"} cannot shadow or override a builtin operator function`,
            loc,
        );
    }

    if (funcBuiltinFunctions.includes(ident)) {
        throwFuncSyntaxError(
            `${altPrefix ?? "Declared identifier"} cannot shadow or override a builtin function`,
            loc,
        );
    }

    if (funcBuiltinMethods.includes(ident)) {
        throwFuncSyntaxError(
            `${altPrefix ?? "Declared identifier"} cannot shadow or override a builtin method`,
            loc,
        );
    }

    if (funcBuiltinConstants.includes(ident)) {
        throwFuncSyntaxError(
            `${altPrefix ?? "Declared identifier"} cannot shadow or override a builtin constant`,
            loc,
        );
    }

    // not an unusedId
    if (ident === "_") {
        throwFuncSyntaxError(
            `${altPrefix ?? "Declared identifier"} cannot be an underscore`,
            loc,
        );
    }
}

/**
 * Checks that the given identifier is a valid operatorId, i.e. that it actually exists on the list of builtin operator functions
 * Unlike other checking functions it doesn't throw, but returns `true`, if identifier is a valid operatorId, and `false` otherwise
 */
function checkOperatorId(ident: string, loc: FuncSrcInfo): boolean {
    if (funcBuiltinOperatorFunctions.includes(ident)) {
        return true;
    }
    return false;
}

/**
 * Checks that the given identifier is a valid plainId, i.e. it's:
 * - NOT a keyword
 * - NOT a control keyword
 * - NOT a type keyword
 * - NOT a directive
 * - NOT a delimiter
 * - NOT an operator (without underscores, like operatorId)
 * - NOT a number
 */
function checkPlainId(ident: string, loc: FuncSrcInfo, altPrefix?: string): void | never {
    if (funcKeywords.includes(ident)) {
        throwFuncSyntaxError(`${altPrefix ?? "Identifier"} cannot be a keyword`, loc);
    }

    if (funcControlKeywords.includes(ident)) {
        throwFuncSyntaxError(`${altPrefix ?? "Identifier"} cannot be a control keyword`, loc);
    }

    if (funcTypeKeywords.includes(ident)) {
        throwFuncSyntaxError(`${altPrefix ?? "Identifier"} cannot be a type keyword`, loc);
    }

    if (funcDirectives.includes(ident)) {
        throwFuncSyntaxError(`${altPrefix ?? "Identifier"} cannot be a compiler directive`, loc);
    }

    if (funcDelimiters.includes(ident)) {
        throwFuncSyntaxError(`${altPrefix ?? "Identifier"} cannot be a delimiter`, loc);
    }

    if (funcOperators.includes(ident)) {
        throwFuncSyntaxError(`${altPrefix ?? "Identifier"} cannot be an operator`, loc);
    }

    if (ident.match(funcDecIntRegex) !== null || ident.match(funcHexIntRegex) !== null) {
        throwFuncSyntaxError(`${altPrefix ?? "Identifier"} cannot be an integer literal`, loc);
    }
}

/**
 * Checks that the given identifier is a valid methodId, i.e. it starts with either . or ~ and has some characters after
 */
function checkMethodId(ident: string, loc: FuncSrcInfo): void | never {
    if (!(ident.startsWith(".") || ident.startsWith("~"))) {
        throwFuncSyntaxError("Identifier doesn't start with ~ or .", loc);
    }

    if (ident.length === 1) {
        throwFuncSyntaxError("Method identifier cannot be just ~ or .", loc);
    }
}

//
// FIXME: Those are matching contents of the grammar.ohm with some minor optimizations for clarity
// FIXME: Pls, unite with syntax.ts and refactor dependent files
// FIXME: Would need help once parser is done on my side :)
//

export type FuncAstNode =
    | FuncAstModule
    | FuncAstPragma
    | FuncAstInclude
    | FuncAstModuleItem
    | FuncAstStatement
    | FuncAstExpression
    | FuncAstId
    | FuncAstComment;

export type FuncAstModule = {
    kind: "module";
    pragmas: FuncAstPragma[];
    includes: FuncAstInclude[];
    items: FuncAstModuleItem[];
    loc: FuncSrcInfo;
};

//
// Compiler pragmas and includes
//

/**
 * #pragma ...;
 */
export type FuncAstPragma =
    | FuncAstPragmaLiteral
    | FuncAstPragmaVersionRange
    | FuncAstPragmaVersionString;

/**
 * #pragma something-something-something;
 */
export type FuncAstPragmaLiteral = {
    kind: "pragma_literal";
    literal: "allow-post-modification" | "compute-asm-ltr";
    loc: FuncSrcInfo;
};

/**
 * `allow` — if set to `true` corresponds to version enforcement
 * `allow` — if set to `false` corresponds to version prohibiting (or not-version enforcement)
 *
 * #pragma (version | not-version) semverRange;
 */
export type FuncAstPragmaVersionRange = {
    kind: "pragma_version_range";
    allow: boolean;
    range: FuncAstVersionRange;
    loc: FuncSrcInfo;
};

/**
 * #pragma test-version-set "exact.version.semver";
 */
export type FuncAstPragmaVersionString = {
    kind: "pragma_version_string";
    version: FuncAstStringLiteral;
    loc: FuncSrcInfo;
};

/**
 * #include "path/to/file";
 */
export type FuncAstInclude = {
    kind: "include";
    path: FuncAstStringLiteral;
    loc: FuncSrcInfo;
};

//
// Top-level, module items
//

export type FuncAstModuleItem =
    | FuncAstGlobalVariablesDeclaration
    | FuncAstConstantsDefinition
    | FuncAstAsmFunctionDefinition
    | FuncAstFunctionDeclaration
    | FuncAstFunctionDefinition;

/**
 * global ..., ...;
 */
export type FuncAstGlobalVariablesDeclaration = {
    kind: "global_variables_declaration";
    globals: FuncAstGlobalVariable[];
    loc: FuncSrcInfo;
};

/**
 * Note, that the type here cannot be polymorphic, i.e. a type variable
 *
 * nonVarType? (quotedId | plainId)
 */
export type FuncAstGlobalVariable = {
    kind: "global_variable";
    ty: FuncAstType | undefined;
    name: FuncAstQuotedId | FuncAstPlainId;
    loc: FuncSrcInfo;
};

/**
 * const ..., ...;
 */
export type FuncAstConstantsDefinition = {
    kind: "constants_definition";
    constants: FuncAstConstant[];
    loc: FuncSrcInfo;
};

/**
 * (slice | int)? (quotedId | plainId) = Expression
 */
export type FuncAstConstant = {
    kind: "constant";
    ty: "slice" | "int" | undefined;
    name: FuncAstQuotedId | FuncAstPlainId;
    value: FuncAstExpression;
    loc: FuncSrcInfo;
};

/**
 * Note, that name cannot be an unusedId
 *
 * Forall? TypeReturn functionId Parameters FunctionAttribute* "asm" AsmArrangement? stringLiteral+;
 */
export type FuncAstAsmFunctionDefinition = {
    kind: "asm_function_definition";
    forall: FuncAstForall | undefined;
    returnTy: FuncAstType;
    name: FuncAstId;
    parameters: FuncAstParameter[];
    attributes: FuncAstFunctionAttribute[];
    arrangement: FuncAstAsmArrangement | undefined;
    asmStrings: FuncAstStringLiteral[];
    loc: FuncSrcInfo;
};

/**
 * Notice, that integers must be unsigned and decimal
 * Notice, that either arguments, returns or both must be defined, i.e. () is prohibited
 *
 * (id+)
 * or
 * (-> integerLiteralDec+)
 * or
 * (id+ -> integerLiteralDec+)
 */
export type FuncAstAsmArrangement = {
    kind: "asm_arrangement_arguments";
    arguments: FuncAstId[] | undefined;
    returns: FuncAstIntegerLiteral[] | undefined;
    loc: FuncSrcInfo;
};

/**
 * Note, that name cannot be an unusedId
 *
 * Forall? TypeReturn functionId Parameters FunctionAttribute*;
 */
export type FuncAstFunctionDeclaration = {
    kind: "function_declaration";
    forall: FuncAstForall | undefined;
    returnTy: FuncAstType;
    name: FuncAstId;
    parameters: FuncAstParameter[];
    attributes: FuncAstFunctionAttribute[];
    loc: FuncSrcInfo;
};

/**
 * Note, that name cannot be an unusedId
 *
 * Forall? TypeReturn functionId Parameters FunctionAttribute* { ... }
 */
export type FuncAstFunctionDefinition = {
    kind: "function_definition";
    forall: FuncAstForall | undefined;
    returnTy: FuncAstType;
    name: FuncAstId;
    parameters: FuncAstParameter[];
    attributes: FuncAstFunctionAttribute[];
    statements: FuncAstStatement[];
    loc: FuncSrcInfo;
};

/**
 * forall (type? typeName1, type? typeName2, ...) ->
 */
export type FuncAstForall = {
    kind: "forall";
    tyVars: FuncAstTypeVar[];
    loc: FuncSrcInfo;
};

/**
 * Note, that the "type" keyword prior to identifier can only occur in `forall` declarations
 *
 * "type"? id
 */
export type FuncAstTypeVar = {
    kind: "type_var";
    keyword: boolean;
    name: FuncAstId;
    loc: FuncSrcInfo;
};

/**
 * Type? Id
 */
export type FuncAstParameter = {
    kind: "parameter";
    ty: FuncAstType | undefined;
    name: FuncAstId;
    loc: FuncSrcInfo;
};

/**
 * Called "specifiers" in https://docs.ton.org/develop/func/functions#specifiers
 *
 * impure | inline_ref | inline | method_id ("(" Integer | String ")")?
 */
export type FuncAstFunctionAttribute =
    | { kind: "function_attribute_impure"; loc: FuncSrcInfo }
    | { kind: "function_attribute_inline_ref"; loc: FuncSrcInfo }
    | { kind: "function_attribute_inline"; loc: FuncSrcInfo }
    | {
          kind: "function_attribute_method_id";
          value: FuncAstIntegerLiteral | FuncAstStringLiteral | undefined;
          loc: FuncSrcInfo;
      };

//
// Statements
//

export type FuncAstStatement =
    | FuncAstStatementReturn
    | FuncAstStatementBlock
    | FuncAstStatementEmpty
    | FuncAstStatementCondition
    | FuncAstStatementRepeat
    | FuncAstStatementUntil
    | FuncAstStatementWhile
    | FuncAstStatementTryCatch
    | FuncAstStatementExpression;

/**
 * return Expression;
 */
export type FuncAstStatementReturn = {
    kind: "statement_return";
    expression: FuncAstExpression;
    loc: FuncSrcInfo;
};

/**
 * { ... }
 */
export type FuncAstStatementBlock = {
    kind: "statement_block";
    statements: FuncAstStatement[];
    loc: FuncSrcInfo;
};

/**
 * ;
 */
export type FuncAstStatementEmpty = {
    kind: "statement_empty";
    loc: FuncSrcInfo;
};

/**
 * (if | ifnot) Expression { ... }
 * (else { ... })?
 *
 * or
 *
 * (if | ifnot) Expression { ... }
 * (elseif | elseifnot) Expression { ... }
 * (else { ... })?
 */
export type FuncAstStatementCondition =
    | FuncAstStatementConditionIf
    | FuncAstStatementConditionElseIf;

/**
 * (if | ifnot) Expression { ... } (else { ... })?
 *
 * @field positive If true, then it represents `if`. If false, it's an `ifnot`.
 * @field condition Expression
 * @field consequences Left branch (after `if`), truthy case (or falsy in case of `ifnot`)
 * @field alternatives Optional right branch (after `else`), falsy case (or truthy in case of `ifnot`)
 */
export type FuncAstStatementConditionIf = {
    kind: "statement_condition_if";
    // if | ifnot
    positive: boolean;
    // expression
    condition: FuncAstExpression;
    // left branch { ... }
    consequences: FuncAstStatement[];
    // optional right branch { ... }
    alternatives: FuncAstStatement[] | undefined;
    loc: FuncSrcInfo;
};

/**
 * (if | ifnot) Expression { ... } (elseif | elseifnot) Expression { ... } (else { ... })?
 *
 * @field positiveIf If true, then it represents `if`. If false, it's an `ifnot`.
 * @field conditionIf Expression
 * @field consequencesIf Branch after `if`, truthy case (or falsy in case of `ifnot`)
 * @field positiveElseif If true, then it represents `elseif`. If false, it's an `elseifnot`.
 * @field conditionElseif Expression
 * @field consequencesElseif Branch after `elseif`, truthy case (or falsy in case of `elseifnot`)
 * @field alternativesElseif Optional third branch (after `else`), falsy case (or truthy in case of `elseifnot`)
 */
export type FuncAstStatementConditionElseIf = {
    kind: "statement_condition_elseif";
    // if | ifnot
    positiveIf: boolean;
    // expression after if | ifnot
    conditionIf: FuncAstExpression;
    // branch after if | ifnot { ... }
    consequencesIf: FuncAstStatement[];
    // elseif | elseifnot
    positiveElseif: boolean;
    // expression after elseif | elseifnot
    conditionElseif: FuncAstExpression;
    // branch after elseif | elseifnot { ... }
    consequencesElseif: FuncAstStatement[];
    // optional third branch after else { ... }
    alternativesElseif: FuncAstStatement[] | undefined;
    loc: FuncSrcInfo;
};

/**
 * repeat Expression { ... }
 */
export type FuncAstStatementRepeat = {
    kind: "statement_repeat";
    iterations: FuncAstExpression;
    statements: FuncAstStatement[];
    loc: FuncSrcInfo;
};

/**
 * do { ... } until Expression;
 */
export type FuncAstStatementUntil = {
    kind: "statement_until";
    statements: FuncAstStatement[];
    condition: FuncAstExpression;
    loc: FuncSrcInfo;
};

/**
 * while Expression { ... }
 */
export type FuncAstStatementWhile = {
    kind: "statement_while";
    condition: FuncAstExpression;
    statements: FuncAstStatement[];
    loc: FuncSrcInfo;
};

/**
 * try { ... } catch (id, id) { ... }
 */
export type FuncAstStatementTryCatch = {
    kind: "statement_try_catch";
    statementsTry: FuncAstStatement[];
    catchExceptionName: FuncAstId;
    catchExitCodeName: FuncAstId;
    statementsCatch: FuncAstStatement[];
    loc: FuncSrcInfo;
};

/**
 * Expression;
 */
export type FuncAstStatementExpression = {
    kind: "statement_expression";
    expression: FuncAstExpression;
    loc: FuncSrcInfo;
};

//
// Expressions, ordered by precedence (from lowest to highest),
// with comments referencing exact function names in C++ code of FunC's parser:
// https://github.com/ton-blockchain/ton/blob/master/crypto/func/parse-func.cpp
//

/**
 * parse_expr
 */
export type FuncAstExpression =
    | FuncAstExpressionAssign
    | FuncAstExpressionConditional
    | FuncAstExpressionCompare
    | FuncAstExpressionBitwiseShift
    | FuncAstExpressionAddBitwise
    | FuncAstExpressionMulBitwise
    | FuncAstExpressionUnary
    | FuncAstExpressionMethodCallChain
    // | FuncAstExpressionMethodCall
    // expressionparens
    // varfunpart
    // expressionargument
    | FuncAstExpressionVarFun
    | FuncAstExpressionPrimary;

/**
 * parse_expr10
 */
export type FuncAstExpressionAssign = {
    kind: "expression_assign";
    left: FuncAstExpressionConditional;
    op:
        | "="
        | "+="
        | "-="
        | "*="
        | "/="
        | "%="
        | "~/="
        | "~%="
        | "^/="
        | "^%="
        | "&="
        | "|="
        | "^="
        | "<<="
        | ">>="
        | "~>>="
        | "^>>=";
    right: FuncAstExpressionConditional;
    loc: FuncSrcInfo;
};

/**
 * parse_expr13
 */
export type FuncAstExpressionConditional = {
    kind: "expression_conditional";
    condition: FuncAstExpressionCompare;
    consequence: FuncAstExpression;
    alternative: FuncAstExpressionConditional;
    loc: FuncSrcInfo;
};

/**
 * parse_expr15
 */
export type FuncAstExpressionCompare = {
    kind: "expression_compare";
    left: FuncAstExpressionBitwiseShift;
    op: "==" | "<=>" | "<=" | "<" | ">=" | ">" | "!=";
    right: FuncAstExpressionBitwiseShift;
    loc: FuncSrcInfo;
};

/**
 * parse_expr17
 */
export type FuncAstExpressionBitwiseShift = {
    kind: "expression_bitwise_shift";
    left: FuncAstExpressionAddBitwise;
    op: "<<" | ">>" | "~>>" | "^>>";
    right: FuncAstExpressionAddBitwise;
    loc: FuncSrcInfo;
};

/**
 * parse_expr20
 */
export type FuncAstExpressionAddBitwise = {
    kind: "expression_add_bitwise";
    negateLeft: boolean;
    left: FuncAstExpressionMulBitwise;
    op: "+" | "-" | "|" | "^";
    right: FuncAstExpressionMulBitwise;
    loc: FuncSrcInfo;
};

/**
 * parse_expr30
 */
export type FuncAstExpressionMulBitwise = {
    kind: "expression_mul_bitwise";
    left: FuncAstExpressionUnary;
    op: "*" | "/%" | "/" | "%" | "~/" | "~%" | "^/" | "^%" | "&";
    right: FuncAstExpressionUnary;
    loc: FuncSrcInfo;
};

/**
 * parse_expr75
 */
export type FuncAstExpressionUnary = {
    kind: "expression_unary";
    op: "~";
    operand: FuncAstExpressionMethodCallChain;
    loc: FuncSrcInfo;
};

/**
 * parse_expr80
 */
export type FuncAstExpressionMethodCallChain = {
    kind: "expression_method_call_chain";
    object: FuncAstExpressionVarFun;
    methods: FuncAstExpressionMethodCall[];
    loc: FuncSrcInfo;
};

/**
 * methodId ExpressionArgument
 */
export type FuncAstExpressionMethodCall = {
    kind: "expression_method_call";
    name: FuncAstMethodId;
    argument: FuncAstExpressionArgument;
    loc: FuncSrcInfo;
};

export type FuncAstExpressionArgument =
    | FuncAstMethodId
    | FuncAstUnit
    | FuncAstExpressionTensor
    | FuncAstExpressionTuple;

/**
 * ( ExpressionFunctionCall )
 */
export type FuncAstExpressionParens = FuncAstExpressionFunCall;

/**
 * parse_expr90
 */
export type FuncAstExpressionVarFun =
    | FuncAstExpressionVarDecl
    | FuncAstExpressionFunCall;

/**
 * Variable declaration
 *
 * Type SingleOrMultipleIds
 */
export type FuncAstExpressionVarDecl = {
    kind: "expression_var_decl";
    ty: FuncAstType;
    names: FuncAstExpressionVarDeclPart;
    loc: FuncSrcInfo;
};

export type FuncAstExpressionVarDeclPart =
    | FuncAstId
    | FuncAstExpressionTensor
    | FuncAstExpressionTuple;

/**
 * Function call
 *
 * (methodId | functionCallReturningFunction) Argument+
 */
export type FuncAstExpressionFunCall = {
    kind: "expression_fun_call";
    object: FuncAstMethodId | FuncAstExpressionParens;
    arguments: FuncAstExpressionArgument[];
    loc: FuncSrcInfo;
};

/**
 * parse_expr100
 */
export type FuncAstExpressionPrimary =
    | FuncAstUnit
    | FuncAstExpressionTensor
    | FuncAstExpressionTuple
    | FuncAstIntegerLiteral
    | FuncAstStringLiteral
    | FuncAstId;

/**
 * ( Expression, Expression, ... )
 */
export type FuncAstExpressionTensor = {
    kind: "expression_tensor";
    expressions: FuncAstExpression[];
    loc: FuncSrcInfo;
};

/**
 * [ Expression, Expression, ... ]
 */
export type FuncAstExpressionTuple = {
    kind: "expression_tuple";
    expressions: FuncAstExpression[];
    loc: FuncSrcInfo;
};

//
// Ternary, binary, unary expression utility sub-types
//

/**
 * Expression ? Expression : Expression
 */
export type FuncAstTernaryExpression = FuncAstExpressionConditional;

/**
 * Expression op Expression
 */
export type FuncAstBinaryExpression =
    | FuncAstExpressionAssign
    | FuncAstExpressionConditional
    | FuncAstExpressionCompare
    | FuncAstExpressionBitwiseShift
    | FuncAstExpressionAddBitwise
    | FuncAstExpressionMulBitwise;

/**
 * op Expression
 *
 * Note, that there are no unary plus, and unary minus is handled elsewhere!
 */
export type FuncAstUnaryExpression = FuncAstExpressionUnary;

//
// Types
//

/**
 * Builtin types, type variables or combinations of, with optional mappings with ->
 */
export type FuncAstType = FuncAstTypeBuiltin | FuncAstTypeVar;

// TODO: re-org the types

/**
 * Builtin types, with optional mappings with ->
 */
export type FuncAstTypeBuiltin = {
    kind: "type_builtin";
    value:
        | "int"
        | "cell"
        | "slice"
        | "builder"
        | "cont"
        | "tuple"
        | FuncAstTensor
        | FuncAstTuple
        | FuncAstHole
        | FuncAstUnit;
    mapsTo: FuncAstType | undefined;
    loc: FuncSrcInfo;
};

/**
 * (..., ...)
 */
export type FuncAstTensor = {
    kind: "type_tensor";
    types: FuncAstType[];
    loc: FuncSrcInfo;
};

/**
 * [..., ...]
 */
export type FuncAstTuple = {
    kind: "type_tuple";
    types: FuncAstType[];
    loc: FuncSrcInfo;
};

//
// Lexical rules, see: https://ohmjs.org/docs/syntax-reference#syntactic-lexical
//

/**
 * _ | var
 */
export type FuncAstHole = {
    kind: "hole";
    value: "_" | "var";
    loc: FuncSrcInfo;
};

/**
 * ()
 */
export type FuncAstUnit = {
    kind: "unit";
    value: "()";
    loc: FuncSrcInfo;
};

/**
 * Identifier variations
 */
export type FuncAstId =
    | FuncAstMethodId
    | FuncAstQuotedId
    | FuncAstOperatorId
    | FuncAstPlainId
    | FuncAstUnusedId;

/**
 * Like quotedId, plainId or operatorId, but starts with . or ~
 */
export type FuncAstMethodId = {
    kind: "method_id";
    prefix: "." | "~";
    value: string;
    loc: FuncSrcInfo;
};

/**
 * \`anything, except \` or new line\`
 */
export type FuncAstQuotedId = {
    kind: "quoted_id";
    value: string;
    loc: FuncSrcInfo;
};

/**
 * _+_, etc.
 */
export type FuncAstOperatorId = {
    kind: "operator_id";
    value: string;
    loc: FuncSrcInfo;
};

/**
 * *magic*
 */
export type FuncAstPlainId = {
    kind: "plain_id";
    value: string;
    loc: FuncSrcInfo;
};

/**
 * _
 */
export type FuncAstUnusedId = {
    kind: "unused_id";
    value: "_";
    loc: FuncSrcInfo;
};

/**
 * op? decNum (. decNum)? (. decNum)?
 */
export type FuncAstVersionRange = {
    kind: "version_range";
    op: string | undefined;
    major: bigint;
    minor: bigint | undefined;
    patch: bigint | undefined;
    loc: FuncSrcInfo;
};

/**
 * -? decNum
 * or
 * -? hexNum
 */
export type FuncAstIntegerLiteral = {
    kind: "integer_literal";
    value: bigint;
    loc: FuncSrcInfo;
};

/**
 * "..."ty?
 * or
 * """ ... """ty?
 */
export type FuncAstStringLiteral =
    | FuncAstStringLiteralSingleLine
    | FuncAstStringLiteralMultiLine;

/**
 * "..."ty?
 */
export type FuncAstStringLiteralSingleLine = {
    kind: "string_singleline";
    value: string;
    ty: FuncAstStringType | undefined;
    loc: FuncSrcInfo;
};

/**
 * """ ... """ty?
 */
export type FuncAstStringLiteralMultiLine = {
    kind: "string_multiline";
    value: string;
    ty: FuncAstStringType | undefined;
    // Perhaps: alignIndent: boolean;
    // Perhaps: trim: boolean;
    loc: FuncSrcInfo;
};

/**
 * An additional modifier. See: https://docs.ton.org/develop/func/literals_identifiers#string-literals
 */
export type FuncAstStringType = "s" | "a" | "u" | "h" | "H" | "c";

export type FuncAstWhiteSpace = {
    kind: "whitespace";
    value: `\t` | ` ` | `\n` | `\r` | `\u2028` | `\u2029`;
};

/**
 * ;; ...
 * or
 * {- ... -}
 */
export type FuncAstComment = FuncAstCommentSingleLine | FuncAstCommentMultiLine;

/**
 * ;; ...
 *
 * Doesn't include the leading ;; characters TODO: rm
 */
export type FuncAstCommentSingleLine = {
    kind: "comment_singleline";
    line: string;
    loc: FuncSrcInfo;
};

/**
 * {- ...can be nested... -}
 *
 * Doesn't include the leftmost {- and rightmost -} *ODO: rm
 *
 * @field skipCR If set to true, skips CR before the next line
 */
export type FuncAstCommentMultiLine = {
    kind: "comment_multiline";
    contents: string;
    skipCR: boolean;
    loc: FuncSrcInfo;
};

//
// Semantic analysis
//

// TODO: ids for nodes via a function wrapper like in Tact?
const semantics = FuncGrammar.createSemantics();

semantics.addOperation<FuncAstNode>("astOfModule", {
    Module(pragmas, includes, items) {
        return {
            kind: "module",
            pragmas: pragmas.children.map((x) => x.astOfPragma()),
            includes: includes.children.map((x) => x.astOfInclude()),
            items: items.children.map((x) => x.astOfModuleItem()),
            loc: createSrcInfo(this),
        };
    },
    comment(cmt) {
        return cmt.astOfModule();
    },
    comment_singleLine(_commentStart, lineContents) {
        return {
            kind: "comment_singleline",
            line: lineContents.sourceString,
            loc: createSrcInfo(this),
        };
    },
    comment_multiLine(cmt) {
        return cmt.astOfModule();
    },
    multiLineComment(
        _commentStart,
        preInnerComment,
        innerComment,
        postInnerComment,
        _commentEnd,
    ) {
        return {
            kind: "comment_multiline",
            contents: [
                preInnerComment.sourceString,
                innerComment.children.map((x) => x.astOfModule()).join("") ??
                    "",
                postInnerComment.sourceString,
            ].join(""),
            skipCR: false,
            loc: createSrcInfo(this),
        };
    },
});

semantics.addOperation<FuncAstNode>("astOfPragma", {
    Pragma(pragma) {
        return pragma.astOfPragma();
    },
    Pragma_literal(_pragmaKwd, literal, _semicolon) {
        return {
            kind: "pragma_literal",
            literal: literal.sourceString as ("allow-post-modification" | "compute-asm-ltr"),
            loc: createSrcInfo(this),
        };
    },
    Pragma_versionRange(_pragmaKwd, literal, range, _semicolon) {
        return {
            kind: "pragma_version_range",
            allow: literal.sourceString === "version" ? true : false,
            range: range.astOfVersionRange(),
            loc: createSrcInfo(this),
        };
    },
    Pragma_versionString(_pragmaKwd, _literal, value, _semicolon) {
        const versionString = value.astOfExpression() as FuncAstStringLiteral;

        if (versionString.ty !== undefined) {
            throwFuncSyntaxError(
                "Version string cannot have a string type specified",
                createSrcInfo(this),
            );
        }

        if (
            versionString.value.match(
                /^\"{0,3}[0-9]+(?:\.[0-9]+)?(?:\.[0-9]+)?\"{0,3}$/,
            ) === null
        ) {
            throwFuncSyntaxError("Invalid version string", createSrcInfo(this));
        }

        return {
            kind: "pragma_version_string",
            version: versionString,
            loc: createSrcInfo(this),
        };
    },
});

semantics.addOperation<FuncAstNode>("astOfInclude", {
    Include(_includeKwd, path, _semicolon) {
        return {
            kind: "include",
            path: path.astOfExpression(),
            loc: createSrcInfo(this),
        };
    },
});

semantics.addOperation<FuncAstNode>("astOfModuleItem", {
    ModuleItem(item) {
        return item.astOfModuleItem();
    },
    GlobalVariablesDeclaration(_globalKwd, globals, _semicolon) {
        return {
            kind: "global_variables_declaration",
            globals: globals.children.map((x) => x.astOfGlobalVariable()),
            loc: createSrcInfo(this),
        };
    },
    ConstantsDefinition(_constKwd, constants, _semicolon) {
        return {
            kind: "constants_definition",
            constants: constants.children.map((x) => x.astOfConstant()),
            loc: createSrcInfo(this),
        };
    },
    AsmFunctionDefinition(
        fnCommonPrefix,
        _asmKwd,
        optArrangement,
        asmStrings,
        _semicolon,
    ) {
        const prefix = fnCommonPrefix.astOfFunctionCommonPrefix();
        return {
            kind: "asm_function_definition",
            forall: prefix.forall,
            returnTy: prefix.returnTy,
            name: prefix.name,
            parameters: prefix.parameters,
            attributes: prefix.attributes,
            arrangement: unwrapOptNode(optArrangement, t => t.astOfAsmArrangement()),
            asmStrings: asmStrings.children.map(x => x.astOfExpression()),
            loc: createSrcInfo(this),
        };
    },
    FunctionDeclaration(fnCommonPrefix, _semicolon) {
        const prefix = fnCommonPrefix.astOfFunctionCommonPrefix();
        return {
            kind: "function_declaration",
            forall: prefix.forall,
            returnTy: prefix.returnTy,
            name: prefix.name,
            parameters: prefix.parameters,
            attributes: prefix.attributes,
            loc: createSrcInfo(this),
        };
        
    },
    FunctionDefinition(fnCommonPrefix, _lbrace, stmts, _rbrace) {
        const prefix = fnCommonPrefix.astOfFunctionCommonPrefix();
        return {
            kind: "function_definition",
            forall: prefix.forall,
            returnTy: prefix.returnTy,
            name: prefix.name,
            parameters: prefix.parameters,
            attributes: prefix.attributes,
            statements: stmts.children.map(x => x.astOfStatement()),
            loc: createSrcInfo(this),
        };
        
    },
});

// Statements
semantics.addOperation<FuncAstStatement>("astOfStatement", {
    Statement(stmt) {
        return stmt.astOfStatement();
    },
    StatementReturn(_returnKwd, expr, _semicolon) {
        return {
            kind: "statement_return",
            expression: expr.astOfExpression(),
            loc: createSrcInfo(this),
        }
    },
    StatementBlock(_lbrace, statements, _rbrace) {
        return {
            kind: "statement_block",
            statements: statements.children.map((x) => x.astOfStatement()),
            loc: createSrcInfo(this),
        };
    },
    StatementEmpty(_semicolon) {
        return {
            kind: "statement_empty",
            loc: createSrcInfo(this),
        }
    },
    StatementCondition(cond) {
        return cond.astOfStatement();
    },
    StatementCondition_if(ifOr, cond, _lbrace, stmts, _rbrace, optElse) {
        return {
            kind: "statement_condition_if",
            positive: ifOr.sourceString === "if" ? true : false,
            condition: cond.astOfExpression(),
            consequences: stmts.children.map(x => x.astOfStatement()),
            alternatives: unwrapOptNode(optElse, t => t.astOfElseBlock()),
            loc: createSrcInfo(this),
        };
    },
    StatementCondition_elseif(ifOr, condIf, _lbrace, stmtsIf, _rbrace, elseifOr, condElseif, _lbrace2, stmtsElseif, _rbrace2, optElse) {
        return {
            kind: "statement_condition_elseif",
            positiveIf: ifOr.sourceString === "if" ? true : false,
            conditionIf: condIf.astOfExpression(),
            consequencesIf: stmtsIf.children.map(x => x.astOfStatement()),
            positiveElseif: elseifOr.sourceString === "elseif" ? true : false,
            conditionElseif: condElseif.astOfExpression(),
            consequencesElseif: stmtsElseif.children.map(x => x.astOfStatement()),
            alternativesElseif: unwrapOptNode(optElse, t => t.astOfElseBlock()),
            loc: createSrcInfo(this),
        };
    },
    StatementRepeat(_repeatKwd, expr, _lbrace, stmts, _rbrace) {
        return {
            kind: "statement_repeat",
            iterations: expr.astOfExpression(),
            statements: stmts.children.map(x => x.astOfStatement()),
            loc: createSrcInfo(this),
        };
    },
    StatementUntil(_doKwd, _lbrace, stmts, _rbrace, _untilKwd, cond, _semicolon) {
        return {
            kind: "statement_until",
            statements: stmts.children.map(x => x.astOfStatement()),
            condition: cond.astOfExpression(),
            loc: createSrcInfo(this),
        };
    },
    StatementWhile(_whileKwd, cond, _lbrace, stmts, _rbrace) {
        return {
            kind: "statement_while",
            condition: cond.astOfExpression(),
            statements: stmts.children.map(x => x.astOfStatement()),
            loc: createSrcInfo(this),
        };
    },
    StatementTryCatch(_tryKwd, _lbrace, stmtsTry, _rbrace, _catchKwd, _lparen, exceptionName, _comma, exitCodeName, _rparen, _lbrace2, stmtsCatch, _rbrace2) {
        return {
            kind: "statement_try_catch",
            statementsTry: stmtsTry.children.map(x => x.astOfStatement()),
            catchExceptionName: exceptionName.astOfExpression(),
            catchExitCodeName: exitCodeName.astOfExpression(),
            statementsCatch: stmtsCatch.children.map(x => x.astOfStatement()),
            loc: createSrcInfo(this),
        };
    },
    StatementExpression(expr, _semicolon) {
        return {
            kind: "statement_expression",
            expression: expr.astOfExpression(),
            loc: createSrcInfo(this),
        };
    },
});

semantics.addOperation<FuncAstExpression>("astOfExpression", {
});

// Miscellaneous things
// 
// A couple of them don't even have their own dedicated TypeScript types,
// and most were added purely for parsing convenience

// nonVarType? (quotedId | plainId)
semantics.addOperation<FuncAstGlobalVariable>("astOfGlobalVariable", {
    GlobalVariableDeclaration(optGlobTy, globName) {
        const name = globName.astOfExpression() as FuncAstId;

        // if a plainId, then check for validity
        if (name.kind === "plain_id") {
            checkPlainId(name.value, createSrcInfo(this), "Name of the global variable");
        }

        // check that it can be declared (also excludes operatorId and unusedId)
        checkDeclaredId(name.value, createSrcInfo(this), "Name of the global variable");

        // and that it's not a methodId
        if (name.kind === "method_id") {
            throwFuncSyntaxError(
                "Name of the global variable cannot start with ~ or .",
                createSrcInfo(this),
            );
        }

        // leaving only quotedId or plainId
        return {
            kind: "global_variable",
            ty: unwrapOptNode(optGlobTy, t => t.astOfType()),
            name: name as (FuncAstQuotedId | FuncAstPlainId),
            loc: createSrcInfo(this),
        };
    },
});

// (slice | int)? id = Expression
semantics.addOperation<FuncAstConstant>("astOfConstant", {
    ConstantDefinition(optConstTy, constName, _eqSign, expr) {
        const ty = unwrapOptNode(optConstTy, t => t.sourceString);
        const name = constName.astOfExpression() as FuncAstId;

        // if a plainId, then check for validity
        if (name.kind === "plain_id") {
            checkPlainId(name.value, createSrcInfo(this), "Name of the constant");
        }

        // check that it can be declared (also excludes operatorId and unusedId)
        checkDeclaredId(name.value, createSrcInfo(this), "Name of the constant");

        // and that it's not a methodId
        if (name.kind === "method_id") {
            throwFuncSyntaxError(
                "Name of the constant cannot start with ~ or .",
                createSrcInfo(this),
            );
        }

        return {
            kind: "constant",
            ty: ty !== undefined ? ty as ("slice" | "int") : undefined,
            name: name as (FuncAstQuotedId | FuncAstPlainId),
            value: expr.astOfExpression(),
            loc: createSrcInfo(this),
        };
    },
});

/** Not for export, purely for internal convenience reasons */
type FuncFunctionCommonPrefix = {
    forall: FuncAstForall | undefined;
    returnTy: FuncAstType;
    name: FuncAstId;
    parameters: FuncAstParameter[];
    attributes: FuncAstFunctionAttribute[];
};

// Common prefix of all function declarations/definitions
semantics.addOperation<FuncFunctionCommonPrefix>("astOfFunctionCommonPrefix", {
    // FunctionCommonPrefix(optForall, retTy, fnName, fnParams, fnAttributes) {
    // },
});

// forall (type? typeName1, type? typeName2, ...) ->
semantics.addOperation<FuncAstForall>("astOfForall", {
    Forall(_forallKwd, _space1, typeVars, _space2, _mapsToKwd, _space3) {
        return {
            kind: "forall",
            tyVars: typeVars.children.map(x => x.astOfType()),
            loc: createSrcInfo(this),
        }
    },
});

// All the types, united under FuncAstType
semantics.addOperation<FuncAstType>("astOfType", {

// Not a standalone statement, produces a list of statements instead
semantics.addOperation<FuncAstStatement[]>("astOfElseBlock", {
    ElseBlock(_elseKwd, _lbrace, stmts, _rbrace) {
        return stmts.children.map(x => x.astOfStatement());
    },
});

// semantics.addOperation("astOfSOMETHING", { });
// semantics.addOperation("astOfSOMETHING", { });
// semantics.addOperation("astOfSOMETHING", { });

//
// Utility parsing functions
//

/** If the match wasn't successful, provides error message and interval */
export type GrammarMatch =
    | { ok: false; message: string; interval: RawInterval }
    | { ok: true; res: MatchResult };

/**
 * Checks if the given `src` string of FunC code matches the FunC grammar
 * Doesn't throw an error, unlike `parse()` functions
 */
export function match(src: string): GrammarMatch {
    const matchResult = FuncGrammar.match(src);

    if (matchResult.failed()) {
        return {
            ok: false,
            message: `Parse error: expected ${(matchResult as any).getExpectedText()}\n`,
            interval: matchResult.getInterval(),
        };
    }

    return { ok: true, res: matchResult };
}

/**
 * Checks if the given `src` string of FunC code is parsable, returning an AST in case of success or throwing a `FuncParseError` otherwise
 *
 * Uses semantic analysis, unlike simple `match()`
 */
export function parse(src: string) {
    const matchResult = FuncGrammar.match(src);

    if (matchResult.failed()) {
        throwFuncParseError(matchResult, undefined);
    }
    try {
        return semantics(matchResult).astOfModule();
    } finally {
    }
}

/**
 * Similar to `parse()`, but also uses provided `path` in error messages
 * Unlike `parse()`, wraps its body in a call to `inFile()` with the `path` provided
 */
export function parseFile(src: string, path: string) {
    return inFile(path, () => {
        const matchResult = FuncGrammar.match(src);

        if (matchResult.failed()) {
            throwFuncParseError(matchResult, path);
        }
        try {
            return semantics(matchResult).astOfModule();
        } finally {
        }
    });
}
