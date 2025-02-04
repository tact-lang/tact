import * as $ from "@tonstudio/parser-runtime";
import * as A from "../../ast/ast";
import { FactoryAst } from "../../ast/ast-helpers";
import * as G from "./grammar";
import { $ast } from "./grammar";
import { TactCompilationError } from "../../error/errors";
import { SyntaxErrors, syntaxErrorSchema } from "../parser-error";
import { AstSchema, getAstSchema } from "../../ast/getAstSchema";
import { getSrcInfo } from "../src-info";
import { displayToString } from "../../error/display-to-string";
import { makeMakeVisitor } from "../../utils/tricks";
import { Language, Source } from "../../imports/source";
import { emptyPath, fromString } from "../../imports/path";

const makeVisitor = makeMakeVisitor("$");

type Context = {
    ast: AstSchema;
    err: SyntaxErrors<(loc: $.Loc) => never>;
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
    ({ name, loc }: $ast.Id | $ast.TypeId): Handler<A.AstId> =>
    (ctx) => {
        if (name.startsWith("__gen")) {
            ctx.err.reservedVarPrefix("__gen")(loc);
        }
        if (name.startsWith("__tact")) {
            ctx.err.reservedVarPrefix("__tact")(loc);
        }
        return ctx.ast.Id(name, loc);
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
    ({ accessor, id, loc }: $ast.FuncId): Handler<A.AstFuncId> =>
    (ctx) => {
        if (reservedFuncIds.has(id)) {
            ctx.err.reservedFuncId()(loc);
        }
        if (id.match(/^-?([0-9]+|0x[0-9a-fA-F]+)$/)) {
            ctx.err.numericFuncId()(loc);
        }
        if (id.startsWith('"') || id.startsWith("{-")) {
            ctx.err.invalidFuncId()(loc);
        }
        return ctx.ast.FuncId((accessor ?? "") + id, loc);
    };

const baseMap = {
    IntegerLiteralBin: 2,
    IntegerLiteralOct: 8,
    IntegerLiteralDec: 10,
    IntegerLiteralHex: 16,
} as const;

const prefixMap = {
    IntegerLiteralBin: "0b",
    IntegerLiteralOct: "0o",
    IntegerLiteralDec: "",
    IntegerLiteralHex: "0x",
} as const;

const parseIntegerLiteralValue =
    ({ $, digits, loc }: $ast.IntegerLiteral["value"]): Handler<A.AstNumber> =>
    (ctx) => {
        if (
            $ === "IntegerLiteralDec" &&
            digits.startsWith("0") &&
            digits.includes("_")
        ) {
            ctx.err.leadingZeroUnderscore()(loc);
        }
        const value = BigInt(prefixMap[$] + digits.replaceAll("_", ""));
        return ctx.ast.Number(baseMap[$], value, loc);
    };

const parseIntegerLiteral =
    ({ value }: $ast.IntegerLiteral): Handler<A.AstNumber> =>
    (ctx) => {
        return parseIntegerLiteralValue(value)(ctx);
    };

const parseStringLiteral =
    ({ value, loc }: $ast.StringLiteral): Handler<A.AstString> =>
    (ctx) => {
        return ctx.ast.String(value, loc);
    };

const parseBoolLiteral =
    ({ value, loc }: $ast.BoolLiteral): Handler<A.AstBoolean> =>
    (ctx) => {
        return ctx.ast.Boolean(value === "true", loc);
    };

const parseNull =
    ({ loc }: $ast.Null): Handler<A.AstNull> =>
    (ctx) => {
        return ctx.ast.Null(loc);
    };

const parseStructFieldInitializer =
    ({
        name,
        init,
        loc,
    }: $ast.StructFieldInitializer): Handler<A.AstStructFieldInitializer> =>
    (ctx) => {
        const fieldId = parseId(name)(ctx);

        return ctx.ast.StructFieldInitializer(
            fieldId,
            init ? parseExpression(init)(ctx) : fieldId,
            loc,
        );
    };

const parseStructInstance =
    ({
        type,
        fields,
        loc,
    }: $ast.StructInstance): Handler<A.AstStructInstance> =>
    (ctx) => {
        return ctx.ast.StructInstance(
            parseId(type)(ctx),
            map(parseList(fields), parseStructFieldInitializer)(ctx),
            loc,
        );
    };

const parseInitOf =
    ({ name, params, loc }: $ast.InitOf): Handler<A.AstInitOf> =>
    (ctx) => {
        return ctx.ast.InitOf(
            parseId(name)(ctx),
            map(parseList(params), parseExpression)(ctx),
            loc,
        );
    };

const parseConditional =
    ({ head, tail, loc }: $ast.Conditional): Handler<A.AstExpression> =>
    (ctx) => {
        const condition = parseExpression(head)(ctx);
        if (!tail) {
            return condition;
        }
        const { thenBranch, elseBranch } = tail;
        return ctx.ast.Conditional(
            condition,
            parseExpression(thenBranch)(ctx),
            parseExpression(elseBranch)(ctx),
            loc,
        );
    };

const parseBinary =
    ({
        exprs: { head, tail },
    }: $ast.Binary<
        Expression,
        A.AstBinaryOperation
    >): Handler<A.AstExpression> =>
    (ctx) => {
        return tail.reduce(
            ({ child, range }, { op, right }) => {
                const merged = $.mergeLoc(range, $.mergeLoc(op.loc, right.loc));
                return {
                    child: ctx.ast.OpBinary(
                        op.name,
                        child,
                        parseExpression(right)(ctx),
                        merged,
                    ),
                    range: merged,
                };
            },
            { child: parseExpression(head)(ctx), range: head.loc },
        ).child;
    };

const parseUnary =
    ({ prefixes, expression }: $ast.Unary): Handler<A.AstExpression> =>
    (ctx) => {
        return prefixes.reduceRight(
            ({ child, range }, { name, loc }) => {
                const merged = $.mergeLoc(loc, range);
                return {
                    child: ctx.ast.OpUnary(name, child, merged),
                    range: merged,
                };
            },
            { child: parseExpression(expression)(ctx), range: expression.loc },
        ).child;
    };

type SuffixHandler = Handler<
    (child: A.AstExpression, loc: $.Loc) => A.AstExpression
>;

const parseSuffixUnboxNotNull =
    (_: $ast.SuffixUnboxNotNull): SuffixHandler =>
    (ctx) =>
    (child, loc) => {
        return ctx.ast.OpUnary("!!", child, loc);
    };

const parseSuffixCall =
    ({ params }: $ast.SuffixCall): SuffixHandler =>
    (ctx) =>
    (child, loc) => {
        const paramsAst = map(parseList(params), parseExpression)(ctx);
        if (child.kind === "id") {
            return ctx.ast.StaticCall(child, paramsAst, loc);
        } else if (child.kind === "field_access") {
            return ctx.ast.MethodCall(
                child.aggregate,
                child.field,
                paramsAst,
                loc,
            );
        } else {
            ctx.err.notCallable()(loc);
            return ctx.ast.StaticCall(
                ctx.ast.Id("__invalid__", loc),
                paramsAst,
                loc,
            );
        }
    };

const parseSuffixFieldAccess =
    ({ name }: $ast.SuffixFieldAccess): SuffixHandler =>
    (ctx) =>
    (child, loc) => {
        return ctx.ast.FieldAccess(child, parseId(name)(ctx), loc);
    };

const suffixVisitor: (node: $ast.suffix) => SuffixHandler =
    makeVisitor<$ast.suffix>()({
        SuffixUnboxNotNull: parseSuffixUnboxNotNull,
        SuffixCall: parseSuffixCall,
        SuffixFieldAccess: parseSuffixFieldAccess,
    });

const parseSuffix =
    ({ expression, suffixes }: $ast.Suffix): Handler<A.AstExpression> =>
    (ctx) => {
        return suffixes.reduce(
            ({ child, range }, suffix) => {
                const merged = $.mergeLoc(range, suffix.loc);
                return {
                    child: suffixVisitor(suffix)(ctx)(child, merged),
                    range: merged,
                };
            },
            { child: parseExpression(expression)(ctx), range: expression.loc },
        ).child;
    };

const parseParens = ({ child }: $ast.Parens): Handler<A.AstExpression> => {
    return parseExpression(child);
};

// has to be an interface because of the way TS handles circular type references
// eslint-disable-next-line @typescript-eslint/no-empty-object-type
interface Binary extends $ast.Binary<Expression, A.AstBinaryOperation> {}

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
    | $ast.Null
    | $ast.StringLiteral
    | $ast.Id;

const parseExpression: (input: Expression) => Handler<A.AstExpression> =
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
        Null: parseNull,
        StringLiteral: parseStringLiteral,
        Id: parseId,
    });

