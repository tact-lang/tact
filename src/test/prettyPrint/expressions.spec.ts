import fc from "fast-check";
import { eqExpressions, getAstFactory } from "../../ast/ast";
import { prettyPrint } from "../../prettyPrinter";
import { getParser } from "../../grammar";
import { randomAstExpression } from "../utils/expression/randomAst";

describe("Pretty Print Expressions", () => {
    const maxDepth = 3;

    it(`should parse Ast`, () => {
        fc.assert(
            fc.property(randomAstExpression(maxDepth), (generatedAst) => {
                const prettyBefore = prettyPrint(generatedAst);
                const parser = getParser(getAstFactory(), "new");
                const parsedAst = parser.parseExpression(prettyBefore);
                expect(eqExpressions(generatedAst, parsedAst)).toBe(true);
            }),
            { seed: 1, numRuns: 5000 },
        );
    });
});
