import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/init-with-as_Test";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";

const deployValue = toNano("1"); // `dump` is expensive

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;

    const treasury = await blockchain.treasury("treasury");

    return {
        blockchain,
        treasury,
    };
};

describe("init-with-as-types", () => {
    const state = cached(setup);

    it("should return correct values", async () => {
        const { blockchain, treasury } = await state.get();
        blockchain.verbosity.print = false;

        const cellData = Buffer.from("1".repeat(64));

        const contract = blockchain.openContract(
            await Test.fromInit(100n, 2000n, cellData),
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

        const field = await contract.getField();
        expect(Number(field)).toEqual(100);

        const value = await contract.getValue();
        expect(Number(value)).toEqual(2000);

        const data = await contract.getData();
        expect(data.remainingBits).toEqual(512);
        expect(data.loadBuffer(64)).toEqual(cellData);
    });
});
