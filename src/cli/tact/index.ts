import { basename, dirname, normalize, resolve } from "path";
import { ZodError } from "zod";
import { createNodeFileSystem } from "../../vfs/createNodeFileSystem";
import { createVirtualFileSystem } from "../../vfs/createVirtualFileSystem";
import { parseAndEvalExpression } from "../../optimizer/interpreter";
import { showValue } from "../../types/types";
import { Config, Project, parseConfig } from "../../config/parseConfig";
import { ArgParser, GetParserResult } from "../arg-parser";
import { CliErrors } from "./error-schema";
import { CliLogger } from "../logger";
import { ArgConsumer } from "../arg-consumer";
import { VirtualFileSystem } from "../../vfs/VirtualFileSystem";
import { entries } from "../../utils/tricks";
import { Logger, LogLevel } from "../../context/logger";
import { build } from "../../pipeline/build";
import { TactErrorCollection } from "../../error/errors";
import files from "../../stdlib/stdlib";
import { cwd } from "process";
import { getVersion, showCommit } from "../version";

export const main = async () => {
    const Log = CliLogger();
    const Errors = CliErrors(Log.log);

    try {
        const argv = process.argv.slice(2);
        await processArgs(Errors, argv);
    } catch (e) {
        Errors.unexpected(e);
    }

    if (Log.hadErrors()) {
        // https://nodejs.org/docs/v20.12.1/api/process.html#exit-codes
        process.exit(30);
    }
};

const processArgs = async (Errors: CliErrors, argv: string[]) => {
    const Parser = ArgParser(Errors);
    const getArgs = ArgSchema(Parser);

    const match = getArgs(argv);
    if (match.kind === "ok") {
        const Args = ArgConsumer(Errors, match.value);

        await parseArgs(Errors, Args);
    } else {
        await showHelp();
    }
};

const ArgSchema = (Parser: ArgParser) => {
    return Parser.tokenizer
        .add(Parser.string("config", "c", "CONFIG"))
        .add(Parser.string("project", "p", "NAME"))
        .add(Parser.boolean("quiet", "q"))
        .add(Parser.boolean("with-decompilation", undefined))
        .add(Parser.boolean("func", undefined))
        .add(Parser.boolean("check", undefined))
        .add(Parser.string("eval", "e", "EXPRESSION"))
        .add(Parser.boolean("version", "v"))
        .add(Parser.boolean("help", "h"))
        .add(Parser.immediate).end;
};

const showHelp = async () => {
    console.log(`Usage
$ tact [...flags] (--config CONFIG | FILE)

Flags
  -c, --config CONFIG         Specify path to config file (tact.config.json)
  -p, --project ...names      Build only the specified project name(s) from the config file
  -q, --quiet                 Suppress compiler log output
  --with-decompilation        Full compilation followed by decompilation of produced binary code
  --func                      Output intermediate FunC code and exit
  --check                     Perform syntax and type checking, then exit
  -e, --eval EXPRESSION       Evaluate a Tact expression and exit
  -v, --version               Print Tact compiler version and exit
  -h, --help                  Display this text and exit

Examples
  $ tact --version
  ${await getVersion()}

Learn more about Tact:        https://docs.tact-lang.org
Join Telegram group:          https://t.me/tactlang
Follow X/Twitter account:     https://twitter.com/tact_language`);
};

type Args = ArgConsumer<GetParserResult<ReturnType<typeof ArgSchema>>>;

const parseArgs = async (Errors: CliErrors, Args: Args) => {
    if (Args.single("help")) {
        if (await noUnknownParams(Errors, Args)) {
            await showHelp();
        }
        return;
    }

    if (Args.single("version")) {
        if (await noUnknownParams(Errors, Args)) {
            console.log(await getVersion());
            showCommit();
        }
        return;
    }

    const expression = Args.single("eval");
    if (expression) {
        if (await noUnknownParams(Errors, Args)) {
            evaluate(expression);
        }
        return;
    }

    const configPath = Args.single("config");
    if (configPath) {
        const normalizedConfigPath = normalize(resolve(cwd(), configPath));
        const normalizedDirPath = normalize(
            resolve(cwd(), dirname(configPath)),
        );
        const Fs = createNodeFileSystem(normalizedDirPath, false);
        if (!Fs.exists(normalizedConfigPath)) {
            Errors.configNotFound(configPath);
            return;
        }
        const configText = Fs.readFile(normalizedConfigPath).toString("utf-8");
        const config = parseConfigSafe(
            Errors,
            normalizedConfigPath,
            configText,
        );
        if (!config) {
            return;
        }
        await compile(Args, Errors, Fs, config);
        return;
    }

    const filePath = Args.single("immediate");
    if (filePath) {
        const normalizedPath = resolve(cwd(), dirname(filePath));
        const Fs = createNodeFileSystem(normalizedPath, false);
        const config = createSingleFileConfig(basename(filePath));
        await compile(Args, Errors, Fs, config);
        return;
    }

    if (await noUnknownParams(Errors, Args)) {
        await showHelp();
    }
};

