import { beginCell, Cell, Dictionary } from "@ton/core";
import {
    disassembleRoot,
    Cell as OpcodeCell,
    AssemblyWriter,
} from "@tact-lang/opcode";
import type { WrappersConstantDescription } from "@/bindings/writeTypescript";
import { writeTypescript } from "@/bindings/writeTypescript";
import { featureEnable } from "@/config/features";
import type { Project } from "@/config/parseConfig";
import { CompilerContext } from "@/context/context";
import { funcCompile } from "@/func/funcCompile";
import { writeReport } from "@/generator/writeReport";
import { getRawAST } from "@/context/store";
import files from "@/stdlib/stdlib";
import type { ILogger } from "@/context/logger";
import { Logger } from "@/context/logger";
import type { PackageFileFormat } from "@/packaging/fileFormat";
import { packageCode } from "@/packaging/packageCode";
import {
    createABITypeRefFromTypeRef,
    resolveABIType,
} from "@/types/resolveABITypeRef";
import { getContracts, getType } from "@/types/resolveDescriptors";
import { posixNormalize } from "@/utils/filePath";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import type { VirtualFileSystem } from "@/vfs/VirtualFileSystem";
import { compile } from "@/pipeline/compile";
import { precompile } from "@/pipeline/precompile";
import { getCompilerVersion } from "@/pipeline/version";
import type { FactoryAst } from "@/ast/ast-helpers";
import { getAstFactory, idText } from "@/ast/ast-helpers";
import type { TactErrorCollection } from "@/error/errors";
import { TactError } from "@/error/errors";
import type { Parser } from "@/grammar";
import { getParser } from "@/grammar";
import { topSortContracts } from "@/pipeline/utils";
import type { TypeDescription } from "@/types/types";

export function enableFeatures(
    ctx: CompilerContext,
    logger: ILogger,
    config: Project,
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
        {
            option: config.options.safety?.nullChecks ?? true,
            name: "nullChecks",
        },
        {
            option:
                config.options.optimizations?.alwaysSaveContractData ?? false,
            name: "alwaysSaveContractData",
        },
        {
            option:
                config.options.optimizations
                    ?.internalExternalReceiversOutsideMethodsMap ?? true,
            name: "internalExternalReceiversOutsideMethodsMap",
        },
        {
            option: config.options.enableLazyDeploymentCompletedGetter ?? false,
            name: "lazyDeploymentCompletedGetter",
        },
    ];
    return features.reduce((currentCtx, { option, name }) => {
        if (option) {
            logger.debug(`   > 👀 Enabling ${name}`);
            return featureEnable(currentCtx, name);
        }
        return currentCtx;
    }, ctx);
}

export type CompilationCtx = {
    readonly project: VirtualFileSystem;
    readonly stdlib: VirtualFileSystem;
    readonly config: Project;
    readonly logger: ILogger;
    readonly compilerInfo: string;

    ctx: CompilerContext;
    built: BuildRecord;
    errorMessages: TactErrorCollection[];
};

export type CompileTactRes = {
    readonly abi: string;
    readonly codeFunC: FuncSources[];
    readonly entrypointPath: string;
    readonly constants: {
        readonly name: string;
        readonly value: string | undefined;
        readonly fromContract: boolean;
    }[];
};

export type FuncSources = {
    readonly path: string;
    readonly content: string;
};

export type BuildRecord = Record<
    string,
    | {
          codeBoc: Buffer;
          abi: string;
          constants: WrappersConstantDescription[];
          contract: TypeDescription;
      }
    | undefined
>;

export type BuildResult = {
    readonly ok: boolean;
    readonly error: TactErrorCollection[];
};

export const BuildOk = (): BuildResult => ({ ok: true, error: [] });
export const BuildFail = (error: TactErrorCollection[]): BuildResult => ({
    ok: false,
    error,
});