const parseStatementLet =
    ({
        name,
        type,
        init,
        loc,
    }: $ast.StatementLet): Handler<A.AstStatementLet> =>
    (ctx) => {
        return ctx.ast.StatementLet(
            parseId(name)(ctx),
            type ? parseType(type)(ctx) : null,
            parseExpression(init)(ctx),
            loc,
        );
    };

const parsePunnedField =
    ({ name }: $ast.PunnedField): Handler<[A.AstId, A.AstId]> =>
    (ctx) => {
        return [parseId(name)(ctx), parseId(name)(ctx)];
    };

const parseRegularField =
    ({ fieldName, varName }: $ast.RegularField): Handler<[A.AstId, A.AstId]> =>
    (ctx) => {
        return [parseId(fieldName)(ctx), parseId(varName)(ctx)];
    };

const parseDestructItem: (
    node: $ast.destructItem,
) => Handler<[A.AstId, A.AstId]> = makeVisitor<$ast.destructItem>()({
    PunnedField: parsePunnedField,
    RegularField: parseRegularField,
});

const parseStatementDestruct =
    ({
        type,
        fields,
        rest,
        init,
        loc,
    }: $ast.StatementDestruct): Handler<A.AstStatementDestruct> =>
    (ctx) => {
        const ids: Map<string, [A.AstId, A.AstId]> = new Map();
        for (const param of parseList(fields)) {
            const pair = parseDestructItem(param)(ctx);
            const [field] = pair;
            const name = field.text;
            if (ids.has(name)) {
                ctx.err.duplicateField(name)(param.loc);
            }
            ids.set(name, pair);
        }

        return ctx.ast.StatementDestruct(
            parseTypeId(type)(ctx),
            ids,
            rest.$ === "RestArgument",
            parseExpression(init)(ctx),
            loc,
        );
    };

