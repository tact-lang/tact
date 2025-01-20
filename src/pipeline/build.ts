/* eslint-disable @typescript-eslint/no-floating-promises */
/* eslint-disable @typescript-eslint/no-confusing-void-expression */
/* eslint-disable @typescript-eslint/require-await */
import { beginCell, Cell, ContractABI, Dictionary } from "@ton/core";
import { decompileAll } from "@tact-lang/opcode";
import { writeTypescript } from "../bindings/writeTypescript";
import { featureEnable } from "../config/features";
import { ConfigProject, Options } from "../config/parseConfig";
import { CompilerContext } from "../context/context";
import { funcCompileWrap } from "../func/funcCompile";
import { writeReport } from "../generator/writeReport";
import { ILogger, Logger } from "../context/logger";
import { createABITypeRefFromTypeRef } from "../types/resolveABITypeRef";
import { getContracts, getType } from "../types/resolveDescriptors";
import { posixNormalize } from "../utils/filePath";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { resolveDescriptors } from "../types/resolveDescriptors";
import { resolveAllocations } from "../storage/resolveAllocation";
import { openContext } from "../context/store";
import { resolveStatements } from "../types/resolveStatements";
import { resolveErrors } from "../types/resolveErrors";
import { resolveSignatures } from "../types/resolveSignatures";
import { Imports, resolveImports, Source } from "../imports/resolveImports";
import {
    AstImport,
    AstModule,
    FactoryAst,
    getAstFactory,
    idText,
} from "../ast/ast";
import { getParser, ItemOrigin } from "../grammar";
import { defaultParser } from "../grammar/grammar";
import { getFileWriter, getStdLib, Stdlib } from "./fs";
import { createABI } from "../generator/createABI";
import { writeProgram } from "../generator/writeProgram";
import { calculateIPFSlink } from "../utils/calculateIPFSlink";
import { InitDescription } from "../types/types";
import { fileFormat, PackageFileFormat } from "../packaging/fileFormat";
import { getCompilerVersion } from "./version";
import { createVirtualFileSystem } from "../vfs/createVirtualFileSystem";
import files from "../stdlib/stdlib";
import { deferredMap } from "../utils/async";

export function enableFeatures(
    ctx: CompilerContext,
    options: Options | undefined,
): CompilerContext {
    if (options === undefined) {
        return ctx;
    }
    const features = [
        { option: options.debug, name: "debug" },
        { option: options.external, name: "external" },
        { option: options.experimental?.inline, name: "inline" },
        { option: options.ipfsAbiGetter, name: "ipfsAbiGetter" },
        { option: options.interfacesGetter, name: "interfacesGetter" },
    ];
    return features.reduce((currentCtx, { option, name }) => {
        if (option) {
            return featureEnable(currentCtx, name);
        }
        return currentCtx;
    }, ctx);
}

const getStepper = (logger: ILogger, path: string[] = []) => {
    const wrap = async <T>(name: string, callback: () => Promise<T>) => {
        try {
            path.push(name);
            return await callback();
        } finally {
            path.pop();
        }
    };
    const message = (s: string) => [...path, s].join(": ");
    const info = (s: string) => {
        logger.info(message(s));
    };
    const error = (s: string) => {
        logger.error(message(s));
    };
    const step = async <U>(
        name: string,
        callback: () => Promise<U>,
    ): Promise<U> => {
        return wrap(name, async () => {
            info("started");
            try {
                return await callback();
            } catch (e) {
                if (!(e instanceof Error)) {
                    throw e;
                }
                error("failed");
                error(e.toString());
                throw e;
            }
        });
    };
    const steps = async (
        xs: string[],
        f: (x: string, sync: () => Promise<void>) => Promise<void>,
    ) => {
        const rests: (() => Promise<void>)[] = [];
        // execute all threads up to `sync()`
        for (const x of xs) {
            let runSync: undefined | (() => void);
            const sync: Promise<void> = new Promise(
                (resolve) => (runSync = resolve),
            );
            let rest: Promise<void> | undefined;
            await new Promise<void>((atSync) => {
                rest = step(x, () =>
                    f(x, () => {
                        atSync();
                        return sync;
                    }),
                );
            });
            rests.push(async () => {
                runSync?.();
                await rest;
            });
        }
        // let threads continue from sync
        for (const rest of rests) {
            await rest();
        }
    };
    return { step, steps };
};

const getImporter =
    (args: {
        parseImports: (
            src: string,
            path: string,
            origin: ItemOrigin,
        ) => AstImport[];
        stdlib: Stdlib;
        stdlibFs: VirtualFileSystem;
        projectFs: VirtualFileSystem;
        entrypoint: string;
    }) =>
    async () => {
        // Load all sources
        return resolveImports(args);
    };

const getImportParser =
    ({
        parse,
    }: {
        parse: (src: string, path: string, origin: ItemOrigin) => AstModule;
    }) =>
    async (imports: Imports) => {
        // Parse sources
        return Object.entries(imports.tact).map(([path, { code, origin }]) =>
            parse(code, path, origin),
        );
    };

