import * as $ from "@tonstudio/parser-runtime";
import * as Ast from "@/next/ast";
import type { $ast } from "@/next/grammar/grammar";
import * as G from "@/next/grammar/grammar";
import { SyntaxErrors } from "@/next/grammar/errors";
import { makeMakeVisitor } from "@/utils/tricks";
import { throwInternal } from "@/error/errors";
import type { SourceLogger } from "@/error/logger-util";
import { parseImportString } from "@/next/grammar/import-parser";
import { builtinTypes } from "@/next/types/builtins";

const makeVisitor = makeMakeVisitor("$");

const mergeRange = (left: Ast.Range, right: Ast.Range): Ast.Range => {
    if (left.start > right.end) {
        return throwInternal("Invalid range merge");
    }
    if (left.path !== right.path) {
        return throwInternal("Merging ranges from different sources");
    }
    return Ast.Range(left.start, right.end, left.path, left.code);
};

type Context = {
    readonly err: SyntaxErrors<string, void>;
    readonly toRange: (loc: $.Loc) => Ast.Range;
};

type Handler<T> = (ctx: Context) => T;

const map =
    <T, U>(ts: readonly T[], handler: (t: T) => Handler<U>): Handler<U[]> =>
    (ctx) => {
        return ts.map((t) => handler(t)(ctx));
    };

const parseList = <T>(node: $ast.inter<T, unknown> | undefined): T[] => {
    if (!node) {
        return [];
    }
    const { head, tail } = node;
    return [head, ...tail.map(({ right }) => right)];
};

const parseId =
    ({ name, loc }: $ast.Id | $ast.TypeId): Handler<Ast.Id> =>
    (ctx) => {
        if (name.startsWith("__gen")) {
            ctx.err.reservedVarPrefix("__gen")(ctx.toRange(loc));
        }
        if (name.startsWith("__tact")) {
            ctx.err.reservedVarPrefix("__tact")(ctx.toRange(loc));
        }
        if (name === "_") {
            ctx.err.noWildcard()(ctx.toRange(loc));
        }
        return Ast.Id(name, ctx.toRange(loc));
    };

const parseOptionalId =
    ({ name, loc }: $ast.Id | $ast.TypeId): Handler<Ast.OptionalId> =>
    (ctx) => {
        if (name.startsWith("__gen")) {
            ctx.err.reservedVarPrefix("__gen")(ctx.toRange(loc));
        }
        if (name.startsWith("__tact")) {
            ctx.err.reservedVarPrefix("__tact")(ctx.toRange(loc));
        }
        if (name === "_") {
            return Ast.Wildcard(ctx.toRange(loc));
        }
        return Ast.Id(name, ctx.toRange(loc));
    };

const parseVar =
    ({ name, loc }: $ast.Id): Handler<Ast.Var> =>
    (ctx) => {
        if (name.startsWith("__gen")) {
            ctx.err.reservedVarPrefix("__gen")(ctx.toRange(loc));
        }
        if (name.startsWith("__tact")) {
            ctx.err.reservedVarPrefix("__tact")(ctx.toRange(loc));
        }
        if (name === "_") {
            ctx.err.noWildcard()(ctx.toRange(loc));
        }
        return Ast.Var(name, ctx.toRange(loc));
    };

/*
    FunC can parse much more than Fift can handle. For example, _0x0 and _0 are
    valid identifiers in FunC, and using either of them compiles and is then
    interpreted fine by Fift. But if you use both, FunC still compiles, but Fift crashes.

    Same goes for plain identifiers using hashes # or emojis — you can have one
    FunC function with any of those combinations of characters, but you (generally)
    cannot have two or more of such functions.
*/
const reservedFuncIds: Set<string> = new Set([
    "_",
    "#include",
    "#pragma",
    "[",
    "]",
    "{",
    "}",
    "?",
    ":",
    "+",
    "-",
    "*",
    "/%",
    "/",
    "%",
    "~/",
    "^/",
    "~%",
    "^%",
    "<=>",
    "<=",
    "<",
    ">=",
    ">",
    "!=",
    "==",
    "~>>",
    "~",
    "^>>",
    "^",
    "&",
    "|",
    "<<",
    ">>",
    "=",
    "+=",
    "-=",
    "*=",
    "/=",
    "%=",
    "~>>=",
    "~/=",
    "~%=",
    "^>>=",
    "^/=",
    "^%=",
    "^=",
    "<<=",
    ">>=",
    "&=",
    "|=",
    "int",
    "cell",
    "builder",
    "slice",
    "cont",
    "tuple",
    "type",
    "->",
    "forall",
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
]);

const parseFuncId =
    ({ accessor, id, loc }: $ast.FuncId): Handler<Ast.FuncId> =>
    (ctx) => {
        if (reservedFuncIds.has(id)) {
            ctx.err.reservedFuncId()(ctx.toRange(loc));
        }
        if (id.match(/^-?([0-9]+|0x[0-9a-fA-F]+)$/)) {
            ctx.err.numericFuncId()(ctx.toRange(loc));
        }
        if (id.startsWith('"') || id.startsWith("{-")) {
            ctx.err.invalidFuncId()(ctx.toRange(loc));
        }
        return Ast.FuncId((accessor ?? "") + id, ctx.toRange(loc));
    };

const baseMap = {
    IntegerLiteralBin: "2",
    IntegerLiteralOct: "8",
    IntegerLiteralDec: "10",
    IntegerLiteralHex: "16",
} as const;

const prefixMap = {
    IntegerLiteralBin: "0b",
    IntegerLiteralOct: "0o",
    IntegerLiteralDec: "",
    IntegerLiteralHex: "0x",
} as const;

const parseIntegerLiteralValue =
    ({ $, digits, loc }: $ast.IntegerLiteral["value"]): Handler<Ast.Number> =>
    (ctx) => {
        if (
            $ === "IntegerLiteralDec" &&
            digits.startsWith("0") &&
            digits.includes("_")
        ) {
            ctx.err.leadingZeroUnderscore()(ctx.toRange(loc));
        }
        const value = BigInt(prefixMap[$] + digits.replaceAll("_", ""));
        return Ast.Number(baseMap[$], value, ctx.toRange(loc));
    };

const parseIntegerLiteral =
    ({ value }: $ast.IntegerLiteral): Handler<Ast.Number> =>
    (ctx) => {
        return parseIntegerLiteralValue(value)(ctx);
    };

const parseStringLiteral =
    ({ value, loc }: $ast.StringLiteral): Handler<Ast.String> =>
    (ctx) => {
        const simplifiedValue = replaceEscapeSequences(value, loc, ctx);
        return Ast.String(simplifiedValue, ctx.toRange(loc));
    };

export function replaceEscapeSequences(
    stringLiteral: string,
    loc: $.Loc,
    ctx: Context,
): string {
    return stringLiteral.replace(
        /\\\\|\\"|\\n|\\r|\\t|\\v|\\b|\\f|\\u{([0-9A-Fa-f]{1,6})}|\\u([0-9A-Fa-f]{4})|\\x([0-9A-Fa-f]{2})/g,
        (match, unicodeCodePoint, unicodeEscape, hexEscape) => {
            switch (match) {
                case "\\\\":
                    return "\\";
                case '\\"':
                    return '"';
                case "\\n":
                    return "\n";
                case "\\r":
                    return "\r";
                case "\\t":
                    return "\t";
                case "\\v":
                    return "\v";
                case "\\b":
                    return "\b";
                case "\\f":
                    return "\f";
                default:
                    // Handle Unicode code point escape
                    if (unicodeCodePoint) {
                        const codePoint = parseInt(unicodeCodePoint, 16);
                        if (codePoint > 0x10ffff) {
                            ctx.err.undefinedUnicodeCodepoint()(
                                ctx.toRange(loc),
                            );
                            return match;
                        }
                        return String.fromCodePoint(codePoint);
                    }
                    // Handle Unicode escape
                    if (unicodeEscape) {
                        const codeUnit = parseInt(unicodeEscape, 16);
                        return String.fromCharCode(codeUnit);
                    }
                    // Handle hex escape
                    if (hexEscape) {
                        const hexValue = parseInt(hexEscape, 16);
                        return String.fromCharCode(hexValue);
                    }
                    return match;
            }
        },
    );
}

