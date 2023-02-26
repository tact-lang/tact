import { Config, verifyConfig } from "./config/parseConfig";
import files from "./imports/stdlib";
import { build } from "./pipeline/build";
import { createVirtualFileSystem } from "./vfs/createVirtualFileSystem";

export async function run(args: {
    config: Config,
    files: { [key: string]: string }
}) {

    // Verify config
    let config = verifyConfig(args.config);

    // Create project's writable fs
    let project = createVirtualFileSystem('/', args.files, false);

    // Create stdlib fs
    let stdlib = createVirtualFileSystem('@stdlib', files);

    // Compile
    let success = true;
    for (let p of config.projects) {
        let built = await build({ config: p, project, stdlib });
        success = success && built;
    }
    return success;
}