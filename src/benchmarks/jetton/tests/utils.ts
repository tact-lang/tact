import { toNano, beginCell, Address, Builder } from "@ton/core";

import type { Cell, Sender } from "@ton/core";
import type {
    JettonMinter,
    Mint,
    ChangeOwner,
    JettonUpdateContent,
    ProvideWalletAddress,
    JettonBurn,
    JettonTransfer,
} from "@/benchmarks/jetton/tact/output/minter_JettonMinter";
import {
    Blockchain,
    type SandboxContract,
    type SendMessageResult,
} from "@ton/sandbox";

import { randomBytes } from "crypto";
import { JettonWallet } from "@/benchmarks/jetton/tact/output/minter_JettonWallet";
import { setStoragePrices } from "@/test/utils/gasUtils";

export const randomAddress = (wc: number = 0) => {
    const buf = Buffer.alloc(32);
    for (let i = 0; i < buf.length; i++) {
        buf[i] = Math.floor(Math.random() * 256);
    }
    return new Address(wc, buf);
};

const getRandom = (min: number, max: number) => {
    return Math.random() * (max - min) + min;
};

export const getRandomInt = (min: number, max: number) => {
    return Math.round(getRandom(min, max));
};

export const storeBigPayload = (curBuilder: Builder, maxDepth: number = 5) => {
    const rootBuilder = curBuilder;

    function dfs(builder: Builder, currentDepth: number) {
        if (currentDepth >= maxDepth) {
            return;
        }
        // Cell has a capacity of 1023 bits, so we can store 127 bytes max
        builder.storeBuffer(randomBytes(127));
        // Store all 4 references
        for (let i = 0; i < 4; i++) {
            const newBuilder = beginCell();
            dfs(newBuilder, currentDepth + 1);
            builder.storeRef(newBuilder.endCell());
        }
    }

    dfs(rootBuilder, 0); // Start DFS with depth 0
    return rootBuilder;
};

export const sendMint = async (
    jettonMinter: SandboxContract<JettonMinter>,
    via: Sender,
    to: Address,
    jettonAmount: bigint,
    forwardTonAmount: bigint,
    totalTonAmount: bigint,
): Promise<SendMessageResult> => {
    if (totalTonAmount <= forwardTonAmount) {
        throw new Error(
            "Total TON amount should be greater than the forward amount",
        );
    }
    const msg: Mint = {
        $$type: "Mint",
        queryId: 0n,
        receiver: to,
        tonAmount: totalTonAmount,
        mintMessage: {
            $$type: "JettonTransferInternal",
            queryId: 0n,
            amount: jettonAmount,
            sender: via.address!,
            responseDestination: via.address!,
            forwardTonAmount: forwardTonAmount,
            forwardPayload: beginCell().storeUint(0, 1).asSlice(),
        },
    };
    return await jettonMinter.send(
        via,
        { value: totalTonAmount + toNano("0.015") },
        msg,
    );
};

export const sendChangeAdmin = async (
    jettonMinter: SandboxContract<JettonMinter>,
    via: Sender,
    newOwner: Address,
): Promise<SendMessageResult> => {
    const msg: ChangeOwner = {
        $$type: "ChangeOwner",
        queryId: 0n,
        newOwner: newOwner,
    };
    return await jettonMinter.send(via, { value: toNano("0.05") }, msg);
};

export const sendChangeContent = async (
    jettonMinter: SandboxContract<JettonMinter>,
    via: Sender,
    content: Cell,
): Promise<SendMessageResult> => {
    const msg: JettonUpdateContent = {
        $$type: "JettonUpdateContent",
        queryId: 0n,
        content: content,
    };
    return await jettonMinter.send(via, { value: toNano("0.05") }, msg);
};

export const sendDiscovery = async (
    jettonMinter: SandboxContract<JettonMinter>,
    via: Sender,
    address: Address,
    includeAddress: boolean,
    value: bigint = toNano("0.1"),
): Promise<SendMessageResult> => {
    const msg: ProvideWalletAddress = {
        $$type: "ProvideWalletAddress",
        queryId: 0n,
        ownerAddress: address,
        includeAddress: includeAddress,
    };
    return await jettonMinter.send(via, { value: value }, msg);
};

export const getTotalSupply = async (
    jettonMinter: SandboxContract<JettonMinter>,
) => {
    const res = await jettonMinter.getGetJettonData();
    return res.totalSupply;
};

