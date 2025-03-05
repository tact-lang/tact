import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Cell, contractAddress } from "@ton/core";
import type { Address } from "@ton/core";
import { external } from "@ton/core";
import { SendMode } from "@ton/core";
import { beginCell, Dictionary, toNano } from "@ton/core";
import "@ton/test-utils";

import { getUsedGas, generateResults, printBenchmarkTable } from "../util";
import benchmarkResults from "./results.json";
import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed, sign } from "@ton/crypto";
import { Wallet } from "../contracts/output/wallet_Wallet";
import { readFileSync } from "fs";
import { posixNormalize } from "../../utils/filePath";
import { resolve } from "path";

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

    const Opcodes = {
        action_send_msg: 0x0ec3c86d,
        action_set_code: 0xad4de08e,
        action_extended_set_data: 0x1ff8ea0b,
        action_extended_add_extension: 0x02,
        action_extended_remove_extension: 0x03,
        action_extended_set_signature_auth_allowed: 0x04,
        auth_extension: 0x6578746e,
        auth_signed: 0x7369676e,
        auth_signed_internal: 0x73696e74,
    };

    const SUBWALLET_ID = 0n;
    const results = generateResults(benchmarkResults);
    const expectedResult = results.at(-1)!;
    const funcResult = results.at(0)!;

    async function sendSignedActionBody(
        walletAddress: Address,
        actions: Cell,
        isExternal: boolean = true,
    ) {
        const seqnoValue = seqno();

        const requestToSign = beginCell()
            .storeUint(
                isExternal
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

        return await (isExternal
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
                bufferToBigInt(keypair.publicKey),
                SUBWALLET_ID,
                Dictionary.empty(),
            ),
        );

        const deployResult = await walletTact.send(
            deployer.getSender(),
            {
                value: toNano("0.05"),
            },
            {
                $$type: "Deploy",
                queryId: 0n,
            },
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

            const sendTxMsg = beginCell()
                .storeUint(0x10, 6)
                .storeAddress(testReceiver)
                .storeCoins(forwardValue)
                .storeUint(0, 1 + 4 + 4 + 64 + 32 + 1 + 1)
                .storeRef(beginCell().endCell())
                .endCell();

            const sendTxactionAction = beginCell()
                .storeUint(0x0ec3c86d, 32)
                .storeInt(
                    SendMode.PAY_GAS_SEPARATELY | SendMode.IGNORE_ERRORS,
                    8,
                )
                .storeRef(sendTxMsg)
                .endCell();

            const actionsList = beginCell()
                .storeMaybeRef(
                    beginCell()
                        .storeRef(beginCell().endCell()) // empty child - end of action list
                        .storeSlice(sendTxactionAction.beginParse())
                        .endCell(),
                )
                .storeBit(false) // no other_actions
                .endCell();

            const externalTransferSendResult = await sendSignedActionBody(
                walletAddress,
                actionsList,
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

            return getUsedGas(externalTransferSendResult, true);
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

            const sendTxMsg = beginCell()
                .storeUint(0x10, 6)
                .storeAddress(testReceiver)
                .storeCoins(forwardValue)
                .storeUint(0, 1 + 4 + 4 + 64 + 32 + 1 + 1)
                .storeRef(beginCell().endCell())
                .endCell();

            const sendTxactionAction = beginCell()
                .storeUint(0x0ec3c86d, 32)
                .storeInt(
                    SendMode.PAY_GAS_SEPARATELY | SendMode.IGNORE_ERRORS,
                    8,
                )
                .storeRef(sendTxMsg)
                .endCell();

            const actionsList = beginCell()
                .storeMaybeRef(
                    beginCell()
                        .storeRef(beginCell().endCell())
                        .storeSlice(sendTxactionAction.beginParse())
                        .endCell(),
                )
                .storeBit(false) // no other actions
                .endCell();

            const externalTransferSendResult = await sendSignedActionBody(
                walletAddress,
                actionsList,
                false,
            );

            expect(externalTransferSendResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: walletAddress,
                success: true,
                exitCode: 0,
            });

            expect(externalTransferSendResult.transactions.length).toEqual(3);

            expect(externalTransferSendResult.transactions).toHaveTransaction({
                from: walletAddress,
                to: testReceiver,
                value: forwardValue,
            });

            const fee =
                externalTransferSendResult.transactions[2]!.totalFees.coins;
            const receiverBalanceAfter = (
                await blockchain.getContract(testReceiver)
            ).balance;

            expect(receiverBalanceAfter).toEqual(
                receiverBalanceBefore + forwardValue - fee,
            );

            return getUsedGas(externalTransferSendResult, false);
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

            const addExtensionAction = beginCell()
                .storeUint(Opcodes.action_extended_add_extension, 8)
                .storeAddress(testExtension)
                .endCell();

            const actionsList = beginCell()
                .storeMaybeRef(null) // no c5 out actions
                .storeBit(true) // have other actions
                .storeSlice(addExtensionAction.beginParse())
                .endCell();

            const addExtensionSendResult = await sendSignedActionBody(
                walletAddress,
                actionsList,
            );

            expect(addExtensionSendResult.transactions).toHaveTransaction({
                to: walletAddress,
                success: true,
                exitCode: 0,
            });

            expect(addExtensionSendResult.transactions.length).toEqual(1);

            const walletTest = blockchain.openContract(
                Wallet.fromAddress(walletAddress),
            );

            const extensions = await walletTest.getGetExtensions();
            expect(extensions.size).toEqual(1);
            expect(extensions.get(packAddress(testExtension))).toEqual(true);

            return getUsedGas(addExtensionSendResult, true);
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
});
