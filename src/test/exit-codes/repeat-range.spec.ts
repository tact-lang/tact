import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { RepeatRangeTester as TestContract } from "./contracts/output/repeat-range_RepeatRangeTester";
import "@ton/test-utils";

describe("repeat range", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TestContract>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure", {
            resetBalanceIfZero: true,
        });

        contract = blockchain.openContract(await TestContract.fromInit());

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            null,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });
    });

    it("should test repeat range boundaries", async () => {
        // ignored range
        expect(await contract.getTestIgnoredRange()).toEqual(true);

        // invalid range
        expect(await contract.getTestInvalidRange()).toEqual(true);

        // min effective range
        expect(await contract.getTestMinEffectiveRange()).toEqual(true);

        // max effective range
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "testMaxEffectiveRange",
        );
        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: false,
            exitCode: -14,
        });
    });
});
