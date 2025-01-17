import { Config, verifyConfig } from "./config/parseConfig";
import { ILogger } from "./context/logger";
import { build } from "./pipeline/build";
import { createVirtualFileSystem } from "./vfs/createVirtualFileSystem";
import files from "./stdlib/stdlib";
import { getCompilerVersion } from "./pipeline/version";

export async function run(args: {
    config: Config;
    files: Record<string, string>;
    logger?: ILogger;
}) {
    // Verify config
    const config = verifyConfig(args.config);

    // Create project's writable fs
    const projectFs = createVirtualFileSystem("/", args.files, false);

    // Create stdlib path
    const stdlibFs = createVirtualFileSystem("@stdlib", files);

    // Compile
    let success = true;
    let errorCollection: Error[] = [];
    for (const p of config.projects) {
        const built = await build({
            config: p,
            projectFs,
            stdlibFs,
            logger: args.logger,
            compilerVersion: getCompilerVersion(),
        });
        success = success && built.ok;
        if (!built.ok) {
            errorCollection = { ...errorCollection, ...built.error };
        }
    }
    return { ok: success, error: errorCollection };
}
