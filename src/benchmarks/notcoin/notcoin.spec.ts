import "@ton/test-utils";
import {
    Address,
    Cell,
    beginCell,
    toNano,
    contractAddress,
    type Sender,
} from "@ton/core";

import { Blockchain } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
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
import { readFileSync } from "fs";
import { posixNormalize } from "@/utils/filePath";
import { parameter, step } from "@/test/allure/allure";
import {
    JettonMinterNotcoin,
    type JettonUpdateContent,
    type Mint,
    type ProvideWalletAddress,
} from "@/benchmarks/notcoin/tact/output/minter_JettonMinterNotcoin";
import {
    JettonWalletNotcoin,
    type JettonTransfer,
    type JettonBurn,
} from "@/benchmarks/notcoin/tact/output/wallet_JettonWalletNotcoin";

import benchmarkResults from "@/benchmarks/notcoin/results_gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/notcoin/results_code_size.json";

const loadNotcoinJettonsBoc = () => {
    const bocMinter = readFileSync(
        posixNormalize(
            resolve(__dirname, "./func/output/jetton-minter-not.boc"),
        ),
    );

    const bocWallet = readFileSync(
        posixNormalize(
            resolve(__dirname, "./func/output/jetton-wallet-not.boc"),
        ),
    );

    return { bocMinter, bocWallet };
};

