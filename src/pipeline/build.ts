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

export function enableFeatures(
    ctx: CompilerContext,
    logger: ILogger,
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
            logger.debug(`   > 👀 Enabling ${name}`);
            return featureEnable(currentCtx, name);
        }
        return currentCtx;
    }, ctx);
}

const stage =
    <T extends unknown[], U>(
        name: string,
        callback: (...args: T) => Promise<U>,
    ) =>
    (...args: T): Promise<U> => {
        return callback(...args);
    };

// const attempt = async <T>(
//     name: string,
//     f: () => Promise<T>,
// ): Promise<{ ok: true; value: T } | { ok: false; error: Error[] }> => {
//     logger.info(`${name} started`);
//     try {
//         return {
//             ok: true,
//             value: await f(),
//         };
//     } catch (e) {
//         if (!(e instanceof Error)) {
//             throw e;
//         }
//         logger.error(`${name} failed`);
//         logger.error(e);
//         return {
//             ok: false,
//             error: [e],
//         };
//     }
// };

const getImporter = (args: {
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
    stage("Checking imports", async () => {
        // Load all sources
        return resolveImports(args);
    });

const getImportParser = ({
    parse,
}: {
    parse: (src: string, path: string, origin: ItemOrigin) => AstModule;
}) =>
    stage("Parse", async (imports: Imports) => {
        // Parse sources
        return Object.entries(imports.tact).map(([path, { code, origin }]) =>
            parse(code, path, origin),
        );
    });

const checkTypes = stage(
    "Checking types",
    async (args: {
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
    },
);

const getTactCompiler = ({ projectName }: { projectName: string }) =>
    stage(
        `Tact compilation`,
        async (args: {
            contractName: string;
            funcSources: Record<string, Source>;
            ctx: CompilerContext;
        }) => {
            const abiSrc = createABI(args.ctx, args.contractName);
            const abi = JSON.stringify(abiSrc);
            const result = writeProgram({
                ctx: args.ctx,
                abiSrc,
                abiLink: await calculateIPFSlink(Buffer.from(abi)),
                basename: projectName + "_" + args.contractName,
                funcSources: args.funcSources,
            });
            return {
                funcEntry: result.funcEntry,
                codeFc: result.codeFc,
                abiSrc: result.abiSrc,
                abi,
            };
        },
    );

const getFuncCompiler = ({ stdlib }: { stdlib: Stdlib }) =>
    stage(
        `FunC compilation`,
        async (args: {
            funcEntry: string;
            codeFc: { name: string; code: string }[];
        }) => {
            // Names don't really matter, as FunC will
            // make definitions available anyway
            const funcVfsStdlibPath = "/stdlib.fc";
            const funcVfsStdlibExPath = "/stdlib_ex.fc";
            const c = await funcCompileWrap({
                entries: [
                    funcVfsStdlibPath,
                    funcVfsStdlibExPath,
                    args.funcEntry,
                ],
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
        },
    );

const decompile = stage(`Decompilation`, async (codeBoc: Buffer) => {
    // Fift decompiler for generated code debug
    return decompileAll({ src: codeBoc });
});

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

const getPackager = (mods: {
    compilerVersion: string;
    projectFs: VirtualFileSystem;
    options: Options | undefined;
    entrypoint: string;
}) =>
    stage(
        `Package`,
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
                // FIXME
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
                            posixNormalize(
                                path.slice(mods.projectFs.root.length),
                            ),
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
        },
    );

const compileBindings = stage(
    `Bindings`,
    async (args: { abiSrc: ContractABI; contract: CompiledContract }) => {
        return writeTypescript(args.abiSrc, args.contract);
    },
);

const emitReport = stage(
    `Reports`,
    async (args: {
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
    },
);

const runSync = (arr: ((sync: () => Promise<void>) => Promise<void>)[]) => {
    let count = arr.length;
    let resolve: undefined | (() => void);
    const syncP: Promise<void> = new Promise((r) => (resolve = r));
    const sync = async () => {
        --count;
        if (count === 0) resolve?.();
        await syncP;
    };
    return arr.map((task) => task(sync));
};

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
    const logger = new Logger();
    const ast = getAstFactory();
    const parser = getParser(ast, options?.parser ?? defaultParser);
    const stdlibFs = createVirtualFileSystem("@stdlib", files);
    const stdlib = getStdLib(stdlibFs);
    const writeContract = getFileWriter({
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

    const imports = await checkImports();
    const sources = await parseImports(imports);
    const ctx = await checkTypes({
        ctx: enableFeatures(new CompilerContext(), logger, options),
        sources,
        ast,
    });
    if (mode === "checkOnly") {
        return;
    }
    const built: Record<string, Buffer> = {};
    const contracts = getContracts(ctx);
    const tasks = contracts.map(
        (contractName) => async (sync: () => Promise<void>) => {
            const emit = writeContract(contractName);
            const { codeFc, funcEntry, abi, abiSrc } = await compileTact({
                ctx,
                funcSources: imports.func,
                contractName: contractName,
            });
            await emit.funC(files);
            await emit.abi(abi);
            if (mode === "funcOnly") {
                return;
            }
            const { codeBoc, fift } = await compileFunc({
                codeFc,
                funcEntry,
            });
            await emit.fift(fift);
            await emit.boc(codeBoc);
            if (mode === "fullWithDecompilation") {
                await emit.fiftDecompiled(await decompile(codeBoc));
            }
            built[contractName] = codeBoc;
            await sync();
            const { dependsOn, init } = getType(ctx, contractName);
            const childContracts = dependsOn.map(({ uid, name }) => {
                const code = built[name];
                if (typeof code === "undefined") {
                    throw new Error(`Dependency ${name} was not found`);
                }
                return { uid, code };
            });
            const contract = compileContractData({
                ctx,
                childContracts,
                codeBoc,
                init: init!,
            });
            await emit.package(
                await compilePackage({
                    contractName,
                    allSources: { ...imports.func, ...imports.tact },
                    abi,
                    contract,
                }),
            );
            await emit.bindings(
                await compileBindings({
                    abiSrc,
                    contract,
                }),
            );
            await emit.report(
                await emitReport({
                    contractName,
                    ctx,
                    abiSrc,
                    code: contract.code,
                }),
            );
        },
    );

    await Promise.all(runSync(tasks));
}