const parseStatementBlock =
    ({ body, loc }: $ast.StatementBlock): Handler<A.AstStatementBlock> =>
    (ctx) => {
        return ctx.ast.StatementBlock(parseStatements(body)(ctx), loc);
    };

const parseStatementReturn =
    ({
        expression,
        loc,
    }: $ast.StatementReturn): Handler<A.AstStatementReturn> =>
    (ctx) => {
        return ctx.ast.StatementReturn(
            expression ? parseExpression(expression)(ctx) : null,
            loc,
        );
    };

const parseStatementCondition =
    ({
        condition,
        trueBranch,
        falseBranch,
        loc,
    }: $ast.StatementCondition): Handler<A.AstStatementCondition> =>
    (ctx) => {
        if (typeof falseBranch === "undefined") {
            return ctx.ast.Condition(
                parseExpression(condition)(ctx),
                parseStatements(trueBranch)(ctx),
                null,
                null,
                loc,
            );
        } else if (falseBranch.$ === "FalseBranch") {
            return ctx.ast.Condition(
                parseExpression(condition)(ctx),
                parseStatements(trueBranch)(ctx),
                parseStatements(falseBranch.body)(ctx),
                null,
                loc,
            );
        } else {
            return ctx.ast.Condition(
                parseExpression(condition)(ctx),
                parseStatements(trueBranch)(ctx),
                null,
                parseStatementCondition(falseBranch)(ctx),
                loc,
            );
        }
    };

const parseStatementWhile =
    ({
        condition,
        body,
        loc,
    }: $ast.StatementWhile): Handler<A.AstStatementWhile> =>
    (ctx) => {
        return ctx.ast.StatementWhile(
            parseExpression(condition)(ctx),
            parseStatements(body)(ctx),
            loc,
        );
    };

const parseStatementRepeat =
    ({
        condition,
        body,
        loc,
    }: $ast.StatementRepeat): Handler<A.AstStatementRepeat> =>
    (ctx) => {
        return ctx.ast.StatementRepeat(
            parseExpression(condition)(ctx),
            parseStatements(body)(ctx),
            loc,
        );
    };

const parseStatementUntil =
    ({
        condition,
        body,
        loc,
    }: $ast.StatementUntil): Handler<A.AstStatementUntil> =>
    (ctx) => {
        return ctx.ast.StatementUntil(
            parseExpression(condition)(ctx),
            parseStatements(body)(ctx),
            loc,
        );
    };

