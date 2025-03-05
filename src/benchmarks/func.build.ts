import { __DANGER__disableVersionNumber } from "../pipeline/version";
import { promises as fs } from "fs";
import path from "path";
import { allInFolderFunc } from "../test/utils/all-in-folder.build";

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const outputDir = path.join(__dirname, "contracts/func/output");
    try {
        await fs.access(outputDir);
        await fs.rm(outputDir, { recursive: true, force: true });
    } catch {
        // Directory does not exist, no need to remove
    }

    await allInFolderFunc(__dirname, ["contracts/func/**/*.fc"]);
};

void main();
