import { beginCell, Cell, Dictionary } from "@ton/core";
import { decompileAll } from "@tact-lang/opcode";
import { writeTypescript } from "../bindings/writeTypescript";
import { featureEnable } from "../config/features";
import { ConfigProject } from "../config/parseConfig";
import { CompilerContext } from "../context";
import { funcCompile } from "../func/funcCompile";
import { writeReport } from "../generator/writeReport";
import { getRawAST } from "../grammar/store";
import files from "../imports/stdlib";
import { ILogger, Logger } from "../logger";
import { PackageFileFormat } from "../packaging/fileFormat";
import { packageCode } from "../packaging/packageCode";
import { createABITypeRefFromTypeRef } from "../types/resolveABITypeRef";
import { getContracts, getType } from "../types/resolveDescriptors";
import { posixNormalize } from "../utils/filePath";
import { createVirtualFileSystem } from "../vfs/createVirtualFileSystem";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { compile } from "./compile";
import { precompile } from "./precompile";
import { getCompilerVersion } from "./version";
import { idText } from "../grammar/ast";
import { TactErrorCollection } from "../errors";

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
        { option: config.options.masterchain, name: "masterchain" },
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

export async function build(args: {
    config: ConfigProject;
    project: VirtualFileSystem;
    stdlib: string | VirtualFileSystem;
    logger?: ILogger;
}): Promise<{ ok: boolean; error: TactErrorCollection[] }> {
    const { config, project } = args;
    const stdlib =
        typeof args.stdlib === "string"
            ? createVirtualFileSystem(args.stdlib, files)
            : args.stdlib;
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
        ctx = precompile(ctx, project, stdlib, config.path);
    } catch (e) {
        logger.error(
            config.mode === "checkOnly" || config.mode === "funcOnly"
                ? "Syntax and type checking failed"
                : "Tact compilation failed",
        );
        logger.error(e as Error);
        return { ok: false, error: [e as Error] };
    }

    if (config.mode === "checkOnly") {
        logger.info("✔️ Syntax and type checking succeeded.");
        return { ok: true, error: [] };
    }

    // Compile contracts
    let ok = true;
    const errorMessages: TactErrorCollection[] = [];
    const built: Record<
        string,
        | {
              codeBoc: Buffer;
              abi: string;
          }
        | undefined
    > = {};
    for (const contract of getContracts(ctx)) {
        const pathAbi = project.resolve(
            config.output,
            config.name + "_" + contract + ".abi",
        );

        const pathCodeBoc = project.resolve(
            config.output,
            config.name + "_" + contract + ".code.boc",
        );
        const pathCodeFif = project.resolve(
            config.output,
            config.name + "_" + contract + ".code.fif",
        );
        const pathCodeFifDec = project.resolve(
            config.output,
            config.name + "_" + contract + ".code.rev.fif",
        );
        let codeFc: { path: string; content: string }[];
        let codeEntrypoint: string;

        // Compiling contract to func
        logger.info(`   > ${contract}: tact compiler`);
        let abi: string;
        try {
            const res = await compile(
                ctx,
                contract,
                config.name + "_" + contract,
            );
            for (const files of res.output.files) {
                const ffc = project.resolve(config.output, files.name);
                project.writeFile(ffc, files.code);
            }
            project.writeFile(pathAbi, res.output.abi);
            abi = res.output.abi;
            codeFc = res.output.files.map((v) => ({
                path: posixNormalize(project.resolve(config.output, v.name)),
                content: v.code,
            }));
            codeEntrypoint = res.output.entrypoint;
        } catch (e) {
            logger.error("Tact compilation failed");
            logger.error(e as Error);
            ok = false;
            errorMessages.push(e as Error);
            continue;
        }

        if (config.mode === "funcOnly") {
            continue;
        }

        // Compiling contract to TVM
        logger.info(`   > ${contract}: func compiler`);
        let codeBoc: Buffer;
        try {
            const stdlibPath = stdlib.resolve("stdlib.fc");
            const stdlibCode = stdlib.readFile(stdlibPath).toString();
            const stdlibExPath = stdlib.resolve("stdlib_ex.fc");
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
                    return { ok: false, error: errorMessages };
                }

                logger.error(c.log);
                ok = false;
                errorMessages.push(new Error(c.log));
                continue;
            }
            project.writeFile(pathCodeFif, c.fift);
            project.writeFile(pathCodeBoc, c.output);
            codeBoc = c.output;
        } catch (e) {
            logger.error("FunC compiler crashed");
            logger.error(e as Error);
            ok = false;
            errorMessages.push(e as Error);
            continue;
        }

        // Add to built map
        built[contract] = {
            codeBoc,
            abi,
        };

        if (config.mode === "fullWithDecompilation") {
            // Fift decompiler for generated code debug
            logger.info(`   > ${contract}: fift decompiler`);
            let codeFiftDecompiled: string;
            try {
                codeFiftDecompiled = decompileAll({ src: codeBoc });
                project.writeFile(pathCodeFifDec, codeFiftDecompiled);
            } catch (e) {
                logger.error("Fift decompiler crashed");
                logger.error(e as Error);
                ok = false;
                errorMessages.push(e as Error);
                continue;
            }
        }
    }
    if (!ok) {
        logger.info("💥 Compilation failed. Skipping packaging");
        return { ok: false, error: errorMessages };
    }

    if (config.mode === "funcOnly") {
        logger.info("✔️ FunC code generation succeeded.");
        return { ok: true, error: errorMessages };
    }

    // Package
    logger.info("   > Packaging");
    const contracts = getContracts(ctx);
    const packages: PackageFileFormat[] = [];
    for (const contract of contracts) {
        logger.info("   > " + contract);
        const artifacts = built[contract];
        if (!artifacts) {
            const message = `   > ${contract}: no artifacts found`;
            logger.error(message);
            errorMessages.push(new Error(message));
            return { ok: false, error: errorMessages };
        }

        // System cell
        const depends = Dictionary.empty(
            Dictionary.Keys.Uint(16),
            Dictionary.Values.Cell(),
        );
        const ct = getType(ctx, contract);
        depends.set(ct.uid, Cell.fromBoc(built[ct.name]!.codeBoc)[0]!); // Mine
        for (const c of ct.dependsOn) {
            const cd = built[c.name];
            if (!cd) {
                const message = `   > ${c.name}: no artifacts found`;
                logger.error(message);
                errorMessages.push(new Error(message));
                return { ok: false, error: errorMessages };
            }
            depends.set(c.uid, Cell.fromBoc(cd.codeBoc)[0]!);
        }
        const systemCell = beginCell().storeDict(depends).endCell();

        // Collect sources
        const sources: Record<string, string> = {};
        const rawAst = getRawAST(ctx);
        for (const source of [...rawAst.funcSources, ...rawAst.sources]) {
            if (
                source.path.startsWith(project.root) &&
                !source.path.startsWith(stdlib.root)
            ) {
                const source_path = posixNormalize(
                    source.path.slice(project.root.length),
                );
                sources[source_path] = Buffer.from(source.code).toString(
                    "base64",
                );
            }
        }

        // Package
        const pkg: PackageFileFormat = {
            name: contract,
            abi: artifacts.abi,
            code: artifacts.codeBoc.toString("base64"),
            init: {
                kind: "direct",
                args: getType(ctx, contract).init!.params.map((v) => ({
                    name: idText(v.name),
                    type: createABITypeRefFromTypeRef(ctx, v.type, v.loc),
                })),
                prefix: {
                    bits: 1,
                    value: 0,
                },
                deployment: {
                    kind: "system-cell",
                    system: systemCell.toBoc().toString("base64"),
                },
            },
            sources,
            compiler: {
                name: "tact",
                version: getCompilerVersion(),
                parameters: cfg,
            },
        };
        const pkgData = packageCode(pkg);
        const pathPkg = project.resolve(
            config.output,
            config.name + "_" + contract + ".pkg",
        );
        project.writeFile(pathPkg, pkgData);
        packages.push(pkg);
    }

    // Bindings
    logger.info("   > Bindings");
    for (const pkg of packages) {
        logger.info(`   > ${pkg.name}`);
        if (pkg.init.deployment.kind !== "system-cell") {
            const message = `   > ${pkg.name}: unsupported deployment kind ${pkg.init.deployment.kind}`;
            logger.error(message);
            errorMessages.push(new Error(message));
            return { ok: false, error: errorMessages };
        }
        try {
            const bindingsServer = writeTypescript(JSON.parse(pkg.abi), {
                code: pkg.code,
                prefix: pkg.init.prefix,
                system: pkg.init.deployment.system,
                args: pkg.init.args,
            });
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
            errorMessages.push(error);
            return { ok: false, error: errorMessages };
        }
    }

    // Reports
    logger.info("   > Reports");
    for (const pkg of packages) {
        logger.info("   > " + pkg.name);
        try {
            const report = writeReport(ctx, pkg);
            const pathBindings = project.resolve(
                config.output,
                config.name + "_" + pkg.name + ".md",
            );
            project.writeFile(pathBindings, report);
        } catch (e) {
            const error = e as Error;
            error.message = `Report generation crashed: ${error.message}`;
            logger.error(error);
            errorMessages.push(error);
            return { ok: false, error: errorMessages };
        }
    }

    return { ok: true, error: [] };
}