export const getAdminAddress = async (
    jettonMinter: SandboxContract<JettonMinter>,
) => {
    const res = await jettonMinter.getGetJettonData();
    return res.adminAddress;
};

export const getContent = async (
    jettonMinter: SandboxContract<JettonMinter>,
) => {
    const res = await jettonMinter.getGetJettonData();
    return res.jettonContent;
};

export const getJettonBalance = async (
    jettonWallet: SandboxContract<JettonWallet>,
) => {
    return (await jettonWallet.getGetWalletData()).balance;
};

export const errors = {
    "Incorrect sender": 73,
    "Unauthorized burn": 74,
    "Not a basechain address": 333,
    "Incorrect sender jetton": 705,
    "Incorrect balance after send": 706,
    "Incorrect sender wallet": 707,
    "Insufficient amount of TON attached": 709,
};

export const jettonContentToCell = (content: { type: 0 | 1; uri: string }) => {
    return beginCell()
        .storeUint(content.type, 8)
        .storeStringTail(content.uri) // Snake logic under the hood
        .endCell();
};

export const sendTransfer = async (
    jettonWallet: SandboxContract<JettonWallet>,
    via: Sender,
    value: bigint,
    jettonAmount: bigint,
    to: Address,
    responseAddress: Address,
    customPayload: Cell | null,
    forwardTonAmount: bigint,
    forwardPayload: Cell | null,
): Promise<SendMessageResult> => {
    const parsedForwardPayload =
        forwardPayload != null
            ? forwardPayload.beginParse()
            : new Builder().storeUint(0, 1).endCell().beginParse();

    const msg: JettonTransfer = {
        $$type: "JettonTransfer",
        queryId: 0n,
        amount: jettonAmount,
        destination: to,
        responseDestination: responseAddress,
        customPayload: customPayload,
        forwardTonAmount: forwardTonAmount,
        forwardPayload: parsedForwardPayload,
    };

    return await jettonWallet.send(via, { value }, msg);
};

export const sendBurn = async (
    jettonWallet: SandboxContract<JettonWallet>,
    via: Sender,
    value: bigint,
    jettonAmount: bigint,
    responseAddress: Address,
    customPayload: Cell | null,
): Promise<SendMessageResult> => {
    const msg: JettonBurn = {
        $$type: "JettonBurn",
        queryId: 0n,
        amount: jettonAmount,
        responseDestination: responseAddress,
        customPayload: customPayload,
    };

    return await jettonWallet.send(via, { value }, msg);
};

export type FromInitMinter = (
    totalSupply: bigint,
    owner: Address,
    jettonContent: Cell,
) => Promise<JettonMinter>;
export type FromInitWallet = (
    owner: Address,
    jettonMinter: Address,
    jettonAmount: bigint,
) => Promise<JettonWallet>;

export const globalSetup = async (
    fromInitMinter: FromInitMinter,
    fromInitWallet: FromInitWallet,
) => {
    const blockchain = await Blockchain.create();
    const config = blockchain.config;
    blockchain.setConfig(
        setStoragePrices(config, {
            unixTimeSince: 0,
            bitPricePerSecond: 0n,
            cellPricePerSecond: 0n,
            masterChainBitPricePerSecond: 0n,
            masterChainCellPricePerSecond: 0n,
        }),
    );

    const deployer = await blockchain.treasury("deployer");
    const notDeployer = await blockchain.treasury("notDeployer");

    const defaultContent = beginCell()
        .storeStringTail("defaultContent")
        .endCell();

    const msg: JettonUpdateContent = {
        $$type: "JettonUpdateContent",
        queryId: 0n,
        content: defaultContent,
    };

    const jettonMinter = blockchain.openContract(
        await fromInitMinter(0n, deployer.address, defaultContent),
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

    const jettonWallet = blockchain.openContract(
        await fromInitWallet(deployer.address, jettonMinter.address, 0n),
    );

    const userWallet = async (address: Address) => {
        const wallet = blockchain.openContract(
            new JettonWallet(await jettonMinter.getGetWalletAddress(address)),
        );

        await sendMint(
            jettonMinter,
            deployer.getSender(),
            address,
            0n,
            0n,
            toNano(1),
        );

        return wallet;
    };

    return {
        blockchain,
        deployer,
        notDeployer,
        jettonMinter,
        jettonWallet,
        userWallet,
        defaultContent,
    };
};
