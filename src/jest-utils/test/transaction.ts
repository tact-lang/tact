import {
    AccountStatus,
    Address,
    Cell,
    CurrencyCollection,
    Transaction,
} from "@ton/core";
import { inspect } from "util";
import { CompareResult } from "@/jest-utils/test/interface";

export type FlatTransaction = {
    from?: Address;
    to?: Address;
    on?: Address;
    value?: bigint;
    ec?: [number, bigint][];
    body?: Cell;
    inMessageBounced?: boolean;
    inMessageBounceable?: boolean;
    op?: number;
    initData?: Cell;
    initCode?: Cell;
    deploy: boolean;
    lt: bigint;
    now: number;
    outMessagesCount: number;
    oldStatus: AccountStatus;
    endStatus: AccountStatus;
    totalFees?: bigint;
    aborted?: boolean;
    destroyed?: boolean;
    exitCode?: number;
    actionResultCode?: number;
    success?: boolean;
};

type WithFunctions<T> = {
    [K in keyof T]: T[K] | ((x: T[K]) => boolean);
};

export type FlatTransactionComparable = Partial<WithFunctions<FlatTransaction>>;

function extractOp(body: Cell): number | undefined {
    const s = body.beginParse();
    if (s.remainingBits >= 32) {
        return s.loadUint(32);
    } else {
        return undefined;
    }
}

function extractEc(cc: CurrencyCollection): [number, bigint][] {
    const r: [number, bigint][] = [];
    for (const [k, v] of cc.other ?? []) {
        r.push([k, v]);
    }
    r.sort((a, b) => a[0] - b[0]);
    return r;
}

export function flattenTransaction(tx: Transaction): FlatTransaction {
    return {
        lt: tx.lt,
        now: tx.now,
        outMessagesCount: tx.outMessagesCount,
        oldStatus: tx.oldStatus,
        endStatus: tx.endStatus,
        totalFees: tx.totalFees.coins,
        ...(tx.inMessage
            ? {
                  from:
                      tx.inMessage.info.src instanceof Address
                          ? tx.inMessage.info.src
                          : undefined,
                  to: tx.inMessage.info.dest as Address,
                  on: tx.inMessage.info.dest as Address,
                  value:
                      tx.inMessage.info.type === "internal"
                          ? tx.inMessage.info.value.coins
                          : undefined,
                  ec:
                      tx.inMessage.info.type === "internal"
                          ? extractEc(tx.inMessage.info.value)
                          : undefined,
                  body: tx.inMessage.body,
                  inMessageBounced:
                      tx.inMessage.info.type === "internal"
                          ? tx.inMessage.info.bounced
                          : undefined,
                  inMessageBounceable:
                      tx.inMessage.info.type === "internal"
                          ? tx.inMessage.info.bounce
                          : undefined,
                  op: extractOp(tx.inMessage.body),
                  initData: tx.inMessage.init?.data ?? undefined,
                  initCode: tx.inMessage.init?.code ?? undefined,
                  deploy: tx.inMessage.init
                      ? tx.oldStatus !== "active" && tx.endStatus === "active"
                      : false,
              }
            : {
                  from: undefined,
                  to: undefined,
                  on: undefined,
                  value: undefined,
                  ec: undefined,
                  body: undefined,
                  inMessageBounced: undefined,
                  inMessageBounceable: undefined,
                  op: undefined,
                  initData: undefined,
                  initCode: undefined,
                  deploy: false,
              }),
        ...(tx.description.type === "generic" ||
        tx.description.type === "tick-tock" ||
        tx.description.type === "split-prepare" ||
        tx.description.type === "merge-install"
            ? {
                  aborted: tx.description.aborted,
                  destroyed: tx.description.destroyed,
                  exitCode:
                      tx.description.computePhase.type === "vm"
                          ? tx.description.computePhase.exitCode
                          : undefined,
                  actionResultCode: tx.description.actionPhase?.resultCode,
                  success:
                      tx.description.computePhase.type === "vm"
                          ? tx.description.computePhase.success &&
                            tx.description.actionPhase?.success
                          : false,
              }
            : {
                  aborted: undefined,
                  destroyed: undefined,
                  exitCode: undefined,
                  actionResultCode: undefined,
                  success: undefined,
              }),
    };
}

