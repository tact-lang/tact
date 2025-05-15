import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/contract-optional-builder_Test";
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

describe("contract optional builder", () => {
    const state = cached(setup);

    it("should run receiver correctly", async () => {
        const { contract, treasury } = await state.get();

        const res = await contract.send(
            treasury.getSender(),
            { value: deployValue },
            null,
        );
        expect(res.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
        });
    });
});