function testNotcoin(
    benchmarkResults: BenchmarkResult,
    codeSizeResults: CodeSizeResult,
    fromInit: (
        totalSupply: bigint,
        owner: Address,
        nextOwner: Address,
        jettonContent: Cell,
    ) => Promise<JettonMinterNotcoin>,
) {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let notDeployer: SandboxContract<TreasuryContract>;
    const defaultContent: Cell = beginCell().endCell();
    let jettonMinterNotcoin: SandboxContract<JettonMinterNotcoin>;
    let deployerJettonWalletNotcoin: SandboxContract<JettonWalletNotcoin>;

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        deployer = await blockchain.treasury("deployer");
        notDeployer = await blockchain.treasury("notDeployer");

        await parameter("deployer", deployer.address.toString());
        await parameter("notDeployer", notDeployer.address.toString());

        const msg: JettonUpdateContent = {
            $$type: "JettonUpdateContent",
            queryId: 0n,
            content: new Cell(),
        };

        jettonMinterNotcoin = blockchain.openContract(
            await fromInit(
                0n,
                deployer.address,
                deployer.address,
                defaultContent,
            ),
        );

        const deployResult = await step(
            "Send JettonUpdateContent",
            async () => {
                return await jettonMinterNotcoin.send(
                    deployer.getSender(),
                    { value: toNano("0.1") },
                    msg,
                );
            },
        );

        await step("Should have deploy transaction", () => {
            expect(deployResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: jettonMinterNotcoin.address,
                deploy: true,
                success: true,
            });
        });

        deployerJettonWalletNotcoin = blockchain.openContract(
            await JettonWalletNotcoin.fromAddress(
                await jettonMinterNotcoin.getGetWalletAddress(deployer.address),
            ),
        );
    });

    const sendFunding = async (
        jettonWallet: SandboxContract<JettonWalletNotcoin>,
        from: Sender,
        value: bigint,
        jetton_amount: bigint,
        to: Address,
        responseAddress: Address,
        customPayload: Cell | null,
        forward_ton_amount: bigint,
        forwardPayload: Cell | null,
    ) => {
        const parsedForwardPayload =
            forwardPayload != null
                ? forwardPayload.beginParse()
                : beginCell().storeUint(0, 1).endCell().beginParse(); //Either bit equals 0

        const msg: JettonTransfer = {
            $$type: "JettonTransfer",
            queryId: 0n,
            amount: jetton_amount,
            destination: to,
            responseDestination: responseAddress,
            customPayload: customPayload,
            forwardTonAmount: forward_ton_amount,
            forwardPayload: parsedForwardPayload,
        };

        return await jettonWallet.send(from, { value }, msg);
    };

    const sendMint = async (
        jettonMinterNotcoin: SandboxContract<JettonMinterNotcoin>,
        from: Sender,
        to: Address,
        jetton_amount: bigint,
        forward_ton_amount: bigint,
        total_ton_amount: bigint,
    ) => {
        const msg: Mint = {
            $$type: "Mint",
            queryId: 0n,
            receiver: to,
            tonAmount: total_ton_amount,
            mintMessage: {
                $$type: "JettonTransferInternal",
                queryId: 0n,
                amount: jetton_amount,
                responseDestination: jettonMinterNotcoin.address,
                forwardTonAmount: forward_ton_amount,
                sender: jettonMinterNotcoin.address,
                forwardPayload: beginCell()
                    .storeUint(0, 1)
                    .endCell()
                    .beginParse(),
            },
        };

        return await jettonMinterNotcoin.send(
            from,
            { value: total_ton_amount + toNano("0.015") },
            msg,
        );
    };

    const sendDiscovery = async (
        jettonMinterNotcoin: SandboxContract<JettonMinterNotcoin>,
        from: Sender,
        address: Address,
        includeAddress: boolean,
        value: bigint,
    ) => {
        const msg: ProvideWalletAddress = {
            $$type: "ProvideWalletAddress",
            queryId: 0n,
            ownerAddress: address,
            includeAddress: includeAddress,
        };

        return await jettonMinterNotcoin.send(from, { value }, msg);
    };

    const sendBurn = async (
        jettonWallet: SandboxContract<JettonWalletNotcoin>,
        from: Sender,
        value: bigint,
        jetton_amount: bigint,
        responseAddress: Address,
        customPayload: Cell | null,
    ) => {
        const msg: JettonBurn = {
            $$type: "JettonBurn",
            queryId: 0n,
            amount: jetton_amount,
            responseDestination: responseAddress,
            customPayload: customPayload,
        };

        return await jettonWallet.send(from, { value }, msg);
    };

    it("transfer", async () => {
        const mintResult = await step("mint", () =>
            sendMint(
                jettonMinterNotcoin,
                deployer.getSender(),
                deployer.address,
                toNano(100000),
                toNano("0.05"),
                toNano("1"),
            ),
        );

        await step("Should have mint transaction", () => {
            expect(mintResult.transactions).toHaveTransaction({
                from: jettonMinterNotcoin.address,
                to: deployerJettonWalletNotcoin.address,
                success: true,
                endStatus: "active",
            });
        });

        const someAddress = Address.parse(
            "EQD__________________________________________0vo",
        );

        const sendResult = await step("transfer", () =>
            sendFunding(
                deployerJettonWalletNotcoin,
                deployer.getSender(),
                toNano(1),
                1n,
                someAddress,
                deployer.address,
                null,
                0n,
                null,
            ),
        );

        await step("Should not fail transfer", () => {
            expect(sendResult.transactions).not.toHaveTransaction({
                success: false,
            });
        });

        await step("Should have successful transfer transaction", () => {
            expect(sendResult.transactions).toHaveTransaction({
                from: deployerJettonWalletNotcoin.address,
                success: true,
                exitCode: 0,
            });
        });

        const transferGasUsed = await step(
            "Get transfer gas used",
            async () => {
                return await getUsedGas(sendResult, "internal");
            },
        );
        await step("Transfer gas used should match benchmark", () => {
            expect(transferGasUsed).toEqual(benchmarkResults.gas["transfer"]);
        });
    });

    it("burn", async () => {
        const burnAmount = toNano("0.01");

        const burnResult = await step("burn", () =>
            sendBurn(
                deployerJettonWalletNotcoin,
                deployer.getSender(),
                toNano(10),
                burnAmount,
                deployer.address,
                null,
            ),
        );

        await step("Should have burn transaction", () => {
            expect(burnResult.transactions).toHaveTransaction({
                from: deployerJettonWalletNotcoin.address,
                to: jettonMinterNotcoin.address,
                exitCode: 0,
            });
        });

        const burnGasUsed = await step("Get burn gas used", () => {
            return getUsedGas(burnResult, "internal");
        });
        await step("Burn gas used should match benchmark", () => {
            expect(burnGasUsed).toEqual(benchmarkResults.gas["burn"]);
        });
    });

    it("discovery", async () => {
        const discoveryResult = await step("discovery", () =>
            sendDiscovery(
                jettonMinterNotcoin,
                deployer.getSender(),
                notDeployer.address,
                false,
                toNano(10),
            ),
        );

        await step("Should have discovery transaction", () => {
            expect(discoveryResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: jettonMinterNotcoin.address,
                success: true,
            });
        });

        const discoveryGasUsed = await step("Get discovery gas used", () => {
            return getUsedGas(discoveryResult, "internal");
        });
        await step("Discovery gas used should match benchmark", () => {
            expect(discoveryGasUsed).toEqual(benchmarkResults.gas["discovery"]);
        });
    });

    it("minter cells", async () => {
        await step("Minter cells size should match benchmark", async () => {
            expect(
                (
                    await getStateSizeForAccount(
                        blockchain,
                        jettonMinterNotcoin.address,
                    )
                ).cells,
            ).toEqual(codeSizeResults.size["minter cells"]);
        });
    });

    it("minter bits", async () => {
        await step("Minter bits size should match benchmark", async () => {
            expect(
                (
                    await getStateSizeForAccount(
                        blockchain,
                        jettonMinterNotcoin.address,
                    )
                ).bits,
            ).toEqual(codeSizeResults.size["minter bits"]);
        });
    });

    it("wallet cells", async () => {
        await step("Wallet cells size should match benchmark", async () => {
            expect(
                (
                    await getStateSizeForAccount(
                        blockchain,
                        deployerJettonWalletNotcoin.address,
                    )
                ).cells,
            ).toEqual(codeSizeResults.size["wallet cells"]);
        });
    });

    it("wallet bits", async () => {
        await step("Wallet bits size should match benchmark", async () => {
            expect(
                (
                    await getStateSizeForAccount(
                        blockchain,
                        deployerJettonWalletNotcoin.address,
                    )
                ).bits,
            ).toEqual(codeSizeResults.size["wallet bits"]);
        });
    });
}

