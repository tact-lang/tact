import { Config } from "./config/parseConfig";
import files from "./imports/stdlib";
import { build } from './pipeline/build';
import { createVirtualFileSystem } from "./vfs/createVirtualFileSystem";
import { VirtualFileSystem } from "./vfs/VirtualFileSystem";

export async function compileProjects(args: {
    config: Config,
    projectNames?: string[],
    project: VirtualFileSystem,
    stdlibPath?: string,
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
    let stdlib = createVirtualFileSystem(args.stdlibPath || '@stdlib', files);
    for (let config of projects) {
        console.log('💼 Compiling project ' + config.name + '...');
        let built = await build({ config, project: args.project, stdlib });
        success = success && built;
    }
    return success;
}