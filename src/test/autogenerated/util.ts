import path from "path";
import type * as A from "../../ast/ast";
import type { FactoryAst } from "../../ast/ast-helpers";
import { featureEnable } from "../../config/features";
import { CompilerContext } from "../../context/context";
import { Logger } from "../../context/logger";
import { funcCompile } from "../../func/funcCompile";
import { getParser } from "../../grammar";
import { defaultParser } from "../../grammar/grammar";
import { compile } from "../../pipeline/compile";
import { precompile } from "../../pipeline/precompile";
import { topSortContracts } from "../../pipeline/utils";
import files from "../../stdlib/stdlib";
import * as fs from "fs";
import { getAllTypes } from "../../types/resolveDescriptors";
import { posixNormalize } from "../../utils/filePath";
import { createVirtualFileSystem } from "../../vfs/createVirtualFileSystem";
import type {
    Address,
    Cell,
    Contract,
    ContractProvider,
    Sender,
    StateInit,
} from "@ton/core";
import { contractAddress } from "@ton/core";

export async function buildModule(
    astF: FactoryAst,
    module: A.AstModule,
): Promise<Map<string, Buffer>> {
    let ctx = new CompilerContext();
    const parser = getParser(astF, defaultParser);
    const fileSystem = {
        [`contracts/empty.tact`]: fs
            .readFileSync(path.join(__dirname, `contracts/empty.tact`))
            .toString("base64"),
    };
    const project = createVirtualFileSystem("/", fileSystem, false);
    const stdlib = createVirtualFileSystem("@stdlib", files);
    const config = {
        name: "test",
        path: "contracts/empty.tact",
        output: ".",
    };
    const contractCodes = new Map();

    ctx = precompile(ctx, project, stdlib, config.path, parser, astF, [module]);

    const built: Record<
        string,
        | {
              codeBoc: Buffer;
              abi: string;
          }
        | undefined
    > = {};

    const allContracts = getAllTypes(ctx).filter((v) => v.kind === "contract");

    // Sort contracts in topological order
    // If a cycle is found, return undefined
    const sortedContracts = topSortContracts(allContracts);
    if (sortedContracts !== undefined) {
        ctx = featureEnable(ctx, "optimizedChildCode");
    }
    for (const contract of sortedContracts ?? allContracts) {
        const contractName = contract.name;

        // Compiling contract to func
        const res = await compile(
            ctx,
            contractName,
            `${config.name}_${contractName}`,
            built,
        );
        for (const files of res.output.files) {
            const ffc = project.resolve(config.output, files.name);
            project.writeFile(ffc, files.code);
        }
        //project.writeFile(pathAbi, res.output.abi);
        const codeFc = res.output.files.map((v) => ({
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
                posixNormalize(project.resolve(config.output, codeEntrypoint)),
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

        // Add to built map
        built[contractName] = {
            codeBoc: c.output,
            abi: "",
        };

        contractCodes.set(contractName, c.output);
    }

    return contractCodes;
}

export class ProxyContract implements Contract {
    address: Address;
    init: StateInit;

    constructor(stateInit: StateInit) {
        this.address = contractAddress(0, stateInit);
        this.init = stateInit;
    }

    async send(
        provider: ContractProvider,
        via: Sender,
        args: { value: bigint; bounce?: boolean | null | undefined },
        body: Cell,
    ) {
        await provider.internal(via, { ...args, body: body });
    }
}