const parseBoolLiteral =
    ({ value, loc }: $ast.BoolLiteral): Handler<Ast.Boolean> =>
    (ctx) => {
        return Ast.Boolean(value === "true", ctx.toRange(loc));
    };

const parseNull =
    ({ loc }: $ast.Null): Handler<Ast.Null> =>
    (ctx) => {
        return Ast.Null(ctx.toRange(loc));
    };

const parseStructFieldInitializer =
    ({
        name,
        init,
        loc,
    }: $ast.StructFieldInitializer): Handler<Ast.StructFieldInitializer> =>
    (ctx) => {
        const fieldId = parseId(name)(ctx);

        // { x }
        return Ast.StructFieldInitializer(
            fieldId,
            init ? parseExpression(init)(ctx) : parseVar(name)(ctx),
            ctx.toRange(loc),
        );
    };

const parseStructInstance =
    ({
        type,
        typeArgs,
        fields,
        loc,
    }: $ast.StructInstance): Handler<Ast.StructInstance> =>
    (ctx) => {
        return Ast.StructInstance(
            parseTypeId(type)(ctx),
            map(parseList(typeArgs), parseType)(ctx),
            map(parseList(fields), parseStructFieldInitializer)(ctx),
            ctx.toRange(loc),
        );
    };

const parseBouncedArgs =
    (typeArgs: $ast.typeArgs, range: Ast.Range): Handler<Ast.TBounced> =>
    (ctx) => {
        const args = parseList(typeArgs);
        const [head] = args;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (args.length !== 1 || !head) {
            ctx.err.typeArity("bounced", 1)(range);
            return Ast.TBounced(
                Ast.TCons(Ast.TypeId("ERROR", range), [], range),
                range,
            );
        }
        return Ast.TBounced(parseType(head)(ctx), range);
    };

const parseMaybeArgs =
    (typeArgs: $ast.typeArgs, range: Ast.Range): Handler<Ast.TMaybe> =>
    (ctx) => {
        const args = parseList(typeArgs);
        const [head] = args;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (args.length !== 1 || !head) {
            ctx.err.typeArity("Maybe", 1)(range);
            return Ast.TMaybe(
                Ast.TCons(Ast.TypeId("ERROR", range), [], range),
                range,
            );
        }
        return Ast.TMaybe(parseType(head)(ctx), range);
    };

const parseMapArgs =
    (typeArgs: $ast.typeArgs, range: Ast.Range): Handler<Ast.TMap> =>
    (ctx) => {
        const args = parseList(typeArgs);
        const [keyType, valueType] = args;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (args.length !== 2 || !keyType || !valueType) {
            ctx.err.mapArgCount()(range);
            return Ast.TMap(
                Ast.TCons(Ast.TypeId("ERROR", range), [], range),
                Ast.TCons(Ast.TypeId("ERROR", range), [], range),
                range,
            );
        }
        return Ast.TMap(
            parseType(keyType)(ctx),
            parseType(valueType)(ctx),
            range,
        );
    };

const parseMapLiteral =
    ({ typeArgs, fields, loc }: $ast.MapLiteral): Handler<Ast.MapLiteral> =>
    (ctx) => {
        const range = ctx.toRange(loc);
        return Ast.MapLiteral(
            parseMapArgs(typeArgs, range)(ctx),
            map(parseList(fields), parseMapField)(ctx),
            range,
        );
    };

const parseMapField =
    ({ key, value }: $ast.mapField): Handler<Ast.MapField> =>
    (ctx) => {
        return Ast.MapField(
            parseExpression(key)(ctx),
            parseExpression(value)(ctx),
        );
    };

const parseSetArgs =
    (typeArgs: $ast.typeArgs, range: Ast.Range): Handler<Ast.TMap> =>
    (ctx) => {
        const args = parseList(typeArgs);
        const [valueType] = args;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (args.length !== 1 || !valueType) {
            ctx.err.setArgCount()(range);
            return Ast.TMap(
                Ast.TCons(Ast.TypeId("ERROR", range), [], range),
                Ast.TBasic(Ast.TUnit(range), range),
                range,
            );
        }
        return Ast.TMap(
            parseType(valueType)(ctx),
            Ast.TBasic(Ast.TUnit(range), range),
            range,
        );
    };

const parseSetLiteral =
    ({ typeArgs, fields, loc }: $ast.SetLiteral): Handler<Ast.SetLiteral> =>
    (ctx) => {
        const range = ctx.toRange(loc);
        return Ast.SetLiteral(
            parseSetArgs(typeArgs, range)(ctx),
            map(parseList(fields), parseExpression)(ctx),
            range,
        );
    };

const parseInitOf =
    ({ name, params, loc }: $ast.InitOf): Handler<Ast.InitOf> =>
    (ctx) => {
        return Ast.InitOf(
            parseTypeId(name)(ctx),
            map(parseList(params), parseExpression)(ctx),
            ctx.toRange(loc),
        );
    };

const parseCodeOf =
    ({ name, loc }: $ast.CodeOf): Handler<Ast.CodeOf> =>
    (ctx) => {
        return Ast.CodeOf(parseTypeId(name)(ctx), ctx.toRange(loc));
    };

const parseConditional =
    ({ head, tail, loc }: $ast.Conditional): Handler<Ast.Expression> =>
    (ctx) => {
        const condition = parseExpression(head)(ctx);
        if (!tail) {
            return condition;
        }
        const { thenBranch, elseBranch } = tail;
        return Ast.Conditional(
            condition,
            parseExpression(thenBranch)(ctx),
            parseExpression(elseBranch)(ctx),
            ctx.toRange(loc),
        );
    };

const parseBinary =
    ({
        exprs: { head, tail },
    }: $ast.Binary<Expression, Ast.BinaryOperation>): Handler<Ast.Expression> =>
    (ctx) => {
        return tail.reduce(
            ({ child, range }, { op, right }) => {
                const merged = mergeRange(
                    range,
                    mergeRange(ctx.toRange(op.loc), ctx.toRange(right.loc)),
                );
                return {
                    child: Ast.OpBinary(
                        op.name,
                        child,
                        parseExpression(right)(ctx),
                        merged,
                    ),
                    range: merged,
                };
            },
            { child: parseExpression(head)(ctx), range: ctx.toRange(head.loc) },
        ).child;
    };

const parseUnary =
    ({ prefixes, expression }: $ast.Unary): Handler<Ast.Expression> =>
    (ctx) => {
        return prefixes.reduceRight(
            ({ child, range }, { name, loc }) => {
                const merged = mergeRange(ctx.toRange(loc), range);
                return {
                    child: Ast.OpUnary(name, child, merged),
                    range: merged,
                };
            },
            {
                child: parseExpression(expression)(ctx),
                range: ctx.toRange(expression.loc),
            },
        ).child;
    };

type SuffixHandler = Handler<
    (child: Ast.Expression, loc: Ast.Range) => Ast.Expression
>;

const parseSuffixUnboxNotNull =
    (_: $ast.SuffixUnboxNotNull): SuffixHandler =>
    (_ctx) =>
    (child, loc) => {
        return Ast.OpUnary("!!", child, loc);
    };

