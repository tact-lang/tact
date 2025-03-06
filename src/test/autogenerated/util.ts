import * as A from "../../ast/ast";
import { FactoryAst } from "../../ast/ast-helpers";
import { featureEnable } from "../../config/features";
import { CompilerContext } from "../../context/context";
import { Logger } from "../../context/logger";
import { openContext } from "../../context/store";
import { funcCompile } from "../../func/funcCompile";
import { getParser } from "../../grammar";
import { defaultParser, Parser } from "../../grammar/grammar";
import { compile } from "../../pipeline/compile";
import { topSortContracts } from "../../pipeline/utils";
import files from "../../stdlib/stdlib";
import { resolveAllocations } from "../../storage/resolveAllocation";
import { computeReceiversEffects } from "../../types/effects";
import { getAllTypes, resolveDescriptors } from "../../types/resolveDescriptors";
import { resolveErrors } from "../../types/resolveErrors";
import { resolveSignatures } from "../../types/resolveSignatures";
import { resolveStatements } from "../../types/resolveStatements";

import { posixNormalize } from "../../utils/filePath";
import { createVirtualFileSystem } from "../../vfs/createVirtualFileSystem";

export async function buildModule(astF: FactoryAst, module: A.AstModule): Promise<Map<string,Buffer>> {
    let ctx = new CompilerContext();
    const parser = getParser(astF, defaultParser);
    const project = createVirtualFileSystem("/", {}, false);
    const stdlib = createVirtualFileSystem("@stdlib", files);
    const config = {
        name: "",
        output: "."
    };
    const contractCodes = new Map();

    ctx = precompile(ctx, parser, astF, [module]);

    // Compile contracts
    const allContracts = getAllTypes(ctx).filter((v) => v.kind === "contract");

    // Sort contracts in topological order
    // If a cycle is found, return undefined
    const sortedContracts = topSortContracts(allContracts);
    if (sortedContracts !== undefined) {
        ctx = featureEnable(ctx, "optimizedChildCode");
    }
    for (const contract of sortedContracts ?? allContracts) {
        const contractName = contract.name;

        let codeFc: { path: string; content: string }[];

        // Compiling contract to func

        const res = await compile(
            ctx,
            contractName,
            config.name + "_" + contractName,
            {},
        );
        for (const files of res.output.files) {
            const ffc = project.resolve(config.output, files.name);
            project.writeFile(ffc, files.code);
        }
        codeFc = res.output.files.map((v) => ({
            path: posixNormalize(project.resolve(config.output, v.name)),
            content: v.code,
        }));
        const codeEntrypoint = res.output.entrypoint;

        // Compiling contract to TVM
        const stdlibPath = stdlib.resolve("std/stdlib.fc");
        const stdlibCode = stdlib.readFile(stdlibPath).toString();
        const stdlibExPath = stdlib.resolve("std/stdlib_ex.fc");
        const stdlibExCode = stdlib.readFile(stdlibExPath).toString();
        const c = await funcCompile({
            entries: [
                stdlibPath,
                stdlibExPath,
                posixNormalize(
                    project.resolve(config.output, codeEntrypoint),
                ),
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
                ...codeFc,
            ],
            logger: new Logger(),
        });
        if (!c.ok) {
            throw new Error(c.log);
        }
        contractCodes.set(contractName, c.output);
    }

    return contractCodes;
}

// Like precompile in the main pipeline, but skipping resolveImports

export function precompile(
    ctx: CompilerContext,
    parser: Parser,
    ast: FactoryAst,
    parsedModules: A.AstModule[],
) {
    // Add information about all the source code entries to the context
    ctx = openContext(ctx, [], [], parser, parsedModules);

    // First load type descriptors and check that
    //       they all have valid signatures
    ctx = resolveDescriptors(ctx, ast);

    // This creates TLB-style type definitions
    ctx = resolveSignatures(ctx, ast);

    // This checks and resolves all statements
    ctx = resolveStatements(ctx, ast);

    // This extracts error messages
    ctx = resolveErrors(ctx, ast);

    // This creates allocations for all defined types
    ctx = resolveAllocations(ctx);

    // To use in code generation to decide if a receiver needs to call the contract storage function
    computeReceiversEffects(ctx);

    // Prepared context
    return ctx;
}

