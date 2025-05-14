import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { storeFoo, Test } from "./output/inversion-law_Test";
import "@ton/test-utils";

describe("inversion-law", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");

        contract = blockchain.openContract(await Test.fromInit());

        const deployResult = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should return true for fromCell -> toCell -> fromCell", async () => {
        const b = beginCell();
        b.store(storeFoo({ $$type: "Foo", slice: beginCell().asSlice() }));
        const res = await contract.getFromCell(b.endCell());
        expect(res).toEqual(true);
    });

    it("should return true for toCell -> fromCell -> toCell", async () => {
        const res = await contract.getToCell({
            $$type: "Foo",
            slice: beginCell().asSlice(),
        });
        expect(res).toEqual(true);
    });
});
