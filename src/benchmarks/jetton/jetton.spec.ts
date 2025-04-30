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
import { join, resolve } from "path";
import { readFileSync } from "fs";
import { posixNormalize } from "@/utils/filePath";
import { type Step, writeLog } from "@/test/utils/write-vm-log";
import {
    JettonMinter,
    type JettonUpdateContent,
    type Mint,
    type ProvideWalletAddress,
} from "@/benchmarks/contracts/output/jetton-minter-discoverable_JettonMinter";
import {
    JettonWallet,
    type JettonTransfer,
    type JettonBurn,
} from "@/benchmarks/contracts/output/jetton-minter-discoverable_JettonWallet";

import benchmarkResults from "@/benchmarks/jetton/results_gas.json";
import benchmarkCodeSizeResults from "@/benchmarks/jetton/results_code_size.json";
import { calculateCoverage } from "@/asm/coverage";

const loadFunCJettonsBoc = () => {
    const bocMinter = readFileSync(
        posixNormalize(
            resolve(
                __dirname,
                "../contracts/func/output/jetton-minter-discoverable.boc",
            ),
        ),
    );

    const bocWallet = readFileSync(
        posixNormalize(
            resolve(__dirname, "../contracts/func/output/jetton-wallet.boc"),
        ),
    );

    return { bocMinter, bocWallet };
};

function testJetton(
    benchmarkResults: BenchmarkResult,
    codeSizeResults: CodeSizeResult,
    fromInit: (
        totalSupply: bigint,
        owner: Address,
        jettonContent: Cell,
    ) => Promise<JettonMinter>,
) {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let notDeployer: SandboxContract<TreasuryContract>;
    const defaultContent: Cell = beginCell().endCell();
    let step: Step;
    let jettonMinter: SandboxContract<JettonMinter>;
    let deployerJettonWallet: SandboxContract<JettonWallet>;

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        deployer = await blockchain.treasury("deployer");
        notDeployer = await blockchain.treasury("notDeployer");

        step = writeLog({
            path: join(__dirname, "output", "log.yaml"),
            blockchain,
        });

        const msg: JettonUpdateContent = {
            $$type: "JettonUpdateContent",
            queryId: 0n,
            content: new Cell(),
        };

        jettonMinter = blockchain.openContract(
            await fromInit(0n, deployer.address, defaultContent),
        );

        const deployResult = await jettonMinter.send(
            deployer.getSender(),
            { value: toNano("0.1") },
            msg,
        );

        expect(deployResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: jettonMinter.address,
            deploy: true,
            success: true,
        });

        deployerJettonWallet = blockchain.openContract(
            await JettonWallet.fromAddress(
                await jettonMinter.getGetWalletAddress(deployer.address),
            ),
        );
    });

    const sendFunding = async (
        jettonWallet: SandboxContract<JettonWallet>,
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
        jettonMinter: SandboxContract<JettonMinter>,
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
                responseDestination: jettonMinter.address,
                forwardTonAmount: forward_ton_amount,
                sender: jettonMinter.address,
                forwardPayload: beginCell()
                    .storeUint(0, 1)
                    .endCell()
                    .beginParse(),
            },
        };

        return await jettonMinter.send(
            from,
            { value: total_ton_amount + toNano("0.015") },
            msg,
        );
    };

    const sendDiscovery = async (
        jettonMinter: SandboxContract<JettonMinter>,
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

        return await jettonMinter.send(from, { value }, msg);
    };

    const sendBurn = async (
        jettonWallet: SandboxContract<JettonWallet>,
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
                jettonMinter,
                deployer.getSender(),
                deployer.address,
                toNano(100000),
                toNano("0.05"),
                toNano("1"),
            ),
        );

        expect(mintResult.transactions).toHaveTransaction({
            from: jettonMinter.address,
            to: deployerJettonWallet.address,
            success: true,
            endStatus: "active",
        });

        const someAddress = Address.parse(
            "EQD__________________________________________0vo",
        );

        const sendResult = await step("transfer", () =>
            sendFunding(
                deployerJettonWallet,
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

        expect(sendResult.transactions).not.toHaveTransaction({
            success: false,
        });

        expect(sendResult.transactions).toHaveTransaction({
            from: deployerJettonWallet.address,
            success: true,
            exitCode: 0,
        });

        const transferGasUsed = await getUsedGas(sendResult, "internal");
        expect(transferGasUsed).toEqual(benchmarkResults.gas["transfer"]);
    });

    it("burn", async () => {
        const burnAmount = toNano("0.01");

        const burnResult = await step("burn", () =>
            sendBurn(
                deployerJettonWallet,
                deployer.getSender(),
                toNano(10),
                burnAmount,
                deployer.address,
                null,
            ),
        );

        expect(burnResult.transactions).toHaveTransaction({
            from: deployerJettonWallet.address,
            to: jettonMinter.address,
            exitCode: 0,
        });

        const burnGasUsed = getUsedGas(burnResult, "internal");
        expect(burnGasUsed).toEqual(benchmarkResults.gas["burn"]);
    });

    it("discovery", async () => {
        const discoveryResult = await step("discovery", () =>
            sendDiscovery(
                jettonMinter,
                deployer.getSender(),
                notDeployer.address,
                false,
                toNano(10),
            ),
        );

        expect(discoveryResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: jettonMinter.address,
            success: true,
        });

        const discoveryGasUsed = getUsedGas(discoveryResult, "internal");
        expect(discoveryGasUsed).toEqual(benchmarkResults.gas["discovery"]);
    });

    it("minter cells", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, jettonMinter.address))
                .cells,
        ).toEqual(codeSizeResults.size["minter cells"]);
    });

    it("minter bits", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, jettonMinter.address))
                .bits,
        ).toEqual(codeSizeResults.size["minter bits"]);
    });

    it("wallet cells", async () => {
        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    deployerJettonWallet.address,
                )
            ).cells,
        ).toEqual(codeSizeResults.size["wallet cells"]);
    });

    it("wallet bits", async () => {
        expect(
            (
                await getStateSizeForAccount(
                    blockchain,
                    deployerJettonWallet.address,
                )
            ).bits,
        ).toEqual(codeSizeResults.size["wallet bits"]);
    });

    afterAll(async () => {
        await calculateCoverage(__dirname, jettonMinter);
    });
}

