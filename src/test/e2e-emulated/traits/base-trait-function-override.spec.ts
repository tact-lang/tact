import { toNano } from "@/core";
import type { SandboxContract, TreasuryContract } from "@/sandbox";
import { Blockchain } from "@/sandbox";
import { BaseTraitsFunctionContract } from "./output/base-trait-function-override_BaseTraitsFunctionContract";
import "@/jest-utils";

describe("base-trait-function-override", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<BaseTraitsFunctionContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await BaseTraitsFunctionContract.fromInit(),
        );

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

    it("should override function correctly", async () => {
        expect(await contract.getValue()).toEqual(1000n);
    });
});
