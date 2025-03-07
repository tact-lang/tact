import { Program } from "../src/generators";
import assert from "assert";

import { precompile, createContext, enableFeatures } from "./testUtils";
import { createProperty, checkProperty } from "../src/util";
import { GlobalContext } from "../src/context";

describe("properties", () => {
  it("generates well-typed programs", () => {
    const property = createProperty(
      new Program({ addStdlib: true }).generate(),
      (program) => {
        let ctx = createContext(program);
        ctx = enableFeatures(ctx, "external");
        precompile(ctx);
        GlobalContext.resetDepth();
      },
    );
    checkProperty(property);
  });

  it("generates reproducible AST", () => {
    // Setting a fixed seed for reproducibility
    const originalSeed = GlobalContext.config.seed;
    GlobalContext.config.seed = 42;

    let program1: string | undefined;
    let program2: string | undefined;

    // Create a single property that generates two programs
    const property = createProperty(new Program().generate(), (program) => {
      if (program1 === undefined) {
        program1 = GlobalContext.format(program, "ast");
      } else {
        program2 = GlobalContext.format(program, "ast");
      }
      GlobalContext.resetDepth();
    });

    // Execute property twice
    checkProperty(property, /*numRuns=*/ 1);
    checkProperty(property, /*numRuns=*/ 1);

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
    GlobalContext.config.seed = originalSeed;
  });
});
