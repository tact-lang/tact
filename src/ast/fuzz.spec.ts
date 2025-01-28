import fc from "fast-check";
import { getParser } from "../grammar";
import { getAstFactory } from "../ast/ast-helpers";
import { randomAstModule } from "./random.infra";
import { prettyPrint } from "./ast-printer";

describe("Pretty Print Expressions", () => {
    // const maxDepth = 3;
    const parser = getParser(getAstFactory(), "new");

    // it(`should parse AstExpression`, () => {
    //     fc.assert(
    //         fc.property(randomAstExpression(1), (generatedAst) => {
    //             const prettyBefore = prettyPrint(generatedAst);
    //             const parsedAst = parser.parseExpression(prettyBefore);
    //             expect(eqExpressions(generatedAst, parsedAst)).toBe(true);
    //         }),
    //         { seed: 1, numRuns: 5000 },
    //     );
    // });

    it(`should parse AstModule`, () => {
        fc.assert(
            fc.property(randomAstModule(2), (generatedAst) => {
                // console.log("Starting generating");
                const prettyBefore = prettyPrint(generatedAst);
                // console.log("Pretty Before");
                // console.log(prettyBefore);
                parser.parseModule(prettyBefore);
                // console.log("Generated AST");
                // console.log(JSON.stringify(generatedAst, null, 2));
                // console.log("Parsed AST");
                // console.log(JSON.stringify(parsedAst, null, 2));
                // expect(eqStatements(generatedAst, parsedAst)).toBe(true);
            }),
            { seed: 1, numRuns: 15000, markInterruptAsFailure: false },
        );
    });
});
