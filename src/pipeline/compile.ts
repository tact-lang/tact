import { CompilerContext } from "../context/context";
import { createABI } from "../generator/createABI";
import { writeProgram } from "../generator/writeProgram";
import { ConfigProject } from "../config/parseConfig";

export async function compile(
    ctx: CompilerContext,
    config: ConfigProject,
    name: string,
    basename: string,
) {
    const abi = createABI(ctx, name);
    const output = await writeProgram(ctx, config, abi, basename);
    const cOutput = output;
    return { output: cOutput, ctx };
}
