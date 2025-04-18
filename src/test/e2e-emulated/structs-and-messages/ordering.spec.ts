import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { A } from "./output/ordering_A";
import { B } from "./output/ordering_B";
import "@ton/test-utils";

describe("ordering", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");
    });

    it("should implement constructor ordering correctly in contract A", async () => {
        const contract = blockchain.openContract(
            await A.fromInit(treasury.address),
        );

        const deployResult = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // Check constructor order in contract A
        const res = await contract.getCreate(0n);
        expect(res.v1).toBe(3n);
        expect(res.v2).toBe(2n);
        expect(res.v3).toBe(1n);
    });

    it("should implement punned constructor correctly in contract B", async () => {
        const contract = blockchain.openContract(await B.fromInit());

        const deployResult = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // Check constructor order in contract B
        const res = await contract.getCreate(0n);
        expect(res.v1).toBe(1n);
        expect(res.v2).toBe(2n);
        expect(res.v3).toBe(3n);
    });
});
