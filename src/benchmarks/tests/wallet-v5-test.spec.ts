import type {
    BlockchainSnapshot,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { Address, Cell } from "@ton/core";
import { external } from "@ton/core";
import { SendMode } from "@ton/core";
import { beginCell, Dictionary, toNano } from "@ton/core";
import "@ton/test-utils";

import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed, sign } from "@ton/crypto";
import {
    bufferToBigInt,
    createAddExtActionMsg,
    createSendTxActionMsg,
    sendInternalMessageFromExtension,
    validUntil,
} from "@/benchmarks/wallet-v5/utils";
import { WalletV5 } from "@/benchmarks/wallet-v5/tact/output/wallet-v5_WalletV5";

export function packAddress(address: Address) {
    return bufferToBigInt(address.hash);
}

const createSeqno = () => {
    let seqnoValue = 0n;

    return () => {
        const value = seqnoValue;
        seqnoValue++;
        return value;
    };
};

describe("Wallet v5 correctness tests", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let receiver: SandboxContract<TreasuryContract>;
    let walletV5: SandboxContract<WalletV5>;
    let seqno: () => bigint;

    let snapshot: BlockchainSnapshot;

    let keypair: KeyPair;

    const SUBWALLET_ID = 0n;

    async function sendSignedActionBody(
        walletAddress: Address,
        actions: Cell,
        kind: "external" | "internal",
    ) {
        const seqnoValue = seqno();

        const requestToSign = beginCell()
            .storeUint(
                kind === "external"
                    ? WalletV5.opcodes.ExternalSignedRequest
                    : WalletV5.opcodes.InternalSignedRequest,
                32,
            )
            .storeUint(SUBWALLET_ID, 32)
            .storeUint(validUntil(), 32)
            .storeUint(seqnoValue, 32)
            .storeSlice(actions.asSlice());

        const operationHash = requestToSign.endCell().hash();
        const signature = sign(operationHash, keypair.secretKey);

        const dataCell = beginCell().storeBuffer(signature, 64).asSlice();
        const operationMsg = requestToSign
            .storeBuilder(dataCell.asBuilder())
            .endCell();

        return await (kind === "external"
            ? blockchain.sendMessage(
                  external({
                      to: walletAddress,
                      body: operationMsg,
                  }),
              )
            : deployer.send({
                  to: walletAddress,
                  value: toNano("0.1"),
                  body: operationMsg,
              }));
    }

    beforeAll(async () => {
        blockchain = await Blockchain.create();

        keypair = keyPairFromSeed(await getSecureRandomBytes(32));

        deployer = await blockchain.treasury("deployer");
        receiver = await blockchain.treasury("receiver");

        seqno = createSeqno();

        walletV5 = blockchain.openContract(
            await WalletV5.fromInit(
                true,
                0n,
                SUBWALLET_ID,
                bufferToBigInt(keypair.publicKey),
                Dictionary.empty(),
            ),
        );

        const deployResult = await walletV5.send(
            deployer.getSender(),
            {
                value: toNano("0.05"),
            },
            beginCell().endCell().asSlice(),
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: walletV5.address,
            deploy: true,
            success: true,
        });

        // top up wallet balance
        await deployer.send({
            to: walletV5.address,
            value: toNano("10"),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        });

        snapshot = blockchain.snapshot();
    });

    beforeEach(async () => {
        await blockchain.loadFrom(snapshot);
    });

    it("should return instead of throw on unauthorized extension message", async () => {
        const testReceiver = receiver.address;

        const forwardValue = toNano(0.001);
        const receiverBalanceBefore = (
            await blockchain.getContract(testReceiver)
        ).balance;

        const sendTxActionsList = createSendTxActionMsg(
            testReceiver,
            forwardValue,
        );

        const extensionTransferResult = await sendInternalMessageFromExtension(
            deployer,
            walletV5.address,
            {
                body: sendTxActionsList,
                value: toNano("0.1"),
            },
        );

        expect(extensionTransferResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: walletV5.address,
            success: true,
            exitCode: 0, // return instead of throw
        });

        // external to extension + internal with return, no send message
        expect(extensionTransferResult.transactions.length).toEqual(2);

        const receiverBalanceAfter = (
            await blockchain.getContract(testReceiver)
        ).balance;

        // did not change
        expect(receiverBalanceAfter).toEqual(receiverBalanceBefore);
    });

    it("should throw on attempt to add extension that already exists", async () => {
        // add deployer as extension
        const actionsListAddExt = createAddExtActionMsg(deployer.address);
        await sendSignedActionBody(
            walletV5.address,
            actionsListAddExt,
            "internal",
        );

        const extensions = await walletV5.getGetExtensions();
        // first successful extension add
        expect(extensions.get(packAddress(deployer.address))).toEqual(true);

        const secondAddExtensionResult = await sendSignedActionBody(
            walletV5.address,
            actionsListAddExt,
            "internal",
        );

        expect(secondAddExtensionResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: walletV5.address,
            exitCode: 139, // throw on map.exist check
        });
    });
});