const parseSuffixCall =
    ({ params, typeArgs }: $ast.SuffixCall): SuffixHandler =>
    (ctx) =>
    (child, loc) => {
        const paramsAst = map(parseList(params), parseExpression)(ctx);
        if (child.kind === "var") {
            return Ast.StaticCall(
                Ast.Id(child.name, child.loc),
                map(parseList(typeArgs), parseType)(ctx),
                paramsAst,
                loc,
            );
        } else if (child.kind === "field_access") {
            const parsedTypeArgs = map(parseList(typeArgs), parseType)(ctx);
            if (parsedTypeArgs.length > 0) {
                ctx.err.noGenericMethods()(loc);
            }
            return Ast.MethodCall(
                child.aggregate,
                child.field,
                [],
                paramsAst,
                loc,
            );
        } else {
            ctx.err.notCallable()(loc);
            return Ast.StaticCall(
                Ast.Id("__invalid__", loc),
                map(parseList(typeArgs), parseType)(ctx),
                paramsAst,
                loc,
            );
        }
    };

const parseSuffixFieldAccess =
    ({ name }: $ast.SuffixFieldAccess): SuffixHandler =>
    (ctx) =>
    (child, loc) => {
        return Ast.FieldAccess(child, parseId(name)(ctx), loc);
    };

const suffixVisitor: (node: $ast.suffix) => SuffixHandler =
    makeVisitor<$ast.suffix>()({
        SuffixUnboxNotNull: parseSuffixUnboxNotNull,
        SuffixCall: parseSuffixCall,
        SuffixFieldAccess: parseSuffixFieldAccess,
    });

const parseSuffix =
    ({ expression, suffixes }: $ast.Suffix): Handler<Ast.Expression> =>
    (ctx) => {
        return suffixes.reduce(
            ({ child, range }, suffix) => {
                const merged = mergeRange(range, ctx.toRange(suffix.loc));
                return {
                    child: suffixVisitor(suffix)(ctx)(child, merged),
                    range: merged,
                };
            },
            {
                child: parseExpression(expression)(ctx),
                range: ctx.toRange(expression.loc),
            },
        ).child;
    };

const parseUnit =
    ({ loc }: $ast.Unit): Handler<Ast.Unit> =>
    (ctx) => {
        return Ast.Unit(ctx.toRange(loc));
    };

const parseTensor =
    ({ head, tail, loc }: $ast.Tensor): Handler<Ast.Tensor> =>
    (ctx) => {
        return Ast.Tensor(
            map([head, ...tail], parseExpression)(ctx),
            ctx.toRange(loc),
        );
    };

const parseTuple =
    ({ types, loc }: $ast.Tuple): Handler<Ast.Tuple> =>
    (ctx) => {
        return Ast.Tuple(
            map(parseList(types), parseExpression)(ctx),
            ctx.toRange(loc),
        );
    };

const parseStaticCall =
    ({
        type,
        name,
        typeArgs,
        args,
        loc,
    }: $ast.StaticCall): Handler<Ast.StaticMethodCall> =>
    (ctx) => {
        return Ast.StaticMethodCall(
            parseTypeId(type)(ctx),
            map(parseList(typeArgs), parseType)(ctx),
            parseId(name)(ctx),
            map(parseList(args), parseExpression)(ctx),
            ctx.toRange(loc),
        );
    };

const parseParens = ({ child }: $ast.Parens): Handler<Ast.Expression> => {
    return parseExpression(child);
};

// has to be an interface because of the way TS handles circular type references
// eslint-disable-next-line @typescript-eslint/no-empty-object-type
interface Binary extends $ast.Binary<Expression, Ast.BinaryOperation> {}

type Expression =
    | $ast.Conditional
    | Binary
    | $ast.Unary
    | $ast.Suffix
    | $ast.Parens
    | $ast.StructInstance
    | $ast.IntegerLiteral
    | $ast.BoolLiteral
    | $ast.InitOf
    | $ast.CodeOf
    | $ast.Null
    | $ast.StringLiteral
    | $ast.Id
    | $ast.Unit
    | $ast.Tensor
    | $ast.Tuple
    | $ast.MapLiteral
    | $ast.SetLiteral
    | $ast.StaticCall;

const parseExpression: (input: Expression) => Handler<Ast.Expression> =
    makeVisitor<Expression>()({
        Conditional: parseConditional,
        Binary: parseBinary,
        Unary: parseUnary,
        Suffix: parseSuffix,
        Parens: parseParens,
        StructInstance: parseStructInstance,
        IntegerLiteral: parseIntegerLiteral,
        BoolLiteral: parseBoolLiteral,
        InitOf: parseInitOf,
        CodeOf: parseCodeOf,
        Null: parseNull,
        StringLiteral: parseStringLiteral,
        Id: parseVar,
        Unit: parseUnit,
        Tensor: parseTensor,
        Tuple: parseTuple,
        MapLiteral: parseMapLiteral,
        SetLiteral: parseSetLiteral,
        StaticCall: parseStaticCall,
    });

const parseStatementLet =
    ({ name, type, init, loc }: $ast.StatementLet): Handler<Ast.StatementLet> =>
    (ctx) => {
        return Ast.StatementLet(
            parseOptionalId(name)(ctx),
            type ? parseType(type)(ctx) : undefined,
            parseExpression(init)(ctx),
            ctx.toRange(loc),
        );
    };

const parsePunnedField =
    ({ name }: $ast.PunnedField): Handler<[Ast.Id, Ast.Id]> =>
    (ctx) => {
        return [parseId(name)(ctx), parseId(name)(ctx)];
    };

const parseRegularField =
    ({
        fieldName,
        varName,
    }: $ast.RegularField): Handler<[Ast.Id, Ast.OptionalId]> =>
    (ctx) => {
        return [parseId(fieldName)(ctx), parseOptionalId(varName)(ctx)];
    };

const parseDestructItem: (
    node: $ast.destructItem,
) => Handler<[Ast.Id, Ast.OptionalId]> = makeVisitor<$ast.destructItem>()({
    PunnedField: parsePunnedField,
    RegularField: parseRegularField,
});

const parseStatementDestruct =
    ({
        type,
        typeArgs,
        fields,
        rest,
        init,
        loc,
    }: $ast.StatementDestruct): Handler<Ast.StatementDestruct> =>
    (ctx) => {
        const ids = map(parseList(fields), parseDestructItem)(ctx);

        return Ast.StatementDestruct(
            parseTypeId(type)(ctx),
            map(parseList(typeArgs), parseType)(ctx),
            ids,
            rest.$ === "RestArgument",
            parseExpression(init)(ctx),
            ctx.toRange(loc),
        );
    };

const parseStatementBlock =
    ({ body, loc }: $ast.StatementBlock): Handler<Ast.StatementBlock> =>
    (ctx) => {
        return Ast.StatementBlock(parseStatements(body)(ctx), ctx.toRange(loc));
    };

const parseStatementReturn =
    ({ expression, loc }: $ast.StatementReturn): Handler<Ast.StatementReturn> =>
    (ctx) => {
        return Ast.StatementReturn(
            expression ? parseExpression(expression)(ctx) : undefined,
            ctx.toRange(loc),
        );
    };

const parseStatementCondition =
    ({
        condition,
        trueBranch,
        falseBranch,
        loc,
    }: $ast.StatementCondition): Handler<Ast.StatementCondition> =>
    (ctx) => {
        if (typeof falseBranch === "undefined") {
            return Ast.StatementCondition(
                parseExpression(condition)(ctx),
                parseStatements(trueBranch)(ctx),
                undefined,
                ctx.toRange(loc),
            );
        } else if (falseBranch.$ === "FalseBranch") {
            return Ast.StatementCondition(
                parseExpression(condition)(ctx),
                parseStatements(trueBranch)(ctx),
                parseStatements(falseBranch.body)(ctx),
                ctx.toRange(loc),
            );
        } else {
            return Ast.StatementCondition(
                parseExpression(condition)(ctx),
                parseStatements(trueBranch)(ctx),
                [parseStatementCondition(falseBranch)(ctx)],
                ctx.toRange(loc),
            );
        }
    };

