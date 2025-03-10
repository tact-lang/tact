import type { Address, Cell } from "@ton/core";
import { beginCell, Builder, SendMode, toNano } from "@ton/core";
import type {
    Blockchain,
    SandboxContract,
    TreasuryContract,
} from "@ton/sandbox";
import type {
    JettonBurn,
    JettonTransfer,
    Mint,
    ProvideWalletAddress,
} from "../contracts/output/escrow_Escrow";
import {
    storeJettonBurn,
    storeJettonTransfer,
    storeMint,
    storeProvideWalletAddress,
} from "../contracts/output/escrow_Escrow";

export const sendDiscoveryRaw = async (
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

export const sendTransferRaw = async (
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

export const sendMintRaw = async (
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

export const sendBurnRaw = async (
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

export const getJettonWalletRaw = async (
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
