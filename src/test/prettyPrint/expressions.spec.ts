import fc from "fast-check";
import {
    AstConditional,
    AstExpression,
    AstNumber,
    AstOpBinary,
    AstOpUnary,
    eqExpressions,
    getAstFactory,
} from "../../grammar/ast";
import { prettyPrint } from "../../prettyPrinter";
import { dummySrcInfo, getParser } from "../../grammar";

describe("Pretty Print Expressions", () => {
    // Max depth of the expression tree
    const maxShrinks = 15;

    const generateAstNumber = () =>
        fc.record({
            kind: fc.constant("number"),
            base: fc.constantFrom(2, 8, 10, 16),
            value: fc.bigInt().filter((n) => n > 0),
            id: fc.constant(0),
            loc: fc.constant(dummySrcInfo),
        }) as fc.Arbitrary<AstNumber>;

    const generateAstOpUnary = (expression: fc.Arbitrary<AstExpression>) =>
        fc.record({
            kind: fc.constant("op_unary"),
            op: fc.constantFrom("+", "-", "!", "!!", "~"),
            operand: expression,
            id: fc.constant(0),
            loc: fc.constant(dummySrcInfo),
        }) as fc.Arbitrary<AstOpUnary>;

    const generateAstOpBinary = (expression: fc.Arbitrary<AstExpression>) =>
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
            left: expression,
            right: expression,
            id: fc.constant(0),
            loc: fc.constant(dummySrcInfo),
        }) as fc.Arbitrary<AstOpBinary>;

    const generateAstConditional = (expression: fc.Arbitrary<AstExpression>) =>
        fc.record({
            kind: fc.constant("conditional"),
            condition: expression,
            thenBranch: expression,
            elseBranch: expression,
            id: fc.constant(0),
            loc: fc.constant(dummySrcInfo),
        }) as fc.Arbitrary<AstConditional>;

    const generateAstExpression: fc.Arbitrary<AstExpression> = fc.letrec(
        (tie) => ({
            AstExpression: fc.oneof(
                generateAstNumber(),
                tie("AstOpUnary") as fc.Arbitrary<AstOpUnary>,
                tie("AstOpBinary") as fc.Arbitrary<AstOpBinary>,
                tie("AstConditional") as fc.Arbitrary<AstConditional>,
            ),
            AstOpUnary: fc.limitShrink(
                generateAstOpUnary(
                    tie("AstExpression") as fc.Arbitrary<AstExpression>,
                ),
                maxShrinks,
            ),
            AstOpBinary: fc.limitShrink(
                generateAstOpBinary(
                    tie("AstExpression") as fc.Arbitrary<AstExpression>,
                ),
                maxShrinks,
            ),
            AstConditional: fc.limitShrink(
                generateAstConditional(
                    tie("AstExpression") as fc.Arbitrary<AstExpression>,
                ),
                maxShrinks,
            ),
        }),
    ).AstExpression;
    it.each([
        ["AstConditional", generateAstConditional(generateAstExpression)],
        ["AstOpBinary", generateAstOpBinary(generateAstExpression)],
        ["AstOpUnary", generateAstOpUnary(generateAstExpression)],
    ])("should parse random %s expression", (_, astGenerator) => {
        fc.assert(
            fc.property(astGenerator, (astBefore) => {
                const prettyBefore = prettyPrint(astBefore);
                const astFactory = getAstFactory();
                const parser = getParser(astFactory);
                const astAfter = parser.parseExpression(prettyBefore);
                expect(eqExpressions(astBefore, astAfter)).toBe(true);
            }),
            { seed: 1 },
        );
    });
});
