import { funcCompile } from "../../src/func/funcCompile";
import { posixNormalize } from "../../src/utils/filePath";
import type { AstModule, AstContract } from "../../src/ast/ast";
import { writeFileSync } from "fs";
import * as path from "path";
import fc from "fast-check";

import { Program } from "../src/generators";
// import { StdlibCode, StdlibPath } from "../src/stdlib";
import { withNodeFS, checkAsyncProperty } from "../src/util";
import {
    compile,
    precompile,
    createContext,
    enableFeatures,
} from "./testUtils";
import { GlobalContext } from "../src/context";
import { getAstFactory } from "../../src/ast/ast-helpers";

function getContract(program: AstModule): AstContract | undefined {
    for (const entry of program.items) {
        if (entry.kind === "contract") {
            return entry;
        }
    }
    return undefined;
}

async function compileProgram(program: AstModule) {
    await withNodeFS(async (vfs) => {
        const factoryAst = getAstFactory();
        let ctx = createContext(program, factoryAst);
        ctx = enableFeatures(ctx, "external");
        ctx = precompile(ctx, factoryAst);
        const compilationOutput = vfs.root;

        const contract = getContract(program)!;

        // Save the generated contract to a file
        const contractCode = GlobalContext.format(contract, "ast");
        writeFileSync(
            path.join(compilationOutput, "contract.tact"),
            contractCode,
        );

        // Compile contracts to FunC
        const res = await compile(ctx, contract.name.text);
        for (const files of res.output.files) {
            const ffc = vfs.resolve(compilationOutput, files.name);
            vfs.writeFile(ffc, files.code);
        }

        // Process compilation output
        const codeFc = res.output.files.map((v) => ({
            path: posixNormalize(vfs.resolve(compilationOutput, v.name)),
            content: v.code,
        }));
        const codeEntrypoint = res.output.entrypoint;

        // Compile the resulted FunC code
        // NOTE: We intentionally disabled stdlibEx, since the generated
        // contracts currently don't use it.
        const c = await funcCompile({
            entries: [
                // StdlibPath,
                // stdlibExPath,
                posixNormalize(vfs.resolve(compilationOutput, codeEntrypoint)),
            ],
            sources: [
                // { path: StdlibPath, content: StdlibCode },
                // {
                //     path: stdlibExPath,
                //     content: stdlibExCode,
                // },
                ...codeFc,
            ],
            logger: {
                info: (_) => {},
                debug: (_) => {},
                warn: (_) => {},
                error: (_) => {},
            },
        });
        try {
            expect(c.ok).toBeTruthy();
        } catch (_error) {
            throw new Error(`FunC compilation failed:\n${c.log}`);
        }

        GlobalContext.resetDepth();
    });
}

describe("properties", () => {
    it(
        "compiles contracts",
        async () => {
            // The generated AST is compiled once on compilation tests.
            // This approach is used to speed-up testing, since non-structural changes
            // are not significant for this case.
            //
            // Instead, the original NUM_RUNS option is used to generate the requested number of
            // programs with a different structure.
            const numRuns = GlobalContext.config.numRuns;

            const compileAndCheckProperty = async () => {
                const property = fc.asyncProperty(
                    new Program({ addStdlib: true }).generate(),
                    compileProgram,
                );
                await checkAsyncProperty(property, /*numRuns=*/ 1);
            };

            if (numRuns === Infinity) {
                for (;;) {
                    await compileAndCheckProperty();
                }
            } else {
                await Promise.all(
                    Array.from({ length: numRuns }).map(async () => {
                        await compileAndCheckProperty();
                    }),
                );
            }
        },
        /*timeout_ms=*/ 60 * 60 * 1000 /*1hr*/,
    );
});