const parseStatementTry =
    ({ body, handler, loc }: $ast.StatementTry): Handler<A.AstStatementTry> =>
    (ctx) => {
        if (handler) {
            return ctx.ast.StatementTry(parseStatements(body)(ctx), loc, {
                catchName: parseId(handler.name)(ctx),
                catchStatements: parseStatements(handler.body)(ctx),
            });
        } else {
            return ctx.ast.StatementTry(
                parseStatements(body)(ctx),
                loc,
                undefined,
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
    }: $ast.StatementForEach): Handler<A.AstStatementForEach> =>
    (ctx) => {
        return ctx.ast.StatementForEach(
            parseId(key)(ctx),
            parseId(value)(ctx),
            parseExpression(expression)(ctx),
            parseStatements(body)(ctx),
            loc,
        );
    };

const parseStatementExpression =
    ({
        expression,
        loc,
    }: $ast.StatementExpression): Handler<A.AstStatementExpression> =>
    (ctx) => {
        return ctx.ast.StatementExpression(
            parseExpression(expression)(ctx),
            loc,
        );
    };

const parseStatementAssign =
    ({
        left,
        operator,
        right,
        loc,
    }: $ast.StatementAssign): Handler<
        A.AstStatementAssign | A.AstStatementAugmentedAssign
    > =>
    (ctx) => {
        if (typeof operator === "undefined") {
            return ctx.ast.StatementAssign(
                parseExpression(left)(ctx),
                parseExpression(right)(ctx),
                loc,
            );
        } else {
            return ctx.ast.StatementAugmentedAssign(
                operator,
                parseExpression(left)(ctx),
                parseExpression(right)(ctx),
                loc,
            );
        }
    };

const parseStatement: (node: $ast.statement) => Handler<A.AstStatement> =
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
    (nodes: readonly $ast.statement[]): Handler<A.AstStatement[]> =>
    (ctx) => {
        return map(nodes, parseStatement)(ctx);
    };

const parseFunctionAttribute =
    (node: $ast.FunctionAttribute): Handler<A.AstFunctionAttribute> =>
    (ctx) => {
        if (typeof node.name === "string") {
            return ctx.ast.FunctionAttribute(node.name, node.loc);
        }

        return ctx.ast.FunctionAttributeGet(
            node.name.methodId
                ? parseExpression(node.name.methodId)(ctx)
                : null,
            node.loc,
        );
    };

const checkAttributes =
    (kind: "constant" | "function") =>
    (
        ctx: Context,
        isAbstract: boolean,
        attributes: readonly (
            | $ast.FunctionAttribute
            | $ast.ConstantAttribute
        )[],
        loc: $.Loc,
    ) => {
        const { duplicate, tooAbstract, notAbstract } = ctx.err[kind];
        const k: Set<string> = new Set();
        for (const { name, loc } of attributes) {
            const type = typeof name === "string" ? name : name.$;
            if (k.has(type)) {
                duplicate(type)(loc);
            }
            k.add(type);
        }
        if (isAbstract && !k.has("abstract")) {
            notAbstract()(loc);
        }
        if (!isAbstract && k.has("abstract")) {
            tooAbstract()(loc);
        }
    };

const parseFunctionAttributes =
    (
        nodes: readonly $ast.FunctionAttribute[],
        isAbstract: boolean,
        loc: $.Loc,
    ): Handler<A.AstFunctionAttribute[]> =>
    (ctx) => {
        checkAttributes("function")(ctx, isAbstract, nodes, loc);
        return map(nodes, parseFunctionAttribute)(ctx);
    };

const parseConstantAttribute =
    ({ name, loc }: $ast.ConstantAttribute): Handler<A.AstConstantAttribute> =>
    (ctx) => {
        return ctx.ast.ConstantAttribute(name, loc);
    };

const parseConstantAttributes =
    (
        nodes: readonly $ast.ConstantAttribute[],
        isAbstract: boolean,
        loc: $.Loc,
    ): Handler<A.AstConstantAttribute[]> =>
    (ctx) => {
        checkAttributes("constant")(ctx, isAbstract, nodes, loc);
        return map(nodes, parseConstantAttribute)(ctx);
    };

const parseParameter =
    ({ name, type, loc }: $ast.Parameter): Handler<A.AstTypedParameter> =>
    (ctx) => {
        return ctx.ast.TypedParameter(
            parseId(name)(ctx),
            parseType(type)(ctx),
            loc,
        );
    };

const parseTypeId =
    ({ name, loc }: $ast.TypeId): Handler<A.AstTypeId> =>
    (ctx) => {
        return ctx.ast.TypeId(name, loc);
    };

const parseTypeOptional =
    ({ child, loc }: $ast.TypeOptional): Handler<A.AstType> =>
    (ctx) => {
        return ctx.ast.OptionalType(parseTypeId(child)(ctx), loc);
    };

const parseTypeRegular =
    ({ child }: $ast.TypeRegular): Handler<A.AstType> =>
    (ctx) => {
        return parseTypeId(child)(ctx);
    };

const parseTypeMap =
    ({ key, keyAs, value, valueAs, loc }: $ast.TypeMap): Handler<A.AstType> =>
    (ctx) => {
        return ctx.ast.MapType(
            parseTypeId(key)(ctx),
            keyAs ? parseId(keyAs)(ctx) : null,
            parseTypeId(value)(ctx),
            valueAs ? parseId(valueAs)(ctx) : null,
            loc,
        );
    };

const parseTypeBounced =
    ({ child, loc }: $ast.TypeBounced): Handler<A.AstType> =>
    (ctx) => {
        return ctx.ast.BouncedMessageType(parseTypeId(child)(ctx), loc);
    };

const parseType: (input: $ast.$type) => Handler<A.AstType> =
    makeVisitor<$ast.$type>()({
        TypeBounced: parseTypeBounced,
        TypeMap: parseTypeMap,
        TypeOptional: parseTypeOptional,
        TypeRegular: parseTypeRegular,
    });

const parseFieldDecl =
    ({
        name,
        as,
        type,
        expression,
        loc,
    }: $ast.FieldDecl): Handler<A.AstFieldDecl> =>
    (ctx) => {
        return ctx.ast.FieldDecl(
            parseId(name)(ctx),
            parseType(type)(ctx),
            expression ? parseExpression(expression)(ctx) : null,
            as ? parseId(as)(ctx) : null,
            loc,
        );
    };

const parseReceiverParam =
    (param: $ast.receiverParam): Handler<A.AstReceiverSubKind> =>
    (ctx) => {
        return !param
            ? ctx.ast.ReceiverFallback()
            : param.$ === "Parameter"
              ? ctx.ast.ReceiverSimple(parseParameter(param)(ctx))
              : ctx.ast.ReceiverComment(parseStringLiteral(param)(ctx));
    };

const parseReceiverReceive =
    ({ type, param, body, loc }: $ast.Receiver): Handler<A.AstReceiver> =>
    (ctx) => {
        return ctx.ast.Receiver(
            ctx.ast.ReceiverInternal(parseReceiverParam(param)(ctx), type.loc),
            map(body, parseStatement)(ctx),
            loc,
        );
    };

const parseReceiverExternal =
    ({ type, param, body, loc }: $ast.Receiver): Handler<A.AstReceiver> =>
    (ctx) => {
        return ctx.ast.Receiver(
            ctx.ast.ReceiverExternal(parseReceiverParam(param)(ctx), type.loc),
            map(body, parseStatement)(ctx),
            loc,
        );
    };

const repairParam: $ast.receiverParam = {
    $: "Parameter",
    name: {
        $: "Id",
        name: "__invalid__",
        loc: { $: "range", start: 0, end: 0 },
    },
    type: {
        $: "TypeRegular",
        child: {
            $: "TypeId",
            name: "__Invalid__",
            loc: { $: "range", start: 0, end: 0 },
        },
        loc: { $: "range", start: 0, end: 0 },
    },
    loc: { $: "range", start: 0, end: 0 },
};

const parseReceiverBounced =
    ({ type, param, body, loc }: $ast.Receiver): Handler<A.AstReceiver> =>
    (ctx) => {
        if (typeof param === "undefined") {
            ctx.err.noBouncedWithoutArg()(loc);
            param = repairParam;
        }

        if (param.$ === "StringLiteral") {
            ctx.err.noBouncedWithString()(loc);
            param = repairParam;
        }

        return ctx.ast.Receiver(
            ctx.ast.ReceiverBounce(parseParameter(param)(ctx), type.loc),
            map(body, parseStatement)(ctx),
            loc,
        );
    };

const parserByReceiverType: Record<
    $ast.ReceiverType["name"],
    (node: $ast.Receiver) => Handler<A.AstReceiver>
> = {
    bounced: parseReceiverBounced,
    receive: parseReceiverReceive,
    external: parseReceiverExternal,
};

const parseReceiver = (node: $ast.Receiver): Handler<A.AstReceiver> => {
    return parserByReceiverType[node.type.name](node);
};

const defaultShuffle = {
    args: [],
    ret: [],
};

const parseAsmShuffle =
    (node: $ast.shuffle | undefined): Handler<A.AstAsmShuffle> =>
    (ctx) => {
        if (!node) {
            return defaultShuffle;
        }

        return {
            args: map(node.ids, parseId)(ctx),
            ret: node.to ? map(node.to, parseIntegerLiteralValue)(ctx) : [],
        };
    };

const parseAsmFunction =
    (node: $ast.AsmFunction): Handler<A.AstAsmFunctionDef> =>
    (ctx) => {
        return ctx.ast.AsmFunctionDef(
            parseAsmShuffle(node.shuffle)(ctx),
            parseFunctionAttributes(node.attributes, false, node.loc)(ctx),
            parseId(node.name)(ctx),
            node.returnType ? parseType(node.returnType)(ctx) : null,
            map(parseList(node.parameters), parseParameter)(ctx),
            [node.instructions.trim()],
            node.loc,
        );
    };

const parseContractInit =
    ({
        parameters,
        body,
        loc,
    }: $ast.ContractInit): Handler<A.AstContractInit> =>
    (ctx) => {
        return ctx.ast.ContractInit(
            map(parseList(parameters), parseParameter)(ctx),
            map(body, parseStatement)(ctx),
            loc,
        );
    };

const parseConstantDefInModule =
    (node: $ast.Constant): Handler<A.AstConstantDef> =>
    (ctx) => {
        const result = parseConstantDef(node)(ctx);
        const firstAttribute = result.attributes[0];
        if (typeof firstAttribute !== "undefined") {
            // FIXME: should be `firstAttribute.loc`
            // https://github.com/tact-lang/tact/issues/1255
            ctx.err.topLevelConstantWithAttribute()(node.loc);
            result.attributes = [];
        }
        return result;
    };

const parseConstantDef =
    (node: $ast.Constant): Handler<A.AstConstantDef> =>
    (ctx) => {
        const result = parseConstant(node)(ctx);

        if (result.kind !== "constant_def") {
            ctx.err.noConstantDecl()(node.loc);
            return {
                ...parseConstant(node)(ctx),
                kind: "constant_def",
                initializer: ctx.ast.Number(10, 0n, node.loc),
            };
        }

        return result;
    };

const parseConstant =
    (node: $ast.Constant): Handler<A.AstConstantDecl | A.AstConstantDef> =>
    (ctx) => {
        const name = parseId(node.name)(ctx);
        const type = parseType(node.type)(ctx);

        if (node.body.$ === "ConstantDeclaration") {
            const attributes = parseConstantAttributes(
                node.attributes,
                true,
                node.loc,
            )(ctx);
            return ctx.ast.ConstantDecl(attributes, name, type, node.loc);
        } else {
            const attributes = parseConstantAttributes(
                node.attributes,
                false,
                node.loc,
            )(ctx);
            const initializer = parseExpression(node.body.expression)(ctx);
            return ctx.ast.ConstantDef(
                attributes,
                name,
                type,
                initializer,
                node.loc,
            );
        }
    };

const parseContract =
    ({
        name,
        attributes,
        traits,
        declarations,
        loc,
    }: $ast.Contract): Handler<A.AstContract> =>
    (ctx) => {
        return ctx.ast.Contract(
            parseId(name)(ctx),
            map(parseList(traits), parseId)(ctx),
            map(attributes, parseContractAttribute)(ctx),
            map(declarations, parseContractItem)(ctx),
            loc,
        );
    };

const parseFunctionDef =
    (node: $ast.$Function): Handler<A.AstFunctionDef> =>
    (ctx) => {
        const result = parseFunction(node)(ctx);

        if (result.kind !== "function_def") {
            ctx.err.noFunctionDecl()(node.loc);
            return {
                ...parseFunction(node)(ctx),
                kind: "function_def",
                statements: [],
            };
        }

        return result;
    };

const parseFunction =
    (node: $ast.$Function): Handler<A.AstFunctionDef | A.AstFunctionDecl> =>
    (ctx) => {
        const name = parseId(node.name)(ctx);
        const returnType = node.returnType
            ? parseType(node.returnType)(ctx)
            : null;
        const parameters = map(parseList(node.parameters), parseParameter)(ctx);

        if (node.body.$ === "FunctionDeclaration") {
            const attributes = parseFunctionAttributes(
                node.attributes,
                true,
                node.loc,
            )(ctx);
            return ctx.ast.FunctionDecl(
                attributes,
                name,
                returnType,
                parameters,
                node.loc,
            );
        } else {
            const attributes = parseFunctionAttributes(
                node.attributes,
                false,
                node.loc,
            )(ctx);
            const statements = map(node.body.body, parseStatement)(ctx);
            return ctx.ast.FunctionDef(
                attributes,
                name,
                returnType,
                parameters,
                statements,
                node.loc,
            );
        }
    };

const parseMessageDecl =
    ({
        name,
        opcode,
        fields,
        loc,
    }: $ast.MessageDecl): Handler<A.AstMessageDecl> =>
    (ctx) => {
        return ctx.ast.MessageDecl(
            parseId(name)(ctx),
            opcode ? parseExpression(opcode)(ctx) : null,
            map(parseList(fields), parseFieldDecl)(ctx),
            loc,
        );
    };

const parseNativeFunctionDecl =
    ({
        name,
        attributes,
        nativeName,
        parameters,
        returnType,
        loc,
    }: $ast.NativeFunctionDecl): Handler<A.AstNativeFunctionDecl> =>
    (ctx) => {
        return ctx.ast.NativeFunctionDecl(
            map(attributes, parseFunctionAttribute)(ctx),
            parseId(name)(ctx),
            parseFuncId(nativeName)(ctx),
            map(parseList(parameters), parseParameter)(ctx),
            returnType ? parseType(returnType)(ctx) : null,
            loc,
        );
    };

const parsePrimitiveTypeDecl =
    ({ name, loc }: $ast.PrimitiveTypeDecl): Handler<A.AstPrimitiveTypeDecl> =>
    (ctx) => {
        return ctx.ast.PrimitiveTypeDecl(parseId(name)(ctx), loc);
    };

const parseStructDecl =
    ({ name, fields, loc }: $ast.StructDecl): Handler<A.AstStructDecl> =>
    (ctx) => {
        return ctx.ast.StructDecl(
            parseId(name)(ctx),
            map(parseList(fields), parseFieldDecl)(ctx),
            loc,
        );
    };

const parseContractAttribute =
    ({ name, loc }: $ast.ContractAttribute): Handler<A.AstContractAttribute> =>
    (ctx) => {
        return ctx.ast.ContractAttribute(parseStringLiteral(name)(ctx), loc);
    };

const parseTrait =
    ({
        name,
        traits,
        attributes,
        declarations,
        loc,
    }: $ast.Trait): Handler<A.AstTrait> =>
    (ctx) => {
        return ctx.ast.Trait(
            parseId(name)(ctx),
            traits ? map(parseList(traits), parseId)(ctx) : [],
            map(attributes, parseContractAttribute)(ctx),
            map(declarations, parseTraitItem)(ctx),
            loc,
        );
    };

const parseContractItem: (
    input: $ast.contractItemDecl,
) => Handler<A.AstContractDeclaration> = makeVisitor<$ast.contractItemDecl>()({
    ContractInit: parseContractInit,
    FieldDecl: parseFieldDecl,
    Receiver: parseReceiver,
    Function: parseFunctionDef,
    Constant: parseConstantDef,
});

const parseTraitItem: (
    input: $ast.traitItemDecl,
) => Handler<A.AstTraitDeclaration> = makeVisitor<$ast.traitItemDecl>()({
    FieldDecl: parseFieldDecl,
    Receiver: parseReceiver,
    Function: parseFunction,
    Constant: parseConstant,
});

const parseModuleItem: (input: $ast.moduleItem) => Handler<A.AstModuleItem> =
    makeVisitor<$ast.moduleItem>()({
        PrimitiveTypeDecl: parsePrimitiveTypeDecl,
        Function: parseFunctionDef,
        AsmFunction: parseAsmFunction,
        NativeFunctionDecl: parseNativeFunctionDecl,
        Constant: parseConstantDefInModule,
        StructDecl: parseStructDecl,
        MessageDecl: parseMessageDecl,
        Contract: parseContract,
        Trait: parseTrait,
    });

const detectLanguage = (path: string): Language | undefined => {
    if (path.endsWith(".fc") || path.endsWith(".func")) {
        return "func";
    }

    if (path.endsWith(".tact")) {
        return "tact";
    }

    return undefined;
};

const guessExtension = (
    importText: string,
): { language: Language; guessedPath: string } => {
    const language = detectLanguage(importText);
    if (language) {
        return { guessedPath: importText, language };
    } else {
        return { guessedPath: `${importText}.tact`, language: "tact" };
    }
};

const stdlibPrefix = "@stdlib/";

const parseImportString =
    (importText: string, loc: $.Loc): Handler<A.ImportPath> =>
    (ctx) => {
        if (importText.endsWith("/")) {
            ctx.err.noFolderImports()(loc);
            importText = importText.slice(0, -1);
        }

        if (importText.includes("\\")) {
            ctx.err.importWithBackslash()(loc);
            importText = importText.replace(/\\/g, "/");
        }

        const { guessedPath, language } = guessExtension(importText);

        if (guessedPath.startsWith(stdlibPrefix)) {
            return {
                path: fromString(guessedPath.substring(stdlibPrefix.length)),
                type: "stdlib",
                language,
            };
        } else if (
            guessedPath.startsWith("./") ||
            guessedPath.startsWith("../")
        ) {
            return {
                path: fromString(guessedPath),
                type: "relative",
                language,
            };
        } else {
            ctx.err.invalidImport()(loc);
            return {
                path: emptyPath,
                type: "relative",
                language: "tact",
            };
        }
    };

const parseImport =
    ({ path, loc }: $ast.Import): Handler<A.AstImport> =>
    (ctx) => {
        const stringLiteral = parseStringLiteral(path)(ctx);
        const parsedString: string = JSON.parse(`"${stringLiteral.value}"`);
        return ctx.ast.Import(parseImportString(parsedString, loc)(ctx), loc);
    };

const parseModule =
    ({ imports, items }: $ast.Module): Handler<A.AstModule> =>
    (ctx) => {
        return ctx.ast.Module(
            map(imports, parseImport)(ctx),
            map(items, parseModuleItem)(ctx),
        );
    };

const parseJustImports =
    ({ imports }: $ast.JustImports): Handler<A.AstImport[]> =>
    (ctx) => {
        return map(imports, parseImport)(ctx);
    };

export const getParser = (ast: FactoryAst) => {
    const display = displayToString;

    const doParse = <T, U>(
        grammar: $.Parser<T>,
        handler: (t: T) => Handler<U>,
        { code, path, origin }: Source,
    ) => {
        const locationToSrcInfo = (loc: $.Loc) => {
            if (loc.$ === "range") {
                return getSrcInfo(code, loc.start, loc.end, path, origin);
            } else {
                console.error("Invalid range");
                return getSrcInfo(code, loc.at, loc.at, path, origin);
            }
        };

        const err = syntaxErrorSchema(
            display,
            (message: string) => (source: $.Loc) => {
                const srcInfo = locationToSrcInfo(source);
                throw new TactCompilationError(
                    display.at(srcInfo, message),
                    srcInfo,
                );
            },
        );

        const result = $.parse({
            grammar,
            space: G.space,
            text: code,
        });
        if (result.$ === "error") {
            const { expected, position } = result.error;
            return err.expected(expected)({
                $: "range",
                start: position,
                end: position,
            });
        }
        const ctx = {
            ast: getAstSchema(ast, locationToSrcInfo),
            err,
        };
        return handler(result.value)(ctx);
    };

    return {
        parse: (source: Source): A.AstModule => {
            return doParse(G.Module, parseModule, source);
        },
        parseExpression: (code: string): A.AstExpression => {
            return doParse(G.expression, parseExpression, {
                code,
                path: "<repl>",
                origin: "user",
            });
        },
        parseImports: (source: Source): A.AstImport[] => {
            return doParse(G.JustImports, parseJustImports, source);
        },
        parseStatement: (code: string): A.AstStatement => {
            return doParse(G.statement, parseStatement, {
                code,
                path: "<repl>",
                origin: "user",
            });
        },
    };
};
