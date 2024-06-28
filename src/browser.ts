import { Config, verifyConfig } from "./config/parseConfig";
import { Logger } from "./logger";
import { build } from "./pipeline/build";
import { createVirtualFileSystem } from "./vfs/createVirtualFileSystem";

export async function run(args: {
    config: Config;
    files: { [key: string]: string };
    logger?: Logger | null | undefined;
}) {
    // Verify config
    const config = verifyConfig(args.config);

    // Create project's writable fs
    const project = createVirtualFileSystem("/", args.files, false);

    // Create stdlib path
    const stdlib = "@stdlib";

    // Compile
    let success = true;
    let errorCollection: Error[] = [];
    for (const p of config.projects) {
        const built = await build({
            config: p,
            project,
            stdlib,
            logger: args.logger,
        });
        success = success && built.ok;
        if (!built.ok && built.error) {
            errorCollection = { ...errorCollection, ...built.error };
        }
    }
    return { ok: success, error: errorCollection };
}
