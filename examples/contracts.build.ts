import fs from "fs";
import { run } from "../src/node";
import path from "path";
import { glob } from "glob";
import { verify } from "./verify";
import { Logger } from "../src/context/logger";
import { __DANGER__disableVersionNumber } from "../src/pipeline/version";

const configPath = path.join(__dirname, "tact.config.json");
const packagesPath = path.join(__dirname, "output", "*.pkg");

// Read cases
const main = async () => {
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
        for (const pkgPath of glob.sync(path.normalize(packagesPath))) {
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
};

void main();