function compareValue(a: any, b: any) {
    if (a instanceof Address) {
        if (!(b instanceof Address)) return false;
        return a.equals(b);
    }

    if (a instanceof Cell) {
        if (!(b instanceof Cell)) return false;
        return a.equals(b);
    }

    if (a instanceof Array) {
        if (!(b instanceof Array)) return false;
        if (a.length !== b.length) return false;
        for (let i = 0; i < a.length; i++) {
            if (!compareValue(a[i], b[i])) return false;
        }
        return true;
    }

    return a === b;
}

export function compareTransaction(
    tx: FlatTransaction,
    cmp: FlatTransactionComparable,
): boolean {
    for (const key in cmp) {
        if (!(key in tx))
            throw new Error(`Unknown flat transaction object key ${key}`);

        const cmpv = (cmp as any)[key];
        const txv = (tx as any)[key];
        if (typeof cmpv === "function") {
            if (!cmpv(txv)) return false;
        } else {
            if (!compareValue(txv, cmpv)) return false;
        }
    }

    return true;
}

export function compareTransactionForTest(
    subject: any,
    cmp: FlatTransactionComparable,
): CompareResult {
    if (Array.isArray(subject)) {
        return {
            pass: subject.some((tx) =>
                compareTransaction(flattenTransaction(tx), cmp),
            ),
            posMessage: ((subj: any[], cmp: FlatTransactionComparable) =>
                `Expected ${inspect(subj.map((tx) => flattenTransaction(tx)))} to contain a transaction that matches pattern ${inspect(cmp)}`).bind(
                undefined,
                subject,
                cmp,
            ),
            negMessage: ((subj: any[], cmp: FlatTransactionComparable) =>
                `Expected ${inspect(subj.map((tx) => flattenTransaction(tx)))} NOT to contain a transaction that matches pattern ${inspect(cmp)}, but it does`).bind(
                undefined,
                subject,
                cmp,
            ),
        };
    } else {
        try {
            const flat = flattenTransaction(subject);
            return {
                pass: compareTransaction(flat, cmp),
                posMessage: ((flat: any, cmp: FlatTransactionComparable) =>
                    `Expected ${inspect(flat)} to match pattern ${inspect(cmp)}`).bind(
                    undefined,
                    flat,
                    cmp,
                ),
                negMessage: ((flat: any, cmp: FlatTransactionComparable) =>
                    `Expected ${inspect(flat)} NOT to match pattern ${inspect(cmp)}, but it does`).bind(
                    undefined,
                    flat,
                    cmp,
                ),
            };
        } catch (e) {
            if (subject.transactions !== undefined) {
                console.warn(
                    "It seems that a SendMessageResult is being used for this comparison. Please make sure to pass `result.transactions` instead of just `result` into the matcher.",
                );
            }
            throw e;
        }
    }
}

export function findTransaction<T extends Transaction>(
    txs: T | T[],
    match: FlatTransactionComparable,
) {
    let res: T | undefined;
    if (Array.isArray(txs)) {
        res = txs.find((x) => compareTransaction(flattenTransaction(x), match));
    } else {
        res = compareTransaction(flattenTransaction(txs), match)
            ? txs
            : undefined;
    }
    return res;
}

export function findTransactionRequired<T extends Transaction>(
    txs: T | T[],
    match: FlatTransactionComparable,
) {
    const res = findTransaction(txs, match);
    if (res === undefined) {
        throw new Error(
            `Expected ${inspect(Array.isArray(txs) ? txs.map((x) => flattenTransaction(x)) : flattenTransaction(txs))} to contain a transaction that matches pattern ${inspect(match)}`,
        );
    }
    return res;
}

export function filterTransactions<T extends Transaction>(
    txs: T[],
    match: FlatTransactionComparable,
) {
    return txs.filter((x) => compareTransaction(flattenTransaction(x), match));
}
