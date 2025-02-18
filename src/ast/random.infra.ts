import fc from "fast-check";
import type * as A from "./ast";
import { dummySrcInfo } from "../grammar/src-info";
import { diffJson } from "diff";
import { astBinaryOperations, astUnaryOperations } from "./ast-constants";

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
    const values = [
        ...Array.from({ length: 10 }, (_, i) => [0n, BigInt(i)]).flat(),
        ...Array.from({ length: 256 }, (_, i) => 1n ** BigInt(i)),
    ];

    return dummyAstNode(
        fc.record({
            kind: fc.constant("number"),
            base: fc.constantFrom(2, 8, 10, 16),
            value: fc.oneof(...values.map((value) => fc.constant(value))),
        }),
    );
}

function randomAstOpUnary(
    operand: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstOpUnary> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("op_unary"),
            op: fc.constantFrom(...astUnaryOperations),
            operand: operand,
        }),
    );
}
function randomAstOpBinary(
    leftExpression: fc.Arbitrary<A.AstExpression>,
    rightExpression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstOpBinary> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("op_binary"),
            op: fc.constantFrom(...astBinaryOperations),
            left: leftExpression,
            right: rightExpression,
        }),
    );
}

function randomAstConditional(
    conditionExpression: fc.Arbitrary<A.AstExpression>,
    thenBranchExpression: fc.Arbitrary<A.AstExpression>,
    elseBranchExpression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstConditional> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("conditional"),
            condition: conditionExpression,
            thenBranch: thenBranchExpression,
            elseBranch: elseBranchExpression,
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

function randomAstInitOf(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstInitOf> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("init_of"),
            contract: randomAstId(),
            args: fc.array(expression),
        }),
    );
}

function randomAstStaticCall(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStaticCall> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("static_call"),
            function: randomAstId(),
            args: fc.array(expression),
        }),
    );
}

function randomAstStructFieldInitializer(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstStructFieldInitializer> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_field_initializer"),
            field: randomAstId(),
            initializer: expression,
        }),
    );
}

function randomAstStructInstance(
    structFieldInitializer: fc.Arbitrary<A.AstStructFieldInitializer>,
): fc.Arbitrary<A.AstStructInstance> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_instance"),
            type: randomAstCapitalizedId(),
            args: fc.array(structFieldInitializer),
        }),
    );
}

function randomAstFieldAccess(
    expression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstFieldAccess> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("field_access"),
            aggregate: expression,
            field: randomAstId(),
        }),
    );
}

function randomAstMethodCall(
    selfExpression: fc.Arbitrary<A.AstExpression>,
    argsExpression: fc.Arbitrary<A.AstExpression>,
): fc.Arbitrary<A.AstMethodCall> {
    return dummyAstNode(
        fc.record({
            self: selfExpression,
            kind: fc.constant("method_call"),
            method: randomAstId(),
            args: fc.array(argsExpression),
        }),
    );
}

function randomAstStructFieldValue(
    subLiteral: fc.Arbitrary<A.AstLiteral>,
): fc.Arbitrary<A.AstStructFieldValue> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_field_value"),
            field: randomAstId(),
            initializer: subLiteral,
        }),
    );
}

function randomAstStructValue(
    subLiteral: fc.Arbitrary<A.AstLiteral>,
): fc.Arbitrary<A.AstStructValue> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_value"),
            type: randomAstCapitalizedId(),
            args: fc.array(randomAstStructFieldValue(subLiteral)),
        }),
    );
}

function randomAstLiteral(maxDepth: number): fc.Arbitrary<A.AstLiteral> {
    return fc.memo((depth: number): fc.Arbitrary<A.AstLiteral> => {
        if (depth <= 1) {
            return fc.oneof(
                randomAstNumber(),
                randomAstBoolean(),
                randomAstNull(),
                // Add Address, Cell, Slice
                // randomAstCommentValue(),
                // randomAstSimplifiedString(),
            );
        }

        const subLiteral = () => randomAstLiteral(depth - 1);

        return fc.oneof(
            randomAstNumber(),
            randomAstBoolean(),
            randomAstNull(),
            // Add Address, Cell, Slice
            // randomAstSimplifiedString(),
            // randomAstCommentValue(),
            randomAstStructValue(subLiteral()),
        );
    })(maxDepth);
}

export function randomAstExpression(
    maxDepth: number,
): fc.Arbitrary<A.AstExpression> {
    return fc.memo((depth: number): fc.Arbitrary<A.AstExpression> => {
        if (depth <= 1) {
            return fc.oneof(randomAstLiteral(depth - 1));
        }

        const subExpr = () => randomAstExpression(depth - 1);

        return fc
            .oneof(
                randomAstLiteral(maxDepth),
                randomAstMethodCall(subExpr(), subExpr()),
                randomAstFieldAccess(subExpr()),
                randomAstStaticCall(subExpr()),
                randomAstStructInstance(
                    randomAstStructFieldInitializer(subExpr()),
                ),
                randomAstInitOf(subExpr()),
                randomAstString(),
                randomAstOpUnary(subExpr()),
                randomAstOpBinary(subExpr(), subExpr()),
                randomAstConditional(subExpr(), subExpr(), subExpr()),
            )
            .filter((i) => i.kind !== "struct_value");
    })(maxDepth);
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
