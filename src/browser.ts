import { Config, verifyConfig } from "./config/parseConfig";
import { TactLogger } from "./logger";
import { build } from "./pipeline/build";
import { createVirtualFileSystem } from "./vfs/createVirtualFileSystem";
import {createNodeFileSystem} from "./vfs/createNodeFileSystem";
import {getRootDir} from "./utils/utils";
import path from "path";

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

    // Create npm path
    let npm = createNodeFileSystem(path.resolve(getRootDir(), "node_modules"));

    // Compile
    let success = true;
    for (let p of config.projects) {
        let built = await build({ config: p, project, stdlib, npm, logger: args.logger });
        success = success && built;
    }
    return success;
}