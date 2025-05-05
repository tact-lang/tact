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
    type Slice,
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
import { type Step, writeLog } from "@/test/utils/write-vm-log";
import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed, sign } from "@ton/crypto";
import type { PluginRequestFunds } from "@/benchmarks/wallet-v4/tact/output/wallet-v4_WalletV4";
import {
    storePluginRequestFunds,
    WalletV4,
    type ContractState,
} from "@/benchmarks/wallet-v4/tact/output/wallet-v4_WalletV4";
import {
    bufferToBigInt,
    createSeqnoCounter,
    validUntil,
} from "@/benchmarks/wallet-v5/utils";

import benchmarkResults from "@/benchmarks/wallet-v4/results_gas.json";

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

function createAddPluginBody(pluginAddress: Address, amount: bigint) {
    const msg = beginCell().storeUint(2, 8);

    // old way of ~store_msg_address
    const address = beginCell()
        .storeInt(pluginAddress.workChain, 8)
        .storeUint(bufferToBigInt(pluginAddress.hash), 256)
        .endCell();

    msg.storeSlice(address.asSlice());

    return msg.storeCoins(amount).storeUint(0, 64).asSlice();
}

function testWalletV4(
    benchmarkResult: BenchmarkResult,
    fromInit: (state: ContractState) => Promise<WalletV4>,
) {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let receiver: SandboxContract<TreasuryContract>;
    let wallet: SandboxContract<WalletV4>;
    let seqno: () => bigint;
    let keypair: KeyPair;
    let step: Step;

    const SUBWALLET_ID = 0n;

    async function sendSignedActionBody(
        wallet: SandboxContract<WalletV4>,
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
                to: wallet.address,
                body: msg,
            }),
        );
    }

    beforeEach(async () => {
        blockchain = await Blockchain.create();

        keypair = keyPairFromSeed(await getSecureRandomBytes(32));

        deployer = await blockchain.treasury("deployer");
        receiver = await blockchain.treasury("receiver");

        step = writeLog({
            path: resolve(__dirname, "output", "log.yaml"),
            blockchain,
        });

        seqno = createSeqnoCounter();

        wallet = blockchain.openContract(
            await fromInit({
                $$type: "ContractState",
                seqno: 0n,
                walletId: SUBWALLET_ID,
                publicKey: bufferToBigInt(keypair.publicKey),
                extensions: Dictionary.empty(),
            }),
        );

        // Deploy wallet
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

        const sendTxActionsList = createSimpleTransferBody(
            testReceiver,
            forwardValue,
        );

        const externalTransferSendResult = await step("externalTransfer", () =>
            sendSignedActionBody(wallet, sendTxActionsList),
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

    it("addPlugin", async () => {
        const runAddPluginTest = async (wallet: SandboxContract<WalletV4>) => {
            const testPlugin = receiver.address;

            const addExtActionsList = createAddPluginBody(
                testPlugin,
                10000000n,
            );
            const addPluginSendResult = await sendSignedActionBody(
                wallet,
                addExtActionsList,
            );

            expect(addPluginSendResult.transactions).toHaveTransaction({
                to: wallet.address,
                success: true,
                exitCode: 0,
            });

            const isPluginInstalled = await wallet.getIsPluginInstalled(
                BigInt(testPlugin.workChain),
                bufferToBigInt(testPlugin.hash),
            );

            expect(isPluginInstalled).toBeTruthy();
            return getUsedGas(addPluginSendResult, "external");
        };

        const addPluginGasUsedTact = await runAddPluginTest(wallet);

        expect(addPluginGasUsedTact).toEqual(benchmarkResult.gas["addPlugin"]);
    });
    it("pluginTransfer", async () => {
        // add deployer as plugin
        const deployerAsPlugin = deployer.address;

        const addExtActionsList = createAddPluginBody(
            deployerAsPlugin,
            10000000n,
        );
        await sendSignedActionBody(wallet, addExtActionsList);

        const walletTest = blockchain.openContract(
            WalletV4.fromAddress(wallet.address),
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

        const pluginTransferResult = await step("pluginTransfer", () =>
            deployer.send({
                to: wallet.address,
                value: toNano("0.1"),
                body: beginCell().store(storePluginRequestFunds(msg)).endCell(),
                sendMode: SendMode.PAY_GAS_SEPARATELY,
            }),
        );

        expect(pluginTransferResult.transactions).toHaveTransaction({
            from: wallet.address,
            to: deployer.address,
            value: (v) => v! >= forwardValue, // we care about received amount being greater or equal to requested
        });

        const pluginTransferGasUsed = getUsedGas(
            pluginTransferResult,
            "internal",
        );
        expect(pluginTransferGasUsed).toEqual(
            benchmarkResult.gas["pluginTransfer"],
        );
    });
}

describe("WalletV4 Gas Tests", () => {
    const fullResults = generateResults(benchmarkResults);

    describe("func", () => {
        const funcResult = fullResults.at(0)!;

        async function fromFuncInit(contractState: ContractState) {
            const bocWallet = readFileSync(
                posixNormalize(
                    resolve(__dirname, "./func/output/wallet-v4.boc"),
                ),
            );

            const walletCell = Cell.fromBoc(bocWallet)[0]!;

            const stateInitWallet = beginCell()
                .storeUint(contractState.seqno, 32)
                .storeUint(contractState.walletId, 32)
                .storeUint(contractState.publicKey, 256)
                .storeDict(Dictionary.empty())
                .endCell();

            const init = { code: walletCell, data: stateInitWallet };
            const address = contractAddress(0, init);

            return Promise.resolve(new WalletV4(address, init));
        }

        testWalletV4(funcResult, fromFuncInit);
    });

    describe("tact", () => {
        const tactResult = fullResults.at(-1)!;
        testWalletV4(tactResult, WalletV4.fromInit.bind(WalletV4));
    });

    afterAll(() => {
        printBenchmarkTable(fullResults, undefined, {
            implementationName: "FunC",
            printMode: "full",
        });
    });
});
