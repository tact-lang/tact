import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { TestContract } from "./output/unary-plus_TestContract";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";

const deployValue = toNano("1");

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;
    const treasury = await blockchain.treasury("treasury");

    const contract = blockchain.openContract(await TestContract.fromInit());

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

describe("unary-plus", () => {
    const state = cached(setup);

    beforeEach(async () => {
        const { contract, treasury } = await state.get();

        const deployResult = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
        });
    });

    it("should implement unary plus operator correctly", async () => {
        const { contract } = await state.get();
        expect(await contract.getFoo()).toEqual(2n);
        expect(await contract.getFoo1()).toEqual(2n);
        expect(await contract.getFoo2()).toEqual(-1n);
    });
});
