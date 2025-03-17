import { beginCell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import "@ton/test-utils";
import { ThrowOnlyFallbackEmpty } from "./contracts/output/throw-only-fallback_ThrowOnlyFallbackEmpty";
import { ThrowOnlyFallbackText } from "./contracts/output/throw-only-fallback_ThrowOnlyFallbackText";
import { ThrowOnlyFallbackBinary } from "./contracts/output/throw-only-fallback_ThrowOnlyFallbackBinary";
import { ThrowOnlyFallbackMixed } from "./contracts/output/throw-only-fallback_ThrowOnlyFallbackMixed";
import { NotThrowOnlyFallback } from "./contracts/output/throw-only-fallback_NotThrowOnlyFallback";

describe("throw only fallback", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let throwOnlyFallbackEmptyContract: SandboxContract<ThrowOnlyFallbackEmpty>;
    let throwOnlyFallbackTextContract: SandboxContract<ThrowOnlyFallbackText>;
    let throwOnlyFallbackBinaryContract: SandboxContract<ThrowOnlyFallbackBinary>;
    let throwOnlyFallbackMixedContract: SandboxContract<ThrowOnlyFallbackMixed>;
    let notThrowOnlyFallbackContract: SandboxContract<NotThrowOnlyFallback>;

    function getThrowOnlyAddresses() {
        return [
            throwOnlyFallbackEmptyContract.address,
            throwOnlyFallbackTextContract.address,
            throwOnlyFallbackBinaryContract.address,
            throwOnlyFallbackMixedContract.address,
        ];
    }

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure", {
            resetBalanceIfZero: true,
        });

        throwOnlyFallbackEmptyContract = blockchain.openContract(
            await ThrowOnlyFallbackEmpty.fromInit(),
        );
        throwOnlyFallbackTextContract = blockchain.openContract(
            await ThrowOnlyFallbackText.fromInit(),
        );
        throwOnlyFallbackBinaryContract = blockchain.openContract(
            await ThrowOnlyFallbackBinary.fromInit(),
        );
        throwOnlyFallbackMixedContract = blockchain.openContract(
            await ThrowOnlyFallbackMixed.fromInit(),
        );
        notThrowOnlyFallbackContract = blockchain.openContract(
            await NotThrowOnlyFallback.fromInit(),
        );

        const contracts = [
            throwOnlyFallbackEmptyContract,
            throwOnlyFallbackTextContract,
            throwOnlyFallbackBinaryContract,
            throwOnlyFallbackMixedContract,
            notThrowOnlyFallbackContract,
        ];

        for (const contract of contracts) {
            const deployResult = await contract.send(
                treasure.getSender(),
                { value: toNano("10") },
                beginCell().asSlice(),
            );

            expect(deployResult.transactions).toHaveTransaction({
                from: treasure.address,
                to: contract.address,
                deploy: true,
            });
        }
    });

    it("should omit throw-only fallback receiver and change exit code", async () => {
        const addresses = getThrowOnlyAddresses();

        for (const address of addresses) {
            const sendResult = await treasure.send({
                to: address,
                value: toNano("1"),
                bounce: true,
                body: beginCell().storeUint(0xff, 32).endCell(), // some random body so we hit the fallback
            });

            expect(sendResult.transactions).toHaveTransaction({
                from: treasure.address,
                to: address,
                success: false,
                exitCode: 0xffff,
            });
        }
    });

    it("should not change not-throw-only fallback", async () => {
        const address = notThrowOnlyFallbackContract.address;

        const sendResult = await treasure.send({
            to: address,
            value: toNano("1"),
            bounce: true,
            body: beginCell().storeUint(0xff, 32).endCell(), // some random body so we hit the fallback
        });

        expect(sendResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: address,
            success: true,
        });
    });
});
