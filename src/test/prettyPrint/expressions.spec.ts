import fc from "fast-check";
import { AstExpression, eqExpressions, getAstFactory } from "../../grammar/ast";
import { prettyPrint } from "../../prettyPrinter";
import { getParser } from "../../grammar";
import {
    randomAstConditional,
    randomAstOpBinary,
    randomAstOpUnary,
    randomAstExpression,
    randomAstInitOf,
    randomAstNull,
    randomAstStaticCall,
    randomAstStructInstance,
    randomAstStructFieldInitializer,
    randomAstId,
    randomAstFieldAccess,
    randomAstMethodCall,
    randomAstBoolean,
    randomAstNumber,
    randomAstString,
} from "../utils/expression/randomAst";

describe("Pretty Print Expressions", () => {
    // Max depth of the expression tree
    const maxShrinks = 15;
    const expression = () => randomAstExpression(maxShrinks);

    const cases: [string, fc.Arbitrary<AstExpression>][] = [
        //
        // Primary expressions
        //
        ["AstMethodCall", randomAstMethodCall(expression(), expression())],
        ["AstFieldAccess", randomAstFieldAccess(expression())],
        ["AstStaticCall", randomAstStaticCall(expression())],
        [
            "AstStructInstance",
            randomAstStructInstance(
                randomAstStructFieldInitializer(expression()),
            ),
        ],
        ["AstId", randomAstId()],
        ["AstNull", randomAstNull()],
        ["AstInitOf", randomAstInitOf(expression())],
        ["AstString", randomAstString()],

        //
        // Literals
        //
        ["AstNumber", randomAstNumber()],
        ["AstBoolean", randomAstBoolean()],

        [
            "AstConditional",
            randomAstConditional(expression(), expression(), expression()),
        ],
        ["AstOpBinary", randomAstOpBinary(expression(), expression())],
        ["AstOpUnary", randomAstOpUnary(expression())],
    ];

    cases.forEach(([caseName, astGenerator]) => {
        it(`should parse ${caseName}`, () => {
            fc.assert(
                fc.property(astGenerator, (generatedAst) => {
                    const prettyBefore = prettyPrint(generatedAst);
                    const astFactory = getAstFactory();
                    const parser = getParser(astFactory, "new");
                    const parsedAst = parser.parseExpression(prettyBefore);
                    expect(eqExpressions(generatedAst, parsedAst)).toBe(true);
                }),
                { seed: 1 },
            );
        });
    });
});
