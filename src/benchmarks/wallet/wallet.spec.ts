import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Cell, contractAddress } from "@ton/core";
import type { Address } from "@ton/core";
import { external } from "@ton/core";
import { SendMode } from "@ton/core";
import { beginCell, Dictionary, toNano } from "@ton/core";
import "@ton/test-utils";

import { getUsedGas, generateResults, printBenchmarkTable } from "../utils/gas";
import benchmarkResults from "./results_gas.json";
import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed, sign } from "@ton/crypto";
import { Wallet } from "../contracts/output/wallet_Wallet";
import { readFileSync } from "fs";
import { posixNormalize } from "../../utils/filePath";
import { resolve } from "path";
import {
    createAddExtActionMsg,
    createSendTxActionMsg,
    sendInternalMessageFromExtension,
} from "./utils";

function validUntil(ttlMs = 1000 * 60 * 3) {
    return BigInt(Math.floor((Date.now() + ttlMs) / 1000));
}

export function packAddress(address: Address) {
    return bufferToBigInt(address.hash);
}

function bufferToBigInt(buffer: Buffer): bigint {
    return BigInt("0x" + buffer.toString("hex"));
}

function createSeqnoCounter() {
    let seqno = 0n;
    let step = 0;
    return () => {
        if (step++ % 2 === 1) {
            return seqno++;
        } else {
            return seqno;
        }
    };
}

