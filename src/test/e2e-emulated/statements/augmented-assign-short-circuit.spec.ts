import { toNano } from "@/core";
import type { SandboxContract, TreasuryContract } from "@/sandbox";
import { Blockchain } from "@/sandbox";
import { Test } from "./output/augmented-assign-short-circuit_Test";
import "@/jest-utils";

describe("augmented assign short circuit", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(await Test.fromInit());

        const result = await contract.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            null,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should successfully run getters", async () => {
        expect(await contract.getAnd()).toEqual(false);
        expect(await contract.getOr()).toEqual(true);
        expect(await contract.getAndAssign()).toEqual(false);
        expect(await contract.getOrAssign()).toEqual(true);
    });
});