export async function build(args: {
    config: Project;
    project: VirtualFileSystem;
    stdlib: string | VirtualFileSystem;
    logger?: ILogger;
    parser?: Parser;
    ast?: FactoryAst;
}): Promise<BuildResult> {
    const { config, project } = args;
    const stdlib =
        typeof args.stdlib === "string"
            ? createVirtualFileSystem(args.stdlib, files)
            : args.stdlib;
    const ast: FactoryAst = args.ast ?? getAstFactory();
    const parser: Parser = args.parser ?? getParser(ast);
    const logger: ILogger = args.logger ?? new Logger();

    // Configure context
    let ctx: CompilerContext = new CompilerContext();
    const cfg: string = JSON.stringify({
        entrypoint: posixNormalize(config.path),
        options: config.options ?? {},
    });
    ctx = enableFeatures(ctx, logger, config);

    // Precompile
    try {
        ctx = precompile(ctx, project, stdlib, config.path, parser, ast);
    } catch (e) {
        logger.error(
            config.mode === "checkOnly" || config.mode === "funcOnly"
                ? "Syntax and type checking failed"
                : "Tact compilation failed",
        );

        // show an error with a backtrace only in verbose mode
        if (e instanceof TactError && config.verbose && config.verbose < 2) {
            logger.error(e.message);
        } else {
            logger.error(e as Error);
        }
        return { ok: false, error: [e as Error] };
    }

    if (config.mode === "checkOnly") {
        logger.info("✔️ Syntax and type checking succeeded.");
        return { ok: true, error: [] };
    }

    const compilationCtx: CompilationCtx = {
        ctx,
        config,
        logger,
        built: {},
        project,
        stdlib,
        compilerInfo: cfg,
        errorMessages: [],
    };

    return mainCompile(compilationCtx);
}

async function mainCompile(ctx: CompilationCtx): Promise<BuildResult> {
    // Compile contracts
    const allContracts = getContracts(ctx.ctx);

    // Sort contracts in topological order
    // If a cycle is found, return undefined
    const sortedContracts = topSortContracts(allContracts);
    if (sortedContracts !== undefined) {
        ctx.ctx = featureEnable(ctx.ctx, "optimizedChildCode");
    }

    const contracts = sortedContracts ?? allContracts;

    let ok = true;
    for (const contract of contracts) {
        ok &&= await compileContract(contract, ctx);
    }

    if (!ok) {
        ctx.logger.info("💥 Compilation failed. Skipping packaging");
        return BuildFail(ctx.errorMessages);
    }

    if (ctx.config.mode === "funcOnly") {
        ctx.logger.info("✔️ FunC code generation succeeded.");
        return BuildFail(ctx.errorMessages);
    }

    const packages = doPackage(ctx);
    if (!packages) {
        return BuildFail(ctx.errorMessages);
    }

    const bindingsRes = doBindings(ctx, packages);
    if (!bindingsRes) {
        return BuildFail(ctx.errorMessages);
    }

    return doReports(ctx, packages);
}

async function compileContract(contract: TypeDescription, ctx: CompilationCtx) {
    const { project, config, logger, built, errorMessages } = ctx;

    const contractName = contract.name;

    // Compiling contract to func
    logger.info(`   > ${contractName}: tact compiler`);

    const compileRes = await compileTact(ctx, contractName);
    if (!compileRes) {
        return false;
    }

    if (config.mode === "funcOnly") {
        return true;
    }

    const codeBoc = await compileFunc(
        ctx,
        contractName,
        compileRes.entrypointPath,
        compileRes.codeFunC,
    );

    if (typeof codeBoc === "undefined") {
        return false;
    }

    const { abi, constants } = compileRes;
    // Add to built map
    built[contractName] = {
        codeBoc,
        abi,
        constants,
        contract,
    };

    if (config.mode === "fullWithDecompilation") {
        // Fift decompiler for generated code debug
        logger.info(`   > ${contractName}: fift decompiler`);
        let codeFiftDecompiled: string;
        try {
            const cell = OpcodeCell.fromBoc(codeBoc).at(0);
            if (typeof cell === "undefined") {
                throw new Error("Cannot create Cell from BoC file");
            }

            const program = disassembleRoot(cell, { computeRefs: true });
            codeFiftDecompiled = AssemblyWriter.write(program, {
                useAliases: true,
            });

            const pathCodeFifDec = project.resolve(
                config.output,
                `${config.name}_${contractName}.rev.fif`,
            );

            project.writeFile(pathCodeFifDec, codeFiftDecompiled);
        } catch (e) {
            logger.error("Fift decompiler crashed");
            logger.error(e as Error);
            errorMessages.push(e as Error);
            return false;
        }
    }
    return true;
}

