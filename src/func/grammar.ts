import { Interval as RawInterval, IterationNode, MatchResult, Node } from "ohm-js";
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
 * Creates a `FuncSrcInfo` reference to a Node and `currentFile`
 */
export function createRef(s: Node) {
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
// TODO: Unite with syntax.ts and refactor dependant files
// FIXME: Would need help once parser is done on my side :)
//

type FuncAstNode = 
    | FuncAstModule
    | FuncAstPragma
    | FuncAstInclude
    | FuncAstModuleItem
    | FuncAstComment
    ;

type FuncAstModule = {
    kind: "module";
    pragmas: FuncAstPragma;
    includes: FuncAstInclude;
    items: FuncAstModuleItem;
};

//
// Compiler pragmas and includes
//

/**
 * #pragma ...
 */
type FuncAstPragma =
    | FuncAstPragmaLiteral
    | FuncAstPragmaVersionRange
    | FuncAstPragmaVersionString
    ;

/**
 * #pragma something-something-something;
 */
type FuncAstPragmaLiteral = {
    kind: "pragma_literal";
    literal: "allow-post-modification" | "compute-asm-ltr";
};

/**
 * `allow` — if set to `true` corresponds to version enforcement
 * `allow` — if set to `false` corresponds to version prohibiting (or not-version enforcement)
 *
 * #pragma (version | not-version) semverRange;
 */
type FuncAstPragmaVersionRange = {
    kind: "pragma_version_range";
    allow: boolean;
    range: FuncAstVersionRange;
};

/**
 * #pragma test-version-set "exact.version.semver";
 */
type FuncAstPragmaVersionString = {
    kind: "pragma_version_string";
    version: string;
};

/**
 * #include "path/to/file";
 */
type FuncAstInclude = {
    kind: "include";
    path: string;
};

//
// Top-level, module items
//

type FuncAstModuleItem =
    | {}
    ;

type FuncAstGlobalVariablesDeclaration = {
    kind: "global_variables_declaration",
    globals: FuncAstGlobalVariable,
};

type FuncAstGlobalVariable = {
    kind: "global_variable",
    type: FuncAstType | undefined;
    name: FuncAstId;
};

//
// Statements
// TODO
//

//
// Expressions
// TODO
//

//
// Miscellaneous syntactic rules, see: https://ohmjs.org/docs/syntax-reference#syntactic-lexical
//

// TODO:
type FuncAstType =
    | {};

//
// Lexical rules, see: https://ohmjs.org/docs/syntax-reference#syntactic-lexical
//

type FuncAstHole = {
    kind: "hole";
    value: "_" | "var";
};

type FuncAstUnit = {
    kind: "unit";
    value: "()";
};

type FuncAstFunctionId = {
    kind: "function_id";
    value: string;
};

type FuncAstId = 
    | FuncAstIdQuoted
    | FuncAstIdPlain
    ;

type FuncAstIdQuoted = {
    kind: "id_quoted";
    value: string;
};

type FuncAstIdPlain = {
    kind: "id_plain";
    value: string;
};

type FuncAstUnusedId = {
    kind: "unused_id";
    value: "_";
};

type FuncAstVersionRange = {
    kind: "version_range";
    op: string | undefined;
    major: bigint;
    minor: bigint | undefined;
    patch: bigint | undefined;
};

/**
 * "..."ty?
 */
type FuncAstStringLiteral = {
    kind: "string_literal";
    value: string;
    ty: undefined | FuncAstStringType;
};

/**
 * An additional modifier. See: https://docs.ton.org/develop/func/literals_identifiers#string-literals
 */
type FuncAstStringType = "s" | "a" | "u" | "h" | "H" | "c";

/**
 * """ ... """
 */
type FuncAstMultiLineString = {
    kind: "multiline_string";
    value: string;
    // TODO: alignIndent: boolean;
    // TODO: trim: boolean;
};

type FuncAstWhiteSpace = {
    kind: "whitespace";
    value: `\t` | ` ` | `\n` | `\r` | `\u2028` | `\u2029`;
};

/**
 * ;; ...
 * or
 * {- ... -}
 */
type FuncAstComment = 
    | FuncAstCommentSingleLine
    | FuncAstCommentMultiLine
    ;

/**
 * Doesn't include the starting ;; characters
 *
 * ;; ...
 */
type FuncAstCommentSingleLine = {
    kind: "comment_singleline";
    line: string;
};

/**
 * `skipCR` — if set to true, skips CR before the next line
 *
 * {- ... -}
 */
type FuncAstCommentMultiLine = {
    kind: "comment_multiline";
    contents: string;
    skipCR: boolean;
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
            pragmas: pragmas.children.map(x => x.astOfPragma()),
            includes: includes.children.map(x => x.astOfInclude()),
            items: items.children.map(x => x.astOfModuleItem()),
        };
    },
    comment(cmt) {
        return cmt.astOfModule();
    },
    comment_singleLine(_commentStart, lineContents) {
        return {
            kind: "comment_singleline",
            line: lineContents.sourceString,
        };
    },
    comment_multiLine(cmt) {
        return cmt.astOfModule();
    },
    multiLineComment(_commentStart, preInnerComment, innerComment, postInnerComment, _commentEnd) {
        return {
            kind: "comment_multiline",
            contents: [
                preInnerComment.sourceString,
                (innerComment.children.map(x => x.astOfModule()).join("") ?? ""),
                postInnerComment.sourceString,
            ].join(""),
            skipCR: false,
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
        };
    },
    Pragma_versionRange(_pragmaKwd, literal, range, _semicolon) {
        return {
            kind: "pragma_version_range",
            allow: literal.sourceString === "version" ? true : false,
            range: range.astOfVersionRange(),
        };
    },
    Pragma_versionString(_pragmaKwd, _literal, value, _semicolon) {
        return {
            kind: "pragma_version_string",
            version: value.astOfExpression(),
        };
    },
});

