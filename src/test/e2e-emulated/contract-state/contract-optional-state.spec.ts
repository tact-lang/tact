import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/contract-optional-state_Test";
import "@ton/test-utils";

describe("contract optional state", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;
    let contract2: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(await Test.fromInit(0n));
        contract2 = blockchain.openContract(await Test.fromInit(10n));

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

        const result2 = await contract2.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            null,
        );

        expect(result2.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract2.address,
            success: true,
            deploy: true,
        });
    });

    it("should return value correctly", async () => {
        expect(await contract.getContractState()).toEqual(null);
        expect(await contract2.getContractState()).toMatchObject({ x: 10n });
    });
});
