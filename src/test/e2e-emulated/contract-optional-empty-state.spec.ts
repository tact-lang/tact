import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./contracts/output/contract-optional-empty-state_Test";
import "@ton/test-utils";

describe("contract optional empty state", () => {
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

    it("should return value correctly", async () => {
        expect(await contract.getContractState(true)).toEqual(null);
        expect(await contract.getContractState(false)).toMatchObject({});
    });
});
