import { __DANGER_resetNodeId } from "../../grammar/ast";
import { compile } from "../../pipeline/compile";
import { precompile } from "../../pipeline/precompile";
import { getContracts } from "../../types/resolveDescriptors";
import { CompilationOutput, CompilationResults } from "../../pipeline/compile";
import { createNodeFileSystem } from "../../vfs/createNodeFileSystem";
import { CompilerContext } from "../../context";
import * as fs from "fs";
import * as path from "path";

const CONTRACTS_DIR = path.join(__dirname, "./contracts/");

function capitalize(str: string): string {
    if (str.length === 0) return str;
    return str.charAt(0).toUpperCase() + str.slice(1).toLowerCase();
}

/**
 * Generates a Tact configuration file for the given contract (imported from Misti).
 */
export function generateConfig(contractName: string): string {
    const config = {
        projects: [
            {
                name: `${contractName}`,
                path: `./${contractName}.tact`,
                output: `./output`,
                options: {},
            },
        ],
    };
    const configPath = path.join(CONTRACTS_DIR, `${contractName}.config.json`);
    fs.writeFileSync(configPath, JSON.stringify(config), {
        encoding: "utf8",
        flag: "w",
    });
    return configPath;
}

/**
 * Compiles the contract on the given filepath to CompilationResults replicating the Tact compiler pipeline.
 */
async function compileContract(
    backend: "new" | "old",
    contractName: string,
): Promise<CompilationResults[]> {
    generateConfig(contractName);

    // see: pipeline/build.ts
    const project = createNodeFileSystem(CONTRACTS_DIR, false);
    const stdlib = createNodeFileSystem(
        path.resolve(__dirname, "..", "..", "..", "stdlib"),
        false,
    );
    let ctx: CompilerContext = new CompilerContext();
    ctx = precompile(ctx, project, stdlib, contractName);

    return await Promise.all(
        getContracts(ctx).map(async (contract) => {
            const res = await compile(
                ctx,
                contract,
                `${contractName}_${contract}`,
                backend,
            );
            return res;
        }),
    );
}

function compareCompilationOutputs(
    newOut: CompilationOutput,
    oldOut: CompilationOutput,
): void {
    const errors: string[] = [];

    if (newOut === undefined || oldOut === undefined) {
        errors.push("One of the outputs is undefined.");
    } else {
        try {
            expect(newOut.entrypoint).toBe(oldOut.entrypoint);
        } catch (error) {
            if (error instanceof Error) {
                errors.push(`Entrypoint mismatch: ${error.message}`);
            } else {
                errors.push(`Entrypoint mismatch: ${String(error)}`);
            }
        }

        try {
            expect(newOut.abi).toBe(oldOut.abi);
        } catch (error) {
            if (error instanceof Error) {
                errors.push(`ABI mismatch: ${error.message}`);
            } else {
                errors.push(`ABI mismatch: ${String(error)}`);
            }
        }

        const unmatchedFiles = new Set(oldOut.files.map((file) => file.name));

        for (const newFile of newOut.files) {
            const oldFile = oldOut.files.find(
                (file) => file.name === newFile.name,
            );
            if (oldFile) {
                unmatchedFiles.delete(oldFile.name);
                try {
                    expect(newFile.code).toBe(oldFile.code);
                } catch (error) {
                    if (error instanceof Error) {
                        errors.push(
                            `Code mismatch in file ${newFile.name}: ${error.message}`,
                        );
                    } else {
                        errors.push(
                            `Code mismatch in file ${newFile.name}: ${String(error)}`,
                        );
                    }
                }
            } else {
                errors.push(
                    `File ${newFile.name} is missing in the old output.`,
                );
            }
        }

        for (const missingFile of unmatchedFiles) {
            errors.push(`File ${missingFile} is missing in the new output.`);
        }
    }

    if (errors.length > 0) {
        throw new Error(errors.join("\n"));
    }
}

describe("codegen", () => {
    beforeEach(async () => {
        __DANGER_resetNodeId();
    });

    fs.readdirSync(CONTRACTS_DIR).forEach((file) => {
        if (!file.endsWith(".tact")) {
            return;
        }
        const contractName = capitalize(file);
        // Differential tests with the old backend
        it(`Should compile the ${file} contract`, async () => {
            Promise.all([
                compileContract("new", contractName),
                compileContract("old", contractName),
            ])
                .then(([resultsNew, resultsOld]) => {
                    if (resultsNew.length !== resultsOld.length) {
                        throw new Error("Not all contracts have been compiled");
                    }
                    const zipped = resultsNew.map((value, idx) => [
                        value,
                        resultsOld[idx],
                    ]);
                    zipped.forEach(([newRes, oldRes]) => {
                        expect(() => compareCompilationOutputs(
                            newRes!.output,
                            oldRes!.output,
                        )).not.toThrow();
                    });
                })
        });
    });
});
