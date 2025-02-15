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

let currentCompilation: Promise<void> | null = null;
let abortController: AbortController | null = null;

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
        const watcher = watch(watchPath, { recursive: true });

        // Initial compilation
        currentCompilation = compile(Args, Errors, Fs, config);
        await currentCompilation;
        logger.info("✅ Initial build completed successfully");

        for await (const event of watcher) {
            if (
                event.filename?.endsWith(".tact") ||
                event.filename === "tact.config.json"
            ) {
                logger.info(
                    `🔄 Change detected in ${event.filename}, rebuilding...`,
                );

                // Cancel previous compilation if it's still running
                if (abortController) {
                    abortController.abort();
                }

                // Create new abort controller for this compilation
                abortController = new AbortController();

                // Small delay to handle multiple rapid changes
                await new Promise((resolve) => setTimeout(resolve, 100));

                try {
                    // Create a fresh file system instance using the original root
                    const freshFs = createNodeFileSystem(Fs.root, false);

                    // If it's a config file, reload the config
                    if (event.filename === "tact.config.json") {
                        const configPath = join(watchPath, "tact.config.json");
                        if (!freshFs.exists(configPath)) {
                            logger.error(
                                "❌ Config file not found after change",
                            );
                            continue;
                        }
                        const configText = freshFs
                            .readFile(configPath)
                            .toString("utf-8");
                        try {
                            const newConfig = parseConfig(configText);
                            config = newConfig;
                        } catch (e) {
                            if (e instanceof ZodError) {
                                logger.error(
                                    `❌ Config error: ${e.toString()}`,
                                );
                            } else {
                                throw e;
                            }
                            continue;
                        }
                    }

                    // For .tact files, verify the file exists and is readable
                    if (event.filename.endsWith(".tact")) {
                        const filePath = join(watchPath, event.filename);
                        if (!freshFs.exists(filePath)) {
                            logger.error(
                                `❌ File not found after change: ${event.filename}`,
                            );
                            continue;
                        }
                    }

                    currentCompilation = compile(
                        Args,
                        Errors,
                        freshFs,
                        config,
                        abortController.signal,
                    );
                    await currentCompilation;
                    logger.info("✅ Build completed successfully");
                } catch (error: unknown) {
                    if (error instanceof Error) {
                        if (
                            error.name === "AbortError" ||
                            error.message === "AbortError"
                        ) {
                            logger.info("🛑 Build cancelled");
                        } else {
                            logger.error(`❌ Build failed: ${error.message}`);
                        }
                    } else {
                        logger.error("❌ Build failed with unknown error");
                    }
                }
            }
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
