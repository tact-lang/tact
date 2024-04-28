import path from "path";
import fs from "fs";
import { Config, parseConfig } from "./config/parseConfig";
import { createNodeFileSystem } from "./vfs/createNodeFileSystem";
import { build } from "./pipeline/build";
import { consoleLogger } from "./logger";

async function configForSingleFile(fileName: string): Promise<Config> {
    return {
        projects: [{
            name: "main",
            path: fileName,
            output: process.cwd(),
        }],
        rootPath: process.cwd(),
    };    
}

async function loadConfig(fileName?: string, configPath?: string): Promise<Config | null> {
    if (fileName)
        return configForSingleFile(fileName);

    if (!configPath)
        return null;

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
    return {rootPath, ...config};
}

export async function run(args: {
    fileName?: string;
    configPath?: string;
    projectNames?: string[];
    checkOnly?: boolean;
    func?: boolean;
}) {
    const config = await loadConfig(args.fileName, args.configPath);
    if (!config) {
        return false;
    }

    // Resolve projects
    let projects = config.projects;
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
    const project = createNodeFileSystem(config.rootPath as string, false);
    const stdlib = createNodeFileSystem(
        path.resolve(__dirname, "..", "stdlib"),
        false,
    ); // Improves developer experience
    for (const config of projects) {
        console.log("💼 Compiling project " + config.name + "...");
        const built = await build({
            config,
            project,
            stdlib,
            logger: consoleLogger,
            checkOnly: args.checkOnly,
            func: args.func,
        });
        success = success && built;
    }
    return success;
}

export { createNodeFileSystem } from "./vfs/createNodeFileSystem";
