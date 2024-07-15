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

/**
 * Compiles the given contract to Func.
 */
export async function compile(
    ctx: CompilerContext,
    contractName: string,
    abiName: string,
): Promise<CompilationResults> {
    const abi = createABI(ctx, contractName);
    let output: CompilationOutput;
    if (process.env.NEW_CODEGEN === "1") {
        output = await FuncGenerator.fromTactProject(
            ctx,
            abi,
            abiName,
        ).writeProgram();
    } else {
        output = await writeProgram(ctx, abi, abiName);
    }
    console.log(`${contractName} output:`);
    output.files.forEach((o) =>
        console.log(`---------------\nname=${o.name}; code:\n${o.code}\n`),
    );
    return { output, ctx };
}
