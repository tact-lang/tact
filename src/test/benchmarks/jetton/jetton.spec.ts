import {
    Address,
    beginCell,
    Cell,
    ContractProvider,
    Sender,
    toNano,
    Builder,
    TransactionDescriptionGeneric,
    TransactionComputeVm,
} from "@ton/core";
import { Blockchain, SandboxContract, TreasuryContract } from "@ton/sandbox";
import chalk from "chalk";

import {
    JettonMinter,
    TokenUpdateContent,
    TokenBurn,
    Mint,
    ProvideWalletAddress,
} from "../contracts/output/jetton_minter_discoverable_JettonMinter";
import {
    JettonWallet,
    TokenTransfer,
} from "../contracts/output/jetton_minter_discoverable_JettonWallet";

import "@ton/test-utils";
import { SendMessageResult } from "@ton/sandbox/dist/blockchain/Blockchain";
import Table from "cli-table3";

type BenchmarkResult = {
    label: string;
    transfer: bigint;
    burn: bigint;
    discovery: bigint;
};

const results: BenchmarkResult[] = [
    {
        label: "FunC",
        transfer: 15064n,
        burn: 11895n,
        discovery: 5915n,
    },
    {
        label: "1.5.3",
        transfer: 40678n,
        burn: 25852n,
        discovery: 15265n,
    },
    {
        label: "1.5.3 without address validation",
        transfer: 31470n,
        burn: 26594n,
        discovery: 15408n,
    },
    {
        label: "1.5.3 without self-code in system cell",
        transfer: 26876n,
        burn: 17898n,
        discovery: 11135n,
    },
    {
        label: "1.5.3 with removed JettonWallet duplicate",
        transfer: 26852n,
        burn: 17728n,
        discovery: 11055n,
    },
    {
        label: "master",
        transfer: 26568n,
        burn: 17718n,
        discovery: 11063n,
    },
];

type MetricKey = "transfer" | "burn" | "discovery";
const METRICS: readonly MetricKey[] = [
    "transfer",
    "burn",
    "discovery",
] as const;

function calculateChange(prev: bigint, curr: bigint): string {
    const change = ((Number(curr - prev) / Number(prev)) * 100).toFixed(2);
    return parseFloat(change) >= 0
        ? chalk.redBright(`(+${change}%)`)
        : chalk.green(`(${change}%)`);
}

function calculateChanges(results: BenchmarkResult[]): string[][] {
    return results.reduce<string[][]>((changes, currentResult, index) => {
        if (index === 0) {
            return [METRICS.map(() => "")];
        }

        const previousResult = results.at(index - 1);
        const rowChanges =
            typeof previousResult !== "undefined"
                ? METRICS.map((metric) =>
                      calculateChange(
                          previousResult[metric],
                          currentResult[metric],
                      ),
                  )
                : [];

        return [...changes, rowChanges];
    }, []);
}

function printBenchmarkTable(results: BenchmarkResult[]): void {
    if (results.length === 0) {
        console.log("No benchmark results to display.");
        return;
    }

    const table = new Table({
        head: ["Run", "Transfer", "Burn", "Discovery"],
        style: {
            head: ["cyan"],
            border: ["gray"],
        },
    });

    const changes = calculateChanges(results);

    results.forEach((result, i) => {
        table.push([
            result.label,
            `${result.transfer} ${changes[i]?.[0] ?? ""}`,
            `${result.burn} ${changes[i]?.[1] ?? ""}`,
            `${result.discovery} ${changes[i]?.[2] ?? ""}`,
        ]);
    });

    let output = "";
    output += table.toString();
    output += "\n";

    const first = results[0]!;
    const last = results[results.length - 1]!;
    const compareMetrics = ["transfer", "burn", "discovery"] as const;

    output += "\nComparison with FunC implementation:\n";
    compareMetrics.forEach((metric) => {
        const ratio = (
            (Number(last[metric]) / Number(first[metric])) *
            100
        ).toFixed(2);
        output += `${metric.charAt(0).toUpperCase() + metric.slice(1)}: ${
            parseFloat(ratio) > 100
                ? chalk.redBright(`${ratio}%`)
                : chalk.green(`${ratio}%`)
        } of FunC gas usage\n`;
    });
    output += "\n";

    console.log(output);
}

