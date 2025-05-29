import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/toCellForContractWithInit_Test";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";

const deployValue = toNano("1");

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;

    const treasury = await blockchain.treasury("treasury");
    const contract = blockchain.openContract(await Test.fromInit(10n));

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

describe("toCell for contract with init()", () => {
    const state = cached(setup);

    it("should return correct Cell from self.toCell()", async () => {
        const { contract } = await state.get();

        expect((await contract.getAsCell()).toString()).toMatchSnapshot();
    });
});
