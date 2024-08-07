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
 * FunC parser error, which generally occurs when either the sources didn't match the grammar, or the AST couldn't be constructed
 */
export class FuncParseError extends FuncError {
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
 * Throws a FunC parse error of the given `path` file
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
): T | null {
    const optNode = optional.children[0] as Node | undefined;
    return optNode !== undefined ? f(optNode) : null;
}

//
// FIXME: Those are directly matching contents of the grammar.ohm
// FIXME: Unite with syntax.ts and refactor dependant files
// FIXME: Would need help once parser is done on my side :)
//

export type FuncAstNode =
    | FuncAstModule
    | FuncAstPragma
    | FuncAstInclude
    | FuncAstModuleItem
    | FuncAstStatement
    | FuncAstExpression
    | FuncAstFunctionId
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
 * #pragma ...
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
    literal: string;
    // "allow-post-modification" | "compute-asm-ltr";
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
    version: string;
    loc: FuncSrcInfo;
};

/**
 * #include "path/to/file";
 */
export type FuncAstInclude = {
    kind: "include";
    path: string;
    loc: FuncSrcInfo;
};

//
// Top-level, module items
//

export type FuncAstModuleItem =
    | FuncAstGlobalVariablesDeclaration
    | FuncAstConstantsDefinition;

/**
 * global ..., ...;
 */
export type FuncAstGlobalVariablesDeclaration = {
    kind: "global_variables_declaration";
    globals: FuncAstGlobalVariable[];
    loc: FuncSrcInfo;
};

/**
 * nonVarType? id
 */
export type FuncAstGlobalVariable = {
    kind: "global_variable";
    ty: FuncAstTypeUniform | undefined;
    name: FuncAstId;
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
 * (slice | int)? id = Expression
 */
export type FuncAstConstant = {
    kind: "constant";
    ty: "slice" | "int" | undefined;
    name: FuncAstId;
    value: FuncAstExpression;
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
    alternatives: undefined | FuncAstStatement[];
    loc: FuncSrcInfo;
};

/**
 * (if | ifnot) Expression { ... } (elseif | elseifnot) Expression { ... } (else { ... })?
 *
 * @field positiveIf If true, then it represents `if`. If false, it's an `ifnot`.
 * @field conditionIf Expression
 * @field consequencesIf Branch after `if`, truthy case (or falsy in case of `ifnot`)
 * @field positiveElseif If true, then it represents `elseif`. If false, it's an `elseifnot`.
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
    // branch after elseif | elseifnot { ... }
    consequencesElseif: FuncAstStatement[];
    // optional third branch after else { ... }
    alternativesElseif: undefined | FuncAstStatement[];
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
    statementsCatch: FuncAstStatement[];
    catchExceptionName: FuncAstId;
    catchExitCodeName: FuncAstId;
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
    name: FuncAstFunctionId;
    argument: FuncAstExpressionArgument;
    loc: FuncSrcInfo;
};

export type FuncAstExpressionArgument =
    | FuncAstFunctionId
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
    | FuncAstExpressionFunCall
    | FuncAstExpressionPrimary;

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
 * (functionId | functionCallReturningFunction) Argument+
 */
export type FuncAstExpressionFunCall = {
    kind: "expression_fun_call";
    object: FuncAstFunctionId | FuncAstExpressionParens;
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
    | FuncAstFunctionId
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
// Miscellaneous syntactic rules, see: https://ohmjs.org/docs/syntax-reference#syntactic-lexical
//

/**
 * forall type? typeName1, type? typeName2, ... ->
 */
export type FuncAstForall = FuncAstTypeVar[];

/**
 * "type"? id
 */
export type FuncAstTypeVar = {
    kind: "type_var";
    keyword: boolean;
    ident: FuncAstId;
    loc: FuncSrcInfo;
};

/**
 * (type id, ...)
 */
export type FuncAstParameters = FuncAstParameter[];

/**
 * Parameters
 */
export type FuncAstParameter =
    | FuncAstParameterRegular
    | FuncAstParameterInferredType;

/**
 * type id
 */
export type FuncAstParameterRegular = {
    kind: "parameter_regular";
    ty: FuncAstType;
    ident: FuncAstId;
    loc: FuncSrcInfo;
};

/**
 * id
 */
export type FuncAstParameterInferredType = {
    kind: "parameter_inferred_type";
    ident: FuncAstId;
    loc: FuncSrcInfo;
};

/**
 * Builtin types or type variables
 */
export type FuncAstType = FuncAstTypeBuiltin | FuncAstTypeVar;

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
    mapsTo: undefined | FuncAstType;
};

/** (...) */
export type FuncAstTensor = FuncAstType[];

/** [...] */
export type FuncAstTuple = FuncAstType[];

/**
 * Non-polymorphic, uniform types
 */

export type FuncAstTypeUniform =
    | FuncAstTypeUniformMapped
    | FuncAstTypeUniformBuiltin;

export type FuncAstTypeUniformMapped = {
    kind: "type_uniform_mapped";
    left: FuncAstTypeBuiltin;
    right: FuncAstType;
};

export type FuncAstTypeUniformBuiltin = {
    kind: "type_uniform_builtin";
    value:
        | "int"
        | "cell"
        | "slice"
        | "builder"
        | "cont"
        | "tuple"
        | FuncAstTensorUniform
        | FuncAstTupleUniform
        | FuncAstHole
        | FuncAstUnit;
};

/** (...) */
export type FuncAstTensorUniform = FuncAstTypeUniform[];

/** [...] */
export type FuncAstTupleUniform = FuncAstTypeUniform[];

//
// Lexical rules, see: https://ohmjs.org/docs/syntax-reference#syntactic-lexical
//

export type FuncAstHole = {
    kind: "hole";
    value: "_" | "var";
    loc: FuncSrcInfo;
};

export type FuncAstUnit = {
    kind: "unit";
    value: "()";
    loc: FuncSrcInfo;
};


/**
 * Identifier kinds, except for function names, which are a superset of those
 */
export type FuncAstId =
    | FuncAstQuotedId
    | FuncAstOperatorId
    | FuncAstPlainId
    | FuncAstUnusedId;

/**
 * Like identifier, but can start with . or ~
 */
export type FuncAstFunctionId = {
    kind: "function_id";
    value: string;
    loc: FuncSrcInfo;
};

/**
 * `anything, except ` or new line`
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
    ty: undefined | FuncAstStringType;
    loc: FuncSrcInfo;
};

/**
 * """ ... """ty?
 */
export type FuncAstStringLiteralMultiLine = {
    kind: "string_multiline";
    value: string;
    ty: undefined | FuncAstStringType;
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
            literal: literal.sourceString,
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
        return {
            kind: "pragma_version_string",
            version: value.astOfExpression(),
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
        return {
            kind: "asm_function_definition",
            // TODO: fnCommonPrefix, optArrangement
        };
    },
    // FunctionDeclaration(arg0, arg1) {
    //     // TODO: ...
    // },
    // FunctionDefinition(arg0, arg1, arg2, arg3) {
    //     // TODO: ...
    // },
});

semantics.addOperation("astOfGlobalVariable", { });

semantics.addOperation("astOfConstant", { });

semantics.addOperation("astOfFunctionCommonPrefix", { });

//
// Utility parsing functions
//

/** If the match wasn't successful, provides error message and interval */
type GrammarMatch =
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
