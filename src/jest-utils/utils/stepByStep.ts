import type { Transaction } from "@ton/core";
import type { FlatTransactionComparable } from "@/jest-utils/test/transaction";
import {
    flattenTransaction,
    compareTransaction,
} from "@/jest-utils/test/transaction";
import { inspect } from "util";

export async function executeTill<T extends Transaction>(
    txs: AsyncIterator<T>,
    match: FlatTransactionComparable,
) {
    const executed: T[] = [];
    let iterResult = await txs.next();
    let found = false;
    while (!iterResult.done) {
        executed.push(iterResult.value);
        found = compareTransaction(flattenTransaction(iterResult.value), match);
        if (found) {
            break;
        }
        iterResult = await txs.next();
    }
    if (!found) {
        throw new Error(
            `Expected ${inspect(executed.map((x) => flattenTransaction(x)))} to contain a transaction that matches pattern ${inspect(match)}`,
        );
    }

    return executed;
}

export async function executeFrom<T extends Transaction>(
    txs: AsyncIterator<T>,
) {
    const executed: T[] = [];
    let iterResult = await txs.next();

    while (!iterResult.done) {
        executed.push(iterResult.value);
        iterResult = await txs.next();
    }

    return executed;
}
