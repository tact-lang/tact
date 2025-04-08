import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import { Cell, contractAddress } from "@ton/core";
import type { Address, Slice } from "@ton/core";
import { external } from "@ton/core";
import { SendMode } from "@ton/core";
import { beginCell, Dictionary, toNano } from "@ton/core";
import "@ton/test-utils";

import {
    getUsedGas,
    generateResults,
    printBenchmarkTable,
} from "@/benchmarks/utils/gas";
import benchmarkResults from "@/benchmarks/wallet-v4/results_gas.json";
import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed, sign } from "@ton/crypto";
import { readFileSync } from "fs";
import { posixNormalize } from "@/utils/filePath";
import { resolve } from "path";
import type { PluginRequestFunds } from "@/benchmarks/contracts/output/wallet-v4_WalletV4";
import {
    storePluginRequestFunds,
    WalletV4,
} from "@/benchmarks/contracts/output/wallet-v4_WalletV4";
import {
    bufferToBigInt,
    createSeqnoCounter,
    validUntil,
} from "@/benchmarks/wallet-v5/utils";

function createSimpleTransferBody(testReceiver: Address, forwardValue: bigint) {
    const msg = beginCell().storeUint(0, 8);

    const sendTxMsg = beginCell()
        .storeUint(0x10, 6)
        .storeAddress(testReceiver)
        .storeCoins(forwardValue)
        .storeUint(0, 1 + 4 + 4 + 64 + 32 + 1 + 1)
        .storeRef(beginCell().endCell())
        .endCell();

    return msg
        .storeInt(SendMode.PAY_GAS_SEPARATELY | SendMode.IGNORE_ERRORS, 8)
        .storeRef(sendTxMsg)
        .asSlice();
}

function createAddPluginBody(
    pluginAddress: Address,
    amount: bigint,
    kind: "func" | "tact",
) {
    const msg = beginCell().storeUint(2, 8);

    if (kind === "func") {
        // old way of ~store_msg_address
        const address = beginCell()
            .storeInt(pluginAddress.workChain, 8)
            .storeUint(bufferToBigInt(pluginAddress.hash), 256)
            .endCell();

        msg.storeSlice(address.asSlice());
    } else {
        msg.storeAddress(pluginAddress);
    }

    return msg.storeCoins(amount).storeUint(0, 64).asSlice();
}

describe("WalletV4 Gas Tests", () => {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let receiver: SandboxContract<TreasuryContract>;
    let walletTact: SandboxContract<WalletV4>;
    let seqno: () => bigint;

    let walletFuncAddress: Address;

    let keypair: KeyPair;

    const SUBWALLET_ID = 0n;
    const results = generateResults(benchmarkResults);
    const expectedResult = results.at(-1)!;
    const funcResult = results.at(0)!;

    async function sendSignedActionBody(
        walletAddress: Address,
        payload: Slice,
    ) {
        const seqnoValue = seqno();

        const requestToSign = beginCell()
            .storeUint(SUBWALLET_ID, 32)
            .storeUint(validUntil(), 32)
            .storeUint(seqnoValue, 32)
            .storeSlice(payload);

        const operationHash = requestToSign.endCell().hash();
        const signature = sign(operationHash, keypair.secretKey);

        const dataCell = beginCell();

        const msg = dataCell
            .storeBuffer(signature, 64)
            .storeSlice(requestToSign.asSlice())
            .endCell();

        return await blockchain.sendMessage(
            external({
                to: walletAddress,
                body: msg,
            }),
        );
    }

    async function deployWalletFunC() {
        const bocWallet = readFileSync(
            posixNormalize(
                resolve(__dirname, "../contracts/func/output/wallet_v4.boc"),
            ),
        );

        const walletCell = Cell.fromBoc(bocWallet)[0]!;

        const stateInitWallet = beginCell()
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
            await WalletV4.fromInit({
                $$type: "ContractState",
                seqno: 0n,
                walletId: SUBWALLET_ID,
                publicKey: bufferToBigInt(keypair.publicKey),
                extensions: Dictionary.empty(),
            }),
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
            printMode: "full",
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

            const sendTxActionsList = createSimpleTransferBody(
                testReceiver,
                forwardValue,
            );

            const externalTransferSendResult = await sendSignedActionBody(
                walletAddress,
                sendTxActionsList,
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

    it("addPlugin", async () => {
        const runAddPluginTest = async (
            walletAddress: Address,
            kind: "func" | "tact",
        ) => {
            const testPlugin = receiver.address;

            const addExtActionsList = createAddPluginBody(
                testPlugin,
                10000000n,
                kind,
            );
            const addPluginSendResult = await sendSignedActionBody(
                walletAddress,
                addExtActionsList,
            );

            expect(addPluginSendResult.transactions).toHaveTransaction({
                to: walletAddress,
                success: true,
                exitCode: 0,
            });

            const walletTest = blockchain.openContract(
                WalletV4.fromAddress(walletAddress),
            );

            const isPluginInstalled = await walletTest.getIsPluginInstalled(
                BigInt(testPlugin.workChain),
                bufferToBigInt(testPlugin.hash),
            );

            expect(isPluginInstalled).toBeTruthy();
            return getUsedGas(addPluginSendResult, "external");
        };

        const addPluginGasUsedFunC = await runAddPluginTest(
            walletFuncAddress,
            "func",
        );

        expect(addPluginGasUsedFunC).toEqual(funcResult.gas["addPlugin"]);

        const addPluginGasUsedTact = await runAddPluginTest(
            walletTact.address,
            "tact",
        );

        expect(addPluginGasUsedTact).toEqual(expectedResult.gas["addPlugin"]);
    });

    it("pluginTransfer", async () => {
        const runPluginTransferTest = async (
            walletAddress: Address,
            kind: "func" | "tact",
        ) => {
            // add deployer as plugin
            const deployerAsPlugin = deployer.address;

            const addExtActionsList = createAddPluginBody(
                deployerAsPlugin,
                10000000n,
                kind,
            );
            await sendSignedActionBody(walletAddress, addExtActionsList);

            const walletTest = blockchain.openContract(
                WalletV4.fromAddress(walletAddress),
            );
            const isPluginInstalled = await walletTest.getIsPluginInstalled(
                BigInt(deployerAsPlugin.workChain),
                bufferToBigInt(deployerAsPlugin.hash),
            );

            expect(isPluginInstalled).toBeTruthy();

            const forwardValue = toNano(1);

            const msg: PluginRequestFunds = {
                $$type: "PluginRequestFunds",
                queryId: 0n,
                amount: forwardValue,
                extra: null,
            };

            const pluginTransferResult = await deployer.send({
                to: walletAddress,
                value: toNano("0.1"),
                body: beginCell().store(storePluginRequestFunds(msg)).endCell(),
                sendMode: SendMode.PAY_GAS_SEPARATELY,
            });

            expect(pluginTransferResult.transactions).toHaveTransaction({
                from: walletAddress,
                to: deployer.address,
                value: (v) => v! >= forwardValue, // we care about received amount being greater or equal to requested
            });

            return getUsedGas(pluginTransferResult, "internal");
        };

        const pluginTransferGasUsedFunC = await runPluginTransferTest(
            walletFuncAddress,
            "func",
        );

        expect(pluginTransferGasUsedFunC).toEqual(
            funcResult.gas["pluginTransfer"],
        );

        const pluginTransferGasUsedTact = await runPluginTransferTest(
            walletTact.address,
            "tact",
        );

        expect(pluginTransferGasUsedTact).toEqual(
            expectedResult.gas["pluginTransfer"],
        );
    });
});
