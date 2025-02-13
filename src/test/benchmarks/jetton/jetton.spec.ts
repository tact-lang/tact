import type { Sender } from "@ton/core";
import { Address, beginCell, Builder, Cell, toNano } from "@ton/core";
import type { SandboxContract, TreasuryContract } from "@ton/sandbox";
import { Blockchain } from "@ton/sandbox";

import type {
    Mint,
    ProvideWalletAddress,
    TokenBurn,
    TokenUpdateContent,
} from "../contracts/output/jetton_minter_discoverable_JettonMinter";
import { JettonMinter } from "../contracts/output/jetton_minter_discoverable_JettonMinter";
import type { TokenTransfer } from "../contracts/output/jetton_minter_discoverable_JettonWallet";
import { JettonWallet } from "../contracts/output/jetton_minter_discoverable_JettonWallet";

import "@ton/test-utils";
import type { SendMessageResult } from "@ton/sandbox/dist/blockchain/Blockchain";
import { generateResults, getUsedGas, printBenchmarkTable } from "../util";
import benchmarkResults from "./results.json";

const getJettonBalance = async (
    userWallet: SandboxContract<JettonWallet>,
): Promise<bigint> => (await userWallet.getGetWalletData()).balance;

const sendTransfer = async (
    userWallet: SandboxContract<JettonWallet>,
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

    return await userWallet.send(via, { value }, msg);
};

const sendBurn = async (
    userWallet: SandboxContract<JettonWallet>,
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

    return await userWallet.send(via, { value }, msg);
};

function sendMint(
    contract: SandboxContract<JettonMinter>,
    via: Sender,
    to: Address,
    jetton_amount: bigint,
    forward_ton_amount: bigint,
    total_ton_amount: bigint,
): Promise<SendMessageResult> {
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
    return contract.send(
        via,
        { value: total_ton_amount + toNano("0.015") },
        msg,
    );
}

function sendDiscovery(
    contract: SandboxContract<JettonMinter>,
    via: Sender,
    address: Address,
    includeAddress: boolean,
    value: bigint = toNano("0.1"),
): Promise<SendMessageResult> {
    const msg: ProvideWalletAddress = {
        $$type: "ProvideWalletAddress",
        query_id: 0n,
        owner_address: address,
        include_address: includeAddress,
    };
    return contract.send(via, { value }, msg);
}

describe("Jetton", () => {
    let blockchain: Blockchain;
    let jettonMinter: SandboxContract<JettonMinter>;
    let deployer: SandboxContract<TreasuryContract>;

    let notDeployer: SandboxContract<TreasuryContract>;

    let defaultContent: Cell;

    const results = generateResults(benchmarkResults);
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
    });

    afterAll(() => {
        printBenchmarkTable(results);
    });

    it("send transfer", async () => {
        const mintResult = await sendMint(
            jettonMinter,
            deployer.getSender(),
            deployer.address,
            toNano(100000),
            toNano("0.05"),
            toNano("1"),
        );
        const deployerJettonWallet = blockchain.openContract(
            JettonWallet.fromAddress(
                await jettonMinter.getGetWalletAddress(deployer.address),
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
        const someJettonWallet = blockchain.openContract(
            JettonWallet.fromAddress(
                await jettonMinter.getGetWalletAddress(someAddress),
            ),
        );

        const sendResult = await sendTransfer(
            deployerJettonWallet,
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
        expect(gasUsed).toEqual(expectedResult.gas["transfer"]);
    });

    it("burn", async () => {
        const snapshot = blockchain.snapshot();
        const deployerJettonWallet = blockchain.openContract(
            JettonWallet.fromAddress(
                await jettonMinter.getGetWalletAddress(deployer.address),
            ),
        );
        const initialJettonBalance =
            await getJettonBalance(deployerJettonWallet);
        const jettonData = await jettonMinter.getGetJettonData();
        const initialTotalSupply = jettonData.totalSupply;
        const burnAmount = toNano("0.01");

        await blockchain.loadFrom(snapshot);

        const burnResult = await sendBurn(
            deployerJettonWallet,
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

        expect(await getJettonBalance(deployerJettonWallet)).toEqual(
            initialJettonBalance - burnAmount,
        );
        const data = await jettonMinter.getGetJettonData();
        expect(data.totalSupply).toEqual(initialTotalSupply - burnAmount);

        const gasUsed = getUsedGas(burnResult);
        expect(gasUsed).toEqual(expectedResult.gas["burn"]);
    });

    it("discovery", async () => {
        const discoveryResult = await sendDiscovery(
            jettonMinter,
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
        expect(gasUsed).toEqual(expectedResult.gas["discovery"]);
    });
});
