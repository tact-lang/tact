import { CompilerContext } from "../context/context";
import { createABI } from "../generator/createABI";
import { writeProgram } from "../generator/writeProgram";
import { Counter } from "../test/utils/dbg/counter";

export async function compile(
    ctx: CompilerContext,
    name: string,
    basename: string,
    counter: Counter,
    generateIds: boolean,
) {
    const abi = createABI(ctx, name);
    const output = await writeProgram(ctx, abi, basename, false, counter, generateIds);
    const cOutput = output;
    return { output: cOutput, ctx };
}