const parseConfigSafe = (
    Errors: CliErrors,
    configPath: string,
    configText: string,
): Config | undefined => {
    try {
        return parseConfig(configText);
    } catch (e) {
        if (!(e instanceof ZodError)) {
            throw e;
        }
        Errors.configError(configPath, e.toString());
        return;
    }
};

export const createSingleFileConfig = (fileName: string) =>
    ({
        projects: [
            {
                name: fileName,
                path: ensureExtension(fileName),
                output: "./",
                options: {
                    debug: true,
                    external: true,
                    ipfsAbiGetter: false,
                    interfacesGetter: false,
                    safety: {
                        nullChecks: true,
                    },
                },
                mode: "full",
            },
        ],
    }) as const;

const ensureExtension = (path: string): string => {
    return path.endsWith(".tact") ? path : `${path}.tact`;
};

const compile = async (
    Args: Args,
    Errors: CliErrors,
    Fs: VirtualFileSystem,
    rawConfig: Config,
) => {
    const config = filterConfig(
        Errors,
        rawConfig,
        Args.multiple("project") ?? [],
    );

    if (!config) {
        return;
    }

    const suppressLog = Args.single("quiet") ?? false;
    const logger = new Logger(suppressLog ? LogLevel.NONE : LogLevel.INFO);

    const flags = entries({
        checkOnly: Args.single("check"),
        funcOnly: Args.single("func"),
        fullWithDecompilation: Args.single("with-decompilation"),
    });
    const setFlags = flags.filter(([, value]) => value);
    if (setFlags.length > 1) {
        Errors.incompatibleFlags();
    }
    const mode = flags.find(([, value]) => value)?.[0];
    const options: ExtraOptions = {};
    if (mode) {
        options.mode = mode;
    }
    setConfigOptions(config, options);

    const stdlib = createVirtualFileSystem("@stdlib", files);

    if (await noUnknownParams(Errors, Args)) {
        // TODO: all flags on the cli should take precedence over flags in the config
        // Make a nice model for it instead of the current mess
        // Consider making overwrites right here or something.
        const result = await run({
            logger,
            config,
            project: Fs,
            stdlib,
        });
        if (!result.ok) {
            Errors.setHadErrors();
        }
    }
};

export async function run(args: {
    logger: Logger;
    config: Config;
    project: VirtualFileSystem;
    stdlib: VirtualFileSystem;
}) {
    // Resolve projects
    const projects = args.config.projects;

    // Compile
    let success = true;
    let errorMessages: TactErrorCollection[] = [];

    for (const config of projects) {
        args.logger.info(`💼 Compiling project ${config.name} ...`);

        const built = await build({
            config,
            project: args.project,
            stdlib: args.stdlib,
            logger: args.logger,
        });
        success = success && built.ok;
        if (!built.ok && built.error.length > 0) {
            errorMessages = [...errorMessages, ...built.error];
        }
    }
    return { ok: success, error: errorMessages };
}

const filterConfig = (
    Errors: CliErrors,
    config: Config,
    projectNames: string[],
): Config | undefined => {
    if (projectNames.length === 0) {
        return config;
    }

    // Check that all project names are valid
    for (const name of projectNames) {
        if (!config.projects.find((v) => v.name === name)) {
            Errors.noSuchProject(name);
            return;
        }
    }

    // Filter by names
    return {
        ...config,
        projects: config.projects.filter((v) => projectNames.includes(v.name)),
    };
};

type ExtraOptions = Pick<Project, "mode">;

const setConfigOptions = (config: Config, options: ExtraOptions): void => {
    for (const project of config.projects) {
        Object.assign(project, options);
    }
};

const noUnknownParams = async (
    Errors: CliErrors,
    Args: Args,
): Promise<boolean> => {
    const leftoverArgs = Args.leftover();

    if (leftoverArgs.length === 0) {
        return true;
    }

    for (const argument of leftoverArgs) {
        Errors.unexpectedArgument(argument);
    }
    await showHelp();
    return false;
};

const evaluate = (expression: string) => {
    const result = parseAndEvalExpression(expression);
    switch (result.kind) {
        case "ok":
            console.log(showValue(result.value));
            process.exit(0);
            break;
        case "error": {
            console.log(result.message);
            process.exit(30);
        }
    }
};
