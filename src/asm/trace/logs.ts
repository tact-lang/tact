import {parse, StackElement} from "../logs"

/**
 * Represents a single TVM Sandbox log entry.
 */
export type LogEntry = {
    readonly hash: string
    readonly offset: number
    readonly stack: readonly StackElement[]
    readonly gas: number
    gasCost: number
}

/**
 * Parses a TVM Sandbox log into a list of transactions, each containing a list of log entries.
 */
export function parseLogs(log: string): LogEntry[][] {
    const vmLines = parse(log)

    const transactions: LogEntry[][] = []
    let entries: LogEntry[] = []

    let currentStack: StackElement[] = []
    let currentGas: number = 1_000_000

    for (const vmLine of vmLines) {
        if (vmLine.$ === "VmStack") {
            currentStack = vmLine.stack
        }

        if (vmLine.$ === "VmLoc") {
            entries.push({
                hash: vmLine.hash.toLowerCase(),
                offset: vmLine.offset,
                stack: currentStack,
                gas: currentGas,
                gasCost: 0,
            })
            currentStack = []
        }

        if (vmLine.$ === "VmGasRemaining") {
            const newGasValue = vmLine.gas
            const diff = currentGas - newGasValue
            const cost = diff < 0 ? 10_000_000 - newGasValue : diff

            const lastEntry = entries.at(-1)
            if (lastEntry) {
                lastEntry.gasCost = cost
            }

            currentGas = newGasValue
        }

        if (vmLine.$ === "VmLimitChanged") {
            currentGas = vmLine.limit // reset gas
        }

        if (vmLine.$ === "VmUnknown" && vmLine.text.includes("console.log")) {
            // new transaction
            currentGas = 1_000_000
            transactions.push([...entries])
            entries = []
        }
    }

    if (entries.length > 0) {
        transactions.push([...entries])
    }

    return transactions
}

export type {StackElement} from "../logs"
