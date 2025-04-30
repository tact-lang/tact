import { Program } from "@/test/fuzzer/src/generators";
import assert from "assert";

import {
    precompile,
    createContext,
    enableFeatures,
} from "@/test/fuzzer/test/testUtils";
import {
    createProperty,
    checkProperty,
    astNodeCounterexamplePrinter,
} from "@/test/fuzzer/src/util";
import { getAstFactory } from "@/ast/ast-helpers";
import { FuzzContext } from "@/test/fuzzer/src/context";

describe("properties", () => {
    it("generates well-typed programs", () => {
        const property = createProperty(
            new Program({ addStdlib: true }).generate(),
            (program) => {
                const factoryAst = getAstFactory();
                let ctx = createContext(program);
                ctx = enableFeatures(ctx, "external");
                precompile(ctx, factoryAst);
                FuzzContext.instance.resetDepth();
            },
        );
        checkProperty(property, astNodeCounterexamplePrinter);
    });

    it("generates reproducible AST", () => {
        // Setting a fixed seed for reproducibility
        const originalSeed = FuzzContext.instance.config.seed;
        FuzzContext.instance.config.seed = 42;

        let program1: string | undefined;
        let program2: string | undefined;

        // Create a single property that generates two programs
        const property = createProperty(new Program().generate(), (program) => {
            if (program1 === undefined) {
                program1 = FuzzContext.instance.format(program, "ast");
            } else {
                program2 = FuzzContext.instance.format(program, "ast");
            }
            FuzzContext.instance.resetDepth();
        });

        // Execute property twice
        checkProperty(property, astNodeCounterexamplePrinter, /*numRuns=*/ 1);
        checkProperty(property, astNodeCounterexamplePrinter, /*numRuns=*/ 1);

        assert.notEqual(
            program1,
            undefined,
            "First program should not be undefined",
        );
        assert.notEqual(
            program2,
            undefined,
            "Second program should not be undefined",
        );
        assert.equal(program1, program2, "Both programs should be identical");

        // Restore the original seed
        FuzzContext.instance.config.seed = originalSeed;
    });
});
