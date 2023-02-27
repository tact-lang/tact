import { Config, verifyConfig } from "./config/parseConfig";
import { TactLogger } from "./logger";
import { build } from "./pipeline/build";
import { createVirtualFileSystem } from "./vfs/createVirtualFileSystem";

export async function run(args: {
    config: Config,
    files: { [key: string]: string },
    logger?: TactLogger | null | undefined
}) {

    // Verify config
    let config = verifyConfig(args.config);

    // Create project's writable fs
    let project = createVirtualFileSystem('/', args.files, false);

    // Create stdlib path
    let stdlib = '@stdlib';

    // Compile
    let success = true;
    for (let p of config.projects) {
        let built = await build({ config: p, project, stdlib, logger: args.logger });
        success = success && built;
    }
    return success;
}