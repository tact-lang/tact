import "@ton/test-utils";
import {
    DEFAULT_TIMEOUT,
    SUBWALLET_ID,
    type FromInitHighloadWalletV3,
    createInternalTransfer,
    createExternalRequestCell,
    getRandomInt,
    createInternalTransferBatch,
    createInternalTransferBody,
} from "@/benchmarks/highload-wallet-v3/tests/utils";
import {
    Blockchain,
    createShardAccount,
    EmulationError,
    internal,
} from "@ton/sandbox";
import { getSecureRandomBytes, keyPairFromSeed } from "@ton/crypto";
import type { OutActionSendMsg } from "@ton/core";
import {
    beginCell,
    BitString,
    Dictionary,
    SendMode,
    toNano,
    type Address,
    internal as internal_relaxed,
} from "@ton/core";
import { bufferToBigInt } from "@/benchmarks/wallet-v5/utils";
import {
    HighloadQueryId,
    MAX_BIT_NUMBER,
    MAX_KEY_COUNT,
    MAX_SHIFT,
} from "@/benchmarks/highload-wallet-v3/tests/highload-query-id";
import { step } from "@/test/allure/allure";
import {
    AlreadyExecuted,
    InvalidCreatedAt,
    loadHighloadWalletV3$Data,
    SignatureMismatch,
    storeHighloadWalletV3$Data,
    SubwalletIdMismatch,
    TimeoutMismatch,
} from "@/benchmarks/highload-wallet-v3/tact/output/highload-wallet-v3_HighloadWalletV3";
import { findTransactionRequired, randomAddress } from "@ton/test-utils";
import { MsgGenerator } from "@/benchmarks/highload-wallet-v3/tests/msg-generator";

const globalSetup = async (fromInit: FromInitHighloadWalletV3) => {
    const blockchain = await Blockchain.create();
    blockchain.now = 1000;

    const keypair = keyPairFromSeed(await getSecureRandomBytes(32));

    const shouldRejectWith = async <T>(p: Promise<T>, code: bigint) => {
        try {
            await p;
            throw new Error(`Should throw ${code}`);
        } catch (e: unknown) {
            if (e instanceof EmulationError) {
                expect(e.exitCode !== undefined).toBe(true);
                expect(BigInt(e.exitCode!)).toEqual(code);
            } else {
                throw e;
            }
        }
    };

    const getContractData = async (address: Address) => {
        const smc = await blockchain.getContract(address);
        if (!smc.account.account) throw new Error("Account not found");
        if (smc.account.account.storage.state.type != "active")
            throw new Error("Attempting to get data on inactive account");
        if (!smc.account.account.storage.state.state.data)
            throw new Error("Data is not present");
        return smc.account.account.storage.state.state.data;
    };
    const getContractCode = async (address: Address) => {
        const smc = await blockchain.getContract(address);
        if (!smc.account.account) throw new Error("Account not found");
        if (smc.account.account.storage.state.type != "active")
            throw new Error("Attempting to get code on inactive account");
        if (!smc.account.account.storage.state.state.code)
            throw new Error("Code is not present");
        return smc.account.account.storage.state.state.code;
    };

    const deployer = await blockchain.treasury("deployer");

    const wallet = blockchain.openContract(
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
            value: toNano("999999"),
        },
        beginCell().endCell().asSlice(),
    );

    expect(deployResult.transactions).toHaveTransaction({
        from: deployer.address,
        to: wallet.address,
        deploy: true,
        success: true,
    });

    return {
        blockchain,
        keypair,
        shouldRejectWith,
        getContractCode,
        getContractData,
        wallet,
    };
};

const testDeploy = (fromInit: FromInitHighloadWalletV3) => {
    const setup = async () => {
        return await globalSetup(fromInit);
    };

    describe("Deploy", () => {
        it("should deploy correctly", async () => {
            const { keypair, wallet } = await setup();
            const lastCleanTime = await wallet.getGetLastCleanTime();

            expect(lastCleanTime).toBe(0n);

            const walletPublicKey = await wallet.getGetPublicKey();

            expect(walletPublicKey).toBe(bufferToBigInt(keypair.publicKey));
        });
    });
};

