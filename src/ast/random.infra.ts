import fc from "fast-check";
import * as A from "./ast";
import { dummySrcInfo } from "../grammar/src-info";

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
            op: fc.constantFrom("+", "-", "!", "!!", "~"),
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
            text: fc.stringMatching(/^[A-Za-z_][A-Za-z0-9_]*$/),
            // Rules for text value are in src/grammar/grammar.ohm
        }),
    );
}

function randomAstCapitalizedId(): fc.Arbitrary<A.AstId> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("id"),
            text: fc.stringMatching(/^[A-Z]+$/),
            // Rules for text value are in src/grammar/grammar.ohm
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
            args: fc.array(expression, { maxLength: 1 }),
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

export function randomAstExpression(
    maxDepth: number,
): fc.Arbitrary<A.AstExpression> {
    // No weighted items
    const baseExpressions = [
        randomAstNumber(),
        randomAstBoolean(),
        randomAstId(),
        randomAstNull(),
        randomAstString(),
    ];

    // More weighted items
    return fc.memo((depth: number): fc.Arbitrary<A.AstExpression> => {
        if (depth == 1) {
            return fc.oneof(...baseExpressions);
        }

        const subExpr = () => randomAstExpression(depth - 1);

        return fc.oneof(
            ...baseExpressions,
            randomAstMethodCall(subExpr(), subExpr()),
            randomAstFieldAccess(subExpr()),
            randomAstStaticCall(subExpr()),
            randomAstStructInstance(randomAstStructFieldInitializer(subExpr())),
            randomAstInitOf(subExpr()),
            randomAstOpUnary(subExpr()),
            randomAstOpBinary(subExpr(), subExpr()),
            randomAstConditional(subExpr(), subExpr(), subExpr()),
        );
    })(maxDepth);
}
