import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/emptyMap-as-argument_Test";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";

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

describe("emptyMap as argument", () => {
    const state = cached(setup);

    it("should return correctly result for emptyMap.deepEqual(emptyMap())", async () => {
        const { contract } = await state.get();
        expect(await contract.getF()).toEqual(true);
    });
});
