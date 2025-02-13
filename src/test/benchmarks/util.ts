import type { SendMessageResult } from "@ton/sandbox/dist/blockchain/Blockchain";

export function getUsedGas(sendEnough: SendMessageResult): number {
    return sendEnough.transactions
        .slice(1)
        .map((t) =>
            t.description.type === "generic" &&
            t.description.computePhase.type === "vm"
                ? Number(t.description.computePhase.gasUsed)
                : 0,
        )
        .reduceRight((prev, cur) => prev + cur);
}
