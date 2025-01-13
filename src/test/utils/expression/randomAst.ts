import fc from "fast-check";
import {
    AstBoolean,
    AstConditional,
    AstExpression,
    AstFieldAccess,
    AstId,
    AstInitOf,
    AstMethodCall,
    AstNull,
    AstNumber,
    AstOpBinary,
    AstOpUnary,
    AstStaticCall,
    AstString,
    AstStructFieldInitializer,
    AstStructInstance,
} from "../../../grammar/ast";
import { dummySrcInfo } from "../../../grammar/src-info";

function dummyAstNode<T>(
    generator: fc.Arbitrary<T>,
): fc.Arbitrary<T & { id: number; loc: typeof dummySrcInfo }> {
    return generator.map((i) => ({
        ...i,
        id: 0,
        loc: dummySrcInfo,
    }));
}

export function randomAstBoolean(): fc.Arbitrary<AstBoolean> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("boolean"),
            value: fc.boolean(),
        }),
    );
}

export function randomAstString(): fc.Arbitrary<AstString> {
    const escapeString = (s: string): string =>
        s.replace(/\\/g, "\\\\").replace(/"/g, '\\"');

    return dummyAstNode(
        fc.record({
            kind: fc.constant("string"),
            value: fc.string().map((s) => escapeString(s)),
        }),
    );
}

export function randomAstNumber(): fc.Arbitrary<AstNumber> {
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

export function randomAstOpUnary(
    operand: fc.Arbitrary<AstExpression>,
): fc.Arbitrary<AstOpUnary> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("op_unary"),
            op: fc.constantFrom("+", "-", "!", "!!", "~"),
            operand: operand,
        }),
    );
}
export function randomAstOpBinary(
    leftExpression: fc.Arbitrary<AstExpression>,
    rightExpression: fc.Arbitrary<AstExpression>,
): fc.Arbitrary<AstOpBinary> {
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

export function randomAstConditional(
    conditionExpression: fc.Arbitrary<AstExpression>,
    thenBranchExpression: fc.Arbitrary<AstExpression>,
    elseBranchExpression: fc.Arbitrary<AstExpression>,
): fc.Arbitrary<AstConditional> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("conditional"),
            condition: conditionExpression,
            thenBranch: thenBranchExpression,
            elseBranch: elseBranchExpression,
        }),
    );
}

export function randomAstId(): fc.Arbitrary<AstId> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("id"),
            text: fc.stringMatching(/^[A-Za-z_][A-Za-z0-9_]*$/),
            // Rules for text value are in src/grammar/grammar.ohm
        }),
    );
}

export function randomAstNull(): fc.Arbitrary<AstNull> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("null"),
        }),
    );
}

export function randomAstInitOf(
    expression: fc.Arbitrary<AstExpression>,
): fc.Arbitrary<AstInitOf> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("init_of"),
            contract: randomAstId(),
            args: fc.array(expression),
        }),
    );
}

export function randomAstStaticCall(
    expression: fc.Arbitrary<AstExpression>,
): fc.Arbitrary<AstStaticCall> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("static_call"),
            function: randomAstId(),
            args: fc.array(expression),
        }),
    );
}

export function randomAstStructFieldInitializer(
    expression: fc.Arbitrary<AstExpression>,
): fc.Arbitrary<AstStructFieldInitializer> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_field_initializer"),
            field: randomAstId(),
            initializer: expression,
        }),
    );
}

export function randomAstStructInstance(
    structFieldInitializer: fc.Arbitrary<AstStructFieldInitializer>,
): fc.Arbitrary<AstStructInstance> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("struct_instance"),
            type: randomAstId(),
            args: fc.array(structFieldInitializer),
        }),
    );
}

export function randomAstFieldAccess(
    expression: fc.Arbitrary<AstExpression>,
): fc.Arbitrary<AstFieldAccess> {
    return dummyAstNode(
        fc.record({
            kind: fc.constant("field_access"),
            aggregate: expression,
            field: randomAstId(),
        }),
    );
}

export function randomAstMethodCall(
    selfExpression: fc.Arbitrary<AstExpression>,
    argsExpression: fc.Arbitrary<AstExpression>,
): fc.Arbitrary<AstMethodCall> {
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
    maxShrinks: number,
): fc.Arbitrary<AstExpression> {
    return fc.letrec<{
        AstExpression: AstExpression;
        AstOpUnary: AstOpUnary;
        AstOpBinary: AstOpBinary;
        AstConditional: AstConditional;
    }>((tie) => ({
        AstExpression: fc.oneof(
            // Enabling will fail the tests by recursion

            // randomAstMethodCall(
            //     fc.limitShrink(tie("AstExpression"), 1),
            //     fc.limitShrink(tie("AstExpression"), 1)),
            // randomAstFieldAccess(fc.limitShrink(tie("AstExpression"), 1)),
            // randomAstStaticCall(fc.limitShrink(tie("AstExpression"), 1)),
            randomAstNumber(),
            randomAstBoolean(),
            randomAstId(),
            randomAstNull(),
            // randomAstInitOf(tie("AstExpression")),
            randomAstString(),
            tie("AstOpUnary"),
            tie("AstOpBinary"),
            tie("AstConditional"),
        ),
        AstOpUnary: fc.limitShrink(
            randomAstOpUnary(tie("AstExpression")),
            maxShrinks,
        ),
        AstOpBinary: fc.limitShrink(
            randomAstOpBinary(tie("AstExpression"), tie("AstExpression")),
            maxShrinks,
        ),
        AstConditional: fc.limitShrink(
            randomAstConditional(
                tie("AstExpression"),
                tie("AstExpression"),
                tie("AstExpression"),
            ),
            maxShrinks,
        ),
    })).AstExpression;
}
