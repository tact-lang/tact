import fs from "fs";
import { run } from "../src/node";
import path from "path";
import { glob } from "glob";
import { verify } from "./verify";
import { Logger } from "../src/010-pipeline/logger";
import { __DANGER__disableVersionNumber } from "../src/010-pipeline/version";

const configPath = path.join(__dirname, "tact.config.json");
const packagePath = path.resolve(__dirname, "output", "*.pkg");

// Read cases
void (async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const logger = new Logger();

    try {
        // Compile projects
        const compileResult = await run({
            configPath,
        });
        if (!compileResult.ok) {
            throw new Error("Tact projects compilation failed");
        }

        // Verify projects
        for (const pkgPath of glob.sync(path.normalize(packagePath))) {
            const res = await verify({
                pkg: fs.readFileSync(pkgPath, "utf-8"),
            });
            if (!res.ok) {
                throw new Error(`Failed to verify ${pkgPath}: ${res.error}`);
            }
        }
    } catch (error) {
        logger.error(error as Error);
        process.exit(1);
    }
})();
