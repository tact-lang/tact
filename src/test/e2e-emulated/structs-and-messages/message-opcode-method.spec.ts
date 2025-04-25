import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";
import { MessageOpcode } from "@/test/e2e-emulated/structs-and-messages/output/message-opcode-method_MessageOpcode";

const deployValue = toNano("1"); // `dump` is expensive

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;

    const treasury = await blockchain.treasury("treasury");

    const contract = blockchain.openContract(await MessageOpcode.fromInit());

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

describe("message-opcode-method", () => {
    const state = cached(setup);

    it("should return correct opcodes", async () => {
        const { contract } = await state.get();
        expect(Number(await contract.getAddOpcode())).toEqual(
            MessageOpcode.opcodes["Add"],
        );
        expect(Number(await contract.getSubOpcode())).toEqual(
            MessageOpcode.opcodes["Sub"],
        );
        expect(Number(await contract.getMulOpcode())).toEqual(
            MessageOpcode.opcodes["Mul"],
        );
        expect(Number(await contract.getDivOpcode())).toEqual(
            MessageOpcode.opcodes["Div"],
        );
    });
});
