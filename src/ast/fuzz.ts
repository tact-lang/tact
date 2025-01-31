import assert from "assert";
import fc from "fast-check";
import { getParser } from "../grammar";
import { eqExpressions, getAstFactory } from "../ast/ast-helpers";
import { diffAstObjects, randomAstExpression } from "./random.infra";
import { prettyPrint } from "./ast-printer";
import { appendFileSync, rmSync, writeFileSync } from "fs";
import { join } from "path";
import { traverse } from "./iterators";

// yarn test src/ast/fuzz.spec.ts
const numNodes: Record<string, number> = {};
const filePath = join(__dirname, 'result.tact');
try {
    rmSync(filePath);
} catch (e) {}
const add = (text: string) => appendFileSync(filePath, `${text}\n\n`);
const maxDepth = 4;
const parser = getParser(getAstFactory(), "new");
fc.assert(
    fc.property(randomAstExpression(maxDepth), (generatedAst) => {
        const prettyBefore = prettyPrint(generatedAst);

        const parsedAst = parser.parseExpression(prettyBefore);
        const prettyAfter = prettyPrint(parsedAst);

        assert(prettyBefore === prettyAfter)
        const actual = eqExpressions(generatedAst, parsedAst);
        if (!actual) {
            diffAstObjects(
                generatedAst,
                parsedAst,
                prettyBefore,
                prettyAfter,
            );
        }
        traverse(generatedAst, (node) => {
            const a = numNodes[node.kind];
            numNodes[node.kind] = a ? a + 1 : 1;
        });
        add(prettyAfter);
        if (!actual) {
            throw new Error();
        }
    }),
    { seed: 1, numRuns: 5000 },
);
add(JSON.stringify(numNodes, null, 4));
