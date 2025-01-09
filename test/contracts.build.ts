import { run } from "../src/node";
import path from "path";
import { Logger } from "../src/010-pipeline/logger";
import { __DANGER__disableVersionNumber } from "../src/010-pipeline/version";

// Read cases
void (async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const logger = new Logger();

    try {
        // Compile projects
        const compileResult = await run({
            configPath: path.join(__dirname, "tact.config.json"),
        });
        if (!compileResult.ok) {
            throw new Error("Tact projects compilation failed");
        }
    } catch (error) {
        logger.error(error as Error);
        process.exit(1);
    }
})();
