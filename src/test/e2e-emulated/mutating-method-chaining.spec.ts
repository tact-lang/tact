import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Tester } from "./contracts/output/mutating-method-chaining_Tester";
import "@ton/test-utils";

describe("bugs", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Tester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await Tester.fromInit());

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

    it("should implement mutating method chaining correctly", async () => {
        // Ensure initial transaction works as expected
        const initialResult = await contract.send(
            treasure.getSender(),
            { value: toNano("1") },
            null,
        );

        expect(initialResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        // Check contract methods
        expect(await contract.getTest1()).toBe(0n);
        expect(await contract.getTest2()).toBe(0n);
        expect(await contract.getTest3()).toBe(6n);
        expect(await contract.getTest4()).toBe(24n);
        expect(await contract.getTest5()).toBe(97n);
        expect(await contract.getTest7()).toBe(42n);
        expect(await contract.getTest8()).toBe(5n);
        expect(await contract.getTest9()).toBe(5n);
    });
});
