import "@ton/test-utils";
import {
    Address,
    beginCell,
    Cell,
    contractAddress,
    SendMode,
    toNano,
} from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";

import { JettonMinter } from "../contracts/output/jetton-minter-discoverable_JettonMinter";

import "@ton/test-utils";
import benchmarkCodeSizeResults from "./results_code_size.json";
import type { JettonUpdateContent } from "../contracts/output/jetton-minter-discoverable_JettonMinter";

import {
    generateCodeSizeResults,
    generateResults,
    getStateSizeForAccount,
    getUsedGas,
    printBenchmarkTable,
} from "../utils/gas";
import benchmarkResults from "./results_gas.json";
import { join, resolve } from "path";
import { readFileSync } from "fs";
import { posixNormalize } from "../../utils/filePath";
import { type Step, writeLog } from "../../test/utils/write-vm-log";
import {
    getJettonWalletRaw,
    sendBurnRaw,
    sendDiscoveryRaw,
    sendMintRaw,
    sendTransferRaw,
} from "../utils/jetton";

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

const deployFuncJettonMinter = async (
    via: SandboxContract<TreasuryContract>,
) => {
    const jettonData = loadFunCJettonsBoc();
    const minterCell = Cell.fromBoc(jettonData.bocMinter)[0]!;
    const walletCell = Cell.fromBoc(jettonData.bocWallet)[0]!;

    const stateInitMinter = beginCell()
        .storeCoins(0)
        .storeAddress(via.address)
        .storeRef(beginCell().storeUint(1, 1).endCell()) // as salt
        .storeRef(walletCell)
        .endCell();

    const init = { code: minterCell, data: stateInitMinter };

    const minterAddress = contractAddress(0, init);

    return {
        minterAddress,
        result: await via.send({
            to: minterAddress,
            value: toNano("0.1"),
            init,
            body: beginCell().endCell(),
            sendMode: SendMode.PAY_GAS_SEPARATELY,
        }),
    };
};

