import "@ton/test-utils";
import {
    Cell,
    beginCell,
    toNano,
    contractAddress,
    external,
    SendMode,
    Dictionary,
    type Address,
} from "@ton/core";

import { Blockchain } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import {
    generateResults,
    getUsedGas,
    printBenchmarkTable,
    type BenchmarkResult,
} from "@/benchmarks/utils/gas";
import { resolve } from "path";
import { readFileSync } from "fs";
import { posixNormalize } from "@/utils/filePath";
import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed, sign } from "@ton/crypto";
import {
    bufferToBigInt,
    createAddExtActionMsg,
    createSendTxActionMsg,
    createSeqnoCounter,
    sendInternalMessageFromExtension,
    validUntil,
} from "@/benchmarks/wallet-v5/utils";

import benchmarkResults from "@/benchmarks/wallet-v5/results_gas.json";
import { WalletV5 } from "@/benchmarks/wallet-v5/output/wallet-v5_WalletV5";

export function packAddress(address: Address) {
    return bufferToBigInt(address.hash);
}

function testWalletV5(
    benchmarkResult: BenchmarkResult,
    fromInit: (isActive: boolean, publicKey: bigint) => Promise<WalletV5>,
) {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let receiver: SandboxContract<TreasuryContract>;
    let wallet: SandboxContract<WalletV5>;
    let seqno: () => bigint;
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

    beforeEach(async () => {
        blockchain = await Blockchain.create();

        keypair = keyPairFromSeed(await getSecureRandomBytes(32));

        deployer = await blockchain.treasury("deployer");
        receiver = await blockchain.treasury("receiver");

        seqno = createSeqnoCounter();

        wallet = blockchain.openContract(
            await fromInit(true, bufferToBigInt(keypair.publicKey)),
        );

        const deployResult = await wallet.send(
            deployer.getSender(),
            {
                value: toNano("0.05"),
            },
            beginCell().endCell().asSlice(),
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: wallet.address,
            deploy: true,
            success: true,
        });

        // Top up wallet balance
        await deployer.send({
            to: wallet.address,
            value: toNano("10"),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        });
    });

    it("check correctness of deploy", async () => {
        const walletSeqno = await wallet.getSeqno();

        expect(walletSeqno).toBe(0n);

        const walletPublicKey = await wallet.getGetPublicKey();

        expect(walletPublicKey).toBe(bufferToBigInt(keypair.publicKey));
    });

    it("externalTransfer", async () => {
        const testReceiver = receiver.address;
        const forwardValue = toNano(1);

        const receiverBalanceBefore = (
            await blockchain.getContract(testReceiver)
        ).balance;

        const sendTxActionsList = createSendTxActionMsg(
            testReceiver,
            forwardValue,
        );

        const externalTransferSendResult = await sendSignedActionBody(
            wallet.address,
            sendTxActionsList,
            "external",
        );

        expect(externalTransferSendResult.transactions).toHaveTransaction({
            to: wallet.address,
            success: true,
            exitCode: 0,
        });

        expect(externalTransferSendResult.transactions.length).toEqual(2);

        expect(externalTransferSendResult.transactions).toHaveTransaction({
            from: wallet.address,
            to: testReceiver,
            value: forwardValue,
        });

        const fee = externalTransferSendResult.transactions[1]!.totalFees.coins;
        const receiverBalanceAfter = (
            await blockchain.getContract(testReceiver)
        ).balance;

        expect(receiverBalanceAfter).toEqual(
            receiverBalanceBefore + forwardValue - fee,
        );

        const externalTransferGasUsed = getUsedGas(
            externalTransferSendResult,
            "external",
        );
        expect(externalTransferGasUsed).toEqual(
            benchmarkResult.gas["externalTransfer"],
        );
    });

    it("internalTransfer", async () => {
        const testReceiver = receiver.address;
        const forwardValue = toNano(1);

        const receiverBalanceBefore = (
            await blockchain.getContract(testReceiver)
        ).balance;

        const sendTxActionsList = createSendTxActionMsg(
            testReceiver,
            forwardValue,
        );

        const internalTransferSendResult = await sendSignedActionBody(
            wallet.address,
            sendTxActionsList,
            "internal",
        );

        expect(internalTransferSendResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: wallet.address,
            success: true,
            exitCode: 0,
        });

        expect(internalTransferSendResult.transactions.length).toEqual(3);

        expect(internalTransferSendResult.transactions).toHaveTransaction({
            from: wallet.address,
            to: testReceiver,
            value: forwardValue,
        });

        const fee = internalTransferSendResult.transactions[2]!.totalFees.coins;
        const receiverBalanceAfter = (
            await blockchain.getContract(testReceiver)
        ).balance;

        expect(receiverBalanceAfter).toEqual(
            receiverBalanceBefore + forwardValue - fee,
        );

        const internalTransferGasUsed = getUsedGas(
            internalTransferSendResult,
            "internal",
        );
        expect(internalTransferGasUsed).toEqual(
            benchmarkResult.gas["internalTransfer"],
        );
    });

    it("addExtension", async () => {
        const testExtension = receiver.address;

        const addExtActionsList = createAddExtActionMsg(testExtension);
        const addExtensionSendResult = await sendSignedActionBody(
            wallet.address,
            addExtActionsList,
            "external",
        );

        expect(addExtensionSendResult.transactions).toHaveTransaction({
            to: wallet.address,
            success: true,
            exitCode: 0,
        });

        const extensions = await wallet.getGetExtensions();
        expect(extensions.size).toEqual(1);
        expect(extensions.get(packAddress(testExtension))).toEqual(true);

        const addExtensionGasUsed = getUsedGas(
            addExtensionSendResult,
            "external",
        );
        expect(addExtensionGasUsed).toEqual(
            benchmarkResult.gas["addExtension"],
        );
    });

    it("extensionTransfer", async () => {
        const testReceiver = receiver.address;

        const forwardValue = toNano(0.001);
        const receiverBalanceBefore = (
            await blockchain.getContract(testReceiver)
        ).balance;

        // add deployer as extension
        const actionsListAddExt = createAddExtActionMsg(deployer.address);
        await sendSignedActionBody(
            wallet.address,
            actionsListAddExt,
            "internal",
        );

        const extensions = await wallet.getGetExtensions();
        expect(extensions.get(packAddress(deployer.address))).toEqual(true);

        const sendTxActionsList = createSendTxActionMsg(
            testReceiver,
            forwardValue,
        );

        const extensionTransferResult = await sendInternalMessageFromExtension(
            deployer,
            wallet.address,
            {
                body: sendTxActionsList,
                value: toNano("0.1"),
            },
        );

        expect(extensionTransferResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: wallet.address,
            success: true,
            exitCode: 0,
        });

        // external to ext + internal + ext transfer action
        expect(extensionTransferResult.transactions.length).toEqual(3);

        expect(extensionTransferResult.transactions).toHaveTransaction({
            from: wallet.address,
            to: testReceiver,
            success: true,
            value: forwardValue,
            exitCode: 0,
        });

        const fee = extensionTransferResult.transactions[2]!.totalFees.coins;
        const receiverBalanceAfter = (
            await blockchain.getContract(testReceiver)
        ).balance;

        expect(receiverBalanceAfter).toEqual(
            receiverBalanceBefore + forwardValue - fee,
        );

        const extensionTransferGasUsed = getUsedGas(
            extensionTransferResult,
            "internal",
        );
        expect(extensionTransferGasUsed).toEqual(
            benchmarkResult.gas["extensionTransfer"],
        );
    });
}

