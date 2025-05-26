import "@ton/test-utils";
import { Address, Cell, beginCell, toNano, type Sender } from "@ton/core";

import { Blockchain } from "@ton/sandbox";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import {
    getStateSizeForAccount,
    getUsedGas,
    type BenchmarkResult,
    type CodeSizeResult,
} from "@/benchmarks/utils/gas";

import type {
    JettonMinter,
    JettonUpdateContent,
    Mint,
    ProvideWalletAddress,
} from "@/benchmarks/jetton/tact/output/minter_JettonMinter";

import {
    JettonWallet,
    type JettonTransfer,
    type JettonBurn,
} from "@/benchmarks/jetton/tact/output/minter_JettonWallet";

import { step, parameter } from "@/test/allure/allure";
import type {
    FromInitMinter,
    FromInitWallet,
} from "@/benchmarks/jetton/tests/utils";

function benchJetton(
    benchmarkResults: BenchmarkResult,
    codeSizeResults: CodeSizeResult,
    fromInit: FromInitMinter,
    _fromInitWallet: FromInitWallet,
) {
    let blockchain: Blockchain;
    let deployer: SandboxContract<TreasuryContract>;
    let notDeployer: SandboxContract<TreasuryContract>;
    const defaultContent: Cell = beginCell().endCell();
    let jettonMinter: SandboxContract<JettonMinter>;
    let deployerJettonWallet: SandboxContract<JettonWallet>;

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
}

import { run } from "@/benchmarks/jetton/run";

run(benchJetton);