const parseStatementWhile =
    ({
        condition,
        body,
        loc,
    }: $ast.StatementWhile): Handler<Ast.StatementWhile> =>
    (ctx) => {
        return Ast.StatementWhile(
            parseExpression(condition)(ctx),
            parseStatements(body)(ctx),
            ctx.toRange(loc),
        );
    };

const parseStatementRepeat =
    ({
        condition,
        body,
        loc,
    }: $ast.StatementRepeat): Handler<Ast.StatementRepeat> =>
    (ctx) => {
        return Ast.StatementRepeat(
            parseExpression(condition)(ctx),
            parseStatements(body)(ctx),
            ctx.toRange(loc),
        );
    };

const parseStatementUntil =
    ({
        condition,
        body,
        loc,
    }: $ast.StatementUntil): Handler<Ast.StatementUntil> =>
    (ctx) => {
        return Ast.StatementUntil(
            parseExpression(condition)(ctx),
            parseStatements(body)(ctx),
            ctx.toRange(loc),
        );
    };

const parseStatementTry =
    ({ body, handler, loc }: $ast.StatementTry): Handler<Ast.StatementTry> =>
    (ctx) => {
        if (handler) {
            return Ast.StatementTry(
                parseStatements(body)(ctx),
                {
                    name: parseOptionalId(handler.name)(ctx),
                    statements: parseStatements(handler.body)(ctx),
                },
                ctx.toRange(loc),
            );
        } else {
            return Ast.StatementTry(
                parseStatements(body)(ctx),
                undefined,
                ctx.toRange(loc),
            );
        }
    };

const parseStatementForEach =
    ({
        key,
        value,
        expression,
        body,
        loc,
    }: $ast.StatementForEach): Handler<Ast.StatementForEach> =>
    (ctx) => {
        return Ast.StatementForEach(
            parseOptionalId(key)(ctx),
            parseOptionalId(value)(ctx),
            parseExpression(expression)(ctx),
            parseStatements(body)(ctx),
            ctx.toRange(loc),
        );
    };

const parseStatementExpression =
    ({
        expression,
        loc,
    }: $ast.StatementExpression): Handler<Ast.StatementExpression> =>
    (ctx) => {
        return Ast.StatementExpression(
            parseExpression(expression)(ctx),
            ctx.toRange(loc),
        );
    };

const parseStatementAssign =
    ({
        left,
        operator,
        right,
        loc,
    }: $ast.StatementAssign): Handler<
        Ast.StatementAssign | Ast.StatementAugmentedAssign
    > =>
    (ctx) => {
        if (operator === "=") {
            return Ast.StatementAssign(
                parseExpression(left)(ctx),
                parseExpression(right)(ctx),
                ctx.toRange(loc),
            );
        } else {
            return Ast.StatementAugmentedAssign(
                operator,
                parseExpression(left)(ctx),
                parseExpression(right)(ctx),
                ctx.toRange(loc),
            );
        }
    };

const parseStatement: (node: $ast.statement) => Handler<Ast.Statement> =
    makeVisitor<$ast.statement>()({
        StatementLet: parseStatementLet,
        StatementDestruct: parseStatementDestruct,
        StatementBlock: parseStatementBlock,
        StatementReturn: parseStatementReturn,
        StatementCondition: parseStatementCondition,
        StatementWhile: parseStatementWhile,
        StatementRepeat: parseStatementRepeat,
        StatementUntil: parseStatementUntil,
        StatementTry: parseStatementTry,
        StatementForEach: parseStatementForEach,
        StatementExpression: parseStatementExpression,
        StatementAssign: parseStatementAssign,
    });

const parseStatements =
    (nodes: readonly $ast.statement[]): Handler<Ast.Statement[]> =>
    (ctx) => {
        return map(nodes, parseStatement)(ctx);
    };

const parseGetAttribute =
    (
        nodes: readonly $ast.FunctionAttribute[],
    ): Handler<undefined | Ast.GetAttribute> =>
    (ctx) => {
        const attrs: $ast.GetAttribute[] = [];
        for (const node of nodes) {
            if (typeof node.name === "object") {
                attrs.push(node.name);
            }
        }
        const [head, ...tail] = attrs;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (!head) {
            return undefined;
        }
        for (const attr of tail) {
            ctx.err.function.duplicate("get")(ctx.toRange(attr.loc));
        }
        return Ast.GetAttribute(
            head.methodId ? parseExpression(head.methodId)(ctx) : undefined,
            ctx.toRange(head.loc),
        );
    };

type NamedAttr =
    | "mutates"
    | "extends"
    | "virtual"
    | "override"
    | "inline"
    | "abstract";

const parseNamedAttr =
    <K extends NamedAttr>(key: K) =>
    (
        nodes: readonly ($ast.FunctionAttribute | $ast.ConstantAttribute)[],
    ): Handler<undefined | Ast.Range> =>
    (ctx) => {
        const attrs: Ast.Range[] = [];
        for (const node of nodes) {
            if (typeof node.name === "string" && node.name === key) {
                attrs.push(ctx.toRange(node.loc));
            }
        }
        const [head, ...tail] = attrs;
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (!head) {
            return undefined;
        }
        for (const range of tail) {
            ctx.err.function.duplicate(key)(range);
        }
        return head;
    };

const parseParameter =
    ({ name, type, loc }: $ast.Parameter): Handler<Ast.TypedParameter> =>
    (ctx) => {
        return Ast.TypedParameter(
            parseOptionalId(name)(ctx),
            parseType(type)(ctx),
            ctx.toRange(loc),
        );
    };

const parseTypeId =
    ({ name, loc }: $ast.TypeId): Handler<Ast.TypeId> =>
    (ctx) => {
        return Ast.TypeId(name, ctx.toRange(loc));
    };

const parseTypeStorage =
    ({ child: storage, loc }: $ast.TypeStorage): Handler<Ast.Type> =>
    (ctx) => {
        const range = ctx.toRange(loc);
        const fallback = Ast.TCons(Ast.TypeId("ERROR", range), [], range);
        if (storage.$ === "CoinsStorage") {
            return Ast.TBasic(Ast.TInt(
                Ast.IFVarInt("unsigned", "16", ctx.toRange(storage.loc)),
                range,
            ), range);
        } else if (storage.$ === "IntStorage") {
            const width = parseInt(storage.width, 10);
            if (storage.isVar) {
                if (width === 16) {
                    return Ast.TBasic(Ast.TInt(
                        Ast.IFVarInt(
                            typeof storage.isUnsigned === "undefined"
                                ? "signed"
                                : "unsigned",
                            "16",
                            ctx.toRange(storage.loc),
                        ),
                        range,
                    ), range);
                } else if (width === 32) {
                    return Ast.TBasic(Ast.TInt(
                        Ast.IFVarInt(
                            typeof storage.isUnsigned === "undefined"
                                ? "signed"
                                : "unsigned",
                            "32",
                            ctx.toRange(storage.loc),
                        ),
                        range,
                    ), range);
                } else {
                    ctx.err.wrongVarIntSize()(range);
                    return fallback;
                }
            } else if (storage.isUnsigned) {
                if (1 <= width && width <= 256) {
                    return Ast.TBasic(Ast.TInt(
                        Ast.IFInt("unsigned", width, range),
                        range,
                    ), range);
                } else {
                    ctx.err.wrongUIntSize()(range);
                    return fallback;
                }
            } else {
                if (1 <= width && width <= 257) {
                    return Ast.TBasic(Ast.TInt(
                        Ast.IFInt("signed", width, range),
                        range,
                    ), range);
                } else {
                    ctx.err.wrongIntSize()(range);
                    return fallback;
                }
            }
        } else if (storage.$ === "RemainingStorage") {
            ctx.err.rawRemaining()(range);
            return Ast.TBasic(Ast.TSlice(Ast.SFRemaining(range), range), range);
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        } else if (storage.$ === "BytesStorage") {
            const width = parseInt(storage.width, 10);
            if (width === 32 || width === 64) {
                return Ast.TBasic(Ast.TSlice(Ast.SFBits(width * 8, range), range), range);
            } else {
                ctx.err.wrongSliceSize()(range);
                return fallback;
            }
        } else {
            ctx.err.wrongFormat("No type")(range);
            return fallback;
        }
    };

