import { CompilerContext } from "./context";
import { createABI } from "../080-generator/createABI";
import { writeProgram } from "../080-generator/writeProgram";

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
