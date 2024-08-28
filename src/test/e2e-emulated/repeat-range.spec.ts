import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { RepeatRange } from "./contracts/output/repeat-range_RepeatRange";
import "@ton/test-utils";

describe("repeat range", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<RepeatRange>;

    beforeEach(async () => {
        const LARGE_SUM = 10_000_000_000n;

        blockchain = await Blockchain.create();
        treasure = await blockchain.treasury("treasure", {
            balance: LARGE_SUM,
            resetBalanceIfZero: true,
        });

        contract = blockchain.openContract(await RepeatRange.fromInit());

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

        const topUpResult = await treasure.send({
            to: contract.address,
            value: LARGE_SUM,
        });

        expect(topUpResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });
    });

    it("should test repeat range boundaries", async () => {
        // ignored range
        expect(await contract.getTestIgnoredRange()).toEqual(0n);

        // invalid range
        expect(await contract.getTestInvalidRange()).toEqual(1n);

        // effective range
        const sendResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "effectiveRange",
        );
        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });
        expect(await contract.getEffectiveRangeCounter()).toEqual(2n ** 31n);
    });
});