const testAuth = (fromInit: FromInitHighloadWalletV3) => {
    const setup = async () => {
        return await globalSetup(fromInit);
    };

    describe("Auth", () => {
        it("should pass check sign", async () => {
            const { keypair, wallet } = await setup();

            try {
                const internalMessage = createInternalTransfer(wallet, {
                    actions: [],
                    queryId: HighloadQueryId.fromQueryId(0n),
                    value: 0n,
                });

                const queryId = HighloadQueryId.getRandom();

                const externalRequestCell = createExternalRequestCell(
                    keypair.secretKey,
                    {
                        message: internalMessage,
                        mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                        queryId,
                        createdAt: 1000,
                        subwalletId: SUBWALLET_ID,
                        timeout: DEFAULT_TIMEOUT,
                    },
                );

                const testResult = await wallet.sendExternal(
                    externalRequestCell.asSlice(),
                );

                await step(
                    "Check that external transfer with correct sign is accepted and internal message is send",
                    () => {
                        expect(testResult.transactions).toHaveTransaction({
                            from: wallet.address,
                            to: wallet.address,
                            success: true,
                        });
                    },
                );
            } catch (e: unknown) {
                if (e instanceof EmulationError) {
                    expect(e.exitCode).toBe(SignatureMismatch);
                } else {
                    throw e;
                }
            }
        });

        it("should fail check sign", async () => {
            const { wallet, shouldRejectWith } = await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const badKey = await getSecureRandomBytes(64);

            const queryId = HighloadQueryId.getRandom();

            const externalRequestCell = createExternalRequestCell(badKey, {
                message: internalMessage,
                mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                queryId,
                createdAt: 1000,
                subwalletId: SUBWALLET_ID,
                timeout: DEFAULT_TIMEOUT,
            });

            await step(
                "Check that external transfer with incorrect sign is rejected",
                async () => {
                    await shouldRejectWith(
                        wallet.sendExternal(externalRequestCell.asSlice()),
                        SignatureMismatch,
                    );
                },
            );
        });
    });
};

const testParameterValidation = (fromInit: FromInitHighloadWalletV3) => {
    const setup = async () => {
        return await globalSetup(fromInit);
    };

    describe("Parameter validation", () => {
        it("should fail subwallet check", async () => {
            const { keypair, wallet, shouldRejectWith } = await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const currentSubwalletId = await wallet.getGetSubwalletId();

            await step("Check that current subwallet id is correct", () => {
                expect(currentSubwalletId).toBe(BigInt(SUBWALLET_ID));
            });

            const queryId = HighloadQueryId.getRandom();

            let badSubwalletId;

            do {
                badSubwalletId = getRandomInt(0, 1000);
            } while (badSubwalletId == Number(currentSubwalletId));

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: badSubwalletId,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            await step(
                "Check that external transfer with incorrect subwallet id is rejected",
                async () => {
                    await shouldRejectWith(
                        wallet.sendExternal(externalRequestCell.asSlice()),
                        SubwalletIdMismatch,
                    );
                },
            );
        });

        it("should fail check creation time", async () => {
            const { keypair, wallet, shouldRejectWith } = await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const currentTimeout = Number(await wallet.getGetTimeout());

            const queryId = HighloadQueryId.getRandom();

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt:
                        1000 -
                        getRandomInt(currentTimeout + 1, currentTimeout + 200),
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            await step(
                "Check that external transfer with incorrect creation time is rejected",
                async () => {
                    await shouldRejectWith(
                        wallet.sendExternal(externalRequestCell.asSlice()),
                        InvalidCreatedAt,
                    );
                },
            );
        });

        it("should fail check timeout", async () => {
            const { keypair, wallet, shouldRejectWith } = await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const currentTimeout = Number(await wallet.getGetTimeout());

            const queryId = HighloadQueryId.getRandom();

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: currentTimeout + 1,
                },
            );

            await step(
                "Check that external transfer with incorrect timeout is rejected",
                async () => {
                    await shouldRejectWith(
                        wallet.sendExternal(externalRequestCell.asSlice()),
                        TimeoutMismatch,
                    );
                },
            );
        });
    });
};

