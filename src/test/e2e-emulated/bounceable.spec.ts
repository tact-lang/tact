import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./contracts/output/bounceable_Test";
import "@ton/test-utils";

describe("Context.bounceable", () => {
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

    it("should set to true for bounce message", async () => {
        await contract.send(
            treasure.getSender(),
            { value: toNano("10"), bounce: true },
            "test",
        );

        expect(await contract.getWasBounceable()).toEqual(true);
    });

    it("should set to false for non bounce message", async () => {
        await contract.send(
            treasure.getSender(),
            { value: toNano("10"), bounce: false },
            "test",
        );

        expect(await contract.getWasBounceable()).toEqual(false);
    });
});