function getUsedGas(sendEnough: SendMessageResult) {
    return sendEnough.transactions
        .slice(1)
        .map((t) => {
            return (
                (t.description as TransactionDescriptionGeneric)
                    .computePhase as TransactionComputeVm
            ).gasUsed;
        })
        .reduceRight((prev, cur) => prev + cur);
}

describe("Jetton", () => {
    let blockchain: Blockchain;
    let jettonMinter: ExtendedJettonMinter;
    let deployer: SandboxContract<TreasuryContract>;

    let notDeployer: SandboxContract<TreasuryContract>;

    let userWallet: (address: Address) => Promise<ExtendedJettonWallet>;
    let defaultContent: Cell;

    const expectedResult = results.at(-1)!;

    beforeAll(async () => {
        blockchain = await Blockchain.create();
        deployer = await blockchain.treasury("deployer");
        notDeployer = await blockchain.treasury("notDeployer");

        defaultContent = beginCell().endCell();
        const msg: TokenUpdateContent = {
            $$type: "TokenUpdateContent",
            content: new Cell(),
        };

        jettonMinter = blockchain.openContract(
            await JettonMinter.fromInit(deployer.address, defaultContent),
        ) as ExtendedJettonMinter;
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

        blockchain.openContract(
            await JettonWallet.fromInit(deployer.address, jettonMinter.address),
        );

        userWallet = async (address: Address) => {
            const newUserWallet = blockchain.openContract(
                JettonWallet.fromAddress(
                    await jettonMinter.getGetWalletAddress(address),
                ),
            );

            newUserWallet.getProvider = (provider: ContractProvider) =>
                provider;

            const getJettonBalance = async (): Promise<bigint> => {
                const provider = await newUserWallet.getProvider();
                const state = await provider.getState();
                if (state.state.type !== "active") {
                    return 0n;
                }
                return (await newUserWallet.getGetWalletData()).balance;
            };

            const sendTransfer = async (
                via: Sender,
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
                const msg: TokenTransfer = {
                    $$type: "TokenTransfer",
                    query_id: 0n,
                    amount: jetton_amount,
                    destination: to,
                    response_destination: responseAddress,
                    custom_payload: customPayload,
                    forward_ton_amount: forward_ton_amount,
                    forward_payload: parsedForwardPayload,
                };

                return await newUserWallet.send(via, { value }, msg);
            };

            const sendBurn = async (
                via: Sender,
                value: bigint,
                jetton_amount: bigint,
                responseAddress: Address,
                customPayload: Cell | null,
            ) => {
                const msg: TokenBurn = {
                    $$type: "TokenBurn",
                    query_id: 0n,
                    amount: jetton_amount,
                    response_destination: responseAddress,
                    custom_payload: customPayload,
                };

                return await newUserWallet.send(via, { value }, msg);
            };

            return {
                ...newUserWallet,
                getJettonBalance,
                sendTransfer,
                sendBurn,
            };
        };
    });

    afterAll(() => {
        printBenchmarkTable(results);
    });

    it("send transfer", async () => {
        const mintResult = await jettonMinter.sendMint(
            deployer.getSender(),
            deployer.address,
            toNano(100000),
            toNano("0.05"),
            toNano("1"),
        );
        const deployerJettonWallet = await userWallet(deployer.address);
        expect(mintResult.transactions).toHaveTransaction({
            from: jettonMinter.address,
            to: deployerJettonWallet.address,
            success: true,
            endStatus: "active",
        });
        const someAddress = Address.parse(
            "EQD__________________________________________0vo",
        );
        const someJettonWallet = await userWallet(someAddress);

        const sendResult = await deployerJettonWallet.sendTransfer(
            deployer.getSender(),
            toNano(1),
            1n,
            someAddress,
            deployer.address,
            null,
            0n,
            null,
        );

        expect(sendResult.transactions).not.toHaveTransaction({
            success: false,
        });

        expect(sendResult.transactions).toHaveTransaction({
            from: deployerJettonWallet.address,
            to: someJettonWallet.address,
            success: true,
            exitCode: 0,
        });

        const gasUsed = getUsedGas(sendResult);
        expect(gasUsed).toEqual(expectedResult.transfer);
    });

    it("burn", async () => {
        const snapshot = blockchain.snapshot();
        const deployerJettonWallet = await userWallet(deployer.address);
        const initialJettonBalance =
            await deployerJettonWallet.getJettonBalance();
        const jettonData = await jettonMinter.getGetJettonData();
        const initialTotalSupply = jettonData.totalSupply;
        const burnAmount = toNano("0.01");

        await blockchain.loadFrom(snapshot);

        const burnResult = await deployerJettonWallet.sendBurn(
            deployer.getSender(),
            toNano(10),
            burnAmount,
            deployer.address,
            null,
        );

        expect(burnResult.transactions).toHaveTransaction({
            from: deployerJettonWallet.address,
            to: jettonMinter.address,
            exitCode: 0,
        });

        expect(await deployerJettonWallet.getJettonBalance()).toEqual(
            initialJettonBalance - burnAmount,
        );
        const data = await jettonMinter.getGetJettonData();
        expect(data.totalSupply).toEqual(initialTotalSupply - burnAmount);

        const gasUsed = getUsedGas(burnResult);
        expect(gasUsed).toEqual(expectedResult.burn);
    });

    it("discovery", async () => {
        const discoveryResult = await jettonMinter.sendDiscovery(
            deployer.getSender(),
            notDeployer.address,
            false,
            toNano(10),
        );

        expect(discoveryResult.transactions).toHaveTransaction({
            from: deployer.address,
            to: jettonMinter.address,
            success: true,
        });

        const gasUsed = getUsedGas(discoveryResult);
        expect(gasUsed).toEqual(expectedResult.discovery);
    });
});

