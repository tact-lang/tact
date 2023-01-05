import fs from 'fs';
import path from 'path';
import { Config, parseConfig } from "./config/parseConfig";
import { build } from './pipeline/build';

export async function compileProjects(configPath: string, projectNames: string[] = []) {

    // Load config
    let resolvedPath = path.resolve(configPath);
    let rootPath = path.dirname(resolvedPath);
    let config: Config;
    if (!fs.existsSync(resolvedPath)) {
        console.warn('Unable to find config file at ' + resolvedPath);
        return;
    }
    try {
        config = parseConfig(fs.readFileSync(resolvedPath, 'utf8'));
    } catch (e) {
        console.log(e);
        console.warn('Unable to parse config file at ' + resolvedPath);
        return;
    }

    // Resolve projects
    let projects = config.projects;
    if (projectNames.length > 0) {

        // Check that all proejct names are valid
        for (let pp of projectNames) {
            if (!projects.find((v) => v.name === pp)) {
                console.warn('Unable to find project ' + pp);
                return;
            }
        }

        // Filter by names
        projects = projects.filter((v) => projectNames.includes(v.name));
    }
    if (projects.length === 0) {
        console.warn('No projects to compile');
        return;
    }

    // Compile projects
    for (let project of projects) {
        console.log('💼 Compiling project ' + project.name + '...');
        await build(project, rootPath);
    }
} 