import { createABI } from "@/generator/createABI";
import { writeProgram } from "@/generator/writeProgram";
import type {
    BuildContext,
    BuiltContract,
    CompileTactRes,
    FuncSource,
} from "@/pipeline/build";
import { getContracts } from "@/types/resolveDescriptors";
import { topSortContracts } from "@/pipeline/utils";
import { featureEnable } from "@/config/features";
import type { TypeDescription } from "@/types/types";
import {
    AssemblyWriter,
    Cell as OpcodeCell,
    disassembleRoot,
} from "@tact-lang/opcode";
import { funcCompile } from "@/func/funcCompile";
import { posixNormalize } from "@/utils/filePath";
import { TactError } from "@/error/errors";

type CompiledContract =
    | GeneratedOnlyFunc
    | CompiledSuccessfully
    | CompilationFailed;

type GeneratedOnlyFunc = {
    readonly $: "GeneratedOnlyFunc";
};

const GeneratedOnlyFunc: GeneratedOnlyFunc = { $: "GeneratedOnlyFunc" };

type CompiledSuccessfully = {
    readonly $: "CompiledSuccessfully";
    readonly built: Readonly<BuiltContract>;
};

const CompiledSuccessfully = (built: BuiltContract): CompiledSuccessfully => ({
    $: "CompiledSuccessfully",
    built,
});

type CompilationFailed = {
    readonly $: "CompilationFailed";
};

const CompilationFailed: CompilationFailed = { $: "CompilationFailed" };

export async function doCompileContracts(bCtx: BuildContext): Promise<boolean> {
    const allContracts = getContracts(bCtx.ctx);

    // Sort contracts in topological order
    // If a cycle is found, topSortContracts returns undefined
    const sortedContracts = topSortContracts(allContracts);
    if (sortedContracts !== undefined) {
        bCtx.ctx = featureEnable(bCtx.ctx, "optimizedChildCode");
    }

    const contracts = sortedContracts ?? allContracts;

    let ok = true;
    for (const contract of contracts) {
        const res = await compileContract(bCtx, contract);
        if (res.$ === "CompilationFailed") {
            ok = false;
            continue;
        }
        if (res.$ === "GeneratedOnlyFunc") {
            continue;
        }

        bCtx.built[contract.name] = res.built;
    }

    return ok;
}

async function compileContract(
    bCtx: BuildContext,
    contract: TypeDescription,
): Promise<CompiledContract> {
    const { config, logger } = bCtx;

    const contractName = contract.name;

    logger.info(`   > ${contractName}: tact compiler`);

    const compileRes = await compileTact(bCtx, contractName);
    if (!compileRes) {
        return CompilationFailed;
    }

    if (config.mode === "funcOnly") {
        return GeneratedOnlyFunc;
    }

    const codeBoc = await compileFunc(
        bCtx,
        contractName,
        compileRes.entrypointPath,
        compileRes.funcSource,
    );

    if (typeof codeBoc === "undefined") {
        return CompilationFailed;
    }

    if (bCtx.config.mode === "fullWithDecompilation") {
        // TODO: return error on fail
        decompileContract(bCtx, contractName, codeBoc);
    }

    const { abi, constants } = compileRes;

    return CompiledSuccessfully({
        codeBoc,
        abi,
        constants,
        contract,
    });
}

function decompileContract(
    bCtx: BuildContext,
    contractName: string,
    codeBoc: Buffer,
) {
    const { project, config, logger, errorMessages } = bCtx;

    logger.info(`   > ${contractName}: fift decompiler`);

    try {
        const cell = OpcodeCell.fromBoc(codeBoc).at(0);
        if (typeof cell === "undefined") {
            throw new Error("Cannot create Cell from BoC file");
        }

        const program = disassembleRoot(cell, { computeRefs: true });
        const codeFiftDecompiled = AssemblyWriter.write(program, {
            useAliases: true,
        });

        const pathCodeFifDec = project.resolve(
            config.output,
            `${config.name}_${contractName}.rev.fif`,
        );

        project.writeFile(pathCodeFifDec, codeFiftDecompiled);
        return true;
    } catch (e) {
        logger.error("Fift decompiler crashed");
        logger.error(e as Error);
        errorMessages.push(e as Error);
    }

    return false;
}

export async function compileFunc(
    bCtx: BuildContext,
    contract: string,
    entrypointPath: string,
    funcSource: FuncSource,
): Promise<Buffer | undefined> {
    const { project, config, logger, errorMessages, stdlib } = bCtx;

    logger.info(`   > ${contract}: func compiler`);

    try {
        const stdlibPath = stdlib.resolve("std/stdlib.fc");
        const stdlibCode = stdlib.readFile(stdlibPath).toString();
        const stdlibExPath = stdlib.resolve("std/stdlib_ex.fc");
        const stdlibExCode = stdlib.readFile(stdlibExPath).toString();

        const c = await funcCompile({
            entries: [
                stdlibPath,
                stdlibExPath,
                posixNormalize(project.resolve(config.output, entrypointPath)),
            ],
            sources: [
                {
                    path: stdlibPath,
                    content: stdlibCode,
                },
                {
                    path: stdlibExPath,
                    content: stdlibExCode,
                },
                funcSource,
            ],
            logger,
        });

        if (!c.ok) {
            const match = c.log.match(
                /undefined function `([^`]+)`, defining a global function of unknown type/,
            );
            if (match) {
                const message = `Function '${match[1]}' does not exist in imported FunC sources`;
                logger.error(message);
                errorMessages.push(new Error(message));
                return undefined;
            }

            logger.error(c.log);
            errorMessages.push(new Error(c.log));
            return undefined;
        }

        const pathCodeBoc = project.resolve(
            config.output,
            // need to keep `.code.boc` here because Blueprint looks for this pattern
            `${config.name}_${contract}.code.boc`,
        );
        const pathCodeFif = project.resolve(
            config.output,
            `${config.name}_${contract}.fif`,
        );

        project.writeFile(pathCodeFif, c.fift);
        project.writeFile(pathCodeBoc, c.output);
        return c.output;
    } catch (e) {
        logger.error("FunC compiler crashed");
        logger.error(e as Error);
        errorMessages.push(e as Error);
    }

    return undefined;
}

export async function compileTact(
    bCtx: BuildContext,
    contract: string,
): Promise<CompileTactRes | undefined> {
    const { project, config } = bCtx;

    try {
        const contractAbi = createABI(bCtx.ctx, contract);
        const res = await writeProgram(
            bCtx.ctx,
            contractAbi,
            `${config.name}_${contract}`,
            bCtx.built,
            false,
        );

        const { abi, funcFile, constants, entrypoint: entrypointPath } = res;

        const pathFunc = project.resolve(config.output, funcFile.name);
        project.writeFile(pathFunc, funcFile.code);

        const pathAbi = project.resolve(
            config.output,
            `${config.name}_${contract}.abi`,
        );
        project.writeFile(pathAbi, abi);

        const funcSource: FuncSource = {
            path: posixNormalize(project.resolve(config.output, funcFile.name)),
            content: funcFile.code,
        };

        return { abi, funcSource, entrypointPath, constants };
    } catch (e) {
        bCtx.logger.error("Tact compilation failed");
        // show an error with a backtrace only in verbose mode
        if (e instanceof TactError && config.verbose && config.verbose < 2) {
            bCtx.logger.error(e.message);
        } else {
            bCtx.logger.error(e as Error);
        }
        bCtx.errorMessages.push(e as Error);
    }

    return undefined;
}
