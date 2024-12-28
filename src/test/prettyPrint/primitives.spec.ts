import fc from "fast-check";
import {
    randomAstBoolean,
    randomAstNumber,
    randomAstString,
} from "../utils/expression/randomAst";
import { getParser } from "../../grammar";
import { getAstFactory, eqExpressions, AstExpression } from "../../grammar/ast";
import { prettyPrint } from "../../prettyPrinter";

describe("Pretty Print Primitives", () => {
    const astFactory = getAstFactory();
    const parser = getParser(astFactory, "new");

    const cases: [string, fc.Arbitrary<AstExpression>][] = [
        ["AstBoolean", randomAstBoolean()],
        ["AstNumber", randomAstNumber()],
        ["AstString", randomAstString()],
    ];

    cases.forEach(([caseName, astGenerator]) => {
        it(`should parse ${caseName}`, () => {
            fc.assert(
                fc.property(astGenerator, (generatedAst) => {
                    const prettyBefore = prettyPrint(generatedAst);
                    const parsedAst = parser.parseExpression(prettyBefore);
                    expect(eqExpressions(generatedAst, parsedAst)).toBe(true);
                }),
                { seed: 1 },
            );
        });
    });
});
