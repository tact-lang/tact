import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Test } from "./output/require_Test";
import "@ton/test-utils";

describe("require", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Test>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");
        contract = blockchain.openContract(await Test.fromInit());

        const result = await contract.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            null, // No specific message, sending a basic transfer
        );

        expect(result.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should throw correct error", async () => {
        const result = await contract.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            "self constant",
        );
        expect(result.transactions).toHaveTransaction({
            exitCode: 59195,
        });

        const result2 = await contract.send(
            treasure.getSender(),
            {
                value: toNano("10"),
            },
            "global constant",
        );
        expect(result2.transactions).toHaveTransaction({
            exitCode: 33768,
        });
    });
});
