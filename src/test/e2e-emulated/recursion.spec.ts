import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { RecursionTester } from "./contracts/output/recursion_RecursionTester";
import "@ton/test-utils";

describe("recursion", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<RecursionTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(await RecursionTester.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should perform recursive operations correctly", async () => {
        // Check Fibonacci sequence
        expect(await contract.getFib(0n)).toBe(0n);
        expect(await contract.getFib(1n)).toBe(1n);
        expect(await contract.getFib(2n)).toBe(1n);
        expect(await contract.getFib(3n)).toBe(2n);

        // Check Factorial calculations
        expect(await contract.getFact(0n)).toBe(1n);
        expect(await contract.getFact(1n)).toBe(1n);
        expect(await contract.getFact(2n)).toBe(2n);
        expect(await contract.getFact(3n)).toBe(6n);
    });
});
