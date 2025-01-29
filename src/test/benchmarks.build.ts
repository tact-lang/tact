import { __DANGER__disableVersionNumber } from "../pipeline/version";
import { allInFolder } from "./utils/all-in-folder.build";

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    await allInFolder(__dirname, ["benchmarks/contracts/*.tact"]);
    await allInFolder(__dirname, ["benchmarks/jetton/sources/*.tact"]);
};

void main();