async function compileFunc(
    ctx: CompilationCtx,
    contract: string,
    entrypointPath: string,
    codeFunC: FuncSources[],
): Promise<Buffer | undefined> {
    const { project, config, logger, errorMessages, stdlib } = ctx;

    const pathCodeBoc = project.resolve(
        config.output,
        // need to keep `.code.boc` here because Blueprint looks for this pattern
        `${config.name}_${contract}.code.boc`,
    );
    const pathCodeFif = project.resolve(
        config.output,
        `${config.name}_${contract}.fif`,
    );

    // Compiling contract to TVM
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
                ...codeFunC,
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

        project.writeFile(pathCodeFif, c.fift);
        project.writeFile(pathCodeBoc, c.output);
        return c.output;
    } catch (e) {
        logger.error("FunC compiler crashed");
        logger.error(e as Error);
        errorMessages.push(e as Error);
        return undefined;
    }
}

async function compileTact(
    ctx: CompilationCtx,
    contract: string,
): Promise<CompileTactRes | undefined> {
    const { project, config, built } = ctx;

    const pathAbi = project.resolve(
        config.output,
        `${config.name}_${contract}.abi`,
    );

    try {
        const res = await compile(
            ctx.ctx,
            contract,
            `${config.name}_${contract}`,
            built,
        );

        for (const files of res.output.files) {
            const ffc = project.resolve(config.output, files.name);
            project.writeFile(ffc, files.code);
        }

        project.writeFile(pathAbi, res.output.abi);
        const abi = res.output.abi;
        const codeFunC: FuncSources[] = res.output.files.map((v) => ({
            path: posixNormalize(project.resolve(config.output, v.name)),
            content: v.code,
        }));

        const entrypointPath = res.output.entrypoint;
        const constants = [...res.output.constants];

        return { abi, codeFunC, entrypointPath, constants };
    } catch (e) {
        ctx.logger.error("Tact compilation failed");
        // show an error with a backtrace only in verbose mode
        if (e instanceof TactError && config.verbose && config.verbose < 2) {
            ctx.logger.error(e.message);
        } else {
            ctx.logger.error(e as Error);
        }
        ctx.errorMessages.push(e as Error);
        return undefined;
    }
}

function doPackage(ctx: CompilationCtx): PackageFileFormat[] | undefined {
    // Package
    ctx.logger.info("   > Packaging");

    const packages: PackageFileFormat[] = [];

    const contracts = getContracts(ctx.ctx).map((v) => v.name);
    for (const contract of contracts) {
        const pkg = packageContract(ctx, contract);
        if (!pkg) continue;
        packages.push(pkg);
    }

    return packages;
}

