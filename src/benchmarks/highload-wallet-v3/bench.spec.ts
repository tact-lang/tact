import "@ton/test-utils";

import benchmarkResults from "@/benchmarks/highload-wallet-v3/gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/highload-wallet-v3/size.json";

import {
    generateResults,
    getStateSizeForAccount,
    generateCodeSizeResults,
    getUsedGas,
    printBenchmarkTable,
    type BenchmarkResult,
    type CodeSizeResult,
} from "@/benchmarks/utils/gas";

import { resolve } from "path";
import {
    beginCell,
    Dictionary,
    SendMode,
    toNano,
    internal as internal_relaxed,
} from "@ton/core";
import { HighloadWalletV3 } from "@/benchmarks/highload-wallet-v3/tact/output/highload-wallet-v3_HighloadWalletV3";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed } from "@ton/crypto";
import { type Step, writeLog } from "@/test/utils/write-vm-log";
import { HighloadQueryId } from "@/benchmarks/highload-wallet-v3/tests/highload-query-id";
import { bufferToBigInt } from "@/benchmarks/wallet-v5/utils";
import {
    createExternalRequestCell,
    createInternalTransfer,
    DEFAULT_TIMEOUT,
    fromInitHighloadWalletV3_FunC,
    SUBWALLET_ID,
    type FromInitHighloadWalletV3,
} from "@/benchmarks/highload-wallet-v3/tests/utils";

function benchHighloadWalletV3(
    benchmarkResult: BenchmarkResult,
    codeSizeResults: CodeSizeResult,
    fromInit: FromInitHighloadWalletV3,
) {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let receiver: SandboxContract<TreasuryContract>;
    let wallet: SandboxContract<HighloadWalletV3>;
    let keypair: KeyPair;

    let step: Step;

    const justTestFlow = async (kind: "external" | "internal") => {
        const testReceiver = receiver.address;
        const forwardToSelfValue = toNano(0.17239);
        const forwardToReceiverValue = toNano(1);
        const queryId = HighloadQueryId.fromSeqno(0n);

        const internalMessage = createInternalTransfer(wallet, {
            actions: [
                {
                    type: "sendMsg",
                    mode: SendMode.PAY_GAS_SEPARATELY,
                    outMsg: internal_relaxed({
                        to: testReceiver,
                        value: forwardToReceiverValue,
                        body: null,
                    }),
                },
            ],
            queryId,
            value: forwardToSelfValue,
        });

        const externalRequestCell = createExternalRequestCell(
            keypair.secretKey,
            {
                message: internalMessage,
                mode: SendMode.PAY_GAS_SEPARATELY,
                queryId,
                createdAt: Date.now(),
                subwalletId: SUBWALLET_ID,
                timeout: DEFAULT_TIMEOUT,
            },
        );

        const result = await step("externalTransfer & internalTransfer", () =>
            wallet.sendExternal(externalRequestCell.asSlice()),
        );

        expect(result.transactions).toHaveTransaction({
            to: wallet.address,
            success: true,
            exitCode: 0,
            outMessagesCount: 1,
        });

        expect(result.transactions).toHaveTransaction({
            from: wallet.address,
            to: wallet.address,
            value: forwardToSelfValue,
            success: true,
            exitCode: 0,
            outMessagesCount: 1,
        });

        expect(result.transactions).toHaveTransaction({
            from: wallet.address,
            to: testReceiver,
            value: forwardToReceiverValue,
        });

        const externalTransferGasUsed = getUsedGas(result, "external");

        const internalTransferGasUsed = getUsedGas(result, "internal");

        if (kind == "external") {
            expect(externalTransferGasUsed).toEqual(
                benchmarkResult.gas["externalTransfer"],
            );
        } else {
            expect(internalTransferGasUsed).toEqual(
                benchmarkResult.gas["internalTransfer"],
            );
        }
    };

    beforeEach(async () => {
        blockchain = await Blockchain.create();

        deployer = await blockchain.treasury("deployer");
        receiver = await blockchain.treasury("receiver");

        keypair = keyPairFromSeed(await getSecureRandomBytes(32));

        step = writeLog({
            path: resolve(__dirname, "output", "log.yaml"),
            blockchain,
        });

        wallet = blockchain.openContract(
            await fromInit(
                bufferToBigInt(keypair.publicKey),
                BigInt(SUBWALLET_ID),
                Dictionary.empty(),
                Dictionary.empty(),
                0n,
                BigInt(DEFAULT_TIMEOUT),
            ),
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
        const lastCleanTime = await wallet.getGetLastCleanTime();

        expect(lastCleanTime).toBe(0n);

        const walletPublicKey = await wallet.getGetPublicKey();

        expect(walletPublicKey).toBe(bufferToBigInt(keypair.publicKey));
    });

    it("externalTransfer", async () => {
        await justTestFlow("external");
    });

    it("internalTransfer", async () => {
        await justTestFlow("internal");
    });

    it("cells", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, wallet.address)).cells,
        ).toEqual(codeSizeResults.size["cells"]);
    });

    it("bits", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, wallet.address)).bits,
        ).toEqual(codeSizeResults.size["bits"]);
    });
}

describe("Highload Wallet v3 Gas Benchmarks", () => {
    const fullResults = generateResults(benchmarkResults);
    const fullCodeSizeResults = generateCodeSizeResults(
        benchmarkCodeSizeResults,
    );

    describe("func", () => {
        const funcCodeSize = fullCodeSizeResults.at(0)!;
        const funcResult = fullResults.at(0)!;

        benchHighloadWalletV3(
            funcResult,
            funcCodeSize,
            fromInitHighloadWalletV3_FunC,
        );
    });

    describe("tact", () => {
        const tactCodeSize = fullCodeSizeResults.at(-1)!;
        const tactResult = fullResults.at(-1)!;
        benchHighloadWalletV3(
            tactResult,
            tactCodeSize,
            HighloadWalletV3.fromInit.bind(HighloadWalletV3),
        );
    });

    afterAll(() => {
        printBenchmarkTable(fullResults, fullCodeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });
    });
});