const applyFormat =
    (
        type: Ast.Type,
        storage: $ast.storage,
        asLoc: Ast.Range,
    ): Handler<Ast.Type> =>
    (ctx) => {
        const fallback = Ast.TCons(Ast.TypeId("ERROR", asLoc), [], asLoc);
        if (type.kind === "basic") {
            const basic = applyBasic(type.type, storage, asLoc)(ctx);
            return basic ? Ast.TBasic(basic, type.loc) : fallback;
        } else if (type.kind === "cons_type" && type.name.text === "Maybe") {
            // NB! Compatibility with old code that allowed `Int? as int32`
            //     instead of `(Int as int32)?`
            const arg = type.typeArgs[0];
            if (type.typeArgs.length !== 1 || typeof arg === "undefined") {
                return throwInternal("Maybe can only have one argument");
            }
            const result = applyFormat(arg, storage, asLoc)(ctx);
            return Ast.TCons(type.name, [result], type.loc);
        } else {
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
            if (type.loc.kind !== "range") {
                return throwInternal("Non-range in parser");
            }
            ctx.err.cannotHaveFormat()(type.loc);
            return fallback;
        }
    };

const applyBasic = (
    type: Ast.BasicType,
    storage: $ast.storage,
    asLoc: Ast.Range,
): Handler<Ast.BasicType | undefined> =>
(ctx) => {
    if (type.kind === "TyInt") {
        if (storage.$ === "CoinsStorage") {
            return Ast.TInt(
                Ast.IFVarInt("unsigned", "16", ctx.toRange(storage.loc)),
                type.loc,
            );
        } else if (storage.$ === "IntStorage") {
            const width = parseInt(storage.width, 10);
            if (storage.isVar) {
                if (width === 16) {
                    return Ast.TInt(
                        Ast.IFVarInt(
                            typeof storage.isUnsigned === "undefined"
                                ? "signed"
                                : "unsigned",
                            "16",
                            ctx.toRange(storage.loc),
                        ),
                        type.loc,
                    );
                } else if (width === 32) {
                    return Ast.TInt(
                        Ast.IFVarInt(
                            typeof storage.isUnsigned === "undefined"
                                ? "signed"
                                : "unsigned",
                            "32",
                            ctx.toRange(storage.loc),
                        ),
                        type.loc,
                    );
                } else {
                    ctx.err.wrongVarIntSize()(asLoc);
                    return undefined;
                }
            } else if (storage.isUnsigned) {
                if (1 <= width && width <= 256) {
                    return Ast.TInt(
                        Ast.IFInt("unsigned", width, asLoc),
                        type.loc,
                    );
                } else {
                    ctx.err.wrongUIntSize()(asLoc);
                    return undefined;
                }
            } else {
                if (1 <= width && width <= 257) {
                    return Ast.TInt(
                        Ast.IFInt("signed", width, asLoc),
                        type.loc,
                    );
                } else {
                    ctx.err.wrongIntSize()(asLoc);
                    return undefined;
                }
            }
        } else {
            ctx.err.wrongFormat("Integer")(asLoc);
            return undefined;
        }
    } else if (type.kind === "TySlice") {
        if (storage.$ === "RemainingStorage") {
            return Ast.TSlice(Ast.SFRemaining(asLoc), type.loc);
        } else if (storage.$ === "BytesStorage") {
            const width = parseInt(storage.width, 10);
            if (width === 32 || width === 64) {
                return Ast.TSlice(
                    Ast.SFBits(width * 8, asLoc),
                    type.loc,
                );
            } else {
                ctx.err.wrongSliceSize()(asLoc);
                return undefined;
            }
        } else {
            ctx.err.wrongFormat("Slice")(asLoc);
            return undefined;
        }
    } else if (type.kind === "TyCell" || type.kind === "TyBuilder") {
        if (storage.$ === "RemainingStorage") {
            const Type =
                type.kind === "TyCell" ? Ast.TCell : Ast.TBuilder;
            return Type(Ast.SFRemaining(asLoc), type.loc);
        } else {
            ctx.err.wrongFormat(
                type.kind === "TyCell" ? "Cell" : "Builder",
            )(asLoc);
            return undefined;
        }
    } else {
        // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
        if (type.loc.kind !== "range") {
            return throwInternal("Non-range in parser");
        }
        ctx.err.cannotHaveFormat()(type.loc);
        return undefined;
    }
};

const parseTypeAs =
    ({ type, as, loc }: $ast.TypeAs): Handler<Ast.Type> =>
    (ctx) => {
        const onlyAs = as[0];
        if (as.length === 0 || typeof onlyAs === "undefined") {
            return parseType(type)(ctx);
        }
        if (as.length > 1) {
            ctx.err.duplicateAs()(ctx.toRange(loc));
            return Ast.TCons(
                Ast.TypeId("ERROR", ctx.toRange(loc)),
                [],
                ctx.toRange(loc),
            );
        }
        const asLoc = ctx.toRange(loc);
        const result = parseType(type)(ctx);
        return applyFormat(result, onlyAs, asLoc)(ctx);
    };

const parseTypeGeneric =
    ({ name, args, loc }: $ast.TypeGeneric): Handler<Ast.Type> =>
    (ctx) => {
        const range = ctx.toRange(loc);
        if (name.$ === "Bounced") {
            return parseBouncedArgs(args, range)(ctx);
        } else if (name.$ === "MapKeyword" || name.name === "Map") {
            return parseMapArgs(args, range)(ctx);
        } else if (name.name === "Maybe") {
            return parseMaybeArgs(args, range)(ctx);
        } else if (builtinTypes.has(name.name)) {
            ctx.err.typeArity(name.name, 0)(range);
            return Ast.TCons(Ast.TypeId("ERROR", range), [], range);
        } else {
            return Ast.TCons(
                Ast.TypeId(name.name, ctx.toRange(name.loc)),
                map(parseList(args), parseTypeAs)(ctx),
                range,
            );
        }
    };

const parseTypeOptional =
    ({ type, optionals }: $ast.TypeOptional): Handler<Ast.Type> =>
    (ctx) => {
        return optionals.reduce((acc, optional) => {
            return Ast.TMaybe(acc, ctx.toRange(optional.loc));
        }, parseType(type)(ctx));
    };

