import { toNano } from "@/core";
import type { SandboxContract, TreasuryContract } from "@/sandbox";
import { Blockchain } from "@/sandbox";
import { Test } from "./output/contract-methods_Test";
import "@/jest-utils";

describe("contract-methods", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await Test.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should implement contract methods correctly", async () => {});
});
