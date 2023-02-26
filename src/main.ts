import { Config } from "./config/parseConfig";
import { build } from './pipeline/build';

export async function compileProjects(args: {
    config: Config,
    configPath: string,
    stdlibPath?: string,
    projectNames?: string[]
}) {

    // Resolve projects
    let projects = args.config.projects;
    if (args.projectNames && args.projectNames.length > 0) {

        // Check that all proejct names are valid
        for (let pp of args.projectNames) {
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

    // Compile projects
    let success = true;
    for (let project of projects) {
        console.log('💼 Compiling project ' + project.name + '...');
        success = success && await build(project, args.configPath, args.stdlibPath || '@stdlib');
    }
    return success;
}