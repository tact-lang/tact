/* eslint-disable @typescript-eslint/restrict-template-expressions */
/* eslint-disable @typescript-eslint/no-non-null-asserted-optional-chain */
import type { Transaction } from "@/core";
import { fromNano } from "@/core";

/**
 * @param tx Transaction to create log string
 * @returns Transaction log string
 */
export function prettyLogTransaction(tx: Transaction) {
    let res = `${tx.inMessage?.info.src!}  ➡️  ${tx.inMessage?.info.dest}\n`;

    for (const message of tx.outMessages.values()) {
        if (message.info.type === "internal") {
            res += `     ➡️  ${fromNano(message.info.value.coins)} 💎 ${message.info.dest}\n`;
        } else {
            res += `      ➡️  ${message.info.dest}\n`;
        }
    }

    return res;
}

/**
 * Log transaction using `console.log`. Logs base on result of {@link prettyLogTransaction}.
 * Example output:
 * ```
 * null  ➡️  EQBGhqLAZseEqRXz4ByFPTGV7SVMlI4hrbs-Sps_Xzx01x8G
 *       ➡️  0.05 💎 EQC2VluVfpj2FoHNMAiDMpcMzwvjLZxxTG8ecq477RE3NvVt
 * ```
 * @param txs Transactions to log
 */
export function prettyLogTransactions(txs: Transaction[]) {
    let out = "";

    for (const tx of txs) {
        out += prettyLogTransaction(tx) + "\n\n";
    }

    console.log(out);
}
