import path from 'path';
import fs from 'fs';
import { Config, parseConfig } from "./config/parseConfig";
import { createNodeFileSystem } from './vfs/createNodeFileSystem';
import { build } from './pipeline/build';
import { consoleLogger } from './logger';

export async function run(args: { configPath: string, projectNames?: string[] }) {

    // Load config
    const resolvedPath = path.resolve(args.configPath);
    const rootPath = path.dirname(resolvedPath);
    let config: Config;
    if (!fs.existsSync(resolvedPath)) {
        console.warn('Unable to find config file at ' + resolvedPath);
        return false;
    }
    try {
        config = parseConfig(fs.readFileSync(resolvedPath, 'utf8'));
    } catch (e) {
        console.log(e);
        console.warn('Unable to parse config file at ' + resolvedPath);
        return false;
    }

    // Resolve projects
    let projects = config.projects;
    if (args.projectNames && args.projectNames.length > 0) {

        // Check that all proejct names are valid
        for (const pp of args.projectNames) {
            if (!projects.find((v) => v.name === pp)) {
                console.warn('Unable to find project ' + pp);
                return false;
            }
        }

        // Filter by names
        projects = projects.filter((v) => args.projectNames!.includes(v.name));
    }
    if (projects.length === 0) {
        console.warn('No projects to compile');
        return false;
    }

    // Compile 
    let success = true;
    const project = createNodeFileSystem(rootPath, false);
    const stdlib = createNodeFileSystem(path.resolve(__dirname, '..', 'stdlib'), false); // Improves developer experience
    for (const config of projects) {
        console.log('💼 Compiling project ' + config.name + '...');
        const built = await build({ config, project, stdlib, logger: consoleLogger });
        success = success && built;
    }
    return success;
}

export { createNodeFileSystem } from './vfs/createNodeFileSystem';