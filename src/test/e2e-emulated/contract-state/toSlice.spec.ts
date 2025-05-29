import { beginCell, Cell, toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/toSlice_Test";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";

const deployValue = toNano("1");

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;

    const treasury = await blockchain.treasury("treasury");
    const contract = blockchain.openContract(
        await Test.fromInit({
            $$type: "State",
            a: 0n,
            b: true,
            c: new Cell(),
            d: beginCell().storeUint(10, 32).asSlice(),
            e: beginCell().storeUint(99, 32),
            f: "Hello World",
        }),
    );

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

describe("toSlice", () => {
    const state = cached(setup);

    it("should return same cells with self.state.toSlice() and self.toSlice()", async () => {
        const { contract } = await state.get();

        const viaStruct = await contract.getLeft();
        const viaContract = await contract.getRight();
        const actualCell = viaContract.loadRef(); // Tact stores struct in ref, so we need to extract it for comparison
        expect(viaStruct.toString()).toEqual(actualCell.toString());
    });
});
