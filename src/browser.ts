import type { Config } from "@/config/parseConfig";
import { verifyConfig } from "@/config/parseConfig";
import type { ILogger } from "@/context/logger";
import { build } from "@/pipeline/build";
import { createVirtualFileSystem } from "@/vfs/createVirtualFileSystem";
import * as Stdlib from "@/stdlib/stdlib";

export async function run(args: {
    config: Config;
    files: Record<string, string>;
    logger?: ILogger;
}) {
    // Verify config
    const config = verifyConfig(args.config);

    // Create project's writable fs
    const project = createVirtualFileSystem("/", args.files, false);

    // Create stdlib path
    const stdlib = createVirtualFileSystem("@stdlib", Stdlib.files);

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
        if (!built.ok) {
            errorCollection = { ...errorCollection, ...built.error };
        }
    }
    return { ok: success, error: errorCollection };
}
