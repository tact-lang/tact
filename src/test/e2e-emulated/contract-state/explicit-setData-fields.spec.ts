import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/explicit-setData-fields_Test";
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

describe("explicit setData for contract with fields", () => {
    const state = cached(setup);

    it("should correctly update state", async () => {
        const { contract, treasury } = await state.get();

        await contract.send(
            treasury.getSender(),
            {
                value: toNano("1"),
            },
            { $$type: "Msg1" },
        );

        await contract.send(
            treasury.getSender(),
            {
                value: toNano("1"),
            },
            { $$type: "Msg2" },
        );

        expect(await contract.getSeqno()).toEqual(2n);
    });
});
