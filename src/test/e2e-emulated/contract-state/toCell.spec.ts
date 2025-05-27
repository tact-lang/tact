import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/toCell_Test";
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
            b: 1n,
            c: 2n,
            d: 3n,
            e: 4n,
            f: 5n,
            g: 6n,
            h: 7n,
            i: 8n,
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

describe("toCell", () => {
    const state = cached(setup);

    it("should return same cells with self.state.toCell() and self.toCell()", async () => {
        const { contract } = await state.get();

        expect(await contract.getCheckCells()).toEqual(true);
    });
});