const parseTypeRegular =
    ({ child }: $ast.TypeRegular): Handler<Ast.Type> =>
    (ctx) => {
        const range = ctx.toRange(child.loc);
        switch (child.name) {
            case "Int":
                return Ast.TBasic(Ast.TInt(Ast.IFInt("signed", 257, range), range), range);
            case "Slice":
                return Ast.TBasic(Ast.TSlice(Ast.SFDefault(range), range), range);
            case "Cell":
                return Ast.TBasic(Ast.TCell(Ast.SFDefault(range), range), range);
            case "Builder":
                return Ast.TBasic(Ast.TBuilder(Ast.SFDefault(range), range), range);
            case "Void":
                return Ast.TBasic(Ast.TVoid(range), range);
            case "Null":
                return Ast.TBasic(Ast.TNull(range), range);
            case "Bool":
                return Ast.TBasic(Ast.TBool(range), range);
            case "Address":
                return Ast.TBasic(Ast.TAddress(range), range);
            case "String":
                return Ast.TBasic(Ast.TString(range), range);
            case "StringBuilder":
                return Ast.TBasic(Ast.TStringBuilder(range), range);
            case "StateInit":
                return Ast.TBasic(Ast.TStateInit(range), range);
            case "Bounced":
                ctx.err.mustBeGeneric()(range);
                return Ast.TCons(Ast.TypeId("ERROR", range), [], range);
            case "Maybe":
                ctx.err.mustBeGeneric()(range);
                return Ast.TCons(Ast.TypeId("ERROR", range), [], range);
            default:
                return Ast.TCons(parseTypeId(child)(ctx), [], range);
        }
    };

const parseTypeTensor =
    ({ head, tail, loc }: $ast.TypeTensor): Handler<Ast.Type> =>
    (ctx) => {
        return Ast.TTensor(
            map([head, ...tail], parseType)(ctx),
            ctx.toRange(loc),
        );
    };

const parseTypeTuple =
    ({ types, loc }: $ast.TypeTuple): Handler<Ast.Type> =>
    (ctx) => {
        return Ast.TTuple(
            map(parseList(types), parseType)(ctx),
            ctx.toRange(loc),
        );
    };

const parseTypeUnit =
    ({ loc }: $ast.TypeUnit): Handler<Ast.Type> =>
    (ctx) => {
        const range = ctx.toRange(loc);
        return Ast.TBasic(Ast.TUnit(range), range);
    };

type RawType =
    | $ast.TypeAs
    | $ast.TypeGeneric
    | $ast.TypeRegular
    | $ast.TypeOptional
    | $ast.TypeTensor
    | $ast.TypeUnit
    | $ast.TypeTuple
    | $ast.TypeStorage;

const parseType: (node: RawType) => Handler<Ast.Type> = makeVisitor<RawType>()({
    TypeAs: parseTypeAs,
    TypeGeneric: parseTypeGeneric,
    TypeOptional: parseTypeOptional,
    TypeRegular: parseTypeRegular,
    TypeTensor: parseTypeTensor,
    TypeTuple: parseTypeTuple,
    TypeUnit: parseTypeUnit,
    TypeStorage: parseTypeStorage,
});

const parseFieldDecl =
    ({ name, type, expression, loc }: $ast.FieldDecl): Handler<Ast.FieldDecl> =>
    (ctx) => {
        return Ast.FieldDecl(
            parseId(name)(ctx),
            parseType(type)(ctx),
            expression ? parseExpression(expression)(ctx) : undefined,
            ctx.toRange(loc),
        );
    };

const parseReceiverParam =
    (param: $ast.receiverParam): Handler<Ast.ReceiverSubKind> =>
    (ctx) => {
        return !param
            ? Ast.ReceiverFallback()
            : param.$ === "Parameter"
              ? Ast.ReceiverSimple(parseParameter(param)(ctx))
              : Ast.ReceiverComment(parseStringLiteral(param)(ctx));
    };

const parseReceiverInternal =
    ({ type, param, body, loc }: $ast.Receiver): Handler<Ast.Receiver> =>
    (ctx) => {
        return Ast.Receiver(
            Ast.ReceiverInternal(
                parseReceiverParam(param)(ctx),
                ctx.toRange(type.loc),
            ),
            map(body, parseStatement)(ctx),
            ctx.toRange(loc),
        );
    };

const parseReceiverExternal =
    ({ type, param, body, loc }: $ast.Receiver): Handler<Ast.Receiver> =>
    (ctx) => {
        return Ast.Receiver(
            Ast.ReceiverExternal(
                parseReceiverParam(param)(ctx),
                ctx.toRange(type.loc),
            ),
            map(body, parseStatement)(ctx),
            ctx.toRange(loc),
        );
    };

const emptyLoc = { $: "range", start: 0, end: 0 } as const;
const repairParam: $ast.receiverParam = {
    $: "Parameter",
    name: {
        $: "Id",
        name: "__invalid__",
        loc: emptyLoc,
    },
    type: {
        $: "TypeAs",
        as: [],
        type: {
            $: "TypeOptional",
            optionals: [],
            type: {
                $: "TypeRegular",
                child: {
                    $: "TypeId",
                    name: "__Invalid__",
                    loc: emptyLoc,
                },
                loc: emptyLoc,
            },
            loc: emptyLoc,
        },
        loc: emptyLoc,
    },
    loc: emptyLoc,
};

const parseReceiverBounced =
    ({ type, param, body, loc }: $ast.Receiver): Handler<Ast.Receiver> =>
    (ctx) => {
        if (typeof param === "undefined") {
            ctx.err.noBouncedWithoutArg()(ctx.toRange(loc));
            param = repairParam;
        }

        if (param.$ === "StringLiteral") {
            ctx.err.noBouncedWithString()(ctx.toRange(loc));
            param = repairParam;
        }

        return Ast.Receiver(
            Ast.ReceiverBounce(
                parseParameter(param)(ctx),
                ctx.toRange(type.loc),
            ),
            map(body, parseStatement)(ctx),
            ctx.toRange(loc),
        );
    };

const parserByReceiverType: Record<
    $ast.ReceiverType["name"],
    (node: $ast.Receiver) => Handler<Ast.Receiver>
> = {
    bounced: parseReceiverBounced,
    receive: parseReceiverInternal,
    external: parseReceiverExternal,
};

const parseReceiver = (node: $ast.Receiver): Handler<Ast.Receiver> => {
    return parserByReceiverType[node.type.name](node);
};

const defaultShuffle = {
    args: [],
    ret: [],
};

const parseAsmShuffle =
    (node: $ast.shuffle | undefined): Handler<Ast.AsmShuffle> =>
    (ctx) => {
        if (!node) {
            return defaultShuffle;
        }

        return {
            args: map(node.ids, parseId)(ctx),
            ret: node.to ? map(node.to, parseIntegerLiteralValue)(ctx) : [],
        };
    };

const parseAsmFunctionRaw =
    (node: $ast.AsmFunction): Handler<Ast.Function> =>
    (ctx) => {
        const range = ctx.toRange(node.loc);
        return Ast.Function(
            !!parseNamedAttr("inline")(node.attributes)(ctx),
            parseId(node.name)(ctx),
            Ast.TFunction(
                map(parseList(node.typeParams), parseTypeId)(ctx),
                map(parseList(node.parameters), parseParameter)(ctx),
                node.returnType
                    ? parseType(node.returnType)(ctx)
                    : Ast.TBasic(Ast.TVoid(range), range),
            ),
            Ast.AsmBody(parseAsmShuffle(node.shuffle)(ctx), [
                node.instructions.trim(),
            ]),
            range,
        );
    };

const checkNoGlobalAttrs =
    (
        attrs: readonly ($ast.FunctionAttribute | $ast.ConstantAttribute)[],
        range: Ast.Range,
    ): Handler<void> =>
    (ctx) => {
        const isVirtual = parseNamedAttr("virtual")(attrs)(ctx);
        const isOverride = parseNamedAttr("override")(attrs)(ctx);
        const isAbstract = parseNamedAttr("abstract")(attrs)(ctx);
        if (isVirtual || isOverride || isAbstract) {
            ctx.err.globalWithAttr()(range);
        }
    };

