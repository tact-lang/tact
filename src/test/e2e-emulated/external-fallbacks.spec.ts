import { toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { ExternalFallbacksTester } from "./contracts/output/external-fallbacks_ExternalFallbacksTester";
import "@ton/test-utils";

describe("external fallbacks", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<ExternalFallbacksTester>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await ExternalFallbacksTester.fromInit(),
        );

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

        expect(await contract.getGetA()).toBe(100n);
    });

    it("should implement external fallbacks correctly", async () => {
        // Test the `Add` function via internal message
        const addResultInternal = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            {
                $$type: "Add",
                x: 10n,
            },
        );
        expect(addResultInternal.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });
        expect(await contract.getGetA()).toBe(110n);

        // Test the `Add` function via external message
        const addResultExternal = await contract.sendExternal({
            $$type: "Add",
            x: 10n,
        });
        expect(addResultExternal.transactions).toHaveTransaction({
            to: contract.address,
            success: true,
        });
        expect(await contract.getGetA()).toBe(120n);

        // Test the external fallback handling (null external message)
        const fallbackResult = await contract.sendExternal(null);
        expect(fallbackResult.transactions).toHaveTransaction({
            to: contract.address,
            success: true,
        });
        expect(await contract.getGetA()).toBe(220n);
    });
});
