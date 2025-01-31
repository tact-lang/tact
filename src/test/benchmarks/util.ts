import { SendMessageResult } from "@ton/sandbox/dist/blockchain/Blockchain";

export function getUsedGas(sendEnough: SendMessageResult) {
    return sendEnough.transactions
        .slice(1)
        .map((t) =>
            t.description.type === "generic" &&
            t.description.computePhase.type === "vm"
                ? t.description.computePhase.gasUsed
                : 0n,
        )
        .reduceRight((prev, cur) => prev + cur);
}
