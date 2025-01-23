import fc from "fast-check";
import { getParser } from "../grammar";
import { eqExpressions, getAstFactory } from "../ast/ast-helpers";
import { randomAstExpression } from "./random.infra";
import { prettyPrint } from "./ast-printer";

describe("Pretty Print Expressions", () => {
    const maxDepth = 3;
    const parser = getParser(getAstFactory(), "new");

    it(`should parse AstExpression`, () => {
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
