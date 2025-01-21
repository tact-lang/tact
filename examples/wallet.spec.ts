import { storeTransfer, Transfer, Wallet } from "./output/wallet_Wallet";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import { beginCell, toNano } from "@ton/core";
import { sign } from "@ton/crypto";
import { testKey } from "@/utils/testKey";
import "@ton/test-utils";

describe("wallet", () => {
    let blockchain: Blockchain;
    let treasure: SandboxContract<TreasuryContract>;
    let contract: SandboxContract<Wallet>;
    let key: { publicKey: Buffer; secretKey: Buffer };

    beforeEach(async () => {
        blockchain = await Blockchain.create();
        blockchain.verbosity.print = false;
        treasure = await blockchain.treasury("treasure");

        key = testKey("wallet-key");
        const publicKey = beginCell()
            .storeBuffer(key.publicKey)
            .endCell()
            .beginParse()
            .loadUintBig(256);

        contract = blockchain.openContract(
            await Wallet.fromInit(publicKey, 0n),
        );

        const deployResult = await contract.send(
            treasure.getSender(),
            { value: toNano("10") },
            "Deploy",
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
            deploy: true,
        });

        // Initial state checks
        expect(await contract.getPublicKey()).toBe(publicKey);
        expect(await contract.getWalletId()).toBe(0n);
        expect(await contract.getSeqno()).toBe(0n);
    });

    it("should deploy and handle transactions correctly", async () => {
        // Send transfer and check seqno
        const transfer: Transfer = {
            $$type: "Transfer",
            seqno: 0n,
            mode: 1n,
            amount: toNano(10),
            to: treasure.address,
            body: null,
        };
        const signature = sign(
            beginCell().store(storeTransfer(transfer)).endCell().hash(),
            key.secretKey,
        );

        const transferResult = await contract.send(
            treasure.getSender(),
            { value: toNano(1) },
            {
                $$type: "TransferMessage",
                transfer,
                signature: beginCell()
                    .storeBuffer(signature)
                    .endCell()
                    .asSlice(),
            },
        );
        expect(transferResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        // Verify that the contract sent the requested transfer message
        expect(transferResult.transactions).toHaveTransaction({
            from: contract.address,
            to: treasure.address,
            success: true,
            value: toNano(10),
            // Add any other specific details you want to check
        });

        expect(await contract.getSeqno()).toBe(1n);

        // Send empty message and check seqno
        const notifyResult = await contract.send(
            treasure.getSender(),
            { value: toNano(1) },
            "notify",
        );
        expect(notifyResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        expect(await contract.getSeqno()).toBe(2n);

        // Send comment message and check seqno
        const commentResult = await contract.send(
            treasure.getSender(),
            { value: toNano(1) },
            null,
        );
        expect(commentResult.transactions).toHaveTransaction({
            from: treasure.address,
            to: contract.address,
            success: true,
        });

        expect(await contract.getSeqno()).toBe(3n);
    });
});
