import { toNano } from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { TextMessageReceivers } from "./contracts/output/text-message-receivers_TextMessageReceivers";
import "@ton/test-utils";

describe("text-message-receivers", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<TextMessageReceivers>;

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        contract = blockchain.openContract(
            await TextMessageReceivers.fromInit(),
        );
    });

    it("should deploy", async () => {
        // Deploy the contract
        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("1") },
            { $$type: "Deploy", queryId: 0n },
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // Verify initial state
        expect(await contract.getGetCounter()).toBe(0n);
    });

    it("should increment counter with different text messages", async () => {
        // Deploy the contract
        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("1") },
            { $$type: "Deploy", queryId: 0n },
        );
        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // Verify initial state
        expect(await contract.getGetCounter()).toBe(0n);

        const sendMessage = async (
            message:
                | "increment'"
                | 'increment-2\\"'
                | "increment-3`"
                | "\\\\increment-4\\\\",
        ) => {
            const incrementResult1 = await contract.send(
                treasure.getSender(),
                { value: toNano("1") },
                message,
            );
            expect(incrementResult1.transactions).toHaveTransaction({
                from: treasure.address,
                to: contract.address,
                success: true,
            });
        };

        // Increment counter
        await sendMessage("increment'");
        expect(await contract.getGetCounter()).toBe(1n);

        await sendMessage('increment-2\\"');
        expect(await contract.getGetCounter()).toBe(3n);

        await sendMessage("increment-3`");
        expect(await contract.getGetCounter()).toBe(6n);

        await sendMessage("\\\\increment-4\\\\");
        expect(await contract.getGetCounter()).toBe(10n);
    });
});
