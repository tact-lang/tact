import { readFileSync } from "fs";
import { dirname, join } from "path";
import { execFileSync } from "child_process";
import { z, ZodError } from "zod";
import { createNodeFileSystem } from "../vfs/createNodeFileSystem";
import { parseAndEvalExpression } from "../optimizer/interpreter";
import { showValue } from "../types/types";
import { Config, ConfigProject, parseConfig } from "../config/parseConfig";
import { ArgParser, GetParserResult } from "./arg-parser";
import { CliErrors } from "./error-schema";
import { CliLogger } from "./logger";
import { ArgConsumer } from "./arg-consumer";
import { VirtualFileSystem } from "../vfs/VirtualFileSystem";
import { entries } from "../utils/tricks";
import { stdlibPath } from "../stdlib/path";
import { Logger, LogLevel } from "../context/logger";
import { build } from "../pipeline/build";
import { TactErrorCollection } from "../error/errors";

export const main = async () => {
    const L = CliLogger();
    const E = CliErrors(L.log);

    try {
        const argv = process.argv.slice(2);
        await processArgs(E, argv);
    } catch (e) {
        E.internal(e);
    }

    if (L.hadErrors()) {
        // https://nodejs.org/docs/v20.12.1/api/process.html#exit-codes
        process.exit(30);
    }
};

const processArgs = async (E: CliErrors, argv: string[]) => {
    const P = ArgParser(E);
    const getArgs = ArgSchema(P);

    const match = getArgs(argv);
    if (match.kind === 'ok') {
        const A = ArgConsumer(match.value);

        await parseArgs(E, A);
    } else {
        showHelp();
    }
};

const ArgSchema = (P: ArgParser) => {
    return P.tokenizer
        .add(P.string('config', 'c', 'CONFIG'))
        .add(P.string('project', 'p', 'NAME'))
        .add(P.boolean('quiet', 'q'))
        .add(P.boolean('withDecompilation', undefined))
        .add(P.boolean('func', undefined))
        .add(P.boolean('check', undefined))
        .add(P.string('eval', 'e', 'EXPRESSION'))
        .add(P.boolean('version', 'v'))
        .add(P.boolean('help', 'h'))
        .add(P.immediate)
        .end;
};

type Args = ArgConsumer<GetParserResult<ReturnType<typeof ArgSchema>>>;

const parseArgs = async (E: CliErrors, A: Args) => {
    if (A.single('help') && noUnknownParams(A)) {
        showHelp();
        return;
    }

    if (A.single('version') && noUnknownParams(A)) {
        showVersion();
        return;
    }

    const expression = A.single('eval');
    if (expression && noUnknownParams(A)) {
        evaluate(expression);
        return;
    }

    const configPath = A.single('config');
    if (configPath) {
        const F = createNodeFileSystem(dirname(configPath));
        if (!F.exists(configPath)) {
            E.configNotFound(configPath);
            return;
        }
        const configText = F.readFile(configPath).toString('utf-8');
        const config = parseConfigSafe(E, configPath, configText);
        if (!config) {
            return;
        }
        await compile(A, E, F, config);
    }

    const filePath = A.single('immediate');
    if (filePath) {
        const F = createNodeFileSystem(dirname(filePath));
        const config = createSingleFileConfig(filePath);
        await compile(A, E, F, config);
        return;
    }

    if (noUnknownParams(A)) {
        showHelp();
    }
};

const parseConfigSafe = (E: CliErrors, configPath:string, configText: string): Config | undefined => {
    try {
        return parseConfig(configText);
    } catch (e) {
        if (!(e instanceof ZodError)) {
            throw e;
        }
        E.configError(configPath, e.toString());
        return;
    }
};

export const createSingleFileConfig = (fileName: string): Config => ({
    projects: [
        {
            name: fileName,
            path: ensureExtension(fileName),
            output: './',
            options: {
                debug: true,
                external: true,
                ipfsAbiGetter: false,
                interfacesGetter: false,
            },
            mode: "full",
        },
    ],
});

const ensureExtension = (path: string): string => {
    return path.endsWith('.tact') ? path : `${path}.tact`;
};

const compile = async (A: Args, E: CliErrors, F: VirtualFileSystem, rawConfig: Config) => {
    const config = filterConfig(E, rawConfig, A.multiple('project') ?? []);

    if (!config) {
        return;
    }

    const suppressLog = A.single('quiet') ?? false;
    const logger = new Logger(suppressLog ? LogLevel.NONE : LogLevel.INFO);

    const flags = entries({
        checkOnly: A.single('check'),
        funcOnly: A.single('func'),
        fullWithDecompilation: A.single('withDecompilation'),
    });
    const setFlags = flags.filter(([, value]) => value);
    if (setFlags.length > 1) {
        E.incompatibleFlags();
    }
    const mode = flags.find(([, value]) => value)?.[0];
    const options: ExtraOptions = {};
    if (mode) {
        options.mode = mode;
    }
    setConfigOptions(config, options);

    const stdlib = createNodeFileSystem(stdlibPath, false); // Improves developer experience

    if (noUnknownParams(A)) {
        // TODO: all flags on the cli should take precedence over flags in the config
        // Make a nice model for it instead of the current mess
        // Consider making overwrites right here or something.
        await run({
            logger,
            config,
            project: F,
            stdlib,
        });
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

const filterConfig = (E: CliErrors, config: Config, projectNames: string[]): Config | undefined => {
    if (projectNames.length === 0) {
        return config;
    }

    // Check that all project names are valid
    for (const name of projectNames) {
        if (!config.projects.find((v) => v.name === name)) {
            E.noSuchProject(name);
            return;
        }
    }

    // Filter by names
    return {
        ...config,
        projects: config.projects.filter((v) => projectNames.includes(v.name)),
    };
};

type ExtraOptions = Pick<ConfigProject, 'mode'>

const setConfigOptions = (config: Config, options: ExtraOptions): void => {
    for (const project of config.projects) {
        Object.assign(project, options);
    }
};

const noUnknownParams = (args: Args): boolean => {
    if (args.isEmpty()) {
        return true;
    }

    showHelp();
    return false;
};

const showHelp = () => {
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
    ${getVersion()}

Learn more about Tact:        https://docs.tact-lang.org
Join Telegram group:          https://t.me/tactlang
Follow X/Twitter account:     https://twitter.com/tact_language`);
};

const showVersion = () => {
    console.log(getVersion());
    // if working inside a git repository
    // also print the current git commit hash
    try {
        const gitCommit = execFileSync("git", ["rev-parse", "HEAD"], {
            encoding: "utf8",
            stdio: ["ignore", "pipe", "ignore"],
        }).trim();
        console.log(`git commit: ${gitCommit}`);
    } finally {
        process.exit(0);
    }
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

const getVersion = () => {
    const packageSchema = z.object({
        version: z.string(),
    });
    
    const packageJsonPath = join(__dirname, "package.json");
    
    const pkg = packageSchema.parse(JSON.parse(readFileSync(packageJsonPath, "utf-8")));

    return pkg.version;
};
