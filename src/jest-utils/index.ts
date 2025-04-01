export {
    FlatTransaction,
    FlatTransactionComparable,
    compareTransaction,
    flattenTransaction,
    findTransaction,
    findTransactionRequired,
    filterTransactions,
} from "@/jest-utils/transaction";

export { randomAddress } from "@/jest-utils/randomAddress";

export { executeTill, executeFrom } from "@/jest-utils/stepByStep";

import type { FlatTransactionComparable } from "@/jest-utils/transaction";
import { compareTransactionForTest } from "@/jest-utils/transaction";
import type { MatcherFunction } from "expect";
import type { CompareResult } from "@/jest-utils/interface";
import {
    compareAddressForTest,
    compareCellForTest,
    compareSliceForTest,
} from "@/jest-utils/comparisons";
import type { Address, Cell, Slice } from "@/core";
import jestGlobals from "@jest/globals";

function wrapComparer<T>(
    comparer: (subject: unknown, cmp: T) => CompareResult,
): MatcherFunction<[cmp: T]> {
    return function (actual, cmp) {
        const result = comparer(actual, cmp);
        return {
            pass: result.pass,
            message: () => {
                if (result.pass) {
                    return result.negMessage();
                } else {
                    return result.posMessage();
                }
            },
        };
    };
}

declare global {
    // eslint-disable-next-line @typescript-eslint/no-namespace
    export namespace jest {
        interface Matchers<R> {
            toHaveTransaction(cmp: FlatTransactionComparable): R;
            toEqualCell(cell: Cell): R;
            toEqualAddress(address: Address): R;
            toEqualSlice(slice: Slice): R;
        }
    }
}

const toHaveTransaction = wrapComparer(compareTransactionForTest);
const toEqualCell = wrapComparer(compareCellForTest);
const toEqualAddress = wrapComparer(compareAddressForTest);
const toEqualSlice = wrapComparer(compareSliceForTest);

jestGlobals.expect.extend({
    toHaveTransaction,
    toEqualCell,
    toEqualAddress,
    toEqualSlice,
});
