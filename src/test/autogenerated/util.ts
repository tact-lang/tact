import type * as A from "../../ast/ast";
import { idText, type FactoryAst } from "../../ast/ast-helpers";
import { featureEnable } from "../../config/features";
import { CompilerContext } from "../../context/context";
import { Logger } from "../../context/logger";
import { funcCompile } from "../../func/funcCompile";
import { getParser } from "../../grammar";
import { compile } from "../../pipeline/compile";
import { precompile } from "../../pipeline/precompile";
import { topSortContracts } from "../../pipeline/utils";
import files from "../../stdlib/stdlib";
import * as fs from "fs";
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
import { resolveImports } from "../../imports/resolveImports";
import { getRawAST, openContext } from "../../context/store";
import path from "path";
import { getAllTypes } from "../../types/resolveDescriptors";

export function parseStandardLibrary(astF: FactoryAst): CompilerContext {
    let ctx = new CompilerContext();
    const parser = getParser(astF);
    const fileSystem = {
        [`contracts/empty.tact`]: "",
    };
    const project = createVirtualFileSystem("/", fileSystem, false);
    const stdlib = createVirtualFileSystem("@stdlib", files);

    const imported = resolveImports({
        entrypoint: "contracts/empty.tact",
        project,
        stdlib,
        parser,
    });

    // Add information about all the source code entries to the context
    ctx = openContext(ctx, imported.tact, imported.func, parser);

    return ctx;
}

export function filterGlobalDeclarations(
    ctx: CompilerContext,
    astF: FactoryAst,
    names: Set<string>,
): A.AstModule {
    const result: A.AstModuleItem[] = [];

    const rawAst = getRawAST(ctx);

    for (const c of rawAst.constants) {
        if (names.has(idText(c.name))) {
            result.push(c);
        }
    }

    for (const f of rawAst.functions) {
        if (names.has(idText(f.name))) {
            result.push(f);
        }
    }

    for (const t of rawAst.types) {
        if (names.has(idText(t.name))) {
            result.push(t);
        }
    }

    return astF.createNode({
        kind: "module",
        imports: [],
        items: result,
    }) as A.AstModule;
}

export function loadCustomStdlibFc(): {
    stdlib_fc: string;
    stdlib_ex_fc: string;
} {
    const stdlib_fc = fs
        .readFileSync(path.join(__dirname, "minimal-fc-stdlib", "stdlib.fc"))
        .toString("base64");
    return {
        stdlib_fc: stdlib_fc,
        stdlib_ex_fc: "",
    };
}

export type CustomStdlib = {
    // Parsed modules of Tact stdlib
    modules: A.AstModule[];
    // Contents of the stdlib.fc file
    stdlib_fc: string;
    // Contents of the stdlib_ex.fc file
    stdlib_ex_fc: string;
};

// If flag useCustomStdlib is false, it will parse the entire stdlib. Otherwise,
// it will use the provided data in CustomStdlib.
export async function buildModule(
    astF: FactoryAst,
    module: A.AstModule,
    customStdlib: CustomStdlib,
    useCustomStdlib: boolean,
): Promise<Map<string, Buffer>> {
    let ctx = new CompilerContext();
    const parser = getParser(astF);
    // We need an entrypoint for precompile, even if it is empty
    const fileSystem = {
        [`contracts/empty.tact`]: "",
    };
    const minimalStdlib = {
        // Needed by precompile, but we set its contents to be empty
        ["std/stdlib.tact"]: "",
        // These two func files are needed during tvm compilation
        ["std/stdlib_ex.fc"]: customStdlib.stdlib_ex_fc,
        ["std/stdlib.fc"]: customStdlib.stdlib_fc,
    };

    const project = createVirtualFileSystem("/", fileSystem, false);
    // If the provided stdlib modules are empty, prepare the full stdlib.
    // Otherwise, just include the minimal stdlib
    const stdlib = useCustomStdlib
        ? createVirtualFileSystem("@stdlib", minimalStdlib)
        : createVirtualFileSystem("@stdlib", files);

    const config = {
        name: "test",
        path: "contracts/empty.tact",
        output: ".",
    };
    const contractCodes = new Map();

    if (useCustomStdlib) {
        ctx = precompile(ctx, project, stdlib, config.path, parser, astF, [
            module,
            ...customStdlib.modules,
        ]);
    } else {
        ctx = precompile(ctx, project, stdlib, config.path, parser, astF, [
            module,
        ]);
    }

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