function packageContract(
    ctx: CompilationCtx,
    contract: string,
): PackageFileFormat | undefined {
    const { project, config, logger, built, errorMessages, stdlib } = ctx;

    logger.info("   > " + contract);
    const artifacts = built[contract];
    if (!artifacts) {
        const message = `   > ${contract}: no artifacts found`;
        logger.error(message);
        errorMessages.push(new Error(message));
        return undefined;
    }

    // System cell
    const depends = Dictionary.empty(
        Dictionary.Keys.Uint(16),
        Dictionary.Values.Cell(),
    );

    const ct = getType(ctx.ctx, contract);
    for (const c of ct.dependsOn) {
        const cd = built[c.name];
        if (!cd) {
            const message = `   > ${c.name}: no artifacts found`;
            logger.error(message);
            errorMessages.push(new Error(message));
            return undefined;
        }
        depends.set(c.uid, Cell.fromBoc(cd.codeBoc)[0]!);
    }

    const systemCell =
        ct.dependsOn.length > 0
            ? beginCell().storeDict(depends).endCell()
            : null;

    // Collect sources
    const sources: Record<string, string> = {};
    const rawAst = getRawAST(ctx.ctx);
    for (const source of [...rawAst.funcSources, ...rawAst.sources]) {
        if (
            source.path.startsWith(project.root) &&
            !source.path.startsWith(stdlib.root)
        ) {
            const source_path = posixNormalize(
                source.path.slice(project.root.length),
            );
            sources[source_path] = Buffer.from(source.code).toString("base64");
        }
    }

    const descriptor = getType(ctx.ctx, contract);
    const init = descriptor.init!;

    const args =
        init.kind !== "contract-params"
            ? init.params.map((v) => ({
                  // FIXME: wildcards in ABI?
                  name: v.name.kind === "id" ? v.name.text : "_",
                  type: createABITypeRefFromTypeRef(ctx.ctx, v.type, v.loc),
              }))
            : (init.contract.params ?? []).map((v) => ({
                  name: idText(v.name),
                  type: resolveABIType(v),
              }));

    // Package
    const pkg: PackageFileFormat = {
        name: contract,
        abi: artifacts.abi,
        code: artifacts.codeBoc.toString("base64"),
        init: {
            kind: "direct",
            args,
            prefix:
                init.kind !== "contract-params"
                    ? {
                          bits: 1,
                          value: 0,
                      }
                    : undefined,
            deployment: {
                kind: "system-cell",
                system: systemCell?.toBoc().toString("base64") ?? null,
            },
        },
        sources,
        compiler: {
            name: "tact",
            version: getCompilerVersion(),
            parameters: ctx.compilerInfo,
        },
    };

    const pkgData = packageCode(pkg);
    const pathPkg = project.resolve(
        config.output,
        config.name + "_" + contract + ".pkg",
    );
    project.writeFile(pathPkg, pkgData);

    return pkg;
}

function doBindings(ctx: CompilationCtx, packages: PackageFileFormat[]) {
    const { project, config, logger, built } = ctx;

    // Bindings
    logger.info("   > Bindings");

    for (const pkg of packages) {
        logger.info(`   > ${pkg.name}`);
        if (pkg.init.deployment.kind !== "system-cell") {
            const message = `   > ${pkg.name}: unsupported deployment kind ${pkg.init.deployment.kind}`;
            logger.error(message);
            ctx.errorMessages.push(new Error(message));
            return false;
        }

        try {
            const bindingsServer = writeTypescript(
                JSON.parse(pkg.abi),
                ctx.ctx,
                built[pkg.name]?.constants ?? [],
                built[pkg.name]?.contract,
                {
                    code: pkg.code,
                    prefix: pkg.init.prefix,
                    system: pkg.init.deployment.system,
                    args: pkg.init.args,
                },
            );
            project.writeFile(
                project.resolve(
                    config.output,
                    config.name + "_" + pkg.name + ".ts",
                ),
                bindingsServer,
            );
        } catch (e) {
            const error = e as Error;
            error.message = `Bindings compiler crashed: ${error.message}`;
            logger.error(error);
            ctx.errorMessages.push(error);
            return false;
        }
    }

    return true;
}

function doReports(
    ctx: CompilationCtx,
    packages: PackageFileFormat[],
): BuildResult {
    const { project, config, logger } = ctx;

    // Reports
    logger.info("   > Reports");

    for (const pkg of packages) {
        logger.info("   > " + pkg.name);
        try {
            const report = writeReport(ctx.ctx, pkg);
            const pathBindings = project.resolve(
                config.output,
                config.name + "_" + pkg.name + ".md",
            );
            project.writeFile(pathBindings, report);
        } catch (e) {
            const error = e as Error;
            error.message = `Report generation crashed: ${error.message}`;
            logger.error(error);
            ctx.errorMessages.push(error);
            return BuildFail(ctx.errorMessages);
        }
    }

    return BuildOk();
}
