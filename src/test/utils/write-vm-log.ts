import type { Blockchain } from "@ton/sandbox";
import { appendFileSync, mkdirSync, rmSync, writeFileSync } from "fs";
import { dirname } from "path";

type WriteLogParams = {
    readonly blockchain: Blockchain;
    readonly path: string;
};
export const writeLog = ({ blockchain, path }: WriteLogParams) => {
    mkdirSync(dirname(path), { recursive: true });

    try {
        rmSync(path);
    } catch (_) {
        /* */
    }
    writeFileSync(path, "");
    return async function step<T>(name: string, callback: () => Promise<T>) {
        const oldLog = console.log;
        const oldVmLogs = blockchain.verbosity.vmLogs;
        const oldBcLogs = blockchain.verbosity.blockchainLogs;
        try {
            console.log = (message: unknown, ...rest: unknown[]) => {
                if (typeof message !== "string" || rest.length > 0) {
                    throw new Error("Unexpected log");
                }
                const lines = message
                    .split("\n")
                    .map((s) => "    " + s)
                    .join("\n");
                const entry = `  - |\n${lines}\n`;
                appendFileSync(path, entry);
            };
            blockchain.verbosity.vmLogs = "vm_logs_full";
            blockchain.verbosity.blockchainLogs = true;
            const entry = `- name: ${name}\n  messages:\n`;
            appendFileSync(path, entry);
            return await callback();
        } finally {
            console.log = oldLog;
            blockchain.verbosity.vmLogs = oldVmLogs;
            blockchain.verbosity.blockchainLogs = oldBcLogs;
        }
    };
};

export type Step = ReturnType<typeof writeLog>;
