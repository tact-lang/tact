import { run } from "../node";
import path from "path";
import { Logger } from "../context/logger";

const configPath = path.join(__dirname, "tact.config.json");

const main = async () => {
    const logger = new Logger();

    try {
        const compileResult = await run({
            configPath,
            compilerVersion: "invalid",
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
