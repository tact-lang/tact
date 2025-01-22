import fc from "fast-check";
import { eqExpressions, getAstFactory } from "./ast";
import { prettyPrint } from "../prettyPrinter";
import { getParser } from "../grammar";
import { randomAstExpression } from "./random.infra";

describe("Pretty Print Expressions", () => {
    const maxDepth = 3;
    const parser = getParser(getAstFactory(), "new");

    it(`should parse Ast`, () => {
        fc.assert(
            fc.property(randomAstExpression(maxDepth), (generatedAst) => {
                const prettyBefore = prettyPrint(generatedAst);
                const parsedAst = parser.parseExpression(prettyBefore);
                expect(eqExpressions(generatedAst, parsedAst)).toBe(true);
            }),
            { seed: 1, numRuns: 5000 },
        );
    });
});