const testQueryId = (fromInit: FromInitHighloadWalletV3) => {
    const setup = async () => {
        return await globalSetup(fromInit);
    };

    describe("Query ID", () => {
        it("should fail check query_id in actual queries", async () => {
            const { keypair, wallet, shouldRejectWith } = await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const queryId = HighloadQueryId.getRandom();

            const externalRequestCell_step1 = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = await wallet.sendExternal(
                externalRequestCell_step1.asSlice(),
            );

            await step(
                "Check that external transfer with correct query_id is accepted and internal message is send",
                () => {
                    expect(testResult.transactions).toHaveTransaction({
                        from: wallet.address,
                        to: wallet.address,
                        success: true,
                    });
                },
            );

            const isProcessed = await wallet.getIsProcessed(
                queryId.getQueryId(),
                true,
            );

            await step("Check that query_id is processed", () => {
                expect(isProcessed).toBe(true);
            });

            const externalRequestCell_step2 = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            await step(
                "Check that external transfer with same query_id is rejected",
                async () => {
                    await shouldRejectWith(
                        wallet.sendExternal(
                            externalRequestCell_step2.asSlice(),
                        ),
                        AlreadyExecuted,
                    );
                },
            );
        });

        it("should work with max bitNumber = 1022", async () => {
            const { keypair, wallet } = await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const shift = getRandomInt(0, Number(MAX_SHIFT));
            const queryId = HighloadQueryId.fromShiftAndBitNumber(
                BigInt(shift),
                1022n,
            );

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            await step(
                "Check that external transfer with correct query_id is accepted",
                async () => {
                    await expect(
                        wallet.sendExternal(externalRequestCell.asSlice()),
                    ).resolves.not.toThrow(EmulationError);
                },
            );
        });

        it("should reject bitNumber = 1023", async () => {
            const { keypair, wallet } = await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const shift = getRandomInt(0, Number(MAX_SHIFT));
            const queryId = BigInt((shift << 10) + 1023);

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            await step(
                "Check that external transfer with incorrect bitNumber is rejected",
                async () => {
                    await expect(
                        wallet.sendExternal(externalRequestCell.asSlice()),
                    ).rejects.toThrow(EmulationError);
                },
            );
        });

        it("should work with max shift = maxShift", async () => {
            const { keypair, wallet } = await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const bitNumber = getRandomInt(0, Number(MAX_BIT_NUMBER));
            const queryId = HighloadQueryId.fromShiftAndBitNumber(
                MAX_SHIFT,
                BigInt(bitNumber),
            );

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            await step(
                "Check that external transfer with correct query_id is accepted",
                async () => {
                    await expect(
                        wallet.sendExternal(externalRequestCell.asSlice()),
                    ).resolves.not.toThrow(EmulationError);
                },
            );
        });

        it("should fail check query_id in old queries", async () => {
            const { keypair, wallet, blockchain, shouldRejectWith } =
                await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const queryId = HighloadQueryId.getRandom();

            const externalRequestCell_step1 = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = await wallet.sendExternal(
                externalRequestCell_step1.asSlice(),
            );

            await step(
                "Check that external transfer with correct query_id is accepted",
                () => {
                    expect(testResult.transactions).toHaveTransaction({
                        from: wallet.address,
                        to: wallet.address,
                        success: true,
                    });
                },
            );

            blockchain.now = 1000 + DEFAULT_TIMEOUT;

            const isProcessed = await wallet.getIsProcessed(
                queryId.getQueryId(),
                true,
            );
            await step("Check that query_id is processed", () => {
                expect(isProcessed).toBe(true);
            });

            const externalRequestCell_step2 = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1050,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            await step(
                "Check that external transfer with same query_id is rejected",
                async () => {
                    await shouldRejectWith(
                        wallet.sendExternal(
                            externalRequestCell_step2.asSlice(),
                        ),
                        AlreadyExecuted,
                    );
                },
            );
        });

        it("should be cleared queries hashmaps", async () => {
            const { keypair, wallet, blockchain } = await setup();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const queryId_step1 = HighloadQueryId.getRandom();

            const externalRequestCell_step1 = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId: queryId_step1,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult_step1 = await wallet.sendExternal(
                externalRequestCell_step1.asSlice(),
            );

            await step(
                "Check that external transfer with correct query_id is accepted and internal message is send",
                () => {
                    expect(testResult_step1.transactions).toHaveTransaction({
                        from: wallet.address,
                        to: wallet.address,
                        success: true,
                    });
                },
            );

            let isProcessed_step1 = await wallet.getIsProcessed(
                queryId_step1.getQueryId(),
                true,
            );

            await step("Check that query_id is processed", () => {
                expect(isProcessed_step1).toBe(true);
            });

            blockchain.now = 1000 + 1 + DEFAULT_TIMEOUT * 2;

            isProcessed_step1 = await wallet.getIsProcessed(
                queryId_step1.getQueryId(),
                true,
            );

            await step("Check that query_id is not processed", () => {
                expect(isProcessed_step1).toBe(false);
            });

            const queryId_step2 = HighloadQueryId.getRandom();

            const externalRequestCell_step2 = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId: queryId_step2,
                    createdAt: 1000 + DEFAULT_TIMEOUT * 2,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult_step2 = await wallet.sendExternal(
                externalRequestCell_step2.asSlice(),
            );

            await step(
                "Check that external transfer with correct query_id is accepted and internal message is send",
                () => {
                    expect(testResult_step2.transactions).toHaveTransaction({
                        from: wallet.address,
                        to: wallet.address,
                        success: true,
                    });
                },
            );

            isProcessed_step1 = await wallet.getIsProcessed(
                queryId_step1.getQueryId(),
                true,
            );
            const isProcessed_step2 = await wallet.getIsProcessed(
                queryId_step2.getQueryId(),
                true,
            );

            await step("Check that query_id is not processed", () => {
                expect(isProcessed_step1).toBe(false);
            });

            await step("Check that another query_id is processed", () => {
                expect(isProcessed_step2).toBe(true);
            });

            const lastCleanTime = await wallet.getGetLastCleanTime();

            await step("Check that last_clean_time is correct", () => {
                expect(lastCleanTime).toBe(
                    BigInt(testResult_step2.transactions[0]!.now),
                );
            });
        });
    });
};

