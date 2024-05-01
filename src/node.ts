import path from "path";
import fs from "fs";
import { Config, parseConfig } from "./config/parseConfig";
import { createNodeFileSystem } from "./vfs/createNodeFileSystem";
import { build } from "./pipeline/build";
import { consoleLogger } from "./logger";

export class CliOptions {
    // The following options are mutually exclusive.
    // That's checked in the CLI before passing their values here.
    public checkOnly: boolean = false;
    public funcOnly: boolean = false;
}

type ConfigWithRootPath = Config & {
    rootPath: string;
};

async function configForSingleFile(
    fileName: string,
): Promise<ConfigWithRootPath> {
    return {
        projects: [
            {
                name: "main",
                path: fileName,
                output: process.cwd(),
                options: { debug: true },
            },
        ],
        rootPath: process.cwd(),
    };
}

async function loadConfig(
    fileName?: string,
    configPath?: string,
): Promise<ConfigWithRootPath | null> {
    if (fileName) return configForSingleFile(fileName);

    if (!configPath) return null;

    let config: Config;

    // Load config
    const resolvedPath = path.resolve(configPath);
    const rootPath = path.dirname(resolvedPath);
    if (!fs.existsSync(resolvedPath)) {
        console.warn("Unable to find config file at " + resolvedPath);
        return null;
    }
    try {
        config = parseConfig(fs.readFileSync(resolvedPath, "utf8"));
    } catch (e) {
        console.log(e);
        console.warn("Unable to parse config file at " + resolvedPath);
        return null;
    }
    return { rootPath, ...config };
}

export async function run(args: {
    fileName?: string;
    configPath?: string;
    projectNames?: string[];
    cliOptions?: CliOptions;
}) {
    const configWithRootPath = await loadConfig(args.fileName, args.configPath);
    if (!configWithRootPath) {
        return false;
    }

    // Resolve projects
    let projects = configWithRootPath.projects;
    if (args.projectNames && args.projectNames.length > 0) {
        // Check that all project names are valid
        for (const pp of args.projectNames) {
            if (!projects.find((v) => v.name === pp)) {
                console.warn("Unable to find project " + pp);
                return false;
            }
        }

        // Filter by names
        projects = projects.filter((v) => args.projectNames!.includes(v.name));
    }
    if (projects.length === 0) {
        console.warn("No projects to compile");
        return false;
    }

    // Compile
    let success = true;
    const project = createNodeFileSystem(
        configWithRootPath.rootPath as string,
        false,
    );
    const stdlib = createNodeFileSystem(
        path.resolve(__dirname, "..", "stdlib"),
        false,
    ); // Improves developer experience
    for (const config of projects) {
        console.log("💼 Compiling project " + config.name + "...");
        const configAndOptions = { ...config, ...args.cliOptions };
        const built = await build({
            config: configAndOptions,
            project,
            stdlib,
            logger: consoleLogger,
        });
        success = success && built;
    }
    return success;
}

export { createNodeFileSystem } from "./vfs/createNodeFileSystem";
