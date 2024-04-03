import { CompilerContext } from "../context";
import { createABI } from "../generator/createABI";
import { writeProgram } from "../generator/writeProgram";

export async function compile(
    ctx: CompilerContext,
    name: string,
    basename: string,
) {
    const abi = createABI(ctx, name);
    const output = await writeProgram(ctx, abi, basename);
    const cOutput = output;
    return { output: cOutput, ctx };
}
