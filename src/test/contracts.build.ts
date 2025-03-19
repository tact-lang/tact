import { __DANGER__disableVersionNumber } from "../pipeline/version";
import { allInFolder } from "./utils/all-in-folder.build";

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    const options = {
        debug: true,
        experimental: { inline: false },
        safety: { nullChecks: false },
        optimizations: {
            alwaysSaveContractData: false,
            internalExternalReceiversOutsideMethodsMap: true,
        },
    };

    await allInFolder(
        __dirname,
        [
            "e2e-emulated/contracts/*.tact",
            "codegen/all-contracts.tact",
            "exit-codes/contracts/*.tact",
            "send-modes/contracts/*.tact",
        ],
        options,
    );

    await allInFolder(__dirname, ["gas-consumption/contracts/*.tact"], {
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
