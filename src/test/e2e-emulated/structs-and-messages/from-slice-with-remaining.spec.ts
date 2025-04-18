import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/from-slice-with-remaining_Test";
import "@ton/test-utils";

describe("fromSlice for message with remaining field", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");
        contract = blockchain.openContract(await Test.fromInit());

        const result = await contract.send(
            treasury.getSender(),
            {
                value: toNano("10"),
            },
            null,
        );

        expect(result.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should return value correctly", async () => {
        const result = await contract.getName();
        expect(result.value).toEqual(1n);
        expect(result.data).toEqualSlice(
            beginCell().storeUint(1, 32).endCell().beginParse(),
        );
    });
});