describe("Notcoin Gas Tests", () => {
    const fullResults = generateResults(benchmarkResults);
    const fullCodeSizeResults = generateCodeSizeResults(
        benchmarkCodeSizeResults,
    );

    describe("func", () => {
        const funcCodeSize = fullCodeSizeResults.at(0)!;
        const funcResult = fullResults.at(0)!;

        function fromInit(
            totalSupply: bigint,
            owner: Address,
            nextOwner: Address,
            jettonContent: Cell,
        ) {
            const jettonData = loadNotcoinJettonsBoc();
            const minterCell = Cell.fromBoc(jettonData.bocMinter)[0]!;
            const walletCell = Cell.fromBoc(jettonData.bocWallet)[0]!;

            const stateInitMinter = beginCell()
                .storeCoins(totalSupply)
                .storeAddress(owner)
                .storeAddress(nextOwner)
                .storeRef(walletCell)
                .storeRef(jettonContent)
                .endCell();

            const init = { code: minterCell, data: stateInitMinter };
            const address = contractAddress(0, init);
            return Promise.resolve(new JettonMinterNotcoin(address, init));
        }

        testNotcoin(funcResult, funcCodeSize, fromInit);
    });

    describe("tact", () => {
        const tactCodeSize = fullCodeSizeResults.at(-1)!;
        const tactResult = fullResults.at(-1)!;
        testNotcoin(
            tactResult,
            tactCodeSize,
            JettonMinterNotcoin.fromInit.bind(JettonMinterNotcoin),
        );
    });

    afterAll(() => {
        printBenchmarkTable(fullResults, fullCodeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });
    });
});