describe("Wallet Gas Tests", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let receiver: SandboxContract<TreasuryContract>;
    let walletTact: SandboxContract<Wallet>;
    let seqno: () => bigint;

    let walletFuncAddress: Address;

    let keypair: KeyPair;

    const SUBWALLET_ID = 0n;
    const results = generateResults(benchmarkResults);
    const expectedResult = results.at(-1)!;
    const funcResult = results.at(0)!;

    async function sendSignedActionBody(
        walletAddress: Address,
        actions: Cell,
        kind: "external" | "internal",
    ) {
        const seqnoValue = seqno();

        const requestToSign = beginCell()
            .storeUint(
                kind === "external"
                    ? Wallet.opcodes.ExternalSignedRequest
                    : Wallet.opcodes.InternalSignedRequest,
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

    async function deployWalletFunC() {
        const bocWallet = readFileSync(
            posixNormalize(
                resolve(__dirname, "../contracts/func/output/wallet_v5.boc"),
            ),
        );

        const walletCell = Cell.fromBoc(bocWallet)[0]!;

        const stateInitWallet = beginCell()
            .storeBit(true)
            .storeUint(0, 32)
            .storeUint(SUBWALLET_ID, 32)
            .storeBuffer(keypair.publicKey, 32)
            .storeDict(Dictionary.empty())
            .endCell();

        const init = { code: walletCell, data: stateInitWallet };

        const walletAddress = contractAddress(0, init);

        return {
            minterAddress: walletAddress,
            result: await deployer.send({
                to: walletAddress,
                value: toNano("0.1"),
                init,
                body: beginCell().endCell(),
                sendMode: SendMode.PAY_GAS_SEPARATELY,
            }),
        };
    }

    beforeEach(async () => {
        blockchain = await Blockchain.create();

        keypair = keyPairFromSeed(await getSecureRandomBytes(32));

        deployer = await blockchain.treasury("deployer");
        receiver = await blockchain.treasury("receiver");

        seqno = createSeqnoCounter();

        walletTact = blockchain.openContract(
            await Wallet.fromInit(
                true,
                0n,
                SUBWALLET_ID,
                bufferToBigInt(keypair.publicKey),
                Dictionary.empty(),
            ),
        );

        const deployResult = await walletTact.send(
            deployer.getSender(),
            {
                value: toNano("0.05"),
            },
            beginCell().endCell().asSlice(),
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: walletTact.address,
            deploy: true,
            success: true,
        });

        // top up wallet balance
        await deployer.send({
            to: walletTact.address,
            value: toNano("10"),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        });

        const walletDeploymentResult = await deployWalletFunC();

        expect(walletDeploymentResult.result.transactions).toHaveTransaction({
            from: deployer.address,
            to: walletDeploymentResult.minterAddress,
            deploy: true,
            success: true,
        });

        walletFuncAddress = walletDeploymentResult.minterAddress;

        // top up wallet balance
        await deployer.send({
            to: walletFuncAddress,
            value: toNano("10"),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        });
    });

    afterAll(() => {
        printBenchmarkTable(results, undefined, {
            implementationName: "FunC",
            printMode: "first-last",
        });
    });

    it("check correctness of deploy", async () => {
        const walletSeqno = await walletTact.getSeqno();

        expect(walletSeqno).toBe(0n);

        const walletPublicKey = await walletTact.getGetPublicKey();

        expect(walletPublicKey).toBe(bufferToBigInt(keypair.publicKey));

        const funcSeqnoResult = await blockchain
            .provider(walletFuncAddress)
            .get("seqno", []);

        expect(funcSeqnoResult.stack.readNumber()).toEqual(0);
    });

    it("externalTransfer", async () => {
        const runExternalTransferTest = async (walletAddress: Address) => {
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
                walletAddress,
                sendTxActionsList,
                "external",
            );

            expect(externalTransferSendResult.transactions).toHaveTransaction({
                to: walletAddress,
                success: true,
                exitCode: 0,
            });

            expect(externalTransferSendResult.transactions.length).toEqual(2);

            expect(externalTransferSendResult.transactions).toHaveTransaction({
                from: walletAddress,
                to: testReceiver,
                value: forwardValue,
            });

            const fee =
                externalTransferSendResult.transactions[1]!.totalFees.coins;
            const receiverBalanceAfter = (
                await blockchain.getContract(testReceiver)
            ).balance;

            expect(receiverBalanceAfter).toEqual(
                receiverBalanceBefore + forwardValue - fee,
            );

            return getUsedGas(externalTransferSendResult, "external");
        };

        const externalTransferGasUsedFunC =
            await runExternalTransferTest(walletFuncAddress);

        expect(externalTransferGasUsedFunC).toEqual(
            funcResult.gas["externalTransfer"],
        );

        const externalTransferGasUsedTact = await runExternalTransferTest(
            walletTact.address,
        );

        expect(externalTransferGasUsedTact).toEqual(
            expectedResult.gas["externalTransfer"],
        );
    });

    it("internalTransfer", async () => {
        const runInternalTransferTest = async (walletAddress: Address) => {
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
                walletAddress,
                sendTxActionsList,
                "internal",
            );

            expect(internalTransferSendResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: walletAddress,
                success: true,
                exitCode: 0,
            });

            expect(internalTransferSendResult.transactions.length).toEqual(3);

            expect(internalTransferSendResult.transactions).toHaveTransaction({
                from: walletAddress,
                to: testReceiver,
                value: forwardValue,
            });

            const fee =
                internalTransferSendResult.transactions[2]!.totalFees.coins;
            const receiverBalanceAfter = (
                await blockchain.getContract(testReceiver)
            ).balance;

            expect(receiverBalanceAfter).toEqual(
                receiverBalanceBefore + forwardValue - fee,
            );

            return getUsedGas(internalTransferSendResult, "internal");
        };

        const externalTransferGasUsedFunC =
            await runInternalTransferTest(walletFuncAddress);

        expect(externalTransferGasUsedFunC).toEqual(
            funcResult.gas["internalTransfer"],
        );

        const externalTransferGasUsedTact = await runInternalTransferTest(
            walletTact.address,
        );

        expect(externalTransferGasUsedTact).toEqual(
            expectedResult.gas["internalTransfer"],
        );
    });

    it("addExtension", async () => {
        const runAddExtensionTest = async (walletAddress: Address) => {
            const testExtension = receiver.address;

            const addExtActionsList = createAddExtActionMsg(testExtension);

            const addExtensionSendResult = await sendSignedActionBody(
                walletAddress,
                addExtActionsList,
                "external",
            );

            expect(addExtensionSendResult.transactions).toHaveTransaction({
                to: walletAddress,
                success: true,
                exitCode: 0,
            });

            const walletTest = blockchain.openContract(
                Wallet.fromAddress(walletAddress),
            );

            const extensions = await walletTest.getGetExtensions();
            expect(extensions.size).toEqual(1);
            expect(extensions.get(packAddress(testExtension))).toEqual(true);

            return getUsedGas(addExtensionSendResult, "external");
        };

        const addExtensionGasUsedFunC =
            await runAddExtensionTest(walletFuncAddress);

        expect(addExtensionGasUsedFunC).toEqual(funcResult.gas["addExtension"]);

        const addExtensionGasUsedTact = await runAddExtensionTest(
            walletTact.address,
        );

        expect(addExtensionGasUsedTact).toEqual(
            expectedResult.gas["addExtension"],
        );
    });

    it("extensionTransfer", async () => {
        const runExtensionTransferTest = async (walletAddress: Address) => {
            const testReceiver = receiver.address;

            const forwardValue = toNano(0.001);
            const receiverBalanceBefore = (
                await blockchain.getContract(testReceiver)
            ).balance;

            // add deployer as extension
            const actionsListAddExt = createAddExtActionMsg(deployer.address);
            await sendSignedActionBody(
                walletAddress,
                actionsListAddExt,
                "internal",
            );

            const walletTest = blockchain.openContract(
                Wallet.fromAddress(walletAddress),
            );

            const extensions = await walletTest.getGetExtensions();
            expect(extensions.get(packAddress(deployer.address))).toEqual(true);

            const sendTxActionsList = createSendTxActionMsg(
                testReceiver,
                forwardValue,
            );

            const extensionTransferResult =
                await sendInternalMessageFromExtension(
                    deployer,
                    walletAddress,
                    {
                        body: sendTxActionsList,
                        value: toNano("0.1"),
                    },
                );

            expect(extensionTransferResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: walletAddress,
                success: true,
                exitCode: 0,
            });

            // external to ext + internal + ext transfer action
            expect(extensionTransferResult.transactions.length).toEqual(3);

            expect(extensionTransferResult.transactions).toHaveTransaction({
                from: walletAddress,
                to: testReceiver,
                success: true,
                value: forwardValue,
                exitCode: 0,
            });

            const fee =
                extensionTransferResult.transactions[2]!.totalFees.coins;
            const receiverBalanceAfter = (
                await blockchain.getContract(testReceiver)
            ).balance;

            expect(receiverBalanceAfter).toEqual(
                receiverBalanceBefore + forwardValue - fee,
            );

            return getUsedGas(extensionTransferResult, "internal");
        };

        const extensionTransferGasUsedFunC =
            await runExtensionTransferTest(walletFuncAddress);

        expect(extensionTransferGasUsedFunC).toEqual(
            funcResult.gas["extensionTransfer"],
        );

        const extensionTransferGasUsedTact = await runExtensionTransferTest(
            walletTact.address,
        );

        expect(extensionTransferGasUsedTact).toEqual(
            expectedResult.gas["extensionTransfer"],
        );
    });
});