interface ExtendedJettonWallet extends SandboxContract<JettonWallet> {
    getJettonBalance(): Promise<bigint>;

    sendTransfer(
        via: Sender,
        value: bigint,
        jetton_amount: bigint,
        to: Address,
        responseAddress: Address,
        customPayload: Cell | null,
        forward_ton_amount: bigint,
        forwardPayload: Cell | null,
    ): Promise<SendMessageResult>;

    sendBurn(
        via: Sender,
        value: bigint,
        jetton_amount: bigint,
        responseAddress: Address,
        customPayload: Cell | null,
    ): Promise<SendMessageResult>;
}

interface ExtendedJettonMinter extends SandboxContract<JettonMinter> {
    sendMint(
        via: Sender,
        to: Address,
        jetton_amount: bigint,
        forward_ton_amount: bigint,
        total_ton_amount: bigint,
    ): Promise<SendMessageResult>;

    sendDiscovery(
        via: Sender,
        address: Address,
        includeAddress: boolean,
        value?: bigint,
    ): Promise<SendMessageResult>;
}

JettonMinter.prototype.sendMint = function sendMint(
    this: JettonMinter,
    provider: ContractProvider,
    via: Sender,
    to: Address,
    jetton_amount: bigint,
    forward_ton_amount: bigint,
    total_ton_amount: bigint,
) {
    if (total_ton_amount <= forward_ton_amount) {
        throw new Error(
            "Total TON amount should be greater than the forward amount",
        );
    }
    const msg: Mint = {
        $$type: "Mint",
        amount: jetton_amount,
        receiver: to,
    };
    return this.send(
        provider,
        via,
        { value: total_ton_amount + toNano("0.015") },
        msg,
    );
};

JettonMinter.prototype.sendDiscovery = function (
    this: JettonMinter,
    provider: ContractProvider,
    via: Sender,
    address: Address,
    includeAddress: boolean,
    value: bigint = toNano("0.1"),
) {
    const msg: ProvideWalletAddress = {
        $$type: "ProvideWalletAddress",
        query_id: 0n,
        owner_address: address,
        include_address: includeAddress,
    };
    return this.send(provider, via, { value: value }, msg);
};
