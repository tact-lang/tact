import { Blockchain } from "@ton/sandbox";
import { getTransactions, Transaction } from "./parse-log";

export async function withLog<T>(
    blockchain: Blockchain,
    callback: () => Promise<T>,
): Promise<{ result: T; transactions: readonly Transaction[] }> {
    const oldLog = console.log;
    const oldVmLogs = blockchain.verbosity.vmLogs;
    const oldBcLogs = blockchain.verbosity.blockchainLogs;
    const log: string[] = [];

    try {
        console.log = (message: unknown, ...rest: unknown[]) => {
            if (typeof message !== "string" || rest.length > 0) {
                throw new Error("Unexpected log");
            }
            log.push(message);
        };
        blockchain.verbosity.vmLogs = "vm_logs_full";
        blockchain.verbosity.blockchainLogs = true;
        const result = await callback();
        const transactions = getTransactions(log);
        return { result, transactions };
    } finally {
        console.log = oldLog;
        blockchain.verbosity.vmLogs = oldVmLogs;
        blockchain.verbosity.blockchainLogs = oldBcLogs;
        // const entry = `- kind: exit\n  name: ${name}\n`;
        // appendFileSync(path, entry);
    }
}
