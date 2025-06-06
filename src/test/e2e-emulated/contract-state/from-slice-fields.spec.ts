import { beginCell, toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/from-slice-fields_Test";
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

describe("fromSlice for contract with fields", () => {
    const state = cached(setup);

    it("should correctly deserialize", async () => {
        const { contract, treasury } = await state.get();

        await contract.send(
            treasury.getSender(),
            {
                value: toNano("1"),
            },
            {
                $$type: "NewContractData",
                slice: beginCell()
                    .storeBit(1)
                    .storeUint(1, 32)
                    .storeUint(2, 32)
                    .endCell()
                    .beginParse(),
            },
        );
        expect(await contract.getState()).toMatchObject({
            $$type: "Test$Data",
            x: 1n,
            y: 2n,
        });
        expect(await contract.getInverseLaw()).toEqual(true);
    });
});