const checkTypes = async (args: {
    sources: AstModule[];
    ast: FactoryAst;
    ctx: CompilerContext;
}) => {
    let ctx = args.ctx;
    // Add information about all the source code entries to the context
    ctx = openContext(ctx, args.sources);
    // First load type descriptors and check that they all have valid signatures
    ctx = resolveDescriptors(ctx, args.ast);
    // This creates TLB-style type definitions
    ctx = resolveSignatures(ctx, args.ast);
    // This checks and resolves all statements
    ctx = resolveStatements(ctx, args.ast);
    // This extracts error messages
    ctx = resolveErrors(ctx, args.ast);
    // This creates allocations for all defined types
    return resolveAllocations(ctx);
};

const compileAbi = async (args: {
    contractName: string;
    ctx: CompilerContext;
}) => {
    const abiSrc = createABI(args.ctx, args.contractName);
    const abi = JSON.stringify(abiSrc);
    const abiLink = await calculateIPFSlink(Buffer.from(abi));
    return { text: abi, src: abiSrc, link: abiLink };
};

const getTactCompiler =
    ({ projectName }: { projectName: string }) =>
    async (args: {
        ctx: CompilerContext;
        abiSrc: ContractABI;
        abiLink: string;
        contractName: string;
        funcSources: Record<string, Source>;
    }) => {
        const result = writeProgram({
            ctx: args.ctx,
            abiSrc: args.abiSrc,
            abiLink: args.abiLink,
            basename: projectName + "_" + args.contractName,
            funcSources: args.funcSources,
        });
        return {
            funcEntry: result.funcEntry,
            codeFc: result.codeFc,
        };
    };

const getFuncCompiler =
    ({ stdlib }: { stdlib: Stdlib }) =>
    async (args: {
        funcEntry: string;
        codeFc: { name: string; code: string }[];
    }) => {
        // Names don't really matter, as FunC will
        // make definitions available anyway
        const funcVfsStdlibPath = "/stdlib.fc";
        const funcVfsStdlibExPath = "/stdlib_ex.fc";
        const c = await funcCompileWrap({
            entries: [funcVfsStdlibPath, funcVfsStdlibExPath, args.funcEntry],
            sources: [
                {
                    path: funcVfsStdlibPath,
                    content: stdlib.stdlibFunc,
                },
                {
                    path: funcVfsStdlibExPath,
                    content: stdlib.stdlibExFunc,
                },
                ...args.codeFc.map(({ name, code }) => ({
                    path: `/${name}`,
                    content: code,
                })),
            ],
        });
        return { fift: c.fift, codeBoc: c.output };
    };

const decompile = async (codeBoc: Buffer) => {
    // Fift decompiler for generated code debug
    return decompileAll({ src: codeBoc });
};

const getSystemCell = (childContracts: { uid: number; code: Buffer }[]) => {
    if (childContracts.length === 0) {
        return null;
    }
    const depends = Dictionary.empty(
        Dictionary.Keys.Uint(16),
        Dictionary.Values.Cell(),
    );
    for (const { uid, code } of childContracts) {
        depends.set(uid, Cell.fromBoc(code)[0]!);
    }
    return beginCell().storeDict(depends).endCell().toBoc().toString("base64");
};

const compileContractData = (args: {
    ctx: CompilerContext;
    childContracts: { uid: number; code: Buffer }[];
    codeBoc: Buffer;
    init: InitDescription;
}) => ({
    prefix: {
        bits: 1,
        value: 0,
    },
    system: getSystemCell(args.childContracts),
    code: args.codeBoc.toString("base64"),
    args: args.init!.params.map((v) => ({
        name: idText(v.name),
        type: createABITypeRefFromTypeRef(args.ctx, v.type, v.loc),
    })),
});

type CompiledContract = ReturnType<typeof compileContractData>;

const getPackager =
    (mods: {
        compilerVersion: string;
        projectFs: VirtualFileSystem;
        options: Options | undefined;
        entrypoint: string;
    }) =>
    async ({
        allSources,
        contractName,
        contract,
        abi,
    }: {
        contractName: string;
        contract: CompiledContract;
        abi: string;
        allSources: Record<string, Source>;
    }) => {
        const pkg: PackageFileFormat = {
            name: contractName,
            abi,
            code: contract.code,
            init: {
                kind: "direct",
                args: contract.args,
                prefix: contract.prefix,
                deployment: {
                    kind: "system-cell",
                    system: contract.system,
                },
            },
            sources: Object.fromEntries(
                Object.entries(allSources)
                    .filter(([, { origin }]) => origin === "user")
                    .map(([path, { code }]) => [
                        posixNormalize(path.slice(mods.projectFs.root.length)),
                        Buffer.from(code).toString("base64"),
                    ]),
            ),
            compiler: {
                name: "tact",
                version: mods.compilerVersion,
                parameters: JSON.stringify({
                    entrypoint: mods.entrypoint,
                    options: mods.options ?? {},
                }),
            },
        };

        return JSON.stringify(fileFormat.parse(pkg));
    };

