import { Config, verifyConfig } from "./config/parseConfig";
import { TactLogger } from "./logger";
import { build } from "./pipeline/build";
import { createVirtualFileSystem } from "./vfs/createVirtualFileSystem";

type CompilationOptions = {
    config: Config,
    files: { [key: string]: string },
    logger?: TactLogger | null | undefined
}
export async function run(args: CompilationOptions) {

    // Verify config
    const config = verifyConfig(args.config);

    // Create project's writable fs
    const project = createVirtualFileSystem('/', args.files, false);

    // Create stdlib path
    const stdlib = '@stdlib';

    // Compile
    let success = true;
    for (const p of config.projects) {
        const built = await build({ config: p, project, stdlib, logger: args.logger });
        success = success && built;
    }
    return success;
}