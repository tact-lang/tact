import fc from "fast-check";
import { getParser } from "../grammar";
import { eqExpressions, getAstFactory } from "../ast/ast-helpers";
import { diffAstObjects, randomAstExpression } from "./random.infra";
import { prettyPrint } from "./ast-printer";

describe("Pretty Print Expressions", () => {
    const maxDepth: fc.DepthSize = "+1"; // Small (default value) +1
    const parser = getParser(getAstFactory(), "new");

    it(`should parse AstExpression`, () => {
        fc.assert(
            fc.property(randomAstExpression(maxDepth), (generatedAst) => {
                const prettyBefore = prettyPrint(generatedAst);

                const parsedAst = parser.parseExpression(prettyBefore);
                const prettyAfter = prettyPrint(parsedAst);

                expect(prettyBefore).toBe(prettyAfter);
                const actual = eqExpressions(generatedAst, parsedAst);
                if (!actual) {
                    diffAstObjects(
                        generatedAst,
                        parsedAst,
                        prettyBefore,
                        prettyAfter,
                    );
                }
                expect(actual).toBe(true);
            }),
            { seed: 1, numRuns: 1000, ignoreEqualValues: true },
        );
    });
});
