import fc from "fast-check";
import type * as Ast from "@/ast/ast";
import { dummySrcInfo } from "@/grammar/src-info";
import { diffJson } from "diff";
import { astBinaryOperations, astUnaryOperations } from "@/ast/ast-constants";

/**
 * An array of reserved words that cannot be used as contract or variable names in tests.
 *
 * These words are reserved for use in the language and may cause errors
 * if attempted to be used as identifiers.
 *
 * @see src/grammar/grammar.gg
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

function randomAstBoolean(): fc.Arbitrary<Ast.Boolean> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("boolean"),
            value: fc.boolean(),
        }),
    );
}

function randomAstString(): fc.Arbitrary<Ast.String> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("string"),
            value: fc.string(),
        }),
    );
}

function randomAstNumber(): fc.Arbitrary<Ast.Number> {
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
    operand: fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.OpUnary> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("op_unary"),
            op: fc.constantFrom(...astUnaryOperations),
            operand: operand,
        }),
    );
}
function randomAstOpBinary(
    leftExpression: fc.Arbitrary<Ast.Expression>,
    rightExpression: fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.OpBinary> {
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
    conditionExpression: fc.Arbitrary<Ast.Expression>,
    thenBranchExpression: fc.Arbitrary<Ast.Expression>,
    elseBranchExpression: fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.Conditional> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("conditional"),
            condition: conditionExpression,
            thenBranch: thenBranchExpression,
            elseBranch: elseBranchExpression,
        }),
    );
}

function randomAstId(): fc.Arbitrary<Ast.Id> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("id"),
            text: fc
                .stringMatching(/^[A-Za-z_][A-Za-z0-9_]*$/)
                .filter(
                    (i) =>
                        !reservedWords.includes(i) &&
                        !i.startsWith("__gen") &&
                        !i.startsWith("__tact") &&
                        i !== "_",
                ),
        }),
    );
}

function randomAstCapitalizedId(): fc.Arbitrary<Ast.Id> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("id"),
            text: fc.stringMatching(/^[A-Z][A-Za-z0-9_]*$/),
        }),
    );
}

function randomAstNull(): fc.Arbitrary<Ast.Null> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("null"),
        }),
    );
}

function randomAstInitOf(
    expression: fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.InitOf> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("init_of"),
            contract: randomAstId(),
            args: fc.array(expression),
        }),
    );
}

function randomAstCodeOf(): fc.Arbitrary<Ast.CodeOf> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("code_of"),
            contract: randomAstId(),
        }),
    );
}

function randomAstStaticCall(
    expression: fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.StaticCall> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("static_call"),
            function: randomAstId(),
            args: fc.array(expression),
        }),
    );
}

function randomAstStructFieldInitializer(
    expression: fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.StructFieldInitializer> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_field_initializer"),
            field: randomAstId(),
            initializer: expression,
        }),
    );
}

function randomAstStructInstance(
    structFieldInitializer: fc.Arbitrary<Ast.StructFieldInitializer>,
): fc.Arbitrary<Ast.StructInstance> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_instance"),
            type: randomAstCapitalizedId(),
            args: fc.array(structFieldInitializer),
        }),
    );
}

function randomAstFieldAccess(
    expression: fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.FieldAccess> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("field_access"),
            aggregate: expression,
            field: randomAstId(),
        }),
    );
}

function randomAstMethodCall(
    selfExpression: fc.Arbitrary<Ast.Expression>,
    argsExpression: fc.Arbitrary<Ast.Expression>,
): fc.Arbitrary<Ast.MethodCall> {
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
    subLiteral: fc.Arbitrary<Ast.Literal>,
): fc.Arbitrary<Ast.StructFieldValue> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_field_value"),
            field: randomAstId(),
            initializer: subLiteral,
        }),
    );
}

function randomAstStructValue(
    subLiteral: fc.Arbitrary<Ast.Literal>,
): fc.Arbitrary<Ast.StructValue> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_value"),
            type: randomAstCapitalizedId(),
            args: fc.array(randomAstStructFieldValue(subLiteral)),
        }),
    );
}

function randomAstLiteral(maxDepth: number): fc.Arbitrary<Ast.Literal> {
    return fc.memo((depth: number): fc.Arbitrary<Ast.Literal> => {
        if (depth <= 1) {
            return fc.oneof(
                randomAstNumber(),
                randomAstBoolean(),
                randomAstNull(),
                // Add Address, Cell, Slice
                // randomAstCommentValue(),
            );
        }

        const subLiteral = () => randomAstLiteral(depth - 1);

        return fc.oneof(
            randomAstNumber(),
            randomAstBoolean(),
            randomAstNull(),
            // Add Address, Cell, Slice
            // randomAstCommentValue(),
            randomAstStructValue(subLiteral()),
        );
    })(maxDepth);
}

export function randomAstExpression(
    maxDepth: number,
): fc.Arbitrary<Ast.Expression> {
    return fc.memo((depth: number): fc.Arbitrary<Ast.Expression> => {
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
                randomAstCodeOf(),
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
    left: Ast.Expression,
    right: Ast.Expression,
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
