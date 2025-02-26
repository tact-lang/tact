import "@ton/test-utils";
import {
    Address,
    beginCell,
    Builder,
    Cell,
    contractAddress,
    SendMode,
    toNano,
} from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";

import {
    type Mint,
    type ProvideWalletAddress,
    JettonMinter,
    storeJettonBurn,
    storeJettonTransfer,
    storeMint,
} from "../contracts/output/jetton_minter_discoverable_JettonMinter";

import "@ton/test-utils";
import benchmarkCodeSizeResults from "./results_code_size.json";
import type {
    JettonBurn,
    JettonTransfer,
    JettonUpdateContent,
} from "../contracts/output/jetton_minter_discoverable_JettonMinter";

import {
    generateCodeSizeResults,
    generateResults,
    getStateSizeForAccount,
    getUsedGas,
    printBenchmarkTable,
} from "../util";
import benchmarkResults from "./results_gas.json";
import { join, resolve } from "path";
import { readFileSync } from "fs";
import { storeProvideWalletAddress } from "../contracts/output/escrow_Escrow";
import { posixNormalize } from "../../../utils/filePath";
import { type Step, writeLog } from "../../utils/write-vm-log";

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

const sendDiscoveryRaw = async (
    minterAddress: Address,
    via: SandboxContract<TreasuryContract>,
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

    const msgCell = beginCell().store(storeProvideWalletAddress(msg)).endCell();

    return await via.send({
        to: minterAddress,
        value,
        body: msgCell,
        sendMode: SendMode.PAY_GAS_SEPARATELY,
    });
};

const sendTransferRaw = async (
    jettonWalletAddress: Address,
    via: SandboxContract<TreasuryContract>,
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
            : new Builder().storeUint(0, 1).endCell().beginParse(); //Either bit equals 0

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

    const msgCell = beginCell().store(storeJettonTransfer(msg)).endCell();

    return await via.send({
        to: jettonWalletAddress,
        value,
        body: msgCell,
        sendMode: SendMode.PAY_GAS_SEPARATELY,
    });
};

const sendMintRaw = async (
    jettonMinterAddress: Address,
    via: SandboxContract<TreasuryContract>,
    to: Address,
    jetton_amount: bigint,
    forward_ton_amount: bigint,
    total_ton_amount: bigint,
) => {
    if (total_ton_amount <= forward_ton_amount) {
        throw new Error(
            "Total TON amount should be greater than the forward amount",
        );
    }

    const msg: Mint = {
        $$type: "Mint",
        queryId: 0n,
        receiver: to,
        tonAmount: total_ton_amount,
        mintMessage: {
            $$type: "JettonTransferInternal",
            queryId: 0n,
            amount: jetton_amount,
            responseDestination: jettonMinterAddress,
            forwardTonAmount: forward_ton_amount,
            sender: jettonMinterAddress,
            forwardPayload: beginCell().storeUint(0, 1).endCell().beginParse(),
        },
    };

    const msgCell = beginCell().store(storeMint(msg)).endCell();

    return await via.send({
        to: jettonMinterAddress,
        value: total_ton_amount + toNano("0.015"),
        body: msgCell,
        sendMode: SendMode.PAY_GAS_SEPARATELY,
    });
};

const sendBurnRaw = async (
    jettonWalletAddress: Address,
    via: SandboxContract<TreasuryContract>,
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

    const msgCell = beginCell().store(storeJettonBurn(msg)).endCell();

    return await via.send({
        to: jettonWalletAddress,
        value,
        body: msgCell,
        sendMode: SendMode.PAY_GAS_SEPARATELY,
    });
};

const getJettonWalletRaw = async (
    minterAddress: Address,
    blockchain: Blockchain,
    walletAddress: Address,
) => {
    const walletAddressResult = await blockchain
        .provider(minterAddress)
        .get(`get_wallet_address`, [
            {
                type: "slice",
                cell: beginCell().storeAddress(walletAddress).endCell(),
            },
        ]);

    return walletAddressResult.stack.readAddress();
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
        printBenchmarkTable(results, codeSizeResults);
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

            return getUsedGas(sendResult);
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

            return getUsedGas(burnResult);
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

            return getUsedGas(discoveryResult);
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
