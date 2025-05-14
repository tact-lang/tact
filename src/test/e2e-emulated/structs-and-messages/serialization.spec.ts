import { beginCell, toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/serialization_Test";
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

describe("serialization", () => {
    const state = cached(setup);

    it("should deploy", async () => {
        const { contract, treasury } = await state.get();

        const result = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            {
                $$type: "Foo",
                slice: beginCell().asSlice(),
                builder: null,
                string: "null",
            },
        );

        expect(result.transactions).toHaveTransaction({
            success: true,
        });
    });
});
