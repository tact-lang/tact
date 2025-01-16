/* eslint-disable @typescript-eslint/require-await */
import { beginCell, Cell, Dictionary } from "@ton/core";
import { decompileAll } from "@tact-lang/opcode";
import { writeTypescript } from "../bindings/writeTypescript";
import { featureEnable } from "../config/features";
import { ConfigProject } from "../config/parseConfig";
import { CompilerContext } from "../context/context";
import { funcCompileWrap } from "../func/funcCompile";
import { writeReport } from "../generator/writeReport";
import { getRawAST } from "../context/store";
import { ILogger, Logger } from "../context/logger";
import { PackageFileFormat } from "../packaging/fileFormat";
import { packageCode } from "../packaging/packageCode";
import { createABITypeRefFromTypeRef } from "../types/resolveABITypeRef";
import { getContracts, getType } from "../types/resolveDescriptors";
import { posixNormalize } from "../utils/filePath";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { compile } from "./compile";
import { resolveDescriptors } from "../types/resolveDescriptors";
import { resolveAllocations } from "../storage/resolveAllocation";
import { openContext } from "../context/store";
import { resolveStatements } from "../types/resolveStatements";
import { resolveErrors } from "../types/resolveErrors";
import { resolveSignatures } from "../types/resolveSignatures";
import { resolveImports } from "../imports/resolveImports";
import { getCompilerVersion } from "./version";
import { FactoryAst, getAstFactory, idText } from "../ast/ast";
import { TactErrorCollection } from "../error/errors";
import { getParser, Parser } from "../grammar";
import { defaultParser } from "../grammar/grammar";

export function enableFeatures(
    ctx: CompilerContext,
    logger: ILogger,
    config: ConfigProject,
): CompilerContext {
    if (config.options === undefined) {
        return ctx;
    }
    const features = [
        { option: config.options.debug, name: "debug" },
        { option: config.options.external, name: "external" },
        { option: config.options.experimental?.inline, name: "inline" },
        { option: config.options.ipfsAbiGetter, name: "ipfsAbiGetter" },
        { option: config.options.interfacesGetter, name: "interfacesGetter" },
    ];
    return features.reduce((currentCtx, { option, name }) => {
        if (option) {
            logger.debug(`   > 👀 Enabling ${name}`);
            return featureEnable(currentCtx, name);
        }
        return currentCtx;
    }, ctx);
}

type Stdlib = {
    stdlibCode: string;
    stdlibExCode: string;
};

const getStdLib = (stdlib: VirtualFileSystem): Stdlib => {
    const stdlibPath = stdlib.resolve("stdlib.fc");
    const stdlibCode = stdlib.readFile(stdlibPath).toString();
    const stdlibExPath = stdlib.resolve("stdlib_ex.fc");
    const stdlibExCode = stdlib.readFile(stdlibExPath).toString();

    return {
        stdlibCode,
        stdlibExCode,
    };
};

const getFileWriter = (config: ConfigProject, project: VirtualFileSystem) => {
    const outputPath: string = config.output;

    return (contract: string) => {
        const writeExt = (ext: string) => (code: string | Buffer) => {
            project.writeFile(
                project.resolve(
                    outputPath,
                    `${config.name}_${contract}.${ext}`,
                ),
                code,
            );
        };

        return {
            writeAbi: writeExt("abi"),
            writeBoc: writeExt("code.boc"),
            writeFift: writeExt("code.fif"),
            writeFiftDecompiled: writeExt("code.rev.fif"),
            writePackage: writeExt("pkg"),
            writeBindings: writeExt("ts"),
            writeReport: writeExt("md"),
            writeFunC: (name: string, code: string) => {
                project.writeFile(project.resolve(outputPath, name), code);
            },
        };
    };
};

