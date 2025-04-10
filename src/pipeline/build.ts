import { beginCell, Cell, Dictionary } from "@ton/core";
import {
    AssemblyWriter,
    Cell as OpcodeCell,
    disassembleRoot,
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

export type BuildContext = {
    readonly project: VirtualFileSystem;
    readonly stdlib: VirtualFileSystem;
    readonly config: Project;
    readonly logger: ILogger;
    readonly compilerInfo: string;

    readonly built: BuildRecord;
    readonly errorMessages: TactErrorCollection[];

    ctx: CompilerContext;
};

export type CompileTactRes = {
    readonly abi: string;
    readonly funcSource: Readonly<FuncSource>;
    readonly entrypointPath: string;
    readonly constants: {
        readonly name: string;
        readonly value: string | undefined;
        readonly fromContract: boolean;
    }[];
};

export type FuncSource = {
    readonly path: string;
    readonly content: string;
};

export type Packages = readonly PackageFileFormat[];

export type BuiltContract = {
    readonly abi: string;
    readonly codeBoc: Buffer;
    readonly constants: readonly WrappersConstantDescription[];
    readonly contract: TypeDescription;
};

export type BuildRecord = Record<string, BuiltContract | undefined>;

export type CompiledContract =
    | GeneratedOnlyFunc
    | CompiledSuccessfully
    | CompilationFailed;

export type GeneratedOnlyFunc = {
    readonly $: "GeneratedOnlyFunc";
};
export const GeneratedOnlyFunc: GeneratedOnlyFunc = { $: "GeneratedOnlyFunc" };

export type CompiledSuccessfully = {
    readonly $: "CompiledSuccessfully";
    readonly built: Readonly<BuiltContract>;
};
export const CompiledSuccessfully = (
    built: BuiltContract,
): CompiledSuccessfully => ({
    $: "CompiledSuccessfully",
    built,
});

export type CompilationFailed = {
    readonly $: "CompilationFailed";
};
export const CompilationFailed: CompilationFailed = { $: "CompilationFailed" };

// Represent dictionary with child contracts code or empty if no child contracts
export type ChildContractsDict = NonEmptyChildContractsDict | NoChildContracts;

export type NonEmptyChildContractsDict = {
    readonly $: "NonEmptyChildContractsDict";
    readonly cell: Cell;
};
export const NonEmptyChildContractsDict = (
    cell: Cell,
): NonEmptyChildContractsDict => ({
    $: "NonEmptyChildContractsDict",
    cell,
});

export type NoChildContracts = {
    readonly $: "NoChildContracts";
};
export const NoChildContracts: NoChildContracts = { $: "NoChildContracts" };

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
    readonly config: Project;
    readonly project: VirtualFileSystem;
    readonly stdlib: string | VirtualFileSystem;
    readonly logger?: ILogger;
    readonly parser?: Parser;
    readonly ast?: FactoryAst;
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
    let ctx = new CompilerContext();
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
        return BuildFail([e as Error]);
    }

    if (config.mode === "checkOnly") {
        logger.info("✔️ Syntax and type checking succeeded.");
        return BuildOk();
    }

    const compilerInfo: string = JSON.stringify({
        entrypoint: posixNormalize(config.path),
        options: config.options ?? {},
    });

    const compilationCtx: BuildContext = {
        config,
        logger,
        project,
        stdlib,
        compilerInfo,
        ctx,
        built: {},
        errorMessages: [],
    };

    return mainCompile(compilationCtx);
}

async function mainCompile(bCtx: BuildContext): Promise<BuildResult> {
    const ok = await doCompileContracts(bCtx);
    if (!ok) {
        bCtx.logger.info("💥 Compilation failed. Skipping packaging");
        return BuildFail(bCtx.errorMessages);
    }

    if (bCtx.config.mode === "funcOnly") {
        bCtx.logger.info("✔️ FunC code generation succeeded.");
        return BuildOk();
    }

    const packages = doPackaging(bCtx);
    if (!packages) {
        return BuildFail(bCtx.errorMessages);
    }

    const bindingsRes = doBindings(bCtx, packages);
    if (!bindingsRes) {
        return BuildFail(bCtx.errorMessages);
    }

    const reportsRes = doReports(bCtx, packages);
    if (!reportsRes) {
        return BuildFail(bCtx.errorMessages);
    }

    return BuildOk();
}

