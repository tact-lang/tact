import { __DANGER__disableVersionNumber } from "../pipeline/version";
import { allInFolder } from "./utils/all-in-folder.build";

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    await allInFolder(__dirname, [
        "e2e-emulated/contracts/*.tact",
        "codegen/all-contracts.tact",
        "exit-codes/contracts/*.tact",
        "send-modes/contracts/*.tact",
    ]);
};

void main();
