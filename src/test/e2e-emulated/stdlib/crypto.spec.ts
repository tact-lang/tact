import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import { Tester } from "./output/crypto_Tester";
import "@ton/test-utils";
import { cached } from "@/test/utils/cache-state";

const setup = async () => {
    const blockchain = await Blockchain.create();
    blockchain.verbosity.print = false;
    const treasury = await blockchain.treasury("treasury");

    const contract = blockchain.openContract(await Tester.fromInit());

    const deployResult = await contract.send(
        treasury.getSender(),
        { value: toNano("1") },
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

describe("keccak256() function", () => {
    const state = cached(setup);

    it("should hash values correctly in a receiver", async () => {
        const { contract, treasury } = await state.get();
        const _ = await contract.send(
            treasury.getSender(),
            { value: toNano("10") },
            "keccak256",
        );

        // TODO: tests in progress!
        // expect(result.transactions[1]?.debugLogs).toMatchSnapshot();
    });
});