async function doCompileContracts(bCtx: BuildContext) {
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

async function compileFunc(
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

async function compileTact(
    bCtx: BuildContext,
    contract: string,
): Promise<CompileTactRes | undefined> {
    const { project, config } = bCtx;

    try {
        const res = await compile(
            bCtx.ctx,
            contract,
            `${config.name}_${contract}`,
            bCtx.built,
        );

        const { funcFile } = res.output;

        const pathFunc = project.resolve(config.output, funcFile.name);
        project.writeFile(pathFunc, funcFile.code);

        const pathAbi = project.resolve(
            config.output,
            `${config.name}_${contract}.abi`,
        );
        project.writeFile(pathAbi, res.output.abi);

        const funcSource: FuncSource = {
            path: posixNormalize(project.resolve(config.output, funcFile.name)),
            content: funcFile.code,
        };

        const abi = res.output.abi;
        const entrypointPath = res.output.entrypoint;
        const constants = [...res.output.constants];

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

function doPackaging(bCtx: BuildContext): Packages | undefined {
    bCtx.logger.info("   > Packaging");

    const packages: PackageFileFormat[] = [];

    const contracts = getContracts(bCtx.ctx);
    for (const contract of contracts) {
        const pkg = packageContract(bCtx, contract.name);
        if (!pkg) continue;
        packages.push(pkg);
    }

    return packages;
}

function buildChildContractsDict(
    bCtx: BuildContext,
    contract: string,
): ChildContractsDict | undefined {
    const depends = Dictionary.empty(
        Dictionary.Keys.Uint(16),
        Dictionary.Values.Cell(),
    );

    const contractType = getType(bCtx.ctx, contract);

    for (const dependencyContract of contractType.dependsOn) {
        const dependencyContractBuild = bCtx.built[dependencyContract.name];
        if (!dependencyContractBuild) {
            const message = `   > ${dependencyContract.name}: no artifacts found`;
            bCtx.logger.error(message);
            bCtx.errorMessages.push(new Error(message));
            return undefined;
        }

        const dependencyContractCell = Cell.fromBoc(
            dependencyContractBuild.codeBoc,
        )[0]!;
        depends.set(dependencyContract.uid, dependencyContractCell);
    }

    if (contractType.dependsOn.length === 0) {
        return NoChildContracts;
    }

    return NonEmptyChildContractsDict(beginCell().storeDict(depends).endCell());
}

function packageContract(
    bCtx: BuildContext,
    contract: string,
): PackageFileFormat | undefined {
    const { project, config, logger, errorMessages, stdlib } = bCtx;

    logger.info("   > " + contract);
    const artifacts = bCtx.built[contract];
    if (!artifacts) {
        const message = `   > ${contract}: no artifacts found`;
        logger.error(message);
        errorMessages.push(new Error(message));
        return undefined;
    }

    const childContractsDict = buildChildContractsDict(bCtx, contract);
    if (childContractsDict === undefined) {
        return undefined;
    }

    // Collect sources
    const sources: Record<string, string> = {};
    const rawAst = getRawAST(bCtx.ctx);
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

    const descriptor = getType(bCtx.ctx, contract);
    const init = descriptor.init!;

    const args =
        init.kind !== "contract-params"
            ? init.params.map((v) => ({
                  // FIXME: wildcards in ABI?
                  name: v.name.kind === "id" ? v.name.text : "_",
                  type: createABITypeRefFromTypeRef(bCtx.ctx, v.type, v.loc),
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
                system:
                    childContractsDict.$ === "NonEmptyChildContractsDict"
                        ? childContractsDict.cell.toBoc().toString("base64")
                        : null,
            },
        },
        sources,
        compiler: {
            name: "tact",
            version: getCompilerVersion(),
            parameters: bCtx.compilerInfo,
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

function doBindings(bCtx: BuildContext, packages: Packages) {
    const { project, config, logger } = bCtx;

    logger.info("   > Bindings");

    for (const pkg of packages) {
        logger.info(`   > ${pkg.name}`);

        if (pkg.init.deployment.kind !== "system-cell") {
            const message = `   > ${pkg.name}: unsupported deployment kind ${pkg.init.deployment.kind}`;
            logger.error(message);
            bCtx.errorMessages.push(new Error(message));
            return false;
        }

        try {
            const bindingsServer = writeTypescript(
                JSON.parse(pkg.abi),
                bCtx.ctx,
                bCtx.built[pkg.name]?.constants ?? [],
                bCtx.built[pkg.name]?.contract,
                {
                    code: pkg.code,
                    prefix: pkg.init.prefix,
                    system: pkg.init.deployment.system,
                    args: pkg.init.args,
                },
            );
            const bindingPath = project.resolve(
                config.output,
                config.name + "_" + pkg.name + ".ts",
            );
            project.writeFile(bindingPath, bindingsServer);
        } catch (e) {
            const error = e as Error;
            error.message = `Bindings compiler crashed: ${error.message}`;
            logger.error(error);
            bCtx.errorMessages.push(error);
            return false;
        }
    }

    return true;
}

function doReports(bCtx: BuildContext, packages: Packages): boolean {
    const { project, config, logger } = bCtx;

    logger.info("   > Reports");

    for (const pkg of packages) {
        logger.info("   > " + pkg.name);
        try {
            const report = writeReport(bCtx.ctx, pkg);
            const pathBindings = project.resolve(
                config.output,
                config.name + "_" + pkg.name + ".md",
            );
            project.writeFile(pathBindings, report);
        } catch (e) {
            const error = e as Error;
            error.message = `Report generation crashed: ${error.message}`;
            logger.error(error);
            bCtx.errorMessages.push(error);
            return false;
        }
    }

    return true;
}