describe("Jetton Gas Tests", () => {
    const fullResults = generateResults(benchmarkResults);
    const fullCodeSizeResults = generateCodeSizeResults(
        benchmarkCodeSizeResults,
    );

    describe("func", () => {
        const funcCodeSize = fullCodeSizeResults.at(0)!;
        const funcResult = fullResults.at(0)!;

        function fromInit(salt: bigint, admin: Address, _content: Cell) {
            const jettonData = loadFunCJettonsBoc();
            const minterCell = Cell.fromBoc(jettonData.bocMinter)[0]!;
            const walletCell = Cell.fromBoc(jettonData.bocWallet)[0]!;

            const stateInitMinter = beginCell()
                .storeCoins(0)
                .storeAddress(admin)
                .storeRef(beginCell().storeUint(1, 1).endCell()) // as salt
                .storeRef(walletCell)
                .endCell();

            const init = { code: minterCell, data: stateInitMinter };
            const address = contractAddress(0, init);
            return Promise.resolve(new JettonMinter(address, init));
        }

        testJetton(funcResult, funcCodeSize, fromInit);
    });

    describe("tact", () => {
        const tactCodeSize = fullCodeSizeResults.at(-1)!;
        const tactResult = fullResults.at(-1)!;
        testJetton(
            tactResult,
            tactCodeSize,
            JettonMinter.fromInit.bind(JettonMinter),
        );
    });

    afterAll(() => {
        printBenchmarkTable(fullResults, fullCodeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });
    });
});
