import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Cell, contractAddress } from "@ton/core";
import type { Address } from "@ton/core";
import { external } from "@ton/core";
import { SendMode } from "@ton/core";
import { beginCell, Dictionary, toNano } from "@ton/core";
import "@ton/test-utils";

import { getUsedGas, generateResults } from "../util";
import benchmarkResults from "./results.json";
import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed, sign } from "@ton/crypto";
import type { CompatibleSignedRequest } from "../contracts/output/wallet_Wallet";
import {
    storeCompatibleSignedRequest,
    Wallet,
} from "../contracts/output/wallet_Wallet";
import { readFileSync } from "fs";
import { posixNormalize } from "../../../utils/filePath";
import { resolve } from "path";

function validUntil(ttlMs = 1000 * 60 * 3) {
    return BigInt(Math.floor((Date.now() + ttlMs) / 1000));
}

function bufferToBigInt(buffer: Buffer): bigint {
    return BigInt("0x" + buffer.toString("hex"));
}

describe("Wallet Gas Tests", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let receiver: SandboxContract<TreasuryContract>;
    let walletTact: SandboxContract<Wallet>;
    const seqno = (() => {
        let seqno = 0n;
        let step = 0;
        return () => {
            if (step++ % 2 === 1) {
                return seqno++;
            } else {
                return seqno;
            }
        };
    })();

    let walletFuncAddress: Address;

    let keypair: KeyPair;

    const SUBWALLET_ID = 0n;
    const results = generateResults(benchmarkResults);
    const expectedResult = results.at(-1)!;
    const funcResult = results.at(0)!;

    async function sendSignedActionBody(
        walletAddress: Address,
        actions: Cell,
        // isExternal: boolean = true,
    ) {
        const seqnoValue = seqno();

        console.log(seqnoValue);

        const requestToSign = beginCell()
            .storeUint(0x7369676e, 32)
            .storeUint(SUBWALLET_ID, 32)
            .storeUint(validUntil(), 32)
            .storeUint(seqnoValue, 32)
            .storeMaybeRef(actions)
            .storeBit(false)
            .endCell();

        const operationHash = requestToSign.hash();
        const signature = sign(operationHash, keypair.secretKey);

        const compatibleSignedRequest: CompatibleSignedRequest = {
            $$type: "CompatibleSignedRequest",
            walletId: SUBWALLET_ID,
            validUntil: validUntil(),
            seqno: seqnoValue,
            outActions: actions,
            hasOtherActions: false,
            data: beginCell().storeBuffer(signature, 64).asSlice(),
        };

        const operationMsg = beginCell()
            .store(storeCompatibleSignedRequest(compatibleSignedRequest))
            .endCell();

        return await blockchain.sendMessage(
            external({
                to: walletAddress,
                body: operationMsg,
            }),
        );

        // return await (isExternal
        //     ? wallet.sendExternal(signedRequest)
        //     : wallet.send(
        //           deployer.getSender(),
        //           {
        //               value: toNano("0.05"),
        //           },
        //           {
        //               $$type: "InternalSignedRequest",
        //               queryId: 0n,
        //               signed: signedRequest,
        //           },
        //       ));
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
        // printBenchmarkTable(results, {
        //     implementationName: "FunC",
        //     isFullTable: true,
        // });
    });

    it("check correctness of deploy", async () => {
        const walletSeqno = await walletTact.getSeqno();

        expect(walletSeqno).toBe(0n);

        const walletPublicKey = await walletTact.getGetPublicKey();

        expect(walletPublicKey).toBe(bufferToBigInt(keypair.publicKey));

        const pluginList = await walletTact.getGetPluginList();

        expect(pluginList.size).toEqual(0);

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

            const outActionCell = beginCell()
                .storeRef(beginCell().endCell()) // empty child - end of action list
                .storeSlice(sendTxactionAction.beginParse())
                .endCell();

            const externalTransferSendResult = await sendSignedActionBody(
                walletAddress,
                outActionCell,
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

    // it("externalTransfer", async () => {
    //     const testReceiver = receiver.address;
    //     const forwardValue = toNano(0.001);

    //     const receiverBalanceBefore = (
    //         await blockchain.getContract(testReceiver)
    //     ).balance;

    //     const actions = collectMultipleActions([
    //         {
    //             mode: 1,
    //             sendMode: SendMode.PAY_GAS_SEPARATELY,
    //             outMsg: {
    //                 body: beginCell().endCell(),
    //                 info: {
    //                     type: "internal",
    //                     bounce: false,
    //                     bounced: false,
    //                     dest: testReceiver,
    //                     value: {
    //                         coins: forwardValue,
    //                     },
    //                     createdAt: 1,
    //                     createdLt: 1n,
    //                     forwardFee: 0n,
    //                     ihrDisabled: true,
    //                     ihrFee: 0n,
    //                 },
    //             },
    //         },
    //     ]);

    //     const actionsSlice = createActionsSlice(actions);

    //     const externalTransferSendResult =
    //         await sendSignedActionBody(actionsSlice);

    //     // external and transfer
    //     expect(externalTransferSendResult.transactions.length).toEqual(2);

    //     expect(externalTransferSendResult.transactions).toHaveTransaction({
    //         from: wallet.address,
    //         to: testReceiver,
    //         value: forwardValue,
    //     });

    //     const fee = externalTransferSendResult.transactions[1]!.totalFees.coins;

    //     const receiverBalanceAfter = (
    //         await blockchain.getContract(testReceiver)
    //     ).balance;
    //     expect(receiverBalanceAfter).toEqual(
    //         receiverBalanceBefore + forwardValue - fee,
    //     );

    //     const gasUsed = getUsedGas(externalTransferSendResult, true);
    //     expect(gasUsed).toEqual(expectedResult.gas["externalTransfer"]);
    // });

    // it("addExtension", async () => {
    //     const testExtension = Address.parse(
    //         "EQAvDfWFG0oYX19jwNDNBBL1rKNT9XfaGP9HyTb5nb2Eml6y",
    //     );

    //     const actions = collectMultipleActions([
    //         {
    //             mode: 3,
    //             extensionAddress: testExtension,
    //         },
    //     ]);

    //     const actionsSlice = createActionsSlice(actions);

    //     const addExtensionSendResult = await sendSignedActionBody(actionsSlice);

    //     expect(addExtensionSendResult.transactions).toHaveTransaction({
    //         from: undefined,
    //         to: wallet.address,
    //         success: true,
    //         exitCode: 0,
    //     });

    //     const extensions = await wallet.getGetPluginList();

    //     expect(extensions.size).toEqual(1);
    //     expect(extensions.get(testExtension)).toEqual(true);

    //     const gasUsed = getUsedGas(addExtensionSendResult, true);
    //     expect(gasUsed).toEqual(expectedResult.gas["addExtension"]);
    // });

    // it("deleteExtension", async () => {
    //     const testExtension = Address.parse(
    //         "EQAvDfWFG0oYX19jwNDNBBL1rKNT9XfaGP9HyTb5nb2Eml6y",
    //     );

    //     const actions = collectMultipleActions([
    //         {
    //             mode: 3,
    //             extensionAddress: testExtension,
    //         },
    //     ]);

    //     await sendSignedActionBody(createActionsSlice(actions));

    //     const isExtensionAdded = await wallet.getIsPluginInstalled(
    //         BigInt(testExtension.workChain),
    //         bufferToBigInt(testExtension.hash),
    //     );

    //     expect(isExtensionAdded).toEqual(true);

    //     const actionsDelete = collectMultipleActions([
    //         {
    //             mode: 4,
    //             extensionAddress: testExtension,
    //         },
    //     ]);

    //     const deleteExtensionSendResult = await sendSignedActionBody(
    //         createActionsSlice(actionsDelete),
    //     );

    //     expect(deleteExtensionSendResult.transactions).not.toHaveTransaction({
    //         success: false,
    //     });

    //     const isExtensionDeleted = !(await wallet.getIsPluginInstalled(
    //         BigInt(testExtension.workChain),
    //         bufferToBigInt(testExtension.hash),
    //     ));

    //     expect(isExtensionDeleted).toEqual(true);

    //     const gasUsed = getUsedGas(deleteExtensionSendResult, true);
    //     expect(gasUsed).toEqual(expectedResult.gas["deleteExtension"]);
    // });

    // it("multipleActions", async () => {
    //     const testExtension1 = Address.parse(
    //         "EQA2pT4d8T7TyRsjW2BpGpGYga-lMA4JjQb4D2tc1PXMX5Bf",
    //     );
    //     const testExtension2 = Address.parse(
    //         "EQCgYDKqfTh7zVj9BQwOIPs4SuOhM7wnIjb6bdtM2AJf_Z9G",
    //     );

    //     const testReceiver = Address.parse(
    //         "EQAvDfWFG0oYX19jwNDNBBL1rKNT9XfaGP9HyTb5nb2Eml6y",
    //     );
    //     const forwardValue = toNano(0.001);

    //     const receiverBalanceBefore = (
    //         await blockchain.getContract(testReceiver)
    //     ).balance;

    //     // add two extensions and do a transfer
    //     const actions = collectMultipleActions([
    //         {
    //             mode: 3,
    //             extensionAddress: testExtension1,
    //         },
    //         {
    //             mode: 3,
    //             extensionAddress: testExtension2,
    //         },
    //         {
    //             mode: 1,
    //             sendMode: SendMode.PAY_GAS_SEPARATELY,
    //             outMsg: {
    //                 body: beginCell().endCell(),
    //                 info: {
    //                     type: "internal",
    //                     bounce: false,
    //                     bounced: false,
    //                     dest: testReceiver,
    //                     value: {
    //                         coins: forwardValue,
    //                     },
    //                     createdAt: 1,
    //                     createdLt: 1n,
    //                     forwardFee: 0n,
    //                     ihrDisabled: true,
    //                     ihrFee: 0n,
    //                 },
    //             },
    //         },
    //     ]);

    //     const multipleActionsResult = await sendSignedActionBody(
    //         createActionsSlice(actions),
    //     );

    //     expect(multipleActionsResult.transactions).toHaveTransaction({
    //         from: wallet.address,
    //         to: testReceiver,
    //         value: forwardValue,
    //     });

    //     expect(multipleActionsResult.transactions.length).toEqual(2);

    //     const fee = multipleActionsResult.transactions[1]!.totalFees.coins;

    //     const receiverBalanceAfter = (
    //         await blockchain.getContract(testReceiver)
    //     ).balance;

    //     expect(receiverBalanceAfter).toEqual(
    //         receiverBalanceBefore + forwardValue - fee,
    //     );

    //     const extDict = await wallet.getGetPluginList();

    //     expect(extDict.size).toEqual(2);

    //     const gasUsed = getUsedGas(multipleActionsResult, true);
    //     expect(gasUsed).toEqual(expectedResult.gas["multipleActions"]);
    // });

    // it("internalTransfer", async () => {
    //     const testReceiver = receiver.address;
    //     const forwardValue = toNano(0.001);

    //     const receiverBalanceBefore = (
    //         await blockchain.getContract(testReceiver)
    //     ).balance;

    //     const actions = collectMultipleActions([
    //         {
    //             mode: 1,
    //             sendMode: SendMode.PAY_GAS_SEPARATELY,
    //             outMsg: {
    //                 body: beginCell().endCell(),
    //                 info: {
    //                     type: "internal",
    //                     bounce: false,
    //                     bounced: false,
    //                     dest: testReceiver,
    //                     value: {
    //                         coins: forwardValue,
    //                     },
    //                     createdAt: 1,
    //                     createdLt: 1n,
    //                     forwardFee: 0n,
    //                     ihrDisabled: true,
    //                     ihrFee: 0n,
    //                 },
    //             },
    //         },
    //     ]);

    //     const actionsSlice = createActionsSlice(actions);

    //     const internalTransferSendResult = await sendSignedActionBody(
    //         actionsSlice,
    //         false,
    //     );

    //     expect(internalTransferSendResult.transactions.length).toEqual(3);

    //     expect(internalTransferSendResult.transactions).toHaveTransaction({
    //         from: wallet.address,
    //         to: testReceiver,
    //         value: forwardValue,
    //     });

    //     const fee = internalTransferSendResult.transactions[2]!.totalFees.coins;

    //     const receiverBalanceAfter = (
    //         await blockchain.getContract(testReceiver)
    //     ).balance;
    //     expect(receiverBalanceAfter).toEqual(
    //         receiverBalanceBefore + forwardValue - fee,
    //     );

    //     const gasUsed = getUsedGas(internalTransferSendResult, false);
    //     expect(gasUsed).toEqual(expectedResult.gas["internalTransfer"]);
    // });
});
