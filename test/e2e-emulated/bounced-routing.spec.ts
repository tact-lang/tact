import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { SampleContract2 } from "./contracts/output/bounced-routing_SampleContract2";
import { SampleContract } from "./contracts/output/bounced-routing_SampleContract";
import "@ton/test-utils";

describe("strings", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<SampleContract>;
    let contract2: SandboxContract<SampleContract2>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await SampleContract.fromInit());
        contract2 = blockchain.openContract(await SampleContract2.fromInit());

        // Deploy contracts
        let deployResult = await contract.send(
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

        deployResult = await contract2.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract2.address,
            success: true,
            deploy: true,
        });
    });

    it("should bounce based on type router", async () => {
        // Initial amount check
        expect(await contract.getAmount()).toBe(100n);

        // Send EntryFirst message
        let result = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "EntryFirst",
                amountToAdd: 10n,
                toAddress: contract2.address,
            },
        );
        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        // Verify amount after EntryFirst
        expect(await contract.getAmount()).toBe(98n);

        // Send EntrySecond message
        result = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "EntrySecond",
                amountToAdd: 10n,
                toAddress: contract2.address,
            },
        );
        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        // Verify amount after EntrySecond
        expect(await contract.getAmount()).toBe(94n);
    });
});
