import path from 'path';
import fs from 'fs';
import { Config, parseConfig } from "./config/parseConfig";
import { compileProjects } from "./main";
import { createNodeFileSystem } from './vfs/createNodeFileSystem';

export async function run(args: { configPath: string, projectNames?: string[] }) {

    // Load config
    let resolvedPath = path.resolve(args.configPath);
    let rootPath = path.dirname(resolvedPath);
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

    // Compile 
    let output = await compileProjects({
        config,
        project: createNodeFileSystem(rootPath, false),
        projectNames: args.projectNames,
        stdlibPath: path.resolve(__dirname, '..', 'stdlib') // Optional, but improves developer experience
    });

    return output;
}