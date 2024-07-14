import { CompilerContext } from "../context";
import { createABI } from "../generator/createABI";
import { writeProgram } from "../generator/writeProgram";
import { ContractGen, CodegenContext } from "../codegen";
import { FuncFormatter } from "../func/formatter";

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
    if (process.env.NEW_CODEGEN === "1") {
        const codegenCtx = new CodegenContext(ctx);
        const funcContract = ContractGen.fromTact(
            codegenCtx,
            contractName,
            abiName,
        ).generate();
        const output = FuncFormatter.dump(funcContract);
        throw new Error(`output:\n${output}`);
        // return { output, ctx };
    } else {
        const output = await writeProgram(ctx, abi, abiName);
        console.log(`${contractName} output:`);
        output.files.forEach((o) => console.log(`---------------\nname=${o.name}; code:\n${o.code}\n`));
        return { output, ctx };
    }
}
