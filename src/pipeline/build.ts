import type { WrappersConstantDescription } from "@/bindings/writeTypescript";
import { featureEnable } from "@/config/features";
import type { Project } from "@/config/parseConfig";
import { CompilerContext } from "@/context/context";
import type { ILogger } from "@/context/logger";
import { Logger } from "@/context/logger";
import { posixNormalize } from "@/utils/filePath";
import type { VirtualFileSystem } from "@/vfs/VirtualFileSystem";
import { doCompileContracts } from "@/pipeline/compile";
import { precompile } from "@/pipeline/precompile";
import type { TactErrorCollection } from "@/error/errors";
import { TactError } from "@/error/errors";
import type { TypeDescription } from "@/types/types";
import { doPackaging } from "@/pipeline/packaging";
import { doBindings } from "@/pipeline/bindings";
import { doReports } from "@/pipeline/reports";
import { doTests } from "@/pipeline/tests";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import * as Stdlib from "@/stdlib/stdlib";

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

export type BuiltContract = {
    readonly abi: string;
    readonly codeBoc: Buffer;
    readonly constants: readonly WrappersConstantDescription[];
    readonly contract: TypeDescription;
};

export type BuildRecord = Record<string, BuiltContract | undefined>;

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
}): Promise<BuildResult> {
    const { config, project, logger = new Logger() } = args;

    const stdlib =
        typeof args.stdlib === "string"
            ? createVirtualFileSystem(args.stdlib, Stdlib.files)
            : args.stdlib;

    // Configure context
    let ctx = new CompilerContext();
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

    const bCtx: BuildContext = {
        config,
        logger,
        project,
        stdlib,
        compilerInfo,
        ctx,
        built: {},
        errorMessages: [],
    };

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

    const testsRes = doTests(bCtx, packages);
    if (!testsRes) {
        return BuildFail(bCtx.errorMessages);
    }

    const reportsRes = doReports(bCtx, packages);
    if (!reportsRes) {
        return BuildFail(bCtx.errorMessages);
    }

    return BuildOk();
}

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