const testPerformanceLimits = (fromInit: FromInitHighloadWalletV3) => {
    const setup = async () => {
        return await globalSetup(fromInit);
    };

    describe("Performance limits", () => {
        it("should work with max keys in queries dictionary", async () => {
            const {
                keypair,
                wallet,
                blockchain,
                getContractData,
                getContractCode,
            } = await setup();

            const newQueries = Dictionary.empty(
                Dictionary.Keys.Uint(13),
                Dictionary.Values.Cell(),
            );
            const padding = new BitString(Buffer.alloc(128, 0), 0, 1023 - 13);

            for (let i = 0; i < MAX_KEY_COUNT; i++) {
                newQueries.set(
                    i,
                    beginCell().storeUint(i, 13).storeBits(padding).endCell(),
                );
            }

            const oldQueries = Dictionary.empty(
                Dictionary.Keys.Uint(13),
                Dictionary.Values.Cell(),
            );
            for (let i = 0; i < MAX_KEY_COUNT; i++) {
                oldQueries.set(
                    i,
                    beginCell().storeBits(padding).storeUint(i, 13).endCell(),
                );
            }

            const walletContract = await blockchain.getContract(wallet.address);

            const walletData = await getContractData(wallet.address);
            const newData = beginCell()
                .store(
                    storeHighloadWalletV3$Data({
                        ...loadHighloadWalletV3$Data(walletData.beginParse()),
                        queries: newQueries,
                        oldQueries,
                    }),
                )
                .endCell();

            await blockchain.setShardAccount(
                wallet.address,
                createShardAccount({
                    address: wallet.address,
                    code: await getContractCode(wallet.address),
                    data: newData,
                    balance: walletContract.balance,
                    workchain: 0,
                }),
            );

            const internalMessage = createInternalTransfer(wallet, {
                actions: [],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const queryId = HighloadQueryId.getRandom();

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = wallet.sendExternal(
                externalRequestCell.asSlice(),
            );

            await step(
                "Check that external transfer with correct query_id is accepted",
                async () => {
                    await expect(testResult).resolves.not.toThrow(
                        EmulationError,
                    );
                },
            );

            await step("Check that internal message is sent", async () => {
                expect((await testResult).transactions).toHaveTransaction({
                    on: wallet.address,
                    aborted: false,
                    outMessagesCount: 1,
                });
            });
        });
    });
};

const testMessageSending = (fromInit: FromInitHighloadWalletV3) => {
    const setup = async () => {
        return await globalSetup(fromInit);
    };

    describe("Message sending", () => {
        it("should send internal message", async () => {
            const { keypair, wallet, shouldRejectWith } = await setup();

            const testAddr = randomAddress(0);
            const testBody = beginCell()
                .storeUint(getRandomInt(0, 1000000), 32)
                .endCell();

            const internalMessage = internal_relaxed({
                to: testAddr,
                bounce: false,
                value: toNano("123"),
                body: testBody,
            });
            const queryId = HighloadQueryId.getRandom();

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.PAY_GAS_SEPARATELY,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = await wallet.sendExternal(
                externalRequestCell.asSlice(),
            );

            await step(
                "Check that internal message is sent with correct parameters",
                () => {
                    expect(testResult.transactions).toHaveTransaction({
                        on: testAddr,
                        from: wallet.address,
                        value: toNano("123"),
                        body: testBody,
                    });
                },
            );

            const isProcessed = await wallet.getIsProcessed(
                queryId.getQueryId(),
                true,
            );

            await step("Check that query_id is processed", () => {
                expect(isProcessed).toBe(true);
            });

            await step("Check that second transfer rejected", async () => {
                await shouldRejectWith(
                    wallet.sendExternal(externalRequestCell.asSlice()),
                    AlreadyExecuted,
                );
            });
        });

        it("should ignore set_code action", async () => {
            const { keypair, wallet, getContractCode } = await setup();

            const mockCode = beginCell()
                .storeUint(getRandomInt(0, 1000000), 32)
                .endCell();
            const testBody = beginCell()
                .storeUint(getRandomInt(0, 1000000), 32)
                .endCell();
            const testAddr = randomAddress();

            const queryId = HighloadQueryId.getRandom();

            const walletCode = await getContractCode(wallet.address);

            const internalMessage = createInternalTransfer(wallet, {
                actions: [
                    {
                        type: "setCode",
                        newCode: mockCode,
                    },
                    {
                        type: "sendMsg",
                        mode: SendMode.PAY_GAS_SEPARATELY,
                        outMsg: internal_relaxed({
                            to: testAddr,
                            value: toNano("0.1"),
                            body: testBody,
                        }),
                    },
                ],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = await wallet.sendExternal(
                externalRequestCell.asSlice(),
            );

            await step("Check that set_code action is ignored", async () => {
                const newCode = await getContractCode(wallet.address);
                expect(newCode.hash()).toEqual(walletCode.hash());
            });

            await step("Check that internal message is sent", () => {
                expect(testResult.transactions).toHaveTransaction({
                    on: testAddr,
                    from: wallet.address,
                    value: toNano("0.1"),
                    body: testBody,
                });
            });
        });

        it("should send external-out message", async () => {
            const { keypair, wallet } = await setup();

            const testBody = beginCell()
                .storeUint(getRandomInt(0, 1000000), 32)
                .endCell();

            const queryId = HighloadQueryId.getRandom();

            const internalMessage = createInternalTransfer(wallet, {
                actions: [
                    {
                        type: "sendMsg",
                        mode: SendMode.NONE,
                        outMsg: {
                            info: {
                                type: "external-out",
                                createdAt: 0,
                                createdLt: 0n,
                            },
                            body: testBody,
                        },
                    },
                ],
                queryId: HighloadQueryId.fromQueryId(0n),
                value: 0n,
            });

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = await wallet.sendExternal(
                externalRequestCell.asSlice(),
            );

            const sentTx = await step("Check and find internal message", () => {
                return findTransactionRequired(testResult.transactions, {
                    from: wallet.address,
                    to: wallet.address,
                    success: true,
                    outMessagesCount: 1,
                    actionResultCode: 0,
                });
            });

            await step("Check that external-out message is sent", () => {
                expect(sentTx.externals.length).toBe(1);
                expect(sentTx.externals[0]!.body).toEqualCell(testBody);
            });

            const isProcessed = await wallet.getIsProcessed(
                queryId.getQueryId(),
                true,
            );

            await step("Check that query_id is processed", () => {
                expect(isProcessed).toBe(true);
            });
        });
    });
};

const testBatchProcessing = (fromInit: FromInitHighloadWalletV3) => {
    const setup = async () => {
        return await globalSetup(fromInit);
    };

    describe("Batch processing", () => {
        it("should handle 254 actions in one go", async () => {
            const { keypair, wallet } = await setup();

            const queryId = HighloadQueryId.getRandom();

            const outMsgs: OutActionSendMsg[] = new Array(254);

            for (let i = 0; i < 254; i++) {
                outMsgs[i] = {
                    type: "sendMsg",
                    mode: SendMode.NONE,
                    outMsg: internal_relaxed({
                        to: randomAddress(),
                        value: toNano("0.015"),
                        body: beginCell().storeUint(i, 32).endCell(),
                    }),
                };
            }

            const internalMessage = createInternalTransferBatch(wallet, {
                actions: outMsgs,
                queryId,
                value: 0n,
            });

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = await wallet.sendExternal(
                externalRequestCell.asSlice(),
            );

            await step("Check that internal messages are sent", () => {
                expect(testResult.transactions).toHaveTransaction({
                    on: wallet.address,
                    outMessagesCount: 254,
                });
            });

            await step("Check messages are processed", () => {
                for (let i = 0; i < 254; i++) {
                    expect(testResult.transactions).toHaveTransaction({
                        from: wallet.address,
                        body: outMsgs[i]!.outMsg.body,
                    });
                }
            });

            const isProcessed = await wallet.getIsProcessed(
                queryId.getQueryId(),
                true,
            );

            await step("Check that query_id is processed", () => {
                expect(isProcessed).toBe(true);
            });
        });

        it("should be able to go beyond 255 messages with chained internal_transfer", async () => {
            const { keypair, wallet } = await setup();

            const queryId = HighloadQueryId.getRandom();

            const msgCount = getRandomInt(256, 507);
            const msgs: OutActionSendMsg[] = new Array(msgCount);

            for (let i = 0; i < msgCount; i++) {
                msgs[i] = {
                    type: "sendMsg",
                    mode: SendMode.PAY_GAS_SEPARATELY,
                    outMsg: internal_relaxed({
                        to: randomAddress(0),
                        value: toNano("0.015"),
                        body: beginCell().storeUint(i, 32).endCell(),
                    }),
                };
            }

            const internalMessage = createInternalTransferBatch(wallet, {
                actions: msgs,
                queryId,
                value: 0n,
            });

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internalMessage,
                    mode: SendMode.CARRY_ALL_REMAINING_BALANCE,
                    queryId,
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = await wallet.sendExternal(
                externalRequestCell.asSlice(),
            );

            await step("Check that internal messages are sent", () => {
                expect(testResult.transactions).toHaveTransaction({
                    on: wallet.address,
                    outMessagesCount: 254,
                });
                expect(testResult.transactions).toHaveTransaction({
                    on: wallet.address,
                    outMessagesCount: msgCount - 253,
                });
            });

            await step("Check messages are processed", () => {
                for (let i = 0; i < msgCount; i++) {
                    expect(testResult.transactions).toHaveTransaction({
                        from: wallet.address,
                        body: msgs[i]!.outMsg.body,
                    });
                }
            });

            const isProcessed = await wallet.getIsProcessed(
                queryId.getQueryId(),
                true,
            );

            await step("Check that query_id is processed", () => {
                expect(isProcessed).toBe(true);
            });
        });
    });
};

const testInternalChecks = (fromInit: FromInitHighloadWalletV3) => {
    const setup = async () => {
        return await globalSetup(fromInit);
    };

    describe("Internal checks", () => {
        it("should ignore internal transfer from address different from self", async () => {
            const { wallet, blockchain } = await setup();

            const queryId = HighloadQueryId.getRandom();

            const testAddr = randomAddress();

            const transferBody = createInternalTransferBody({
                actions: [
                    {
                        type: "sendMsg",
                        mode: SendMode.PAY_GAS_SEPARATELY,
                        outMsg: internal_relaxed({
                            to: testAddr,
                            value: toNano("1000"),
                        }),
                    },
                ],
                queryId,
            });

            let testResult = await blockchain.sendMessage(
                internal({
                    from: testAddr,
                    to: wallet.address,
                    value: toNano("1"),
                    body: transferBody,
                }),
            );

            await step("Check that internal transfer is ignored", () => {
                expect(testResult.transactions).not.toHaveTransaction({
                    on: testAddr,
                    from: wallet.address,
                    value: toNano("1000"),
                });
            });

            testResult = await blockchain.sendMessage(
                internal({
                    from: wallet.address,
                    to: wallet.address,
                    value: toNano("1"),
                    body: transferBody,
                }),
            );

            await step("Check that internal transfer is processed", () => {
                expect(testResult.transactions).toHaveTransaction({
                    on: testAddr,
                    from: wallet.address,
                    value: toNano("1000"),
                });
            });
        });

        it("should ignore bounced messages", async () => {
            const { wallet, blockchain } = await setup();

            const queryId = HighloadQueryId.getRandom();

            const testAddr = randomAddress();

            const transferBody = createInternalTransferBody({
                actions: [
                    {
                        type: "sendMsg",
                        mode: SendMode.PAY_GAS_SEPARATELY,
                        outMsg: internal_relaxed({
                            to: testAddr,
                            value: toNano("1000"),
                        }),
                    },
                ],
                queryId,
            });

            let testResult = await blockchain.sendMessage(
                internal({
                    from: wallet.address,
                    to: wallet.address,
                    body: transferBody,
                    value: toNano("1"),
                    bounced: true,
                }),
            );

            await step("Check that internal transfer is ignored", () => {
                expect(testResult.transactions).not.toHaveTransaction({
                    on: testAddr,
                    from: wallet.address,
                    value: toNano("1000"),
                });
            });

            testResult = await blockchain.sendMessage(
                internal({
                    from: wallet.address,
                    to: wallet.address,
                    body: transferBody,
                    value: toNano("1"),
                    bounced: false,
                }),
            );

            await step("Check that internal transfer is processed", () => {
                expect(testResult.transactions).toHaveTransaction({
                    on: testAddr,
                    from: wallet.address,
                    value: toNano("1000"),
                });
            });
        });

        it("should ignore invalid message in payload", async () => {
            const { keypair, wallet } = await setup();

            const badGenerator = new MsgGenerator(0);
            let queryIter = new HighloadQueryId();

            for (const badMsg of badGenerator.generateBadMsg()) {
                const externalRequestCell = createExternalRequestCell(
                    keypair.secretKey,
                    {
                        message: badMsg,
                        mode: SendMode.NONE,
                        queryId: queryIter,
                        createdAt: 1000,
                        subwalletId: SUBWALLET_ID,
                        timeout: DEFAULT_TIMEOUT,
                    },
                );

                const testResult = await wallet.sendExternal(
                    externalRequestCell.asSlice(),
                );

                await step("Check that invalid message is ignored", () => {
                    expect(testResult.transactions).toHaveTransaction({
                        on: wallet.address,
                        success: true,
                        outMessagesCount: 0,
                    });
                });

                const isProcessed = await wallet.getIsProcessed(
                    queryIter.getQueryId(),
                    true,
                );

                await step("Check that query_id is processed", () => {
                    expect(isProcessed).toBe(true);
                });

                queryIter = queryIter.getNext();
            }
        });
    });
};

const testAttackPrevention = (fromInit: FromInitHighloadWalletV3) => {
    const setup = async () => {
        return await globalSetup(fromInit);
    };

    describe("Attack prevention", () => {
        it("timeout replay attack", async () => {
            const { keypair, wallet, blockchain } = await setup();

            /*
             * Timeout is not part of the external
             * So in theory one could deploy contract with
             * different timeout without thinking too much.
             * This opens up avenue for replay attack.
             * So, at every deploy one should always change key or subwallet id
             */

            const deployer = await blockchain.treasury("new_deployer");
            const attacker = await blockchain.treasury("attacker");

            // Same contract different timeout
            const newWallet = blockchain.openContract(
                await fromInit(
                    bufferToBigInt(keypair.publicKey),
                    BigInt(SUBWALLET_ID),
                    Dictionary.empty(),
                    Dictionary.empty(),
                    0n,
                    BigInt(1234),
                ),
            );

            // Deploy wallet
            const deployResult = await newWallet.send(
                deployer.getSender(),
                {
                    value: toNano("999999"),
                },
                beginCell().endCell().asSlice(),
            );

            await step("Check that wallet is deployed", () => {
                expect(deployResult.transactions).toHaveTransaction({
                    on: newWallet.address,
                    deploy: true,
                    success: true,
                });
            });

            // So attacker requested legit withdraw on the exchange
            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: internal_relaxed({
                        to: attacker.address,
                        value: toNano("10"),
                    }),
                    mode: SendMode.PAY_GAS_SEPARATELY,
                    queryId: new HighloadQueryId(),
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = await wallet.sendExternal(
                externalRequestCell.asSlice(),
            );

            const legitTx = findTransactionRequired(testResult.transactions, {
                on: wallet.address,
                outMessagesCount: 1,
            });

            await step("Check that external request is processed", () => {
                expect(testResult.transactions).toHaveTransaction({
                    on: attacker.address,
                    value: toNano("10"),
                });
            });

            // And now can replay it on contract with different timeout
            const replyExt = legitTx.inMessage!;
            if (replyExt.info.type !== "external-in") {
                throw TypeError("No way");
            }

            // Replace dest
            replyExt.info = {
                ...replyExt.info,
                dest: newWallet.address,
            };

            await step("Check that replay is rejected", async () => {
                await expect(blockchain.sendMessage(replyExt)).rejects.toThrow(
                    EmulationError,
                );
            });
        });

        it("should work replay protection, but don't send message", async () => {
            const { keypair, wallet } = await setup();

            const externalRequestCell = createExternalRequestCell(
                keypair.secretKey,
                {
                    message: beginCell().storeUint(239, 17).endCell(),
                    mode: SendMode.PAY_GAS_SEPARATELY,
                    queryId: new HighloadQueryId(),
                    createdAt: 1000,
                    subwalletId: SUBWALLET_ID,
                    timeout: DEFAULT_TIMEOUT,
                },
            );

            const testResult = await wallet.sendExternal(
                externalRequestCell.asSlice(),
            );

            await step("Check that external request is processed", () => {
                expect(testResult.transactions).toHaveTransaction({
                    to: wallet.address,
                    success: true,
                    outMessagesCount: 0,
                    actionResultCode: 0,
                });
            });
        });
    });
};

export const testHighloadWalletV3 = (fromInit: FromInitHighloadWalletV3) => {
    testDeploy(fromInit);
    testAuth(fromInit);
    testParameterValidation(fromInit);
    testQueryId(fromInit);
    testPerformanceLimits(fromInit);
    testMessageSending(fromInit);
    testBatchProcessing(fromInit);
    testInternalChecks(fromInit);
    testAttackPrevention(fromInit);
};
