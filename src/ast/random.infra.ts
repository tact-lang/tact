import fc from "fast-check";
import * as A from "./ast";
import { dummySrcInfo } from "../grammar/src-info";
import { diffJson } from "diff";

/**
 * An array of reserved words that cannot be used as contract or variable names in tests.
 *
 * These words are reserved for use in the language and may cause errors
 * if attempted to be used as identifiers.
 *
 * @see src/grammar/next/grammar.gg
 */
const reservedWords = [
    "extend",
    "public",
    "fun",
    "let",
    "return",
    "receive",
    "native",
    "primitive",
    "null",
    "if",
    "else",
    "while",
    "repeat",
    "do",
    "until",
    "try",
    "catch",
    "foreach",
    "as",
    "map",
    "mutates",
    "extends",
    "external",
    "import",
    "with",
    "trait",
    "initOf",
    "override",
    "abstract",
    "virtual",
    "inline",
    "const",
    "__gen",
    "__tact",
];

function dummyAstNode<T>(
    generator: fc.Arbitrary<T>,
): fc.Arbitrary<T & { id: number; loc: typeof dummySrcInfo }> {
    return generator.map((i) => ({
        ...i,
        id: 0,
        loc: dummySrcInfo,
    }));
}

function randomAstBoolean(): fc.Arbitrary<A.AstBoolean> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("boolean"),
            value: fc.boolean(),
        }),
    );
}

function randomAstString(): fc.Arbitrary<A.AstString> {
    const escapeString = (s: string): string =>
        s.replace(/\\/g, "\\\\").replace(/"/g, '\\"');

    return dummyAstNode(
        fc.record({
            kind: fc.constant("string"),
            value: fc.string().map((s) => escapeString(s)),
        }),
    );
}

function randomAstNumber(): fc.Arbitrary<A.AstNumber> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("number"),
            base: fc.constantFrom(2, 8, 10, 16),
            value: fc.oneof(
                {
                    arbitrary: fc.bigInt({ min: 0n, max: 2n ** 255n }),
                    weight: 1,
                },
                { arbitrary: fc.bigInt({ min: 0n, max: 256n }), weight: 10000 },
            ),
        }),
    );
}

function randomAstId(): fc.Arbitrary<A.AstId> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("id"),
            text: fc
                .stringMatching(/^[A-Za-z_][A-Za-z0-9_]*$/)
                .filter(
                    (i) =>
                        !reservedWords.includes(i) &&
                        !i.startsWith("__gen") &&
                        !i.startsWith("__tact"),
                ),
        }),
    );
}

function randomAstCapitalizedId(): fc.Arbitrary<A.AstId> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("id"),
            text: fc.stringMatching(/^[A-Z][A-Za-z0-9_]*$/),
        }),
    );
}

function randomAstNull(): fc.Arbitrary<A.AstNull> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("null"),
        }),
    );
}

