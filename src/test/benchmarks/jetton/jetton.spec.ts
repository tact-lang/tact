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

import {
    JettonMinter,
    TokenUpdateContent,
    TokenBurn,
    Mint,
    ChangeOwner,
    ProvideWalletAddress,
} from "./Jetton_JettonMinter";
import { JettonWallet, TokenTransfer } from "./Jetton_JettonWallet";

import "@ton/test-utils";
import { SendMessageResult } from "@ton/sandbox/dist/blockchain/Blockchain";

JettonMinter.prototype.getTotalSupply = async function (
    this: JettonMinter,
    provider: ContractProvider,
): Promise<bigint> {
    const res = await this.getGetJettonData(provider);
    return res.totalSupply;
};

JettonMinter.prototype.getWalletAddress = async function (
    this: JettonMinter,
    provider: ContractProvider,
    owner: Address,
) {
    return this.getGetWalletAddress(provider, owner);
};

JettonMinter.prototype.getAdminAddress = async function (
    this: JettonMinter,
    provider: ContractProvider,
) {
    return this.getOwner(provider);
};

JettonMinter.prototype.getContent = async function (
    this: JettonMinter,
    provider: ContractProvider,
) {
    const res = await this.getGetJettonData(provider);
    return res.jettonContent;
};

JettonMinter.prototype.sendMint = async function (
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

JettonMinter.prototype.sendChangeAdmin = async function (
    this: JettonMinter,
    provider: ContractProvider,
    via: Sender,
    newOwner: Address,
) {
    const msg: ChangeOwner = {
        $$type: "ChangeOwner",
        queryId: 0n,
        newOwner: newOwner,
    };
    return this.send(provider, via, { value: toNano("0.05") }, msg);
};

JettonMinter.prototype.sendChangeContent = async function (
    this: JettonMinter,
    provider: ContractProvider,
    via: Sender,
    content: Cell,
) {
    const msg: TokenUpdateContent = {
        $$type: "TokenUpdateContent",
        content: content,
    };
    return this.send(provider, via, { value: toNano("0.05") }, msg);
};

JettonMinter.prototype.sendDiscovery = async function (
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

type BenchmarkResult = {
    sendTransfer: bigint;
    burn: bigint;
    discovery: bigint;
};

function printBenchmarkTable(results: BenchmarkResult[]): void {
    process.stdout.write("+--------------+----------------------+\n");
    process.stdout.write("| Operation    | Gas                  |\n");
    process.stdout.write("+--------------+----------------------+\n");

    results.forEach((result, index) => {
        process.stdout.write(
            `| Run #${index + 1}       |                      |\n`,
        );
        process.stdout.write("+--------------+----------------------+\n");
        process.stdout.write(
            `| Send         | ${result.sendTransfer.toString().padEnd(20)} |\n`,
        );
        process.stdout.write(
            `| Burn         | ${result.burn.toString().padEnd(20)} |\n`,
        );
        process.stdout.write(
            `| Discovery    | ${result.discovery.toString().padEnd(20)} |\n`,
        );
        process.stdout.write("+--------------+----------------------+\n");
    });
}

function getUsedGas(sendEnough: SendMessageResult) {
    return (
        (
            sendEnough.transactions[1]!
                .description as TransactionDescriptionGeneric
        ).computePhase as TransactionComputeVm
    ).gasUsed;
}

describe("Jetton", () => {
    let blockchain: Blockchain;
    let jettonMinter: SandboxContract<JettonMinter>;
    let deployer: SandboxContract<TreasuryContract>;

    let notDeployer: SandboxContract<TreasuryContract>;

    let userWallet: any;
    let defaultContent: Cell;

    const result: BenchmarkResult = {
        burn: 0n,
        sendTransfer: 0n,
        discovery: 0n,
    };

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
        printBenchmarkTable([result]);
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
            1,
            someAddress,
            deployer.address,
            null,
            0,
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
        result.sendTransfer = gasUsed;

        expect(gasUsed).toMatchInlineSnapshot(`22273n`);
    });

    it("burn", async () => {
        const snapshot = blockchain.snapshot();
        const deployerJettonWallet = await userWallet(deployer.address);
        const initialJettonBalance =
            await deployerJettonWallet.getJettonBalance();
        const initialTotalSupply = await jettonMinter.getTotalSupply();
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
        expect(await jettonMinter.getTotalSupply()).toEqual(
            initialTotalSupply - burnAmount,
        );

        const gasUsed = getUsedGas(burnResult);
        result.burn = gasUsed;

        expect(gasUsed).toMatchInlineSnapshot(`10938n`);
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
        expect(gasUsed).toMatchInlineSnapshot(`14956n`);

        result.discovery = gasUsed;
    });
});