export async function build({
    config,
    projectFs,
    stdlibFs,
    logger = new Logger(),
    ast = getAstFactory(),
    parser = getParser(ast, config.options?.parser ?? defaultParser),
}: {
    config: ConfigProject;
    projectFs: VirtualFileSystem;
    stdlibFs: VirtualFileSystem;
    logger?: ILogger;
    parser?: Parser;
    ast?: FactoryAst;
}) /*: Promise<{ readonly ok: boolean; readonly error: Error[] }>*/ {
    const stdlib = getStdLib(stdlibFs);
    const writer = getFileWriter(config, projectFs);

    // Configure context
    let ctx: CompilerContext = new CompilerContext();
    const cfg: string = JSON.stringify({
        entrypoint: posixNormalize(config.path),
        options: config.options ?? {},
    });
    ctx = enableFeatures(ctx, logger, config);

    const entrypoint = config.path;

    const attempt = async <T>(
        name: string,
        f: () => Promise<T>,
    ): Promise<{ ok: true; value: T } | { ok: false; error: Error[] }> => {
        logger.info(`${name} started`);
        try {
            return {
                ok: true,
                value: await f(),
            };
        } catch (e) {
            if (!(e instanceof Error)) {
                throw e;
            }
            logger.error(`${name} failed`);
            logger.error(e);
            return {
                ok: false,
                error: [e],
            };
        }
    };

    const typecheckResult = await attempt("Checking types", async () => {
        // Load all sources
        const imported = resolveImports({
            entrypoint,
            projectFs,
            stdlibFs,
            parser,
        });
        // Add information about all the source code entries to the context
        ctx = openContext(ctx, imported.tact, imported.func, parser);
        // First load type descriptors and check that they all have valid signatures
        ctx = resolveDescriptors(ctx, ast);
        // This creates TLB-style type definitions
        ctx = resolveSignatures(ctx, ast);
        // This checks and resolves all statements
        ctx = resolveStatements(ctx, ast);
        // This extracts error messages
        ctx = resolveErrors(ctx, ast);
        // This creates allocations for all defined types
        ctx = resolveAllocations(ctx);
    });

    if (!typecheckResult.ok) {
        return typecheckResult;
    }

    if (config.mode === "checkOnly") {
        logger.info("✔️ Syntax and type checking succeeded.");
        return { ok: true, error: [] };
    }

    // Compile contracts
    const errorMessages: TactErrorCollection[] = [];
    const built: Record<
        string,
        {
            codeBoc: Buffer;
            abi: string;
            pack: (resolveDep: (contract: string) => Buffer) => Promise<void>;
        }
    > = {};
    for (const contract of getContracts(ctx)) {
        const cw = writer(contract);

        const tactResult = await attempt(
            `${contract}: Tact compilation`,
            async () => {
                const res = await compile(
                    ctx,
                    contract,
                    config.name + "_" + contract,
                );
                return {
                    abi: res.output.abi,
                    abiSrc: res.output.abiSrc,
                    codeFc: res.output.files,
                    codeEntrypoint: res.output.entrypoint,
                };
            },
        );

        if (!tactResult.ok) {
            errorMessages.push(...tactResult.error);
            continue;
        }

        const { codeFc, codeEntrypoint, abi, abiSrc } = tactResult.value;

        for (const files of codeFc) {
            cw.writeFunC(files.name, files.code);
        }
        cw.writeAbi(abi);

        if (config.mode === "funcOnly") {
            continue;
        }

        // Compiling contract to TVM
        const funcResult = await attempt(
            `${contract}: FunC compilation`,
            async () => {
                const funcVfsStdlibPath = "/stdlib.fc";
                const funcVfsStdlibExPath = "/stdlib_ex.fc";
                const c = await funcCompileWrap({
                    entries: [
                        funcVfsStdlibPath,
                        funcVfsStdlibExPath,
                        codeEntrypoint,
                    ],
                    sources: [
                        {
                            path: funcVfsStdlibPath,
                            content: stdlib.stdlibCode,
                        },
                        {
                            path: funcVfsStdlibExPath,
                            content: stdlib.stdlibExCode,
                        },
                        ...codeFc.map(({ name, code }) => ({
                            path: `/${name}`,
                            content: code,
                        })),
                    ],
                    logger,
                });
                return { fift: c.fift, codeBoc: c.output };
            },
        );

        if (!funcResult.ok) {
            errorMessages.push(...funcResult.error);
            continue;
        }

        const { codeBoc, fift } = funcResult.value;

        cw.writeFift(fift);
        cw.writeBoc(codeBoc);

        const artifacts = { codeBoc, abi };

        const pack = async (resolveDep: (contract: string) => Buffer) => {
            // System cell
            const depends = Dictionary.empty(
                Dictionary.Keys.Uint(16),
                Dictionary.Values.Cell(),
            );
            const { dependsOn } = getType(ctx, contract);
            for (const c of dependsOn) {
                depends.set(c.uid, Cell.fromBoc(resolveDep(c.name))[0]!);
            }
            const systemCell =
                dependsOn.length > 0
                    ? beginCell().storeDict(depends).endCell()
                    : null;

            // Collect sources
            const sources: Record<string, string> = {};
            const rawAst = getRawAST(ctx);
            for (const source of [...rawAst.funcSources, ...rawAst.sources]) {
                if (
                    source.path.startsWith(projectFs.root) &&
                    !source.path.startsWith(stdlibFs.root)
                ) {
                    const source_path = posixNormalize(
                        source.path.slice(projectFs.root.length),
                    );
                    sources[source_path] = Buffer.from(source.code).toString(
                        "base64",
                    );
                }
            }

            const prefix = {
                bits: 1,
                value: 0,
            };
            const system = systemCell?.toBoc().toString("base64") ?? null;
            const code = artifacts.codeBoc.toString("base64");
            const args = getType(ctx, contract).init!.params.map((v) => ({
                name: idText(v.name),
                type: createABITypeRefFromTypeRef(ctx, v.type, v.loc),
            }));

            // Package
            const pkg: PackageFileFormat = {
                name: contract,
                abi: artifacts.abi,
                code,
                init: {
                    kind: "direct",
                    args,
                    prefix,
                    deployment: {
                        kind: "system-cell",
                        system,
                    },
                },
                sources,
                compiler: {
                    name: "tact",
                    version: getCompilerVersion(),
                    parameters: cfg,
                },
            };

            cw.writePackage(packageCode(pkg));

            // Bindings
            await attempt(`${contract}: Bindings`, async () => {
                cw.writeBindings(
                    writeTypescript(abiSrc, { code, prefix, system, args }),
                );
            });

            await attempt(`${contract}: Reports`, async () => {
                cw.writeReport(
                    writeReport(ctx, { abi: abiSrc, code, name: contract }),
                );
            });
        };

        if (config.mode === "fullWithDecompilation") {
            // Fift decompiler for generated code debug
            await attempt(`${contract}: Decompilation`, async () => {
                cw.writeFiftDecompiled(decompileAll({ src: codeBoc }));
            });
        }

        // Add to built map
        built[contract] = {
            abi,
            codeBoc,
            pack,
        };
    }

    if (errorMessages.length > 0) {
        logger.info("💥 Compilation failed. Skipping packaging");
        return { ok: false, error: errorMessages };
    }

    if (config.mode === "funcOnly") {
        logger.info("✔️ FunC code generation succeeded.");
        return { ok: true, error: errorMessages };
    }

    const resolveDep = (contract: string) => {
        const cd = built[contract];
        if (typeof cd === "undefined") {
            throw new Error(`Dependency ${contract} was not found`);
        }
        return cd.codeBoc;
    };

    for (const { pack } of Object.values(built)) {
        await pack(resolveDep);
    }

    return { ok: true, error: [] };
}