const parseInheritance =
    (
        hasBody: boolean,
        attrs: readonly ($ast.FunctionAttribute | $ast.ConstantAttribute)[],
        range: Ast.Range,
    ): Handler<{ override: boolean; overridable: boolean }> =>
    (ctx) => {
        const isVirtual = parseNamedAttr("virtual")(attrs)(ctx);
        const isOverride = parseNamedAttr("override")(attrs)(ctx);
        const isAbstract = parseNamedAttr("abstract")(attrs)(ctx);
        if (isAbstract) {
            if (isVirtual) {
                ctx.err.abstractVirtual()(isVirtual);
            }
            if (isOverride) {
                ctx.err.abstractOverride()(isOverride);
            }
            if (hasBody) {
                ctx.err.abstractWithBody()(isAbstract);
            }
        } else {
            if (!hasBody) {
                ctx.err.noBodyNoAbstract()(range);
            }
        }
        return {
            override: !!isOverride,
            overridable: !!isVirtual || !!isAbstract,
        };
    };

const parseConstant =
    (node: $ast.Constant): Handler<Ast.Constant> =>
    (ctx) => {
        const name = parseId(node.name)(ctx);
        const range = ctx.toRange(node.loc);
        const type = (() => {
            if (node.body.$ === "ConstantDefinition") {
                return Ast.ConstantDef(
                    node.type ? parseType(node.type)(ctx) : undefined,
                    parseExpression(node.body.expression)(ctx),
                );
            } else if (node.type) {
                return Ast.ConstantDecl(parseType(node.type)(ctx));
            } else {
                ctx.err.constDeclNoType()(range);
                return Ast.ConstantDecl(
                    Ast.TCons(Ast.TypeId("ERROR", range), [], range),
                );
            }
        })();
        return Ast.Constant(name, type, range);
    };

const parseConstantGlobal =
    (node: $ast.Constant): Handler<Ast.Constant> =>
    (ctx) => {
        checkNoGlobalAttrs(node.attributes, ctx.toRange(node.loc))(ctx);
        return parseConstant(node)(ctx);
    };

const parseFieldConstant =
    (node: $ast.Constant): Handler<Ast.FieldConstant> =>
    (ctx) => {
        const body = parseConstant(node)(ctx);
        const inh = parseInheritance(
            body.init.kind === "constant_def",
            node.attributes,
            ctx.toRange(node.loc),
        )(ctx);
        return Ast.FieldConstant(inh.overridable, inh.override, body);
    };

const parseContract =
    ({
        name,
        attributes,
        parameters,
        traits,
        declarations,
        loc,
    }: $ast.Contract): Handler<Ast.Contract> =>
    (ctx) => {
        const params = parseList<$ast.Parameter>(parameters?.values).map(
            (param) => {
                return parseFieldDecl({
                    $: "FieldDecl",
                    name: param.name,
                    type: param.type,
                    expression: undefined,
                    loc: param.loc,
                })(ctx);
            },
        );

        const initFns: $ast.ContractInit[] = [];
        const locals: $ast.traitItemDecl[] = [];
        for (const decl of declarations) {
            if (decl.$ === "ContractInit") {
                initFns.push(decl);
            } else {
                locals.push(decl);
            }
        }
        const [initFn, ...restInitFns] = initFns;
        for (const fn of restInitFns) {
            ctx.err.tooMuchInit()(ctx.toRange(fn.loc));
        }

        const init = (() => {
            if (typeof parameters !== "undefined") {
                // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
                if (initFn) {
                    ctx.err.initFnAndParams()(ctx.toRange(initFn.loc));
                }
                return Ast.InitParams(params, ctx.toRange(loc));
                // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
            } else if (initFn) {
                return Ast.InitFunction(
                    map(parseList(initFn.parameters), parseParameter)(ctx),
                    map(initFn.body, parseStatement)(ctx),
                    ctx.toRange(loc),
                );
            } else {
                return undefined;
            }
        })();

        return Ast.Contract(
            init,
            parseTypeId(name)(ctx),
            map(parseList(traits), parseTypeId)(ctx),
            map(attributes, parseContractAttribute)(ctx),
            parseLocalItems(locals)(ctx),
            ctx.toRange(loc),
        );
    };

const parseFunctionRaw =
    (node: $ast.$Function): Handler<Ast.Function> =>
    (ctx) => {
        const range = ctx.toRange(node.loc);
        return Ast.Function(
            !!parseNamedAttr("inline")(node.attributes)(ctx),
            parseId(node.name)(ctx),
            Ast.TFunction(
                map(parseList(node.typeParams), parseTypeId)(ctx),
                map(parseList(node.parameters), parseParameter)(ctx),
                node.returnType
                    ? parseType(node.returnType)(ctx)
                    : Ast.TBasic(Ast.TVoid(range), range),
            ),
            node.body.$ === "FunctionDeclaration"
                ? Ast.AbstractBody()
                : Ast.RegularBody(map(node.body.body, parseStatement)(ctx)),
            range,
        );
    };

const parseExtension =
    <T extends $ast.$Function | $ast.AsmFunction | $ast.NativeFunctionDecl>(
        parseFunction: (node: T) => Handler<Ast.Function>,
    ) =>
    (node: T): Handler<Ast.Function | Ast.Extension> =>
    (ctx) => {
        const fn = parseFunction(node)(ctx);
        const get = parseGetAttribute(node.attributes)(ctx);
        if (get) {
            // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
            if (get.loc.kind !== "range") {
                return throwInternal("Non-range in parser");
            }
            ctx.err.globalGetter()(get.loc);
        }
        checkNoGlobalAttrs(node.attributes, ctx.toRange(node.loc))(ctx);
        const isMutates = parseNamedAttr("mutates")(node.attributes)(ctx);
        const isExtends = parseNamedAttr("extends")(node.attributes)(ctx);
        if (!isExtends) {
            if (isMutates) {
                ctx.err.mutatesWithoutExtends()(isMutates);
            }
            return fn;
        }
        const [first, ...rest] = fn.type.params;
        const selfType = (() => {
            if (
                // eslint-disable-next-line @typescript-eslint/no-unnecessary-condition
                !first ||
                first.name.kind !== "id" ||
                first.name.text !== "self"
            ) {
                const range = ctx.toRange(node.loc);
                ctx.err.extendsSelf()(range);
                return Ast.TCons(Ast.TypeId("ERROR", range), [], range);
            }
            return first.type;
        })();
        return Ast.Extension(
            !!isMutates,
            { ...fn, type: { ...fn.type, params: rest } },
            selfType,
        );
    };

const parseMethod =
    <T extends $ast.$Function | $ast.AsmFunction>(
        parseFunction: (node: T) => Handler<Ast.Function>,
    ) =>
    (node: T): Handler<Ast.Method> =>
    (ctx) => {
        const fn = parseFunction(node)(ctx);
        const get = parseGetAttribute(node.attributes)(ctx);
        const inh = parseInheritance(
            fn.body.kind !== "abstract_body",
            node.attributes,
            ctx.toRange(node.loc),
        )(ctx);
        const isMutates = parseNamedAttr("mutates")(node.attributes)(ctx);
        const isExtends = parseNamedAttr("extends")(node.attributes)(ctx);
        if (isExtends) {
            ctx.err.localExtends()(ctx.toRange(node.loc));
        }
        return Ast.Method(!!isMutates, inh.overridable, inh.override, get, fn);
    };

const parseMessageDecl =
    ({
        name,
        opcode,
        fields,
        loc,
    }: $ast.MessageDecl): Handler<Ast.MessageDecl> =>
    (ctx) => {
        return Ast.MessageDecl(
            parseTypeId(name)(ctx),
            opcode ? parseExpression(opcode)(ctx) : undefined,
            map(parseList(fields), parseFieldDecl)(ctx),
            ctx.toRange(loc),
        );
    };

