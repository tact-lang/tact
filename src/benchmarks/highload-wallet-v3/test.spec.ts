import { testHighloadWalletV3 } from "@/benchmarks/highload-wallet-v3/tests/highload-wallet";
import { HighloadWalletV3 } from "@/benchmarks/highload-wallet-v3/tact/output/highload-wallet-v3_HighloadWalletV3";
import { fromInitHighloadWalletV3_FunC } from "@/benchmarks/highload-wallet-v3/tests/utils";

describe("Highload Wallet V3 Tests", () => {
    describe("func", () => {
        testHighloadWalletV3(fromInitHighloadWalletV3_FunC);
    });

    describe("tact", () => {
        testHighloadWalletV3(HighloadWalletV3.fromInit.bind(HighloadWalletV3));
    });
});