semantics.addOperation<FuncAstNode>("astOfInclude", {
    Include(_includeKwd, path, _semicolon) {
        return {
            kind: "include",
            path: path.astOfExpression(),
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
            globals: globals.children.map(x => x.astOfGlobalVariable()),
        };
    },
    ConstantsDefinition(_constKwd, constants, _semicolon) {
        return {
            kind: "constants_definition",
            constants: constants.children.map(x => x.astOfConstant()),
        };
    },
    AsmFunctionDefinition_singleLine(fnCommonPrefix, _asmKwd, optArrangement, asmStrings, _semicolon) {
        return {
            kind: "asm_function_definition",
            // TODO: fnCommonPrefix, optArrangement
        };
    },
    // AsmFunctionDefinition_multiLine(fnCommon, _asmKwd, optArrangement, multilineAsmStrings, _semicolon) {
    //     // TODO:
    // },
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
    | { ok: true };

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

    return { ok: true };
}

/**
 * Checks if the given `src` string of FunC code is parsable, returning an AST in case of success or throwing a `FuncParseError` otherwise
 *
 * Uses semantic analysis, unlike simple `match()`
 */
export function parse(src: string) {
    const matchResult = FuncGrammar.match(src);

    if (matchResult.failed()) { throwFuncParseError(matchResult, undefined); }
    try { return semantics(matchResult).astOfModule(); } finally {}
}

/**
 * Similar to `parse()`, but also uses provided `path` in error messages
 * Unlike `parse()`, wraps its body in a call to `inFile()` with the `path` provided
 */
export function parseFile(src: string, path: string) {
    return inFile(path, () => {
        const matchResult = FuncGrammar.match(src);

        if (matchResult.failed()) { throwFuncParseError(matchResult, path); }
        try { return semantics(matchResult).astOfModule(); } finally {}
    });
}
