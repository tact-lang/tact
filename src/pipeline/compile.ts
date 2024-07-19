import { CompilerContext } from "../context";
import { createABI } from "../generator/createABI";
import { writeProgram } from "../generator/writeProgram";
import { FuncGenerator } from "../codegen";

export type CompilationOutput = {
    entrypoint: string;
    files: {
        name: string;
        code: string;
    }[];
    abi: string;
};

export type CompilationResults = {
    output: CompilationOutput;
    ctx: CompilerContext;
};

function printOutput(contractName: string, output: CompilationOutput) {
    const sep = "---------------\n";
    console.log(`Contract ${contractName} output:\n`);
    output.files.forEach((o) =>
        console.log(`${sep}\nFile ${o.name}:\n${o.code}\n`),
    );
}

/**
 * Compiles the given contract to Func.
 */
export async function compile(
    ctx: CompilerContext,
    contractName: string,
    abiName: string,
    backend: "new" | "old" = "old",
): Promise<CompilationResults> {
    const abi = createABI(ctx, contractName);
    let output: CompilationOutput;
    if (backend === "new" || process.env.NEW_CODEGEN === "1") {
        output = await FuncGenerator.fromTactProject(
            ctx,
            abi,
            abiName,
        ).writeProgram();
    } else {
        output = await writeProgram(ctx, abi, abiName);
    }
    if (process.env.PRINT_FUNC === "1") {
        printOutput(contractName, output);
    }
    return { output, ctx };
}
