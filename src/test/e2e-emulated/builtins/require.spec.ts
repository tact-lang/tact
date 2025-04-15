import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import {
    Test,
    GLOBAL_ERROR_VOTING_ENDED,
    Test_errors_backward,
} from "./output/require_Test";
import "@ton/test-utils";

describe("require", () => {
    let blockchain: Blockchain;
    let treasury: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasury = await blockchain.treasury("treasury");
        contract = blockchain.openContract(await Test.fromInit());

        const result = await contract.send(
            treasury.getSender(),
            {
                value: toNano("10"),
            },
            null, // No specific message, sending a basic transfer
        );

        expect(result.transactions).toHaveTransaction({
            from: treasury.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should throw correct error", async () => {
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
