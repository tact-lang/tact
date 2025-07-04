import type {
    ExternalRequest,
    MsgInner,
} from "@/benchmarks/highload-wallet-v3/tact/output/highload-wallet-v3_HighloadWalletV3";
import {
    HighloadWalletV3,
    storeExternalRequest,
    storeHighloadWalletV3$Data,
    storeInternalTransfer,
    storeMsgInner,
} from "@/benchmarks/highload-wallet-v3/tact/output/highload-wallet-v3_HighloadWalletV3";
import type { HighloadQueryId } from "@/benchmarks/highload-wallet-v3/tests/highload-query-id";
import { posixNormalize } from "@/utils/filePath";
import type { MessageRelaxed, OutAction } from "@ton/core";
import {
    beginCell,
    Cell,
    contractAddress,
    Dictionary,
    internal as internal_relaxed,
    SendMode,
    storeMessageRelaxed,
    storeOutList,
} from "@ton/core";
import { sign } from "@ton/crypto";
import type { SandboxContract } from "@ton/sandbox";
import { readFileSync } from "fs";
import { resolve } from "path";

export const DEFAULT_TIMEOUT = 120;
export const SUBWALLET_ID = 0;

const getRandom = (min: number, max: number) => {
    return Math.random() * (max - min) + min;
};

export const getRandomInt = (min: number, max: number) => {
    return Math.round(getRandom(min, max));
};

const getCodeCellFromBoc = (bocPath: string) => {
    const codeBoc = readFileSync(posixNormalize(resolve(__dirname, bocPath)));

    const codeCell = Cell.fromBoc(codeBoc)[0]!;

    return codeCell;
};

const getWalletCodeCell_FunC = () => {
    return getCodeCellFromBoc("../func/output/highload-wallet-v3.boc");
};

export type FromInitHighloadWalletV3 = (
    publicKey: bigint,
    subwalletID: bigint,
    oldQueries: Dictionary<number, Cell>,
    queries: Dictionary<number, Cell>,
    lastCleanTime: bigint,
    timeout: bigint,
) => Promise<HighloadWalletV3>;

export async function fromInitHighloadWalletV3_FunC(
    publicKey: bigint,
    subwalletID: bigint,
    _oldQueries: Dictionary<number, Cell>,
    _queries: Dictionary<number, Cell>,
    _lastCleanTime: bigint,
    timeout: bigint,
): Promise<HighloadWalletV3> {
    const initData = beginCell()
        .store(
            storeHighloadWalletV3$Data({
                $$type: "HighloadWalletV3$Data",
                publicKey,
                subwalletID,
                oldQueries: Dictionary.empty(),
                queries: Dictionary.empty(),
                lastCleanTime: 0n,
                timeout,
            }),
        )
        .endCell();

    const stateInit = { code: getWalletCodeCell_FunC(), data: initData };
    const address = contractAddress(0, stateInit);

    return Promise.resolve(new HighloadWalletV3(address, stateInit));
}

export const createInternalTransferBody = (opts: {
    actions: OutAction[] | Cell;
    queryId: HighloadQueryId;
}) => {
    let actionsCell: Cell;
    if (opts.actions instanceof Cell) {
        actionsCell = opts.actions;
    } else {
        if (opts.actions.length > 254) {
            throw TypeError(
                "Max allowed action count is 254. Use packActions instead.",
            );
        }
        const actionsBuilder = beginCell();
        storeOutList(opts.actions)(actionsBuilder);
        actionsCell = actionsBuilder.endCell();
    }
    return beginCell()
        .store(
            storeInternalTransfer({
                $$type: "InternalTransfer",
                queryID: opts.queryId.getQueryId(),
                actions: actionsCell,
            }),
        )
        .endCell();
};

export const createInternalTransfer = (
    wallet: SandboxContract<HighloadWalletV3>,
    opts: {
        actions: OutAction[] | Cell;
        queryId: HighloadQueryId;
        value: bigint;
    },
) => {
    return internal_relaxed({
        to: wallet.address,
        value: opts.value,
        body: createInternalTransferBody(opts),
    });
};

export const createInternalTransferBatch = (
    wallet: SandboxContract<HighloadWalletV3>,
    opts: {
        actions: OutAction[];
        queryId: HighloadQueryId;
        value: bigint;
    },
) => {
    let batch: OutAction[];
    if (opts.actions.length > 254) {
        batch = opts.actions.slice(0, 253);
        batch.push({
            type: "sendMsg",
            mode:
                opts.value > 0n
                    ? SendMode.PAY_GAS_SEPARATELY
                    : SendMode.CARRY_ALL_REMAINING_BALANCE,
            outMsg: createInternalTransferBatch(wallet, {
                actions: opts.actions.slice(253),
                queryId: opts.queryId,
                value: opts.value,
            }),
        });
    } else {
        batch = opts.actions;
    }
    return createInternalTransfer(wallet, {
        actions: batch,
        queryId: opts.queryId,
        value: opts.value,
    });
};

export const createExternalRequestCell = (
    secretKey: Buffer,
    opts: {
        message: MessageRelaxed | Cell;
        mode: number;
        queryId: HighloadQueryId | bigint;
        createdAt: number;
        subwalletId: number;
        timeout: number;
    },
) => {
    let shift: bigint;
    let bitNumber: bigint;
    if (typeof opts.queryId === "bigint") {
        shift = opts.queryId >> 10n;
        bitNumber = opts.queryId & 1023n;
    } else {
        shift = opts.queryId.getShift();
        bitNumber = opts.queryId.getBitNumber();
    }

    const messageCell =
        opts.message instanceof Cell
            ? opts.message
            : beginCell().store(storeMessageRelaxed(opts.message)).endCell();

    const msgInnerStruct: MsgInner = {
        $$type: "MsgInner",
        subwalletID: BigInt(opts.subwalletId),
        messageToSend: messageCell,
        sendMode: BigInt(opts.mode),
        queryID: {
            $$type: "QueryID",
            shift,
            bitNumber,
        },
        createdAt: BigInt(opts.createdAt),
        timeout: BigInt(opts.timeout),
    };

    const msgInnerCell = beginCell()
        .store(storeMsgInner(msgInnerStruct))
        .endCell();

    const msgInnerHash = msgInnerCell.hash();
    const signature = sign(msgInnerHash, secretKey);

    const externalRequestStruct: ExternalRequest = {
        $$type: "ExternalRequest",
        signature: signature,
        signedMsg: msgInnerCell,
    };

    return beginCell()
        .store(storeExternalRequest(externalRequestStruct))
        .endCell();
};
