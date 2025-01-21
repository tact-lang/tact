import { run } from "../cli/node";
import path from "path";
import { Logger } from "../context/logger";
import { __DANGER__disableVersionNumber } from "../pipeline/version";

const configPath = path.join(__dirname, "tact.config.json");

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const logger = new Logger();

    try {
        const compileResult = await run({
            configPath,
        });
        if (!compileResult.ok) {
            throw new Error("Tact projects compilation failed");
        }
    } catch (error) {
        logger.error(error as Error);
        process.exit(1);
    }
};

void main();
