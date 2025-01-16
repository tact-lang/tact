/* eslint-disable @typescript-eslint/require-await */
import { beginCell, Cell, Dictionary } from "@ton/core";
import { decompileAll } from "@tact-lang/opcode";
import { writeTypescript } from "../bindings/writeTypescript";
import { featureEnable } from "../config/features";
import { ConfigProject } from "../config/parseConfig";
import { CompilerContext } from "../context/context";
import { funcCompileWrap } from "../func/funcCompile";
import { writeReport } from "../generator/writeReport";
import { ILogger, Logger } from "../context/logger";
import { packageCode } from "../packaging/packageCode";
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
import { resolveImports } from "../imports/resolveImports";
import { getCompilerVersion } from "./version";
import { FactoryAst, getAstFactory, idText } from "../ast/ast";
import { getParser, Parser } from "../grammar";
import { defaultParser } from "../grammar/grammar";
import { getFileWriter, getStdLib } from "./fs";
import { createABI } from "../generator/createABI";
import { writeProgram } from "../generator/writeProgram";
import { calculateIPFSlink } from "../utils/calculateIPFSlink";

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
        const imports = resolveImports({
            entrypoint,
            stdlib,
            projectFs,
            stdlibFs,
            parseImports: parser.parseImports,
        });
        // Parse sources
        const sources = Object.entries(imports.tact).map(([path, { code, origin }]) =>
            parser.parse(code, path, origin),
        );
        // Add information about all the source code entries to the context
        ctx = openContext(ctx, sources);
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

        return imports; // TODO: use this instead of resolution below
    });

    if (!typecheckResult.ok) {
        return typecheckResult;
    }

    const { func: funcSources, tact: tactSources } = typecheckResult.value;

    if (config.mode === "checkOnly") {
        return { ok: true, error: [] };
    }

    // Compile contracts
    // const errorMessages: TactErrorCollection[] = [];
    const built: Record<
        string,
        {
            codeBoc: Buffer;
            pack: (resolveDep: (contract: string) => Buffer) => Promise<void>;
        }
    > = {};
    for (const contract of getContracts(ctx)) {
        const cw = writer(contract);

        const tactResult = await attempt(
            `${contract}: Tact compilation`,
            async () => {
                const abiSrc = createABI(ctx, contract);
                const abi = JSON.stringify(abiSrc);
                const result = writeProgram({
                    ctx,
                    abiSrc,
                    abiLink: await calculateIPFSlink(Buffer.from(abi)),
                    basename: config.name + "_" + contract,
                    funcSources,
                });
                return { ...result, abi };
            },
        );

        if (!tactResult.ok) {
            continue;
        }

        const { codeFc, entrypoint, abi, abiSrc } = tactResult.value;

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
                // Names don't really matter, as FunC will
                // make definitions available anyway
                const funcVfsStdlibPath = "/stdlib.fc";
                const funcVfsStdlibExPath = "/stdlib_ex.fc";
                const c = await funcCompileWrap({
                    entries: [
                        funcVfsStdlibPath,
                        funcVfsStdlibExPath,
                        entrypoint,
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
                        ...codeFc.map(({ name, code }) => ({
                            path: `/${name}`,
                            content: code,
                        })),
                    ],
                });
                return { fift: c.fift, codeBoc: c.output };
            },
        );

        if (!funcResult.ok) {
            continue;
        }

        const { codeBoc, fift } = funcResult.value;

        cw.writeFift(fift);
        cw.writeBoc(codeBoc);

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

            const prefix = {
                bits: 1,
                value: 0,
            };
            const system = systemCell?.toBoc().toString("base64") ?? null;
            const code = codeBoc.toString("base64");
            const args = getType(ctx, contract).init!.params.map((v) => ({
                name: idText(v.name),
                type: createABITypeRefFromTypeRef(ctx, v.type, v.loc),
            }));

            // Package
            cw.writePackage(packageCode({
                name: contract,
                abi,
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
                sources: Object.fromEntries(
                    Object.entries({ ...funcSources, ...tactSources })
                        .filter(([, { origin }]) => origin === 'user')
                        .map(([path, { code }]) => [
                            posixNormalize(path.slice(projectFs.root.length)),
                            Buffer.from(code).toString("base64"),
                        ])
                ),
                compiler: {
                    name: "tact",
                    version: getCompilerVersion(),
                    parameters: JSON.stringify({
                        entrypoint: posixNormalize(config.path),
                        options: config.options ?? {},
                    }),
                },
            }));

            // Bindings
            await attempt(`${contract}: Bindings`, async () => {
                cw.writeBindings(
                    writeTypescript(abiSrc, { code, prefix, system, args }),
                );
            });

            // Reports
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
            codeBoc,
            pack,
        };
    }

    if (config.mode === "funcOnly") {
        return { ok: true, error: [] };
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
