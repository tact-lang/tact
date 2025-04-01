import { toNano } from "@/core";
import type { SandboxContract, TreasuryContract } from "@/sandbox";
import { Blockchain } from "@/sandbox";
import { TraitsConstantContract } from "./output/base-trait-constant-override-1_TraitsConstantContract";
import "@/jest-utils";

describe("base-trait-constant-override-1", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TraitsConstantContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await TraitsConstantContract.fromInit(),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("0.5") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should override constant correctly", async () => {
        expect(await contract.getConstant()).toEqual(100n);
    });
});
