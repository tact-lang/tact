import { __DANGER__disableVersionNumber } from "@/pipeline/version";
import { allInFolder } from "@/test/utils/all-in-folder.build";

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    await allInFolder(
        __dirname,
        ["./**/*.tact"],
        {
            debug: false,
            experimental: { inline: true },
            safety: { nullChecks: false },
            optimizations: {
                alwaysSaveContractData: false,
                internalExternalReceiversOutsideMethodsMap: true,
            },
        },
        "fullWithDecompilation",
    );
};

void main();
