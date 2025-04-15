import { checkAsyncProperty } from "@/test/fuzzer/src/util";
import {
    bindingsAndExpressionPrtinter,
    createExpressionComputationEqualityProperty,
    ExpressionTestingEnvironment,
    setupEnvironment,
} from "./utils";

describe("evaluation properties", () => {
    let expressionTestingEnvironment: ExpressionTestingEnvironment;

    beforeAll(async () => {
        expressionTestingEnvironment = await setupEnvironment(
            "interesting-failing-tests.txt",
        );
    });

    afterAll(() => expressionTestingEnvironment.outputStream.close());

    test(
        "compiler and interpreter evaluate small generated expressions equally",
        async () => {
            console.log("a");
            await checkAsyncProperty(
                createExpressionComputationEqualityProperty(
                    expressionTestingEnvironment,
                    10,
                    15,
                ),
                bindingsAndExpressionPrtinter,
            );
        },
        60 * 1000 * 60, // 1 hour
    );
});
