import { checkAsyncProperty } from "@/test/fuzzer/src/util";
import {
    bindingsAndExpressionPrtinter,
    compileExpression,
    defaultGenerationIds,
    ExpressionTestingEnvironment,
    generateBindings,
    interpretExpression,
    setupEnvironment,
} from "./utils";
import {
    AllowedTypeEnum,
    ExpressionGenerator,
    GenContext,
    initializeGenerator,
    NonTerminal,
    Terminal,
} from "../../src/generators/uniform-expr-gen";
import assert from "assert";
import fc from "fast-check";

/**
 * Returns an expression generator where each terminal and non-terminal is used or not used with an equal probability of 0.5
 */
function getRandomSwarmGenerator(
    expressionTestingEnvironment: ExpressionTestingEnvironment,
): fc.Arbitrary<{
    generationIds: Map<AllowedTypeEnum, string[]>;
    generator: ExpressionGenerator;
}> {
    return fc
        .array(fc.boolean(), {
            minLength: Object.entries(NonTerminal).length,
            maxLength: Object.entries(NonTerminal).length,
        })
        .chain((isNonTerminalIn) =>
            fc
                .array(fc.boolean(), {
                    minLength: Object.entries(Terminal).length,
                    maxLength: Object.entries(Terminal).length,
                })
                .map((isTerminalIn) => {
                    const allowedNonTerminals = Object.values(
                        NonTerminal,
                    ).filter(
                        (nonTerminal, index) =>
                            nonTerminal.id === NonTerminal.Int.id ||
                            isNonTerminalIn[index],
                    );
                    const allowedTerminals = Object.values(Terminal).filter(
                        (terminal, index) =>
                            terminal.id === Terminal.integer.id ||
                            terminal.id === Terminal.id_int.id ||
                            isTerminalIn[index],
                    );

                    const expressionGenerationCtx: GenContext = {
                        identifiers: defaultGenerationIds,
                        contractNames: [
                            expressionTestingEnvironment.contractNameToCompile,
                        ],
                        allowedNonTerminals,
                        allowedTerminals,
                    };

                    const { generator, availableNonTerminals } =
                        initializeGenerator(
                            1,
                            10,
                            expressionGenerationCtx,
                            expressionTestingEnvironment.astF,
                        );

                    return {
                        generator,
                        availableNonTerminals,
                        generationIds: defaultGenerationIds,
                    };
                })
                .filter(
                    ({ availableNonTerminals }) =>
                        NonTerminal.Int.id in availableNonTerminals,
                ),
        );
}

describe("evaluation properties", () => {
    let expressionTestingEnvironment: ExpressionTestingEnvironment;
    let defaultGenerator: ExpressionGenerator;

    beforeAll(async () => {
        expressionTestingEnvironment = await setupEnvironment(
            "interesting-failing-tests.txt",
        );

        defaultGenerator = initializeGenerator(
            1,
            10,
            {
                identifiers: new Map(),
                contractNames: [
                    expressionTestingEnvironment.contractNameToCompile,
                ],
                allowedNonTerminals: Object.values(NonTerminal),
                allowedTerminals: Object.values(Terminal),
            },
            expressionTestingEnvironment.astF,
        ).generator;
    });

    afterAll(() => expressionTestingEnvironment.outputStream.close());

    test(
        "compiler and interpreter evaluate small generated expressions equally",
        async () => {
            const property = fc.asyncProperty(
                getRandomSwarmGenerator(expressionTestingEnvironment).chain(
                    ({ generator, generationIds }) =>
                        fc.record({
                            bindings: generateBindings(
                                expressionTestingEnvironment,
                                generationIds,
                                defaultGenerator,
                            ),
                            expr: generator(NonTerminal.Int),
                        }),
                ),
                async ({ bindings, expr }) => {
                    const compilationResult = await compileExpression(
                        expressionTestingEnvironment,
                        bindings,
                        expr,
                    );

                    const interpretationResult = interpretExpression(
                        expressionTestingEnvironment,
                        bindings,
                        expr,
                    );
                    assert.strictEqual(
                        compilationResult,
                        interpretationResult,
                        `Compilation result: \n${compilationResult}\nhas to be the same as interpretation result: \n${interpretationResult}`,
                    );
                },
            );

            await checkAsyncProperty(property, ([{ bindings, expr }]) =>
                bindingsAndExpressionPrtinter([bindings, expr]),
            );
        },
        60 * 1000 * 60, // 1 hour
    );
});
