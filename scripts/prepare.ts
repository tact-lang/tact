import fs from "fs";
import { run } from "../src/node";
import path from "path";
import { glob } from "glob";
import { verify } from "../src/verify";
import { Logger } from "../src/context/logger";
import { __DANGER__disableVersionNumber } from "../src/pipeline/version";

// Read cases
void (async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const logger = new Logger();

    try {
        // Compile projects
        const compileResult = await run({
            configPath: path.join(__dirname, "..", "tact.config.json"),
        });
        if (!compileResult.ok) {
            throw new Error("Tact projects compilation failed");
        }

        // Verify projects
        for (const pkgPath of glob.sync(
            path.normalize(
                path.resolve(__dirname, "..", "examples", "output", "*.pkg"),
            ),
        )) {
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
