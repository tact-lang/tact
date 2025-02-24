import type { FileChangeInfo } from "fs/promises";
import { watch } from "fs/promises";
import { join } from "path";
import { createNodeFileSystem } from "../../vfs/createNodeFileSystem";
import type { VirtualFileSystem } from "../../vfs/VirtualFileSystem";
import type { Config } from "../../config/parseConfig";
import { Logger, LogLevel } from "../../context/logger";
import type { CliErrors } from "./error-schema";
import type { Args } from "./index";
import { parseConfig } from "../../config/parseConfig";
import { ZodError } from "zod";

let abortController: AbortController | null = null;

async function processWatchEvent(
    event: FileChangeInfo<string>,
    logger: Logger,
    Args: Args,
    Errors: CliErrors,
    Fs: VirtualFileSystem,
    config: Config,
    watchPath: string,
    compile: (
        Args: Args,
        Errors: CliErrors,
        Fs: VirtualFileSystem,
        config: Config,
        signal?: AbortSignal,
    ) => Promise<void>,
) {
    // Only handle .tact or tact.config.json changes
    if (
        !event.filename ||
        (!event.filename.endsWith(".tact") &&
            event.filename !== "tact.config.json")
    ) {
        return;
    }

    logger.info(`🔄 Change detected in ${event.filename}, rebuilding...`);

    // Cancel previous compilation if it's still running
    if (abortController) {
        abortController.abort();
    }
    abortController = new AbortController();

    // Small delay to batch up rapid-fire changes
    await new Promise((resolve) => setTimeout(resolve, 100));

    try {
        // Create a fresh file system instance each time
        const freshFs = createNodeFileSystem(Fs.root, false);

        // Check if the changed file still exists
        const changedFilePath = join(watchPath, event.filename);
        if (!freshFs.exists(changedFilePath)) {
            logger.error(`❌ File not found after change: ${event.filename}`);
            return;
        }

        // If it's the config file, parse a new config
        if (event.filename === "tact.config.json") {
            const configText = freshFs
                .readFile(changedFilePath)
                .toString("utf-8");
            try {
                config = parseConfig(configText);
            } catch (e) {
                if (e instanceof ZodError) {
                    logger.error(`❌ Config error: ${e.toString()}`);
                } else {
                    throw e;
                }
                return;
            }
        }

        // Run the compile process
        await compile(Args, Errors, freshFs, config, abortController.signal);
        logger.info("✅ Build completed successfully");
    } catch (error: unknown) {
        if (error instanceof Error) {
            if (error.name === "AbortError" || error.message === "AbortError") {
                logger.info("🛑 Build cancelled");
            } else {
                logger.error(`❌ Build failed: ${error.message}`);
            }
        } else {
            logger.error("❌ Build failed with unknown error");
        }
    }
}

export const watchAndCompile = async (
    Args: Args,
    Errors: CliErrors,
    Fs: VirtualFileSystem,
    config: Config,
    watchPath: string,
    compile: (
        Args: Args,
        Errors: CliErrors,
        Fs: VirtualFileSystem,
        config: Config,
        signal?: AbortSignal,
    ) => Promise<void>,
) => {
    const logger = new Logger(
        Args.single("quiet") ? LogLevel.NONE : LogLevel.INFO,
    );
    logger.info("👀 Watching for changes...");

    try {
        // Start watching the directory
        const watcher = watch(watchPath, { recursive: true });

        // Perform an initial compilation
        await compile(Args, Errors, Fs, config);
        logger.info("✅ Initial build completed successfully");

        // Process events as they come in
        for await (const event of watcher) {
            await processWatchEvent(
                event,
                logger,
                Args,
                Errors,
                Fs,
                config,
                watchPath,
                compile,
            );
        }
    } catch (error: unknown) {
        if (error instanceof Error) {
            logger.error(`❌ Watch mode error: ${error.message}`);
        } else {
            logger.error("❌ Watch mode error: Unknown error occurred");
        }
        process.exit(1);
    }
};
