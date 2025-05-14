import { beginCell, toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { storeFoo, Test } from "./output/inversion-law_Test";
import { cached } from "@/test/utils/cache-state";
import "@ton/test-utils";

const deployValue = toNano("1");

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;
    const treasury = await blockchain.treasury("treasury");

    const contract = blockchain.openContract(await Test.fromInit());

    const deployResult = await contract.send(
        treasury.getSender(),
        { value: deployValue },
        null,
    );
    expect(deployResult.transactions).toHaveTransaction({
        from: treasury.address,
        to: contract.address,
        success: true,
        deploy: true,
    });

    return {
        blockchain,
        treasury,
        contract,
    };
};

describe("inversion-law", () => {
    const state = cached(setup);

    it("should return true for fromCell -> toCell -> fromCell", async () => {
        const { contract } = await state.get();
        const b = beginCell();
        b.store(storeFoo({ $$type: "Foo", slice: beginCell().asSlice() }));
        const res = await contract.getFromCell(b.endCell());
        expect(res).toEqual(true);
    });

    it("should return true for toCell -> fromCell -> toCell", async () => {
        const { contract } = await state.get();
        const res = await contract.getToCell({
            $$type: "Foo",
            slice: beginCell().asSlice(),
        });
        expect(res).toEqual(true);
    });
});