const parseNativeFunctionDecl =
    ({
        name,
        attributes,
        typeParams,
        nativeName,
        parameters,
        returnType,
        loc,
    }: $ast.NativeFunctionDecl): Handler<Ast.Function> =>
    (ctx) => {
        const range = ctx.toRange(loc);
        return Ast.Function(
            !!parseNamedAttr("inline")(attributes)(ctx),
            parseId(name)(ctx),
            Ast.TFunction(
                map(parseList(typeParams), parseTypeId)(ctx),
                map(parseList(parameters), parseParameter)(ctx),
                returnType ? parseType(returnType)(ctx) : Ast.TBasic(Ast.TVoid(range), range),
            ),
            Ast.NativeBody(parseFuncId(nativeName)(ctx)),
            range,
        );
    };

const parseAlias =
    ({ name, typeParams, type, loc }: $ast.AliasDecl): Handler<Ast.AliasDecl> =>
    (ctx) => {
        return Ast.AliasDecl(
            parseTypeId(name)(ctx),
            map(parseList(typeParams), parseTypeId)(ctx),
            parseType(type)(ctx),
            ctx.toRange(loc),
        );
    };

const parseUnion =
    ({
        name,
        typeParams,
        cases,
        loc,
    }: $ast.UnionDecl): Handler<Ast.UnionDecl> =>
    (ctx) => {
        return Ast.UnionDecl(
            parseTypeId(name)(ctx),
            map(parseList(typeParams), parseTypeId)(ctx),
            map(cases, parseUnionCase)(ctx),
            ctx.toRange(loc),
        );
    };

const parseUnionCase =
    ({ name, fields }: $ast.Case): Handler<Ast.UnionCase> =>
    (ctx) => {
        return Ast.UnionCase(
            parseTypeId(name)(ctx),
            map(parseList(fields), parseFieldDecl)(ctx),
        );
    };

const parseStructDecl =
    ({
        name,
        typeParams,
        fields,
        loc,
    }: $ast.StructDecl): Handler<Ast.StructDecl> =>
    (ctx) => {
        return Ast.StructDecl(
            parseTypeId(name)(ctx),
            map(parseList(typeParams), parseTypeId)(ctx),
            map(parseList(fields), parseFieldDecl)(ctx),
            ctx.toRange(loc),
        );
    };

const parseContractAttribute =
    ({ name, loc }: $ast.ContractAttribute): Handler<Ast.ContractAttribute> =>
    (ctx) => {
        return Ast.ContractAttribute(
            parseStringLiteral(name)(ctx).value,
            ctx.toRange(loc),
        );
    };

const parseTrait =
    ({
        name,
        traits,
        attributes,
        declarations,
        loc,
    }: $ast.Trait): Handler<Ast.Trait> =>
    (ctx) => {
        return Ast.Trait(
            parseTypeId(name)(ctx),
            traits ? map(parseList(traits), parseTypeId)(ctx) : [],
            map(attributes, parseContractAttribute)(ctx),
            parseLocalItems(declarations)(ctx),
            ctx.toRange(loc),
        );
    };

type LocalItem = Ast.FieldDecl | Ast.Receiver | Ast.Method | Ast.FieldConstant;
const parseLocalItem: (input: $ast.traitItemDecl) => Handler<LocalItem> =
    makeVisitor<$ast.traitItemDecl>()({
        FieldDecl: parseFieldDecl,
        Receiver: parseReceiver,
        Function: parseMethod(parseFunctionRaw),
        AsmFunction: parseMethod(parseAsmFunctionRaw),
        Constant: parseFieldConstant,
    });

const parseLocalItems =
    (items: readonly $ast.traitItemDecl[]): Handler<Ast.LocalItems> =>
    (ctx) => {
        const locals = map(items, parseLocalItem)(ctx);

        const fields: Ast.FieldDecl[] = [];
        const methods: Ast.Method[] = [];
        const receivers: Ast.Receiver[] = [];
        const constants: Ast.FieldConstant[] = [];

        for (const item of locals) {
            switch (item.kind) {
                case "field_decl": {
                    fields.push(item);
                    continue;
                }
                case "receiver": {
                    receivers.push(item);
                    continue;
                }
                case "method": {
                    methods.push(item);
                    continue;
                }
                case "field_const": {
                    constants.push(item);
                    continue;
                }
            }
        }
        return { fields, methods, receivers, constants };
    };

type ModuleItemAux = Exclude<$ast.moduleItem, $ast.PrimitiveTypeDecl>;

const parseModuleItemAux: (input: ModuleItemAux) => Handler<ModuleItem> =
    makeVisitor<ModuleItemAux>()({
        Function: parseExtension(parseFunctionRaw),
        AsmFunction: parseExtension(parseAsmFunctionRaw),
        NativeFunctionDecl: parseExtension(parseNativeFunctionDecl),
        Constant: parseConstantGlobal,
        StructDecl: parseStructDecl,
        MessageDecl: parseMessageDecl,
        Contract: parseContract,
        Trait: parseTrait,
        UnionDecl: parseUnion,
        AliasDecl: parseAlias,
    });

type ModuleItem = Ast.Function | Ast.Extension | Ast.Constant | Ast.TypeDecl;

const parseModuleItem =
    (node: $ast.moduleItem): Handler<ModuleItem[]> =>
    (ctx) => {
        if (node.$ === "PrimitiveTypeDecl") {
            ctx.err.deprecatedPrimitiveDecl()(ctx.toRange(node.loc));
            return [];
        }
        return [parseModuleItemAux(node)(ctx)];
    };

const parseImport =
    ({ path, loc }: $ast.Import): Handler<Ast.Import> =>
    (ctx) => {
        const stringLiteral = parseStringLiteral(path)(ctx);
        const parsedString: string = JSON.parse(`"${stringLiteral.value}"`);
        return Ast.Import(
            parseImportString(parsedString, ctx.toRange(loc), ctx.err.imports),
            ctx.toRange(loc),
        );
    };

const splitItems = (items: readonly ModuleItem[]): Ast.ModuleItems => {
    const functions: Ast.Function[] = [];
    const constants: Ast.Constant[] = [];
    const extensions: Ast.Extension[] = [];
    const types: Ast.TypeDecl[] = [];
    for (const item of items) {
        switch (item.kind) {
            case "function":
                functions.push(item);
                continue;
            case "extension":
                extensions.push(item);
                continue;
            case "constant":
                constants.push(item);
                continue;
            case "struct_decl":
            case "message_decl":
            case "union_decl":
            case "alias_decl":
            case "contract":
            case "trait":
                types.push(item);
                continue;
        }
    }
    return { functions, constants, extensions, types };
};

const parseModule =
    ({ imports, items }: $ast.Module): Handler<Ast.Module> =>
    (ctx) => {
        return Ast.Module(
            map(imports, parseImport)(ctx),
            splitItems(map(items, parseModuleItem)(ctx).flat()),
        );
    };

export const parse = <M>(
    log: SourceLogger<M, void>,
    code: string,
    path: string,
): Ast.Module => {
    const err = SyntaxErrors(log);

    const result = $.parse({
        grammar: G.Module,
        space: G.space,
        text: code,
    });

    if (result.$ === "error") {
        const { expected, position } = result.error;
        err.expected(expected)({
            start: position,
            end: position,
        });
        return Ast.Module([], {
            constants: [],
            extensions: [],
            functions: [],
            types: [],
        });
    }

    const toRange = (loc: $.Loc): Ast.Range => {
        if (loc.$ === "empty") {
            return throwInternal("Lookahead at top level");
        }
        const { start, end } = loc;
        return Ast.Range(start, end, path, code);
    };

    return parseModule(result.value)({
        err,
        toRange,
    });
};
