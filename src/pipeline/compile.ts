import type { CompilerContext } from "../context/context";
import { createABI } from "../generator/createABI";
import { writeProgram } from "../generator/writeProgram";
import type { ContractsCodes } from "../generator/writers/writeContract";

export async function compile(
    ctx: CompilerContext,
    name: string,
    basename: string,
    contractCodes: ContractsCodes,
    optimizedChildCode: boolean,
) {
    const abi = createABI(ctx, name);
    const output = await writeProgram(
        ctx,
        abi,
        basename,
        undefined,
        contractCodes,
        optimizedChildCode,
    );
    const cOutput = output;
    return { output: cOutput, ctx };
}
