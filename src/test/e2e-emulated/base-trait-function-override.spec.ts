import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { BaseTraitsFunctionContract } from "./contracts/output/base-trait-function-override_BaseTraitsFunctionContract";
import "@ton/test-utils";

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