const compileBindings = async (args: {
    abiSrc: ContractABI;
    contract: CompiledContract;
}) => {
    return writeTypescript(args.abiSrc, args.contract);
};

const emitReport = async (args: {
    ctx: CompilerContext;
    abiSrc: ContractABI;
    code: string;
    contractName: string;
}) => {
    return writeReport(args.ctx, {
        abi: args.abiSrc,
        code: args.code,
        name: args.contractName,
    });
};

/*
ограничить параллелизм
падение одной из параллельных тасок не должно ронять все
сделать vfs асинхронной
соединить с run
починить тесты
https://github.com/tact-lang/tact/blob/82ce38d11ccc8a163ff6dda73e51c3d215ef08ab/src/pipeline/build.ts#L354-L386
*/

export async function build({
    config: {
        options,
        path: entrypoint,
        name: projectName,
        output: outputDir,
        mode,
    },
    projectFs,
}: {
    config: ConfigProject;
    projectFs: VirtualFileSystem;
}) {
    const compilerVersion = getCompilerVersion();
    const { step } = getStepper(new Logger());
    const ast = getAstFactory();
    const parser = getParser(ast, options?.parser ?? defaultParser);
    const stdlibFs = createVirtualFileSystem("@stdlib", files);
    const stdlib = getStdLib(stdlibFs);
    const contractFs = getFileWriter({
        projectName,
        outputDir,
        projectFs,
    });
    const checkImports = getImporter({
        parseImports: parser.parseImports,
        stdlib,
        stdlibFs,
        projectFs,
        entrypoint,
    });
    const parseImports = getImportParser({
        parse: parser.parse,
    });
    const compileTact = getTactCompiler({
        projectName,
    });
    const compilePackage = getPackager({
        compilerVersion,
        options,
        entrypoint: posixNormalize(entrypoint),
        projectFs,
    });
    const compileFunc = getFuncCompiler({
        stdlib,
    });

    // FIXME: run((define, use) => { ... })
    const imports = step("Imports", () => checkImports());

    const sources = step("Parse", async () => parseImports(await imports));

    const types = step("Types", async () =>
        checkTypes({
            ctx: enableFeatures(new CompilerContext(), options),
            sources: await sources,
            ast,
        }),
    );

    if (mode === "checkOnly") {
        return;
    }

    step('Contracts', async () => {
        const ctx = await types;

        const contracts = getContracts(ctx);

        const built = deferredMap<string, Buffer>(contracts);

        // eslint-disable-next-line @typescript-eslint/no-misused-promises
        for (const contractName of contracts) {
            // const step = step.sub(contractName);

            const emit = contractFs(contractName);

            const abi = step("ABI", async () =>
                compileAbi({
                    ctx,
                    contractName,
                }),
            );

            step("Emit ABI", async () => await emit.abi((await abi).text));

            const tactResult = step("Tact", async () =>
                compileTact({
                    ctx,
                    funcSources: imports.func,
                    contractName: contractName,
                    abiSrc: (await abi).src,
                    abiLink: (await abi).link,
                }),
            );

            step(
                "Emit FunC",
                async () => await emit.funC((await tactResult).codeFc),
            );

            if (mode === "funcOnly") {
                return;
            }

            const funcResult = step("FunC", async () =>
                compileFunc(await tactResult),
            );

            step("Report BoC", async () =>
                built.set(contractName, (await funcResult).codeBoc),
            );

            step(
                "Emit BoC",
                async () => await emit.boc((await funcResult).codeBoc),
            );

            step(
                "Emit FIFT",
                async () => await emit.fift((await funcResult).fift),
            );

            if (mode === "fullWithDecompilation") {
                step("Decompilation", async () => {
                    await emit.fiftDecompiled(
                        await decompile((await funcResult).codeBoc),
                    );
                });
            }

            const contract = step("Interface", async () => {
                await tactResult;
                const { dependsOn, init } = getType(ctx, contractName);
                const childContracts = await Promise.all(
                    dependsOn.map(
                        async ({ uid, name }) => {
                            return { uid, code: await built.get(name) };
                        },
                    ),
                );
                return await compileContractData({
                    ctx,
                    childContracts: await childContracts,
                    codeBoc: (await funcResult).codeBoc,
                    init: init!,
                });
            });

            step(
                "Package",
                async () =>
                    await emit.package(
                        await compilePackage({
                            contractName,
                            allSources: { ...imports.func, ...imports.tact },
                            abi: (await abi).text,
                            contract: await contract,
                        }),
                    ),
            );

            step(
                "Bindings",
                async () =>
                    await emit.bindings(
                        await compileBindings({
                            abiSrc: (await abi).src,
                            contract: await contract,
                        }),
                    ),
            );

            step(
                "Reports",
                async () =>
                    await emit.report(
                        await emitReport({
                            contractName,
                            ctx,
                            abiSrc: (await abi).src,
                            code: (await contract).code,
                        }),
                    ),
            );
        }
    });
}
