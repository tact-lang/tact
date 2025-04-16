import { toNano } from "@ton/core";
import { Blockchain } from "@ton/sandbox";
import {
    Test,
    GLOBAL_ERROR_VOTING_ENDED,
    Test_errors_backward,
} from "./output/require_Test";
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

describe("require", () => {
    const state = cached(setup);

    it("should throw correct error", async () => {
        const { contract, treasury } = await state.get();

        const result = await contract.send(
            treasury.getSender(),
            {
                value: toNano("10"),
            },
            "self constant",
        );
        expect(result.transactions).toHaveTransaction({
            exitCode: Test_errors_backward[Test.ERROR_VOTING_ENDED],
        });

        const result2 = await contract.send(
            treasury.getSender(),
            {
                value: toNano("10"),
            },
            "global constant",
        );
        expect(result2.transactions).toHaveTransaction({
            exitCode: Test_errors_backward[GLOBAL_ERROR_VOTING_ENDED],
        });
    });
});
