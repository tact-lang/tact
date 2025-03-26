import { __DANGER__disableVersionNumber } from "../pipeline/version";
import { allInFolder } from "../test/utils/all-in-folder.build";
import { promises as fs } from "fs";
import path from "path";

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const outputDir = path.join(__dirname, "contracts/output");
    try {
        await fs.access(outputDir);
        await fs.rm(outputDir, { recursive: true, force: true });
    } catch {
        // Directory does not exist, no need to remove
    }

    await allInFolder(__dirname, ["contracts/*.tact"], {
        debug: false,
        experimental: { inline: true },
        safety: { nullChecks: false },
        optimizations: {
            alwaysSaveContractData: false,
            internalExternalReceiversOutsideMethodsMap: true,
        },
    });
};

void main();
