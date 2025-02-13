import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { MultisigContract } from "./output/multisig-3_MultisigContract";
import "@ton/test-utils";

describe("multisig-3", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<MultisigContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        const key1 = 1n;
        const key2 = 1n;
        const key3 = 1n;

        contract = blockchain.openContract(
            await MultisigContract.fromInit(key1, key2, key3),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // Check keys
        expect(await contract.getKey1()).toBe(key1);
        expect(await contract.getKey2()).toBe(key2);
        expect(await contract.getKey3()).toBe(key3);
    });

    it("should deploy and verify keys", async () => {
        // Keys verification is already done in beforeEach
    });
});