describe("Jetton", () => {
    let blockchain: Blockchain;
    let jettonMinter: SandboxContract<JettonMinter>;
    let jettonMinterFuncAddress: Address;
    let deployer: SandboxContract<TreasuryContract>;
    let step: Step;

    let notDeployer: SandboxContract<TreasuryContract>;

    let defaultContent: Cell;

    const results = generateResults(benchmarkResults);
    const codeSizeResults = generateCodeSizeResults(benchmarkCodeSizeResults);
    const expectedCodeSize = codeSizeResults.at(-1)!;
    const funcCodeSize = codeSizeResults.at(0)!;

    const expectedResult = results.at(-1)!;
    const funcResult = results.at(0)!;

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        step = writeLog({
            path: join(__dirname, "output", "log.yaml"),
            blockchain,
        });

        deployer = await blockchain.treasury("deployer");
        notDeployer = await blockchain.treasury("notDeployer");

        // deploy func
        const { result: deployFuncJettonMinterResult, minterAddress } =
            await deployFuncJettonMinter(deployer);

        expect(deployFuncJettonMinterResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: minterAddress,
            success: true,
            deploy: true,
        });

        jettonMinterFuncAddress = minterAddress;

        defaultContent = beginCell().endCell();
        const msg: JettonUpdateContent = {
            $$type: "JettonUpdateContent",
            queryId: 0n,
            content: new Cell(),
        };

        jettonMinter = blockchain.openContract(
            await JettonMinter.fromInit(0n, deployer.address, defaultContent),
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
    });

    afterAll(() => {
        printBenchmarkTable(results, codeSizeResults, {
            implementationName: "FunC",
            printMode: "full",
        });

        printBenchmarkTable(results.slice(1), undefined, {
            implementationName: "NotCoin",
            printMode: "first-last",
        });
    });

    it("transfer", async () => {
        const runMintTest = async (minterAddress: Address) => {
            const mintResult = await step("mint", () =>
                sendMintRaw(
                    minterAddress,
                    deployer,
                    deployer.address,
                    toNano(100000),
                    toNano("0.05"),
                    toNano("1"),
                ),
            );

            const deployerJettonWalletAddress = await getJettonWalletRaw(
                minterAddress,
                blockchain,
                deployer.address,
            );

            expect(mintResult.transactions).toHaveTransaction({
                from: minterAddress,
                to: deployerJettonWalletAddress,
                success: true,
                endStatus: "active",
            });

            const someAddress = Address.parse(
                "EQD__________________________________________0vo",
            );

            const sendResult = await step("transfer", () =>
                sendTransferRaw(
                    deployerJettonWalletAddress,
                    deployer,
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
                from: deployerJettonWalletAddress,
                success: true,
                exitCode: 0,
            });

            return getUsedGas(sendResult, "internal");
        };

        const transferGasUsedTact = await runMintTest(jettonMinter.address);

        const transferGasUsedFunC = await runMintTest(jettonMinterFuncAddress);

        expect(transferGasUsedTact).toEqual(expectedResult.gas["transfer"]);

        expect(transferGasUsedFunC).toEqual(funcResult.gas["transfer"]);
    });

    it("burn", async () => {
        const runBurnTest = async (minterAddress: Address) => {
            const deployerJettonWalletAddress = await getJettonWalletRaw(
                minterAddress,
                blockchain,
                deployer.address,
            );

            const burnAmount = toNano("0.01");

            const burnResult = await step("burn", () =>
                sendBurnRaw(
                    deployerJettonWalletAddress,
                    deployer,
                    toNano(10),
                    burnAmount,
                    deployer.address,
                    null,
                ),
            );

            expect(burnResult.transactions).toHaveTransaction({
                from: deployerJettonWalletAddress,
                to: minterAddress,
                exitCode: 0,
            });

            return getUsedGas(burnResult, "internal");
        };

        const burnGasUsedTact = await runBurnTest(jettonMinter.address);

        const burnGasUsedFunC = await runBurnTest(jettonMinterFuncAddress);

        expect(burnGasUsedTact).toEqual(expectedResult.gas["burn"]);

        expect(burnGasUsedFunC).toEqual(funcResult.gas["burn"]);
    });

    it("discovery", async () => {
        const runDiscoveryTest = async (minterAddress: Address) => {
            const discoveryResult = await step("discovery", () =>
                sendDiscoveryRaw(
                    minterAddress,
                    deployer,
                    notDeployer.address,
                    false,
                    toNano(10),
                ),
            );

            expect(discoveryResult.transactions).toHaveTransaction({
                from: deployer.address,
                to: minterAddress,
                success: true,
            });

            return getUsedGas(discoveryResult, "internal");
        };

        const discoveryGasUsedTact = await runDiscoveryTest(
            jettonMinter.address,
        );

        const discoveryGasUsedFunC = await runDiscoveryTest(
            jettonMinterFuncAddress,
        );

        expect(discoveryGasUsedTact).toEqual(expectedResult.gas["discovery"]);

        expect(discoveryGasUsedFunC).toEqual(funcResult.gas["discovery"]);
    });

    it("minter cells", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, jettonMinter.address))
                .cells,
        ).toEqual(expectedCodeSize.size["minter cells"]);
        expect(
            (await getStateSizeForAccount(blockchain, jettonMinterFuncAddress))
                .cells,
        ).toEqual(funcCodeSize.size["minter cells"]);
    });

    it("minter bits", async () => {
        expect(
            (await getStateSizeForAccount(blockchain, jettonMinter.address))
                .bits,
        ).toEqual(expectedCodeSize.size["minter bits"]);
        expect(
            (await getStateSizeForAccount(blockchain, jettonMinterFuncAddress))
                .bits,
        ).toEqual(funcCodeSize.size["minter bits"]);
    });

    it("wallet cells", async () => {
        const walletAddress = await getJettonWalletRaw(
            jettonMinter.address,
            blockchain,
            deployer.address,
        );
        expect(
            (await getStateSizeForAccount(blockchain, walletAddress)).cells,
        ).toEqual(expectedCodeSize.size["wallet cells"]);

        const walletAddressFunc = await getJettonWalletRaw(
            jettonMinterFuncAddress,
            blockchain,
            deployer.address,
        );
        expect(
            (await getStateSizeForAccount(blockchain, walletAddressFunc)).cells,
        ).toEqual(funcCodeSize.size["wallet cells"]);
    });

    it("wallet bits", async () => {
        const walletAddress = await getJettonWalletRaw(
            jettonMinter.address,
            blockchain,
            deployer.address,
        );
        expect(
            (await getStateSizeForAccount(blockchain, walletAddress)).bits,
        ).toEqual(expectedCodeSize.size["wallet bits"]);

        const walletAddressFunc = await getJettonWalletRaw(
            jettonMinterFuncAddress,
            blockchain,
            deployer.address,
        );
        expect(
            (await getStateSizeForAccount(blockchain, walletAddressFunc)).bits,
        ).toEqual(funcCodeSize.size["wallet bits"]);
    });
});
