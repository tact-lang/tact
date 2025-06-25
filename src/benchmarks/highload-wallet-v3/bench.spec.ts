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
import type { OutAction } from "@ton/core";
import {
    beginCell,
    Cell,
    contractAddress,
    Dictionary,
    SendMode,
    toNano,
    internal as internal_relaxed,
    storeOutList,
    storeMessageRelaxed,
} from "@ton/core";
import { posixNormalize } from "@/utils/filePath";
import { readFileSync } from "fs";
import type {
    ExternalRequest,
    MsgInner,
} from "@/benchmarks/highload-wallet-v3/tact/output/highload-wallet-v3_HighloadWalletV3";
import {
    HighloadWalletV3,
    storeExternalRequest,
    storeInternalTransfer,
    storeMsgInner,
} from "@/benchmarks/highload-wallet-v3/tact/output/highload-wallet-v3_HighloadWalletV3";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";
import type { KeyPair } from "@ton/crypto";
import { getSecureRandomBytes, keyPairFromSeed, sign } from "@ton/crypto";
import { type Step, writeLog } from "@/test/utils/write-vm-log";
import { HighloadQueryId } from "@/benchmarks/highload-wallet-v3/tests/HighloadQueryId";
import { bufferToBigInt } from "@/benchmarks/wallet-v5/utils";

const createInternalTransferBody = (opts: {
    actions: OutAction[] | Cell;
    queryId: HighloadQueryId;
}) => {
    let actionsCell: Cell;
    if (opts.actions instanceof Cell) {
        actionsCell = opts.actions;
    } else {
        if (opts.actions.length > 254) {
            throw TypeError(
                "Max allowed action count is 254. Use packActions instead.",
            );
        }
        const actionsBuilder = beginCell();
        storeOutList(opts.actions)(actionsBuilder);
        actionsCell = actionsBuilder.endCell();
    }
    return beginCell()
        .store(
            storeInternalTransfer({
                $$type: "InternalTransfer",
                queryID: opts.queryId.getQueryId(),
                actions: actionsCell,
            }),
        )
        .endCell();
};

const createInternalTransfer = (
    wallet: SandboxContract<HighloadWalletV3>,
    opts: {
        actions: OutAction[] | Cell;
        queryId: HighloadQueryId;
        value: bigint;
    },
) => {
    return internal_relaxed({
        to: wallet.address,
        value: opts.value,
        body: createInternalTransferBody(opts),
    });
};

function testHighloadWalletV3(
    benchmarkResult: BenchmarkResult,
    codeSizeResults: CodeSizeResult,
    fromInit: (
        publicKey: bigint,
        subwalletID: bigint,
        oldQueries: Dictionary<number, Cell>,
        queries: Dictionary<number, Cell>,
        lastCleanTime: bigint,
        timeout: bigint,
    ) => Promise<HighloadWalletV3>,
) {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let receiver: SandboxContract<TreasuryContract>;
    let wallet: SandboxContract<HighloadWalletV3>;
    let keypair: KeyPair;

    let step: Step;

    const DEFAULT_TIMEOUT = 120n;
    const SUBWALLET_ID = 0n;

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

        const msgInnerStruct: MsgInner = {
            $$type: "MsgInner",
            subwalletID: SUBWALLET_ID,
            messageToSend: beginCell()
                .store(storeMessageRelaxed(internalMessage))
                .endCell(),
            sendMode: BigInt(SendMode.PAY_GAS_SEPARATELY),
            queryID: {
                $$type: "QueryID",
                shift: queryId.getShift(),
                bitNumber: queryId.getBitNumber(),
            },
            createdAt: BigInt(~~(Date.now() / 1000)),
            timeout: DEFAULT_TIMEOUT,
        };

        const msgInnerCell = beginCell()
            .store(storeMsgInner(msgInnerStruct))
            .endCell();

        const msgInnerHash = msgInnerCell.hash();
        const signature = sign(msgInnerHash, keypair.secretKey);

        const externalRequestStruct: ExternalRequest = {
            $$type: "ExternalRequest",
            signature: signature,
            signedMsg: msgInnerCell,
        };

        const externalRequestCell = beginCell()
            .store(storeExternalRequest(externalRequestStruct))
            .endCell();

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
                SUBWALLET_ID,
                Dictionary.empty(),
                Dictionary.empty(),
                0n,
                DEFAULT_TIMEOUT,
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

describe("Highload Wallet v3 Gas Tests", () => {
    const fullResults = generateResults(benchmarkResults);
    const fullCodeSizeResults = generateCodeSizeResults(
        benchmarkCodeSizeResults,
    );

    describe("func", () => {
        const funcCodeSize = fullCodeSizeResults.at(0)!;
        const funcResult = fullResults.at(0)!;

        async function fromFuncInit(
            publicKey: bigint,
            subwalletID: bigint,
            _oldQueries: Dictionary<number, Cell>,
            _queries: Dictionary<number, Cell>,
            _lastCleanTime: bigint,
            timeout: bigint,
        ) {
            const bocWallet = readFileSync(
                posixNormalize(
                    resolve(__dirname, "./func/output/highload-wallet-v3.boc"),
                ),
            );

            const walletCell = Cell.fromBoc(bocWallet)[0]!;

            const stateInitWallet = beginCell()
                .storeUint(publicKey, 256)
                .storeUint(subwalletID, 32)
                .storeDict(Dictionary.empty())
                .storeDict(Dictionary.empty())
                .storeUint(0, 64)
                .storeUint(timeout, 22)
                .endCell();

            const init = { code: walletCell, data: stateInitWallet };
            const address = contractAddress(0, init);

            return Promise.resolve(new HighloadWalletV3(address, init));
        }

        testHighloadWalletV3(funcResult, funcCodeSize, fromFuncInit);
    });

    describe("tact", () => {
        const tactCodeSize = fullCodeSizeResults.at(-1)!;
        const tactResult = fullResults.at(-1)!;
        testHighloadWalletV3(
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