export function randomAstExpression(
    depthSize: fc.DepthSize,
): fc.Arbitrary<A.AstExpression> {
    return fc.letrec((tie) => ({
        literal: fc.oneof(
            { arbitrary: randomAstNumber(), weight: 100 },
            { arbitrary: randomAstBoolean(), weight: 20 },
            { arbitrary: randomAstNull(), weight: 1 },
        ),
        methodCall: dummyAstNode(
            fc.record({
                kind: fc.constant("method_call"),
                self: tie("expression"),
                method: randomAstId(),
                args: fc.uniqueArray(tie("expression"), {
                    depthIdentifier: "expression",
                }),
            }),
        ),
        fieldAccess: dummyAstNode(
            fc.record({
                kind: fc.constant("field_access"),
                aggregate: tie("expression"),
                field: randomAstId(),
            }),
        ),
        staticCall: dummyAstNode(
            fc.record({
                kind: fc.constant("static_call"),
                function: randomAstId(),
                args: fc.uniqueArray(tie("expression"), {
                    depthIdentifier: "expression",
                }),
            }),
        ),
        structInstance: dummyAstNode(
            fc.record({
                kind: fc.constant("struct_instance"),
                type: randomAstCapitalizedId(),
                args: fc.array(
                    dummyAstNode(
                        fc.record({
                            kind: fc.constant("struct_field_initializer"),
                            field: randomAstId(),
                            initializer: tie("expression"),
                        }),
                    ),
                    { depthIdentifier: "expression" },
                ),
            }),
        ),
        initOf: dummyAstNode(
            fc.record({
                kind: fc.constant("init_of"),
                contract: randomAstId(),
                args: fc.uniqueArray(tie("expression"), {
                    depthIdentifier: "expression",
                }),
            }),
        ),
        string: randomAstString(),
        opUnary: dummyAstNode(
            fc.record({
                kind: fc.constant("op_unary"),
                op: fc.constantFrom("+", "-", "!", "!!", "~"),
                operand: tie("expression"),
            }),
        ),
        opBinary: dummyAstNode(
            fc.record({
                kind: fc.constant("op_binary"),
                op: fc.constantFrom(
                    "+",
                    "-",
                    "*",
                    "/",
                    "!=",
                    ">",
                    "<",
                    ">=",
                    "<=",
                    "==",
                    "&&",
                    "||",
                    "%",
                    "<<",
                    ">>",
                    "&",
                    "|",
                    "^",
                ),
                left: tie("expression"),
                right: tie("expression"),
            }),
        ),
        conditional: dummyAstNode(
            fc.record({
                kind: fc.constant("conditional"),
                condition: tie("expression"),
                thenBranch: tie("expression"),
                elseBranch: tie("expression"),
            }),
        ),
        expression: fc.oneof(
            { depthSize },
            {
                arbitrary: tie("literal") as fc.Arbitrary<A.AstLiteral>,
                weight: 2,
            },
            {
                arbitrary: tie("methodCall") as fc.Arbitrary<A.AstMethodCall>,
                depthIdentifier: "expression",
                weight: 2,
            },
            {
                arbitrary: tie("opUnary") as fc.Arbitrary<A.AstOpUnary>,
                depthIdentifier: "expression",
                weight: 5,
            },
            {
                arbitrary: tie("opBinary") as fc.Arbitrary<A.AstOpBinary>,
                depthIdentifier: "expression",
                weight: 5,
            },
            {
                arbitrary: tie("conditional") as fc.Arbitrary<A.AstConditional>,
                depthIdentifier: "expression",
                weight: 10,
            },
            {
                arbitrary: tie("string") as fc.Arbitrary<A.AstString>,
                weight: 1,
            },
            {
                arbitrary: tie("initOf") as fc.Arbitrary<A.AstInitOf>,
                depthIdentifier: "expression",
                weight: 1,
            },
            {
                arbitrary: tie(
                    "structInstance",
                ) as fc.Arbitrary<A.AstStructInstance>,
                depthIdentifier: "expression",
                weight: 1,
            },
            {
                arbitrary: tie("staticCall") as fc.Arbitrary<A.AstStaticCall>,
                depthIdentifier: "expression",
                weight: 2,
            },
            {
                arbitrary: tie("fieldAccess") as fc.Arbitrary<A.AstFieldAccess>,
                depthIdentifier: "expression",
                weight: 2,
            },
        ),
    })).expression;
}

function isRecord(value: unknown): value is Record<string, unknown> {
    return (
        typeof value === "object" &&
        value !== null &&
        !Array.isArray(value) &&
        Object.keys(value).every((key) => typeof key === "string")
    );
}

function sortObjectKeys<T extends Record<string, unknown>>(obj: T): T {
    const sortedEntries = Object.entries(obj)
        .sort(([key1], [key2]) => key1.localeCompare(key2))
        .map(([key, value]) => ({
            [key]: isRecord(value) ? sortObjectKeys(value) : value,
        }));

    return Object.assign({}, ...sortedEntries);
}

export function diffAstObjects(
    left: A.AstExpression,
    right: A.AstExpression,
    prettyBefore: string,
    prettyAfter: string,
): void {
    const ConsoleColors = {
        added: "\x1b[32m",
        removed: "\x1b[31m",
        reset: "\x1b[0m",
    };

    const replacer = (key: string, value: unknown): unknown => {
        if (key === "id") return undefined;
        if (typeof value === "bigint") return value.toString();
        return value;
    };

    const leftStr = JSON.stringify(sortObjectKeys(left), replacer, 4);
    const rightStr = JSON.stringify(sortObjectKeys(right), replacer, 4);

    const differences = diffJson(leftStr, rightStr);

    differences.forEach((part) => {
        const color = part.added
            ? ConsoleColors.added
            : part.removed
              ? ConsoleColors.removed
              : ConsoleColors.reset;

        process.stdout.write(color + part.value + ConsoleColors.reset);
    });

    process.stdout.write(`\n\nGenerated to\n\n${prettyBefore}`);
    process.stdout.write(`\n\nParsed to\n\n${prettyAfter}\n\n`);
}
