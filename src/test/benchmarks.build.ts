import { __DANGER__disableVersionNumber } from "../pipeline/version";
import { allInFolder } from "./utils/all-in-folder.build";

const main = async () => {
    // Disable version number in packages
    __DANGER__disableVersionNumber();

    await allInFolder(__dirname, ["benchmarks/contracts/*.tact"]);

    // TODO: inline tests are disabled
    // await allInFolder(
    //     __dirname,
    //     ["benchmarks/inline/benchmark_functions.tact"],
    //     { debug: true },
    // );
    // await allInFolder(
    //     __dirname,
    //     ["benchmarks/inline/benchmark_functions_inline.tact"],
    //     { debug: true, experimental: { inline: true } },
    // );
};

void main();