describe("WalletV5 Gas Tests", () => {
    const fullResults = generateResults(benchmarkResults);

    describe("func", () => {
        const funcResult = fullResults.at(0)!;

        async function fromFuncInit(isActive: boolean, publicKey: bigint) {
            const bocWallet = readFileSync(
                posixNormalize(
                    resolve(
                        __dirname,
                        "./output/wallet-v5.boc",
                    ),
                ),
            );

            const walletCell = Cell.fromBoc(bocWallet)[0]!;

            const stateInitWallet = beginCell()
                .storeBit(isActive)
                .storeUint(0, 32)
                .storeUint(0n, 32)
                .storeUint(publicKey, 256)
                .storeDict(Dictionary.empty())
                .endCell();

            const init = { code: walletCell, data: stateInitWallet };
            const address = contractAddress(0, init);

            return Promise.resolve(new WalletV5(address, init));
        }

        testWalletV5(funcResult, fromFuncInit);
    });

    describe("tact", () => {
        const tactResult = fullResults.at(-1)!;

        async function fromTactInit(isActive: boolean, publicKey: bigint) {
            return await WalletV5.fromInit(
                isActive,
                0n,
                0n,
                publicKey,
                Dictionary.empty(),
            );
        }

        testWalletV5(tactResult, fromTactInit);
    });

    afterAll(() => {
        printBenchmarkTable(fullResults, undefined, {
            implementationName: "FunC",
            printMode: "full",
        });
    });
});
