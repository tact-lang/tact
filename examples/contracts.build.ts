import fs from "fs";
import path from "path";
import { glob } from "glob";
import { verify } from "./verify";
import { Logger } from "../src/context/logger";
import { __DANGER__disableVersionNumber } from "../src/pipeline/version";
import { allInFolder } from '../src/test/utils/all-in-folder.build'

const packagesPath = path.resolve(__dirname, "output", "*.pkg");

// Read cases
const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const logger = new Logger();

    // Compile projects
    await allInFolder(__dirname, ["*.tact"]);

    try {
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
